Message-ID: <1423822421.5969.11.camel@infradead.org>
Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
From: David Woodhouse <dwmw2@infradead.org>
To: liu.song11@zte.com.cn
Date: Fri, 13 Feb 2015 10:13:41 +0000
In-Reply-To: <OF4EF0DB08.789494F2-ON48257DEB.0016B74A-48257DEB.0016DF0F@zte.com.cn>
References: <OFA26F19B7.DF3A70A5-ON48257D7B.00265361-48257D7B.0033C198@zte.com.cn>
 <1423748599.15180.10.camel@infradead.org>
 <OF4EF0DB08.789494F2-ON48257DEB.0016B74A-48257DEB.0016DF0F@zte.com.cn>
Content-Type: multipart/signed; micalg="sha-1";
 protocol="application/x-pkcs7-signature";
 boundary="=-Z2PoPfBarUlaJN/7VMlH"
Mime-Version: 1.0
Cc: jiang.xuexin@zte.com.cn, wang.bo116@zte.com.cn,
 linux-mtd@lists.infradead.org, deng.chao1@zte.com.cn, cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Z2PoPfBarUlaJN/7VMlH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the excellent analysis. However, I'm a little confused,
and I'm not sure we're focusing on the right thing.

Step five is to *unlink* the direction /mnt/old. Here's a
carefully-selected citation of your email...

On Fri, 2015-02-13 at 12:09 +0800, liu.song11@zte.com.cn wrote:
>=20
> 5. rmdir /mnt/old=20
> 6. mkdir /mnt/old=20
> 7. goto step 3=20
>=20
> In this loop, there only /mnt/old's ino number will changed.=20
>=20
> Before the problem happen, here we print the dirents' info(after step
> 3 and before step4).=20
> We can see=EF=BC=8C/mnt/old/SW1's pino is 71, that means /mnt/old's ino
> number is 71.=20
> The dirents all in same eraseblock(0x0e600000 - 0x0e61FFFF).=20
> -------------------------------------------------------------=20
 ...
> ino =3D 71, name =3D old, version =3D 299, pino =3D 1, ofs =3D 0x0e6186bc=
=20
> -------------------------------------------------------------=20

OK.

> After step5 and before step6, we print the dirents' info.=20
...
> ino =3D 0, name =3D old, version =3D 298, pino =3D 1, ofs =3D 0x0e6185c4=
=20
> ino =3D 71, name =3D old, version =3D 299, pino =3D 1, ofs =3D 0x0e6186bc=
=20
> ---------------------------------------------------------------

That looks wrong. You said you unlinked /mnt/old. But a deletion dirent
appeared *before* the creation, with an *older* version number?

Was that an older deletion dirent from a previous round, and you just
didn't include it in your previous printout (also cited above)? Is the
*new* deletion dirent with version =3D 300 somewhere else on the flash?

This is the problem, I think.

I don't *care* if the old dirents for <ino#71>/SW1 and <ino#71>/SW2 are
marked as obsolete or not. Because the directory <ino#71> *itself* as
unlinked and should be dead.

If <ino#71> is somehow ending up linked as /mnt/foo again when it should
have been unlinked, *that* is the problem we need to be looking at. The
zombie *children* of <ino#71> are just a symptom of its reincarnation.

--=20
dwmw2

--=-Z2PoPfBarUlaJN/7VMlH
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIISxDCCBjQw
ggQcoAMCAQICAR4wDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDE1NVoX
DTE3MTAyNDIxMDE1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMcJg8zOLdgasSmkLhOrlr6KMoOMpohBllVHrdRvEg/q6r8jR+EK
75xCGhR8ToREoqe7zM9/UnC6TS2y9UKTpT1v7RSMzR0t6ndl0TWBuUr/UXBhPk+Kmy7bI4yW4urC
+y7P3/1/X7U8ocb8VpH/Clt+4iq7nirMcNh6qJR+xjOhV+VHzQMALuGYn5KZmc1NbJQYclsGkDxD
z2UbFqE2+6vIZoL+jb9x4Pa5gNf1TwSDkOkikZB1xtB4ZqtXThaABSONdfmv/Z1pua3FYxnCFmdr
/+N2JLKutIxMYqQOJebr/f/h5t95m4JgrM3Y/w7YX9d7YAL9jvN4SydHsU6n65cCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRTcu2SnODaywFc
fH6WNU7y1LhRgjAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBAAqDCH14qywG
XLhjjF6uHLkjd02hcdh9hrw+VUsv+q1eeQWB21jWj3kJ96AUlPCoEGZ/ynJNScWy6QMVQjbbMXlt
UfO4n4bGGdKo3awPWp61tjAFgraLJgDk+DsSvUD6EowjMTNx25GQgyYJ5RPIzKKR9tQW8gGK+2+R
HxkUCTbYFnL6kl8Ch507rUdPPipJ9CgJFws3kDS3gOS5WFMxcjO5DwKfKSETEPrHh7p5shuuNktv
sv6hxHTLhiMKX893gxdT3XLS9OKmCv87vkINQcNEcIIoFWbP9HORz9v3vQwR4e3ksLc2JZOAFK+s
sS5XMEoznzpihEP0PLc4dCBYjbvSD7kxgDwZ+Aj8Q9PkbvE9sIPP7ON0fz095HdThKjiVJe6vofq
+n6b1NBc8XdrQvBmunwxD5nvtTW4vtN6VY7mUCmxsCieuoBJ9OlqmsVWQvifIYf40dJPZkk9YgGT
zWLpXDSfLSplbY2LL9C9U0ptvjcDjefLTvqSFc7tw1sEhF0n/qpA2r0GpvkLRDmcSwVyPvmjFBGq
Up/pNy8ZuPGQmHwFi2/14+xeSUDG2bwnsYJQG2EdJCB6luQ57GEnTA/yKZSTKI8dDQa8Sd3zfXb1
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIGQjCCBSqg
AwIBAgIDCdkyMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTQwNTA0MTczMDIyWhcNMTUwNTA0MjM0MTAxWjBdMRkwFwYDVQQNExAzODNCMTVkSHFQSUR0cDZO
MRwwGgYDVQQDDBNkd213MkBpbmZyYWRlYWQub3JnMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZy
YWRlYWQub3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy7K+t+REIdZGFUfgR8Io
QrJ/VLZil9I00JcwqTo8BiGy1dqSIB2y923siya5SDKMh1YurtCPsX96cNzwPmmN2cs0MKeVPQWz
iQhHk3uKcB6LvvS7pzTahRWMRmTyW3CH+RphRM9plvyClY23GEeEnpBnGz4GaJJiPcJjGgzyZ/tI
q473pOlSrDPZnZk43vt/5CJN46nIZOZ2I+PzlgINI+EbiwsXVn3VohHB7nVTwGaRLk5oywGt8ZT7
tDdxn3BQ3inO1sr5MtkV1o2cHlenIC8mlU8nL/mrqqVve7Vib1YQUycW+Pj4CBYm4FTeuctAvNzK
U/daeBclOZ8ofgQe2wIDAQABo4IC2TCCAtUwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBRAjCSCV70BpLBeXge5DXi+mPhHTTAf
BgNVHSMEGDAWgBRTcu2SnODaywFcfH6WNU7y1LhRgjAeBgNVHREEFzAVgRNkd213MkBpbmZyYWRl
YWQub3JnMIIBTAYDVR0gBIIBQzCCAT8wggE7BgsrBgEEAYG1NwECAzCCASowLgYIKwYBBQUHAgEW
Imh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0
YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdh
cyBpc3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAxIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRz
IG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRl
ZCBwdXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMu
MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUxLWNybC5jcmww
gY4GCCsGAQUFBwEBBIGBMH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9z
dWIvY2xhc3MxL2NsaWVudC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20v
Y2VydHMvc3ViLmNsYXNzMS5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3Rh
cnRzc2wuY29tLzANBgkqhkiG9w0BAQUFAAOCAQEAWS2KNN7O3vZVtNHXVqgbmijeptKwt+8b6yiF
wT3kJoywInPl5U+OeKRZfQKTHghM4Ohof6lF244ZMxhir/xp7l/zkZ/BUbxLwp6kIL27Gi5pgP4D
KLnTZheQL9N5Yi/vMONxMWcpcW+ZNv5hnDCfEsfVcLXC8sNLPjx2ezfMIhSSPwBuJpmOun70te4E
P0YBqjSalPfvc5fC5KgaYtqTDFwo9Mw25X5HHDC0r6BK5aNrF1nD/xYTX7cdvZZWl7cUApr4PCrn
uI2DEn7OWQ/rY407ytV1c5pjvmuv/IT/ZUb/kXV6Q47UvrJp2Ifi2VhsBcnHHasKavjtRCmpDsGM
rTCCBkIwggUqoAMCAQICAwnZMjANBgkqhkiG9w0BAQUFADCBjDELMAkGA1UEBhMCSUwxFjAUBgNV
BAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNp
Z25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xp
ZW50IENBMB4XDTE0MDUwNDE3MzAyMloXDTE1MDUwNDIzNDEwMVowXTEZMBcGA1UEDRMQMzgzQjE1
ZEhxUElEdHA2TjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzEiMCAGCSqGSIb3DQEJARYT
ZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMuyvrfk
RCHWRhVH4EfCKEKyf1S2YpfSNNCXMKk6PAYhstXakiAdsvdt7IsmuUgyjIdWLq7Qj7F/enDc8D5p
jdnLNDCnlT0Fs4kIR5N7inAei770u6c02oUVjEZk8ltwh/kaYUTPaZb8gpWNtxhHhJ6QZxs+BmiS
Yj3CYxoM8mf7SKuO96TpUqwz2Z2ZON77f+QiTeOpyGTmdiPj85YCDSPhG4sLF1Z91aIRwe51U8Bm
kS5OaMsBrfGU+7Q3cZ9wUN4pztbK+TLZFdaNnB5XpyAvJpVPJy/5q6qlb3u1Ym9WEFMnFvj4+AgW
JuBU3rnLQLzcylP3WngXJTmfKH4EHtsCAwEAAaOCAtkwggLVMAkGA1UdEwQCMAAwCwYDVR0PBAQD
AgSwMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUQIwkgle9AaSwXl4H
uQ14vpj4R00wHwYDVR0jBBgwFoAUU3Ltkpzg2ssBXHx+ljVO8tS4UYIwHgYDVR0RBBcwFYETZHdt
dzJAaW5mcmFkZWFkLm9yZzCCAUwGA1UdIASCAUMwggE/MIIBOwYLKwYBBAGBtTcBAgMwggEqMC4G
CCsGAQUFBwIBFiJodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9wb2xpY3kucGRmMIH3BggrBgEFBQcC
AjCB6jAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgEBGoG+VGhpcyBjZXJ0
aWZpY2F0ZSB3YXMgaXNzdWVkIGFjY29yZGluZyB0byB0aGUgQ2xhc3MgMSBWYWxpZGF0aW9uIHJl
cXVpcmVtZW50cyBvZiB0aGUgU3RhcnRDb20gQ0EgcG9saWN5LCByZWxpYW5jZSBvbmx5IGZvciB0
aGUgaW50ZW5kZWQgcHVycG9zZSBpbiBjb21wbGlhbmNlIG9mIHRoZSByZWx5aW5nIHBhcnR5IG9i
bGlnYXRpb25zLjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9jcnR1
MS1jcmwuY3JsMIGOBggrBgEFBQcBAQSBgTB/MDkGCCsGAQUFBzABhi1odHRwOi8vb2NzcC5zdGFy
dHNzbC5jb20vc3ViL2NsYXNzMS9jbGllbnQvY2EwQgYIKwYBBQUHMAKGNmh0dHA6Ly9haWEuc3Rh
cnRzc2wuY29tL2NlcnRzL3N1Yi5jbGFzczEuY2xpZW50LmNhLmNydDAjBgNVHRIEHDAahhhodHRw
Oi8vd3d3LnN0YXJ0c3NsLmNvbS8wDQYJKoZIhvcNAQEFBQADggEBAFktijTezt72VbTR11aoG5oo
3qbSsLfvG+sohcE95CaMsCJz5eVPjnikWX0Ckx4ITODoaH+pRduOGTMYYq/8ae5f85GfwVG8S8Ke
pCC9uxouaYD+Ayi502YXkC/TeWIv7zDjcTFnKXFvmTb+YZwwnxLH1XC1wvLDSz48dns3zCIUkj8A
biaZjrp+9LXuBD9GAao0mpT373OXwuSoGmLakwxcKPTMNuV+RxwwtK+gSuWjaxdZw/8WE1+3Hb2W
Vpe3FAKa+Dwq57iNgxJ+zlkP62ONO8rVdXOaY75rr/yE/2VG/5F1ekOO1L6yadiH4tlYbAXJxx2r
Cmr47UQpqQ7BjK0xggNvMIIDawIBATCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2
BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMJ
2TIwCQYFKw4DAhoFAKCCAa8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUx
DxcNMTUwMjEzMTAxMzQyWjAjBgkqhkiG9w0BCQQxFgQUX1ny4vBDM7IGVz0kKKpMWneNGUcwgaUG
CSsGAQQBgjcQBDGBlzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4x
KzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0
YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMJ2TIwgacGCyqG
SIb3DQEJEAILMYGXoIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjEr
MCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3Rh
cnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwnZMjANBgkqhkiG
9w0BAQEFAASCAQA+W71zKe+7/NVwGMn7NznhdSli29jf/iqpVCpPFGix+mzqc5O7tdJDsKsckMrT
3kHrM2qlZ2hbPAXT8DGFWFvebomwu2lr+hl7ayMr6xq6nONCfFkmB2/3JM/YwI19azbdYfkL3n8T
mUbNao6ZRf7B3rzn6hiADO1BAD2MBvSI9H7Bf2P2sMe7MtDoUuvfY2g2/kRJKvZQ3g6q3CXQE5cH
CRiWGvqiZ1vUPvoneIj2yTHI+WAP0D2Dgx1TchwmJ1KTngtzx4mTQ3oAVUD+NpCJP/p1fGVZspQF
3g33Xu2s/bOokOvEcgDthE40+ZlhYcESX45KAI05dLKiG85B9cszAAAAAAAA


--=-Z2PoPfBarUlaJN/7VMlH--
