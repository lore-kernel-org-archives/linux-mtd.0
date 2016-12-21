Received: from mail3.marcant.net ([217.14.160.188])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJc0E-0005o2-Sv
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 08:12:00 +0000
Subject: Re: [PATCH V2 2/3] mtd: spi-nor: add support for macronix mx25u3235f
To: Marek Vasut <marek.vasut@gmail.com>, John Crispin <john@phrozen.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1482304990-23942-1-git-send-email-john@phrozen.org>
 <1482304990-23942-3-git-send-email-john@phrozen.org>
 <a5826a87-a45e-4bc6-5ab3-c27c1050f29a@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Andr=c3=a9_Valentin?= <avalentin@marcant.net>
Message-ID: <44b8e7db-e928-d982-3fb7-5dd39ee9844c@marcant.net>
Date: Wed, 21 Dec 2016 09:11:31 +0100
MIME-Version: 1.0
In-Reply-To: <a5826a87-a45e-4bc6-5ab3-c27c1050f29a@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms050703020702090204080202"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a cryptographically signed message in MIME format.

--------------ms050703020702090204080202
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

I took these values from the manufacturer SDK (Qualcomm). I could not det=
ect any problems with the setting.

Kind regards,

Andr=C3=A9

Am 21.12.2016 um 08:33 schrieb Marek Vasut:
> On 12/21/2016 08:23 AM, John Crispin wrote:
>> From: Andr=C3=A9 Valentin <avalentin@marcant.net>
>>
>> This patch adds support for a new macronix spi flash chip. We have had=
 this
>> patch inside our tree for a while and people are actively using router=
s
>> with this chip.
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Andr=C3=A9 Valentin <avalentin@marcant.net>
>> ---
>> Changes in V2
>> * add description
>> * add SECT_4K
>> * fix indenting
>=20
> Are you SURE this chip can do sect_4k ? The datasheet seems to imply
> that, but I wonder why it wasn't in V1 of this patch then ? Esp. if
> people are actively using this chip ...
>=20
>>  drivers/mtd/spi-nor/spi-nor.c |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-n=
or.c
>> index 171adb3..bfff159 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -868,6 +868,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd,=
 loff_t ofs, uint64_t len)
>>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>
>=20
>=20


--------------ms050703020702090204080202
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CfkwggSvMIIDl6ADAgECAhEA4CPLFRKDU4mtYW56VGdrITANBgkqhkiG9w0BAQsFADBvMQsw
CQYDVQQGEwJTRTEUMBIGA1UEChMLQWRkVHJ1c3QgQUIxJjAkBgNVBAsTHUFkZFRydXN0IEV4
dGVybmFsIFRUUCBOZXR3b3JrMSIwIAYDVQQDExlBZGRUcnVzdCBFeHRlcm5hbCBDQSBSb290
MB4XDTE0MTIyMjAwMDAwMFoXDTIwMDUzMDEwNDgzOFowgZsxCzAJBgNVBAYTAkdCMRswGQYD
VQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNP
TU9ETyBDQSBMaW1pdGVkMUEwPwYDVQQDEzhDT01PRE8gU0hBLTI1NiBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAImxDdp6UxlOcFIdvFamBia3uEngludRq/HwWhNJFaO0jBtgvHpRQqd5jKQi3xdh
TpHVdiMKFNNKAn+2HQmAbqUEPdm6uxb+oYepLkNSQxZ8rzJQyKZPWukI2M+TJZx7iOgwZOak
+FaA/SokFDMXmaxE5WmLo0YGS8Iz1OlAnwawsayTQLm1CJM6nCpToxDbPSBhPFUDjtlOdiUC
ISn6o3xxdk/u4V+B6ftUgNvDezVSt4TeIj0sMC0xf1m9UjewM2ktQ+v61qXxl3dnUYzZ7ifr
vKUHOHaMpKk4/9+M9QOsSb7K93OZOg8yq5yVOhM9DkY6V3RhUL7GQD/L5OKfoiECAwEAAaOC
ARcwggETMB8GA1UdIwQYMBaAFK29mHo0tCb3+sQmVO8DveAky1QaMB0GA1UdDgQWBBSSYWuC
4aKgqk/sZ/HCo/e0gADB7DAOBgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAd
BgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMEQGA1Ud
HwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9BZGRUcnVzdEV4dGVybmFs
Q0FSb290LmNybDA1BggrBgEFBQcBAQQpMCcwJQYIKwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVz
ZXJ0cnVzdC5jb20wDQYJKoZIhvcNAQELBQADggEBABsqbqxVwTqriMXY7c1V86prYSvACRAj
mQ/FZmpvsfW0tXdeDwJhAN99Bf4Ss6SAgAD8+x1banICCkG8BbrBWNUmwurVTYT7/oKYz1gb
4yJjnFL4uwU2q31Ypd6rO2Pl2tVz7+zg+3vio//wQiOcyraNTT7kSxgDsqgt1Ni7QkuQaYUQ
26Y3NOh74AEQpZzKOsefT4g0bopl0BqKu6ncyso20fT8wmQpNa/WsadxEdIDQ7GPPprsnjJT
9HaSyoY0B7ksyuYcStiZDcGG4pCS+1pCaiMhEOllx/XVu37qjIUgAmLq0ToHLFnFmTPyOInl
tukWeh95FPZKEBom+nyK+5swggVCMIIEKqADAgECAhEA/xr8MgoEFMef47FIKcRDLTANBgkq
hkiG9w0BAQsFADCBmzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3Rl
cjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxQTA/BgNV
BAMTOENPTU9ETyBTSEEtMjU2IENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVt
YWlsIENBMB4XDTE2MDMyMTAwMDAwMFoXDTE3MDMyMTIzNTk1OVowJjEkMCIGCSqGSIb3DQEJ
ARYVYXZhbGVudGluQG1hcmNhbnQubmV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEA2iHNhcoIWlkvwyHj65beS8N7o6WwGcq0cDeEDFVXsdCpQwJKWYhgB9BwNqS0JSh8FZG0
Taf3gCpMnKJyXhaK8COvvrUhidyCaOJ4ijZlmGrDgQZVWHxw9fXHVmgz8q0QYxquqo+UJ/79
SDvqNP5FgmqCLgpltkdBFo8JF7uMtbykIeMYwX7bt8Vqe5LhKhkoVbQcUkvq9XGFsC8aZs/v
sTmiiBs3hZg/C9nDKFgO5HU1gWUla9CPnaPfeXl2tNVlPu1p0WhtWjDaG7W7yKxB2DqsDa6/
V5wOAbMp1itTqZd+XANu/dqBDFheFA050Wz/bbi1hoz53dcnUyAbC1Z87wIDAQABo4IB8zCC
Ae8wHwYDVR0jBBgwFoAUkmFrguGioKpP7GfxwqP3tIAAwewwHQYDVR0OBBYEFACR9zkLspnA
Y0uFjp2ehN2ezWjdMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMCAGA1UdJQQZMBcG
CCsGAQUFBwMEBgsrBgEEAbIxAQMFAjARBglghkgBhvhCAQEEBAMCBSAwRgYDVR0gBD8wPTA7
BgwrBgEEAbIxAQIBAQEwKzApBggrBgEFBQcCARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5l
dC9DUFMwXQYDVR0fBFYwVDBSoFCgToZMaHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RP
U0hBMjU2Q2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNybDCBkAYIKwYB
BQUHAQEEgYMwgYAwWAYIKwYBBQUHMAKGTGh0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9E
T1NIQTI1NkNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYIKwYB
BQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAgBgNVHREEGTAXgRVhdmFsZW50aW5A
bWFyY2FudC5uZXQwDQYJKoZIhvcNAQELBQADggEBAEvbnAJnoalXbR/lSN0iy+2/F44lT2KJ
dRk0OrtMN/7M1hbU+9oYc38mXqmD9REjrRjX66MqdRoaF6Dyxno9liKdKKA4NpYLXSLg07cX
HxDU4YTua06WUasKoAOgy/dAiF7mJwarOHW8BjWmpuGZnEMLK9+8FQrJ816ciUqxziXcGFZb
mrnLilJ6eNWeD8ZIX5jyZ8px2zt51Kv0VY/NZ5Dlq5n27TC/WGzD9wOtRWenlNC+lEnDkJ41
9Clm4jMsAaGZzAHEpNNF/YDqnkHQH23VsLQoMPN3mO+Nbcx7mygbCQQ4WIZRdBdmnzPcOu60
tvVH63W/QMKGLDh7aZw1WVcxggREMIIEQAIBATCBsTCBmzELMAkGA1UEBhMCR0IxGzAZBgNV
BAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09N
T0RPIENBIExpbWl0ZWQxQTA/BgNVBAMTOENPTU9ETyBTSEEtMjU2IENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA/xr8MgoEFMef47FIKcRDLTANBglghkgB
ZQMEAgEFAKCCAmMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
MTYxMjIxMDgxMTMxWjAvBgkqhkiG9w0BCQQxIgQgVlwu7ZW++pia2wl11/rzWBnQMUymhPmi
N2OafhTa/YowbAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoG
CCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggq
hkiG9w0DAgIBKDCBwgYJKwYBBAGCNxAEMYG0MIGxMIGbMQswCQYDVQQGEwJHQjEbMBkGA1UE
CBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01P
RE8gQ0EgTGltaXRlZDFBMD8GA1UEAxM4Q09NT0RPIFNIQS0yNTYgQ2xpZW50IEF1dGhlbnRp
Y2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQD/GvwyCgQUx5/jsUgpxEMtMIHEBgsqhkiG
9w0BCRACCzGBtKCBsTCBmzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxQTA/
BgNVBAMTOENPTU9ETyBTSEEtMjU2IENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBAhEA/xr8MgoEFMef47FIKcRDLTANBgkqhkiG9w0BAQEFAASCAQCzTgTC8n1m
G4BumH1k4P7JxfhbJbz2irJEsVQIDUJvuPE8/ST42riIlRqxOGqs6SJ97SC2UxD/CgQvBrwU
4nrLovejvDWFjRpE9gQI/iiALK5KQddnA3ckKctg3DZRlQtlwQEBDHHHGuoL1JgwYNtziJDF
k8ovMRXO0RUmsYdyYOIfCsIAwd7QgpVs6BDgGkItVIw9KYaGDeXqexpfm3DEULNmOXBHQGJo
qeQxt4l3uv/9ZTmXTqdIP5IRsm6qpxhUUlTRjdOaQF+c4wIJW7zUpJ20e8rcBXVg6d88nohe
ZPL3FtxAQw7bydLe4Mu3EZAJ5JEWCh7RV03zwZarCPgSAAAAAAAA
--------------ms050703020702090204080202--
