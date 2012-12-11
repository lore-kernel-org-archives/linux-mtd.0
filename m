Received: from smtp2-v.fe.bosch.de ([139.15.237.6])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TiLIR-0006pZ-Aq
 for linux-mtd@lists.infradead.org; Tue, 11 Dec 2012 08:34:36 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 11 Dec 2012 09:34:18 +0100
Subject: RE: Patch to solve NULL pointer dereference in physmap_of.c
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3B057ABA@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3ADE0635@SI-MBX14.de.bosch.com>
 <1353483740.2701.1.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3AF1D4E4@SI-MBX14.de.bosch.com>
 <1354276262.30168.102.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3AFC5168@SI-MBX14.de.bosch.com>
 <1355146279.2657.32.camel@sauron.fi.intel.com>
In-Reply-To: <1355146279.2657.32.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha1; boundary="next-sign-part-=-RtYanx04Vz03rL-=-"
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--next-sign-part-=-RtYanx04Vz03rL-=-
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Great, I was not aware I was allowed to sign-off. Thx

Met vriendelijke groeten | Best Regards,=20
Anton Prins

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
Sent: maandag 10 december 2012 14:31
To: Prins Anton (ST-CO/ENG1.1)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch to solve NULL pointer dereference in physmap_of.c=0D=

On Mon, 2012-12-03 at 08:31 +0100, Prins Anton (ST-CO/ENG1.1) wrote:=0D=
> Sorry I'm in a learning curve... now used 'git format-patch'.
> This made it working for 'git am'; so hopefully this time its fine!=0D=
>=20
> Artem, thanks for your support!

A lot better, but is still not ideal. You did not run checkpatch.pl,=0D=
otherwise you would notice this warning:

checkpatch.pl results for patch "[PATCH] mtd: maps/physmap_of.c: error =
checking to prevent a NULL  pointer dereference"                       =
                                                                       =
              =20
                                                                       =
                                                                       =
                                                                       =
              =20
ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)                 =
                                                                       =
                                                                       =
              =20
                                                                       =
                                                                       =
                                                                       =
              =20
total: 1 errors, 0 warnings, 19 lines checked                          =
                                                                       =
                                                                       =
              =20

I've added the S-o-b line for you and pushed the patch to l2-mtd.git,=0D=
thanks!

--=20
Best Regards,
Artem Bityutskiy

--next-sign-part-=-RtYanx04Vz03rL-=-
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAA
oIIXDjCCBLcwggOfoAMCAQICBEMBtukwDQYJKoZIhvcNAQEFBQAwUDETMBEGCgmS
JomT8ixkARkWA2NvbTEVMBMGCgmSJomT8ixkARkWBUJvc2NoMQwwCgYDVQQDEwNQ
S0kxFDASBgNVBAMTC0Jvc2NoLUNBLURFMB4XDTA1MDgxNjA5NTMxMloXDTE1MDgx
NjEwMjMxMlowUTETMBEGCgmSJomT8ixkARkWA2NvbTEVMBMGCgmSJomT8ixkARkW
BUJvc2NoMQwwCgYDVQQDEwNQS0kxFTATBgNVBAMTDEJvc2NoLUNBMS1ERTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMi/lztWTR6Qfpx9DVU4acAnvusa
vVseqIM0Y9YSMTSzTJ2G+ih8Mrz74gQtjCBBHH5LlwBgUrDvLu/8Qhr1R2rwAB3c
xTBf59R8LFf1lqE8Fqk4UVsKdmZYtmzp+j9wU3NuiupzRjcjleGomwWDDI7TeStt
pHzDxgqQDdXI0Sf+eKtFq+2G1MweEmFHzWQaxvYZylv0OXLC/H8CLFTgViLzz/yb
k5IXb661ijSZlhSsEe3Pgp289zXQirRQZ6qbolIEkc1lGM3N5N1I5D2sx2UdBeyg
o6fo6kIWfTaYAbjEeLWIXfeZsNfkpfjR8GnkNlgkiCQk4DT0BPxxvZS43tkCAwEA
AaOCAZYwggGSMIIBGAYDVR0fBIIBDzCCAQswZ6BloGOkYTBfMRMwEQYKCZImiZPy
LGQBGRYDY29tMRUwEwYKCZImiZPyLGQBGRYFQm9zY2gxDDAKBgNVBAMTA1BLSTEU
MBIGA1UEAxMLQm9zY2gtQ0EtREUxDTALBgNVBAMTBENSTDEwgZ+ggZyggZmGVWxk
YXA6Ly9ib3NjaC5jb20vY249Qm9zY2gtQ0EtREUsY249UEtJLGRjPUJvc2NoLGRj
PWNvbT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2WGQGh0dHA6Ly90cnVz
dGNlbnRlci5ib3NjaC5jb20vQ1JML2Jvc2NoLWNhLWRlX3BraV9jb21fY3JsZmls
ZS5jcmwwCwYDVR0PBAQDAgEGMB8GA1UdIwQYMBaAFB6lPyKiCCEbxVgo0R8t8PP4
+RUpMB0GA1UdDgQWBBT9Jn8OpOawWK9ZOFZJNTbqAKhxrTAMBgNVHRMEBTADAQH/
MBkGCSqGSIb2fQdBAAQMMAobBFY3LjEDAgCBMA0GCSqGSIb3DQEBBQUAA4IBAQAs
4F/UsZU52B3HAvVrFNMpV1PuGxb/BYR1wENZugOAZmNOFJ7Ocik+g6aGTI/0HqYa
/NHscCZUfu8a3nE93DSRp2wN/NMs1rj6Acxs4Pv0eXAndz/uZ3fXP1TQ2gClqGxm
5W1MpHJb+PEuB03Vt+ycPeP2AGUc+GZBoSmLijxB0VwzzOHyWQYrJ6lkht69hUsv
iLZnVtS5Dw+kxhJHZ9NkjeuVHnmtbeI8r5E2U3gUlubxdhsOGWTXdkDfz6Uh4fvi
16moM7dmmG9o1Wj4Cwu30MgDX8qeYKGQIDpEnPk03Kan2oVDnuipXj5Xs+7Psr0x
1FFQrjxJaQb68nlzexgcMIIE+jCCA+KgAwIBAgIEQwG2sjANBgkqhkiG9w0BAQUF
ADBQMRMwEQYKCZImiZPyLGQBGRYDY29tMRUwEwYKCZImiZPyLGQBGRYFQm9zY2gx
DDAKBgNVBAMTA1BLSTEUMBIGA1UEAxMLQm9zY2gtQ0EtREUwHhcNMDUwODE2MDkx
OTQyWhcNMjUwODE2MDk0OTQyWjBQMRMwEQYKCZImiZPyLGQBGRYDY29tMRUwEwYK
CZImiZPyLGQBGRYFQm9zY2gxDDAKBgNVBAMTA1BLSTEUMBIGA1UEAxMLQm9zY2gt
Q0EtREUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDADDavsLqpxKnP
+mABiNavAOpR8EK4o7E1NxRj//V6gVHdLw9EnRY+CeX6KAf6CjW3X+VRzQMZOMxc
j4Hn9T2/hvApgjr4asLHduTYlNlSPBLH1c0rDBJRj4SllBtkHx4g7eelVWzWT4k2
vIgxNtwAR0x+dghgObQBMGnPYGsERYQ62JU4c3Z3yNVOOCtSh+3J9m+8zMSvPKKp
iqK4D5QfhMjJDvOAgJRzkQLnJHTATLhF5Jp0phWUHJGeChwoncbhYX13AnEpqccG
rid+ZdKYIFDs/I8t505VTzvQ8O0yMkYc1RLIfXMsDeullW+00lmlFylcqXXMStOM
hyYii4XXAgMBAAGjggHaMIIB1jARBglghkgBhvhCAQEEBAMCAAcwggEYBgNVHR8E
ggEPMIIBCzBnoGWgY6RhMF8xEzARBgoJkiaJk/IsZAEZFgNjb20xFTATBgoJkiaJ
k/IsZAEZFgVCb3NjaDEMMAoGA1UEAxMDUEtJMRQwEgYDVQQDEwtCb3NjaC1DQS1E
RTENMAsGA1UEAxMEQ1JMMTCBn6CBnKCBmYZVbGRhcDovL2Jvc2NoLmNvbS9jbj1C
b3NjaC1DQS1ERSxjbj1QS0ksZGM9Qm9zY2gsZGM9Y29tP2NlcnRpZmljYXRlUmV2
b2NhdGlvbkxpc3Q/YmFzZYZAaHR0cDovL3RydXN0Y2VudGVyLmJvc2NoLmNvbS9D
UkwvYm9zY2gtY2EtZGVfcGtpX2NvbV9jcmxmaWxlLmNybDArBgNVHRAEJDAigA8y
MDA1MDgxNjA5MTk0MlqBDzIwMjUwODE2MDk0OTQyWjALBgNVHQ8EBAMCAQYwHwYD
VR0jBBgwFoAUHqU/IqIIIRvFWCjRHy3w8/j5FSkwHQYDVR0OBBYEFB6lPyKiCCEb
xVgo0R8t8PP4+RUpMAwGA1UdEwQFMAMBAf8wHQYJKoZIhvZ9B0EABBAwDhsIVjcu
MTo0LjADAgSQMA0GCSqGSIb3DQEBBQUAA4IBAQBkQ/eOR9L4eenoIddXw7SjnJDn
fsgZIaJNsnJ8afxgJjvot/U6AjnmPo7Waa5gyEIS9EEEmAubTwU30NyhHCr8iHjF
DWhbSa9Waajb81i6WgklpjM6T1D+RuEO1Ty6sWgPsfx3bZLITQyoXr33nRokVmKs
hjwtEU05BKRXgvk7ma9HGCV1lOtwdjHKcK17mE2FHGbFNm/o6P9CkN4P3jdmpWKS
b7915Cz9wdNPOl0IBcSlwH7j3D8YEfbkrDkk2UYPccZUzMkPi6+WhlUmwkc0ea+F
a+pjGBsZ7AEfRCcVZaz3fjluyBWjuWRa5bY3P86UdjQplcobWrovoIwehkyRMIIG
fzCCBWegAwIBAgIEQ09B4zANBgkqhkiG9w0BAQUFADBRMRMwEQYKCZImiZPyLGQB
GRYDY29tMRUwEwYKCZImiZPyLGQBGRYFQm9zY2gxDDAKBgNVBAMTA1BLSTEVMBMG
A1UEAxMMQm9zY2gtQ0ExLURFMB4XDTExMDUxODA2MDkzM1oXDTE0MDUxODA2Mzkz
M1owgYUxEzARBgoJkiaJk/IsZAEZFgNjb20xFTATBgoJkiaJk/IsZAEZFgVib3Nj
aDEMMAoGA1UEAxMDcGtpMQ4wDAYDVQQDEwVCT1NDSDELMAkGA1UEAxMCTkwxCjAI
BgNVBAMTAUExCjAIBgNVBAMTAU4xFDASBgNVBAMTC0FudG9uLlByaW5zMIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsaIJDJNSsil6C0dSXUT42SUnWzBU
utilscT9G2QJUjVQ7Jct4Hj44K1ZWK5Bk+YTgYPazvUV9gmrWyXi1iSaS+WcJ2jk
xYX8vx2JmBcK3aW23djmD/dHk++yTydZnhfpEKe5U+Jv3ATn51MQbRRIQv7z3IYF
V5yIMPwXOyBuzdxyLFcRBR8DsUHVeJXqWh9w7QT/V3ZzbyX3v9RaQj884lufG3+b
jNLzsw435t/Wl0tyWhhbqKai5DKrJGZrSm2CGgb11gwpqlPGF14LRS9DY7TW0jJm
MCQRasINDo8yKiJdiFT7etlFiRm81kBx9YcxicU5ufB96KaTC/T4JNaj0QIDAQAB
o4IDKDCCAyQwCwYDVR0PBAQDAgUgMB4GA1UdJQQXMBUGCCsGAQUFBwMEBgkrBgEE
AZURBQEwggFGBgNVHSAEggE9MIIBOTCCATUGDSsGAQQBqUaDfQECAQEwggEiMCwG
CCsGAQUFBwIBFiBodHRwOi8vdHJ1c3RjZW50ZXIuYm9zY2guY29tL2NwczCB8QYI
KwYBBQUHAgIwgeQageFUaGUgQm9zY2ggQ2VydGlmaWNhdGlvbiBQcmFjdGljZSBT
dGF0ZW1lbnQgKENQUykgYXZhaWxhYmxlIGF0IGh0dHA6Ly90cnVzdGNlbnRlci5i
b3NjaC5jb20vY3BzIGlzIGhlcmVieSBpbmNvcnBvcmF0ZWQgaW50byB5b3VyIHVz
ZSBvciByZWxpYW5jZSBvbiB0aGlzIENlcnRpZmljYXRlLiBUaGlzIENQUyBjb250
YWlucyBsaW1pdGF0aW9ucyBvbiB3YXJyYW50aWVzIGFuZCBsaWFiaWxpdGllcy4w
IwYDVR0RBBwwGoEYQW50b24uUHJpbnNAbmwuYm9zY2guY29tMIIBHgYDVR0fBIIB
FTCCAREwa6BpoGekZTBjMRMwEQYKCZImiZPyLGQBGRYDY29tMRUwEwYKCZImiZPy
LGQBGRYFQm9zY2gxDDAKBgNVBAMTA1BLSTEVMBMGA1UEAxMMQm9zY2gtQ0ExLURF
MRAwDgYDVQQDEwdDUkwxMDQzMIGhoIGeoIGbhlZsZGFwOi8vYm9zY2guY29tL2Nu
PUJvc2NoLUNBMS1ERSxjbj1QS0ksZGM9Qm9zY2gsZGM9Y29tP2NlcnRpZmljYXRl
UmV2b2NhdGlvbkxpc3Q/YmFzZYZBaHR0cDovL3RydXN0Y2VudGVyLmJvc2NoLmNv
bS9DUkwvYm9zY2gtY2ExLWRlX3BraV9jb21fY3JsZmlsZS5jcmwwHwYDVR0jBBgw
FoAU/SZ/DqTmsFivWThWSTU26gCoca0wHQYDVR0OBBYEFK/OJ+L3VkBeupbz3vvq
ppEdag0yMAkGA1UdEwQCMAAwGQYJKoZIhvZ9B0EABAwwChsEVjcuMQMCBLAwDQYJ
KoZIhvcNAQEFBQADggEBAEWlTUsHIrG9pf5yMf2zJdg+QDN8SKhjw267JW4Enpu8
3vhIi7NmX8kxTOZGVdBKLukm0h19u1XTmleEqmVr6XN+qCu5avqGz3qIZjQ8rTGb
nfhnpCi3mrXHKNO8ieYFhfonK4AVsN333vO8KRGJdpfXW6Mp+HVsw1PS2zxIyun6
boCHfZ1Q6PudBcJCiys2UmA/APc6mpVra3ADICwFIn9nsRIpt3nbdQSiLryD4kRf
GHNBl2Y5Cy910IQ+7Of5qawMk7erBYm3IgABYmqMiOeTzDX8R31BYmBcf3/6shjH
ifCjqIEmOzIKiwWYGW6o0lYepFq5Cb5zDw5R+cEDY7AwggbOMIIFtqADAgECAgRD
UY2eMA0GCSqGSIb3DQEBBQUAMFExEzARBgoJkiaJk/IsZAEZFgNjb20xFTATBgoJ
kiaJk/IsZAEZFgVCb3NjaDEMMAoGA1UEAxMDUEtJMRUwEwYDVQQDEwxCb3NjaC1D
QTEtREUwHhcNMTEwOTI3MDcwNTQ1WhcNMTQwOTI3MDczNTQ1WjCBhTETMBEGCgmS
JomT8ixkARkWA2NvbTEVMBMGCgmSJomT8ixkARkWBWJvc2NoMQwwCgYDVQQDEwNw
a2kxDjAMBgNVBAMTBUJPU0NIMQswCQYDVQQDEwJOTDEKMAgGA1UEAxMBQTEKMAgG
A1UEAxMBTjEUMBIGA1UEAxMLQW50b24uUHJpbnMwggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQCprLTjAH3t8BXgJbbzsxyjYVVN3oDo9FjnMSOxjRm/+c05
DedDWc+teaemDu7rc1xSoF2xs+vJYmBEImwdNoGgopRSYiC8FVRLgoXyQI5wkxSJ
enM5/iQvfLh4AfezV0IX1GaTZcmzbvAzq2c3aKIPJddGbXCByomTmDV9S3oKjxXM
b2wVaMzAai70SxpVGYWTCDz0pSxcYwSEJAsSOKM0qwS/cT6Y7yctI7/ZZrIvX4XD
7HuiT364/I7sNyryzd02xjDXgka0I7gr/wVsDw52/9qyLdfK6qtzjrKhXH218MKP
9fFiSORvJJxW/A4swgJhbdbSZsWoDqmyRGqD2TXPAgMBAAGjggN3MIIDczALBgNV
HQ8EBAMCB4AwKwYDVR0QBCQwIoAPMjAxMTA5MjcwNzA1NDVagQ8yMDE0MDkyNzA3
MzU0NVowHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMIIBRgYDVR0gBIIB
PTCCATkwggE1Bg0rBgEEAalGg30BAgEBMIIBIjAsBggrBgEFBQcCARYgaHR0cDov
L3RydXN0Y2VudGVyLmJvc2NoLmNvbS9jcHMwgfEGCCsGAQUFBwICMIHkGoHhVGhl
IEJvc2NoIENlcnRpZmljYXRpb24gUHJhY3RpY2UgU3RhdGVtZW50IChDUFMpIGF2
YWlsYWJsZSBhdCBodHRwOi8vdHJ1c3RjZW50ZXIuYm9zY2guY29tL2NwcyBpcyBo
ZXJlYnkgaW5jb3Jwb3JhdGVkIGludG8geW91ciB1c2Ugb3IgcmVsaWFuY2Ugb24g
dGhpcyBDZXJ0aWZpY2F0ZS4gVGhpcyBDUFMgY29udGFpbnMgbGltaXRhdGlvbnMg
b24gd2FycmFudGllcyBhbmQgbGlhYmlsaXRpZXMuMEYGA1UdEQQ/MD2BGEFudG9u
LlByaW5zQG5sLmJvc2NoLmNvbaAhBgorBgEEAYI3FAIDoBMMEXBzYTFiZGFAYm9z
Y2guY29tMIIBHgYDVR0fBIIBFTCCAREwa6BpoGekZTBjMRMwEQYKCZImiZPyLGQB
GRYDY29tMRUwEwYKCZImiZPyLGQBGRYFQm9zY2gxDDAKBgNVBAMTA1BLSTEVMBMG
A1UEAxMMQm9zY2gtQ0ExLURFMRAwDgYDVQQDEwdDUkwxMTg4MIGhoIGeoIGbhlZs
ZGFwOi8vYm9zY2guY29tL2NuPUJvc2NoLUNBMS1ERSxjbj1QS0ksZGM9Qm9zY2gs
ZGM9Y29tP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZYZBaHR0cDovL3Ry
dXN0Y2VudGVyLmJvc2NoLmNvbS9DUkwvYm9zY2gtY2ExLWRlX3BraV9jb21fY3Js
ZmlsZS5jcmwwHwYDVR0jBBgwFoAU/SZ/DqTmsFivWThWSTU26gCoca0wHQYDVR0O
BBYEFOkQXELmbq/rNVctvWZtFmjnd5RBMAkGA1UdEwQCMAAwGQYJKoZIhvZ9B0EA
BAwwChsEVjcuMQMCBLAwDQYJKoZIhvcNAQEFBQADggEBAI6YSA/d8J4JqVeU1QqP
bIiIIIf1Eh0l1RD2PRjXm1Pgh4AlqLwYLOMCVAL9CRQk6v9xbXFIshnRPWKsdSV4
hATTwOTYBaNr8lgClQT7iqNOb+kIvcivaludA+tRnFqavQUh/PLP0Eli2RD1JjX3
ldCQllS5jUjJzeayiAjYd8cnoCTtZRAfQ9gMzYKRdclMspcKwd7Pek/MLhKtURgm
OV6Xeq9GemNYq0YQtjPov9XF9cbRMUBFtvqbq+mDYn/wb6u36nC9vCUoXgimIggh
XTjEGMfOffwKlSzMjND2Am80eVluQXpZ6+42HLRqhIH2kwqbtJ5yQ3d4P8P2+P5K
JiwxggNCMIIDPgIBATBZMFExEzARBgoJkiaJk/IsZAEZFgNjb20xFTATBgoJkiaJ
k/IsZAEZFgVCb3NjaDEMMAoGA1UEAxMDUEtJMRUwEwYDVQQDEwxCb3NjaC1DQTEt
REUCBENRjZ4wCQYFKw4DAhoFAKCCAb4wFwYLKwYBBAGVEQEIAgExCAQGU0VDVURF
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEyMTIx
MTA4MzQwOFowIwYJKoZIhvcNAQkEMRYEFAaErXvZAfMNI2VZ6QX3brzOT2RbMGgG
CSsGAQQBgjcQBDFbMFkwUTETMBEGCgmSJomT8ixkARkWA2NvbTEVMBMGCgmSJomT
8ixkARkWBUJvc2NoMQwwCgYDVQQDEwNQS0kxFTATBgNVBAMTDEJvc2NoLUNBMS1E
RQIEQ09B4zBqBgsqhkiG9w0BCRACCzFboFkwUTETMBEGCgmSJomT8ixkARkWA2Nv
bTEVMBMGCgmSJomT8ixkARkWBUJvc2NoMQwwCgYDVQQDEwNQS0kxFTATBgNVBAMT
DEJvc2NoLUNBMS1ERQIEQ09B4zBwBgkqhkiG9w0BCQ8xYzBhMAoGCCqGSIb3DQMH
MA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG
9w0DAgIBKDAHBgUrDgMCGjAKBggqhkiG9w0CBTAHBgUrJAMCATANBgkqhkiG9w0B
AQEFAASCAQBhP3kZe6ETXJQwcR3OHjKxk+UeslUouQlSskCTY7BRgZz+Demmk/56
EqsEFxsQerfG2RoPDyZWG4E38UD0XSZyzM+HqdD+xZaOv9t9jnNdWNBjS5DlyNvw
d/98cLn+++x/dBpKVByyuFsO36BNOFa9QfwIwMfU/umhPO8PsXd20hEEnURhSBg+
KFdlRBS7owojRgknzacozFK9iDjimilzKd5Z88mOULY6esh5oLqPtQX6gtl7hoYe
6TqUc1bn/6qEekknyoAD2iZwIW5ccfgVC6tSLIRriOoNCcBfFiP9z7EywM7rmBef
kNgeGKYyWwkkDAtEKeLDl3KRJ2DcP/NmAAAAAAAA
--next-sign-part-=-RtYanx04Vz03rL-=---
