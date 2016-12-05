#!/bin/bash

cat <<EOT >> index.html

<html>

<p>
<h1> What is the take away lesson today. </h1>

Before typing your password look in the address bar.<br>
Does it say HTTP or HTTPS ? <br>
Encryption does not save you from being complacent. <br>

</p>

<a href="r2d2.html">link text</a>

</html>
EOT

cat <<EOT >> mitm_index.html

<html>

<p>

<h1> Ofcourse it is an HTTP site. </h1>
Look at the URL address bar again. <br>
Is this the same page as lastone ? What changed ?
<br>
</p>


EOT
