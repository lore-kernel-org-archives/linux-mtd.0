Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dV2z-0001ps-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 11:36:29 +0000
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: <manningc2@actrix.gen.nz>
Cc: "Tony Questad" <tonyq@datalight.com>,
	"Mark Cullen" <mcullen@arcom.co.uk>,
	"Paul Hogan" <pthogan@arcom.co.uk>,
	"Arlen Nipper" <anipper@arcomcontrols.com>,
	"Glen Middleton" <gmiddleton@arcom.co.uk>,
	"MTD for Linux" <linux-mtd@lists.infradead.org>
Subject: RE: FW: [OT] Cf Card vs DiskOnChip -->CF wear levelling
Date: Wed, 20 Feb 2002 11:46:41 -0000
MIME-Version: 1.0
Message-ID: <GEEAIDAKDGCGOMMOLAHMEENKCHAA.ajlennon@arcom.co.uk>
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_00A2_01C1BA04.429856C0"
In-Reply-To: <20020129200142.4CAF11061@creative.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------=_NextPart_000_00A2_01C1BA04.429856C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Charles,

>>I can no longer find the Sandisk reference, so I can't really support
the
>>assertion any more. If I recall correctly, they did wear levelling on
the
>>full-size cards but not on CF. They use (or did use) different
controllers in

The SanDisk folks came back with a white-paper on wear levelling, as
relating
to life-expectancy in CF.

I've put it here, http://www.embeddedsoftware.co.uk/wearlevelling.doc,
for interest sake.

Most interestingly the text (pp2 'Analysis of host dependence') seems  to
be
saying that static data is _not_ wear levelled, which will certainly
impact
our choice of CF sizes for embedded NT and the like.

Best,

-Alex

------=_NextPart_000_00A2_01C1BA04.429856C0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIFwjCCAoIw
ggHroAMCAQICAwbKeDANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdl
c3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsT
FENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAw
MC44LjMwMB4XDTAyMDIxOTEwMDkwNloXDTAzMDIxOTEwMDkwNlowRjEfMB0GA1UEAxMWVGhhd3Rl
IEZyZWVtYWlsIE1lbWJlcjEjMCEGCSqGSIb3DQEJARYUYWpsZW5ub25AYXJjb20uY28udWswgZ8w
DQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMFH6rVN3Cco9Cjq2Yh+qBujN9m6KqwDWNZP4IvJYAZ2
kZSKq9tRo1RZiC8bCeq6Rxxdi0tLfQ9pnE1ApwQGpijpPOuldnSEduAho9/PUtPNQvMTq+iM90wo
Ojwag4Oxn7HFhhGiZirsVqAvzLy46aDFhlraUCzzLMbacKAEIlpfAgMBAAGjMTAvMB8GA1UdEQQY
MBaBFGFqbGVubm9uQGFyY29tLmNvLnVrMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEA
Or/Bc9yKh8cNtsZaSzyksX6jJZgr7xr3Wnk6Z+EHQXIOQd4UXmrQMy4zOQ7Mt/QTo4DXy2aPAmrH
YyPJmmUMe6pH9r/eqdGRuOZ8hzUwgmyNwq3yS8/SQYyFyv+p6CPLulAARL8cpUszegVLa0NvkdX+
dXAvn8Yjb5IwyIpox38wggM4MIICoaADAgECAhBmRXK3zHT1z2N2RYTQLpEBMA0GCSqGSIb3DQEB
BAUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBl
IFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9u
IFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0Ex
KzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDAwODMwMDAw
MDAwWhcNMDQwODI3MjM1OTU5WjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2Fw
ZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmlj
YXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwMIGf
MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDeMzKmY8cJJUU+0m54J2eBxdqIGYKXDuNEKYpjNSpt
cDz63K737nRvMLwzkH/5NHGgo22Y8cNPomXbDfpL8dbdYaX5hc1VmjUanZJ1qCeu2HL5ugL217CR
3hzpq+AYA6h8Q0JQUYeDPPA5tJtUihOH/7ObnUlmAC0JieyUa+mhaQIDAQABo04wTDApBgNVHREE
IjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMS0yOTcwEgYDVR0TAQH/BAgwBgEB/wIBADAL
BgNVHQ8EBAMCAQYwDQYJKoZIhvcNAQEEBQADgYEAMbFLR135AXHl9VNsXXnWPZjAJhNigSKnEvgi
legbSbcnewQ5uvzm8iTrkfq97A0qOPdQVahs9w2tTBu8A/S166JHn2yiDFiNMUIJEWywGmnRKxKy
QF1q+XnQ6i4l3Yrk/NsNH50C81rbyjz2ROomaYd/SJ7OpZ/nhNjJYmKtBcYxggKqMIICpgIBATCB
mjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBU
b3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYD
VQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwAgMGyngwCQYFKw4DAhoFAKCCAWUw
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDIwMjIwMTE0NjQwWjAj
BgkqhkiG9w0BCQQxFgQURsRpkAwWN6EwnSet4fTJ3EHn43kwWAYJKoZIhvcNAQkPMUswSTAKBggq
hkiG9w0DBzAOBggqhkiG9w0DAgICAIAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwBwYFKw4DAhow
CgYIKoZIhvcNAgUwgasGCSsGAQQBgjcQBDGBnTCBmjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgT
DFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNV
BAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0Eg
MjAwMC44LjMwAgMGyngwDQYJKoZIhvcNAQEBBQAEgYCbCOMOvEzsK3ugVroqVEuE8wzh1CXiau7i
c/Liag5MtHlimW/cCLtwe/EMx7q49IuLnOIUXywxUA6aGC/Y9ScggARkCe0LdA0k9P76bsiIFvLz
rjaDEXJvsFNDd8ITBuO7ZxyfrcjdatILReL1Bfbg2wOA4pl5ZA3nP7HY5H9++AAAAAAAAA==

------=_NextPart_000_00A2_01C1BA04.429856C0--
