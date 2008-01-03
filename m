Received: from e35.co.us.ibm.com ([32.97.110.153])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JAPY1-0002Ub-Cj
	for linux-mtd@lists.infradead.org; Thu, 03 Jan 2008 12:51:52 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m03CphtQ025562
	for <linux-mtd@lists.infradead.org>; Thu, 3 Jan 2008 07:51:43 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m03Cphbh111608
	for <linux-mtd@lists.infradead.org>; Thu, 3 Jan 2008 05:51:43 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m03CpPko005094
	for <linux-mtd@lists.infradead.org>; Thu, 3 Jan 2008 05:51:26 -0700
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
From: Frank Haverkamp <haver@vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1198075329.18962.70.camel@sauron>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<20071219154158.23264.95037.sendpatchset@golum>
	<200712191517.18166.arnd@arndb.de> <1198075329.18962.70.camel@sauron>
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-M0bF9VGbh0J/hxtXi+uJ"
Date: Thu, 03 Jan 2008 13:51:39 +0100
Message-Id: <1199364699.7726.34.camel@august>
Mime-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>, haver@vnet.ibm.com
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-M0bF9VGbh0J/hxtXi+uJ
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi Arnd and Artem,

On Wed, 2007-12-19 at 16:42 +0200, Artem Bityutskiy wrote:
> On Wed, 2007-12-19 at 15:17 +0100, Arnd Bergmann wrote:
> > > +struct ubi_attach_req {
> > > +       int32_t vid_hdr_offset;
> > > +       int32_t data_offset;
> > >  };
> >=20
> > Can you explain why you need to pass vid_hdr_offset /and/ data_offset h=
ere?
> > What is the difference between the two?

Data in flash:
EC-hdr | VID-hdr | Data
-------> VID-hdr-offs
-----------------> Data-offset

>  Can't you autoprobe them if you
> > have the device?
>=20
> vid_hdr_offset is the offset of the VID header withing an eraseblock.
> data_offs is where the data starts. We want to be able to let users
> select the VID header offset.

> Vs data offset - indeed it is redundant
> and might be dropped because UBI may just assume data starts at the next
> min. I/O unit after the VID header.

Traditionally NAND could only be written only in page-chunks e.g. 2KiB.
Thomas Gleixner introduced that subpages could be written too e.g. 512B.

In our usage example we decided, that we wanted to have the EC-hdr at
offset 0, and the VID-hdr at the end of the last subpage of page 0 in
the NAND-erase block. We wanted the data to start at a page boundary so
that e.g. JFFS2 can use the pagesize as minimum write size and not the
sub-pagesize.

Our layout:
page 0                  | page 1                   | ...
subpage | ... | subpage | subpage | ...  | subpage | ...
EC-hdr  | ... | VID-hdr | Data

Default layout (Artem, correct me if I am wrong):
page 0                          | page 1                   | ...
subpage | ...     | subpage ... | subpage | ...  | subpage | ...
EC-hdr  | VID-hdr | Data

> We can autoprobe the VID header offset, unless the MTD device is empty,
> in which case UBI automatically formats it.

I do not like auto-probing the VID hdr offset. In my eyes the user
should have the flexibility to define where his VID-hdr and data start
e.g. like in our case to have influence on if data is starting on
subpage- or page-boundaries. I also think that the autoprobe feature
would add more complexity to the code.

> > The reason I'm asking is that I'd really like to make this a simple
> > attribute in sysfs, in the mtd object. The question there is what a
> > user would need to store into that attribute. The device is identified
> > implicitly already, but this looks like you still need two distint
> > integers in order to create an UBI device.

I think with our current usage calculating the data offset as next free
min-io-offset would work, although the fact that we want to store our
data at a page-offset would be done implicitly than.

I wonder which layout Thomas Gleixner and Josh Boyer are using? Would it
work to calculate the data offset in your case?

Frank

--=20
IBM Deutschland Entwicklung GmbH, Schoenaicher Str. 220, 71032
Boeblingen, Vorsitzender des Aufsichtsrats: Martin Jetter
Gesch=E4ftsf=FChrung: Herbert Kircher, Sitz der Gesellschaft: B=F6blingen,
Registergericht: Amtsgericht Stuttgart, HRB 243294

--=-M0bF9VGbh0J/hxtXi+uJ
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIP9DCCBSww
ggSVoAMCAQICEDqcN60eyFMWG0XIVQBLNZgwDQYJKoZIhvcNAQEFBQAwgcExCzAJBgNVBAYTAlVT
MRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjE8MDoGA1UECxMzQ2xhc3MgMiBQdWJsaWMgUHJpbWFy
eSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eSAtIEcyMTowOAYDVQQLEzEoYykgMTk5OCBWZXJpU2ln
biwgSW5jLiAtIEZvciBhdXRob3JpemVkIHVzZSBvbmx5MR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMB4XDTAzMDUwNjAwMDAwMFoXDTEzMDUwNTIzNTk1OVowgfkxCzAJBgNVBAYTAlVT
MTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnBvcmF0aW9uMR8w
HQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYDVQQLEzJUZXJtcyBvZiB1c2UgYXQg
aHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykwMzEwMC4GA1UECxMnQ2xhc3MgMiBPblNp
dGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQwIgYDVQQDExtJQk0gQ2VydGlmaWNhdGlvbiBB
dXRob3JpdHkwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANVnrTXdoH79V2HWnacXy7mjjSNc
nOi3Z+cXSBh9uSDhCLAUUeuvoHubuA5ImrJI5k/dA+Q0L+WNzR7OZr4TRpw3DOksYS/0o+RZ5+lu
J7ltXcdVgsHU6qqHDpvF1hAegqpNz670JVVfUs4ThC1AafMIBHwmJbqFG4Iy39OH37oBAgMBAAGj
ggHpMIIB5TASBgNVHRMBAf8ECDAGAQH/AgEAMEQGA1UdIAQ9MDswOQYLYIZIAYb4RQEHFwIwKjAo
BggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYTA0BgNVHR8ELTArMCmgJ6Al
hiNodHRwOi8vY3JsLnZlcmlzaWduLmNvbS9wY2EyLWcyLmNybDALBgNVHQ8EBAMCAQYwEQYJYIZI
AYb4QgEBBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEyNzAd
BgNVHQ4EFgQUkcFzsHPV2ZJ0Z80b8VEUNDG2LFowgegGA1UdIwSB4DCB3aGBx6SBxDCBwTELMAkG
A1UEBhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTwwOgYDVQQLEzNDbGFzcyAyIFB1Ymxp
YyBQcmltYXJ5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5IC0gRzIxOjA4BgNVBAsTMShjKSAxOTk4
IFZlcmlTaWduLCBJbmMuIC0gRm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkxHzAdBgNVBAsTFlZlcmlT
aWduIFRydXN0IE5ldHdvcmuCEQC5L2DMiJ+hekYJuFtwbIqvMA0GCSqGSIb3DQEBBQUAA4GBAJcM
UE/GM7DSGWSfEaUELX8FdU5Ug5WUfJVLTc4s5xDj+d9P/sxo39ofCYcyBrVFpessapDKDJKKCu6z
bSNwKStMN7smU6TYiyT2FP216Adb5wsu94gxblObFoms2qG/BuGHbFxtbIBAiCNlFcRk69rPUGu/
EOvQeUAR+Ub1NkjPMIIFXjCCBMegAwIBAgIQBx15Uc8dgKRMua0Jq2/yNTANBgkqhkiG9w0BAQQF
ADCB+TELMAkGA1UEBhMCVVMxNDAyBgNVBAoTK0ludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGlu
ZXMgQ29ycG9yYXRpb24xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNVBAsT
MlRlcm1zIG9mIHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTAzMTAwLgYD
VQQLEydDbGFzcyAyIE9uU2l0ZSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0ExJDAiBgNVBAMTG0lC
TSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0wNzA0MTYwMDAwMDBaFw0wODA0MTUyMzU5NTla
MIGJMS4wLAYDVQQKFCVJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnAuMRgwFgYD
VQQDDA9GcmFuayBIYXZlcmthbXAxGTAXBgoJkiaJk/IsZAEBFAkxMjQ2MTQ3MjQxIjAgBgkqhkiG
9w0BCQEWE2hhdmVya2FtQGRlLmlibS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANqa
0RVcURGtTfJRuKOEaQPrtJrWVAmWFTIA2YdQSiHJDgg+OLG/dnlpyqU0JOfcd3j1ZyQK7EFpoT03
B4Bx4MWBSoWdf3bdbEmKvYIM2BddBVgisGiwhWklRsoGiItckT7xSVK5P3hvLCXjBvcdbxcm4VS2
NRyJfGEyeoGiObLdAgMBAAGjggJTMIICTzAJBgNVHRMEAjAAMAsGA1UdDwQEAwIFoDBmBgNVHR8E
XzBdMFugWaBXhlVodHRwOi8vb25zaXRlY3JsLnZlcmlzaWduLmNvbS9JbnRlcm5hdGlvbmFsQnVz
aW5lc3NNYWNoaW5lc0NvcnBDb3Jwb3JhdGVDSU8vTGF0ZXN0Q1JMMIIBKQYDVR0gBIIBIDCCARww
ggEYBgtghkgBhvhFAQcXAjCCAQcwKwYIKwYBBQUHAgEWH2h0dHBzOi8vd3d3LnZlcmlzaWduLmNv
bS9ycGEta3IwgdcGCCsGAQUFBwICMIHKGoHHTm90aWNlIFRleHQ9Tk9USUNFOiBQcml2YXRlIGtl
eSBtYXkgYmUgcmVjb3ZlcmVkIGJ5IFZlcmlTaWduJ3MgY3VzdG9tZXIgd2hvIG1heSBiZSBhYmxl
IHRvIGRlY3J5cHQgbWVzc2FnZXMgeW91IHNlbmQgdG8gY2VydGlmaWNhdGUgaG9sZGVyLiAgVXNl
IGlzIHN1YmplY3QgdG8gdGVybXMgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYS1rcjAf
BgNVHSMEGDAWgBSRwXOwc9XZknRnzRvxURQ0MbYsWjAdBgNVHQ4EFgQUbOeIIYn3x+GgI5Am0KHt
R62Y458wLgYDVR0RBCcwJaAjBgorBgEEAYI3FAIDoBUME2hhdmVya2FtQGRlLmlibS5jb20wHQYD
VR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGCWCGSAGG+EIBAQQEAwIFoDANBgkqhkiG9w0B
AQQFAAOBgQAJ6/At+OSf4q8CRKWRmIxb3m0Sk6YfSTI6gu+YIu6LiOIq3BFH7XhRGiM+KqQaKyKe
9Ar+L/QzI9YQMIShrA9m2eFKVrfsBTeSn2/d+wTYM4rjyYtv24qeYSKF9yqWGMW+Oy9SIjb9TAgF
A0rQrpiAExeGgoIuDAsZFr4+EfUkcDCCBV4wggTHoAMCAQICEAcdeVHPHYCkTLmtCatv8jUwDQYJ
KoZIhvcNAQEEBQAwgfkxCzAJBgNVBAYTAlVTMTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2lu
ZXNzIE1hY2hpbmVzIENvcnBvcmF0aW9uMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3Jr
MTswOQYDVQQLEzJUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAo
YykwMzEwMC4GA1UECxMnQ2xhc3MgMiBPblNpdGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQw
IgYDVQQDExtJQk0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMDcwNDE2MDAwMDAwWhcNMDgw
NDE1MjM1OTU5WjCBiTEuMCwGA1UEChQlSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyBD
b3JwLjEYMBYGA1UEAwwPRnJhbmsgSGF2ZXJrYW1wMRkwFwYKCZImiZPyLGQBARQJMTI0NjE0NzI0
MSIwIAYJKoZIhvcNAQkBFhNoYXZlcmthbUBkZS5pYm0uY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDamtEVXFERrU3yUbijhGkD67Sa1lQJlhUyANmHUEohyQ4IPjixv3Z5acqlNCTn3Hd4
9WckCuxBaaE9NweAceDFgUqFnX923WxJir2CDNgXXQVYIrBosIVpJUbKBoiLXJE+8UlSuT94bywl
4wb3HW8XJuFUtjUciXxhMnqBojmy3QIDAQABo4ICUzCCAk8wCQYDVR0TBAIwADALBgNVHQ8EBAMC
BaAwZgYDVR0fBF8wXTBboFmgV4ZVaHR0cDovL29uc2l0ZWNybC52ZXJpc2lnbi5jb20vSW50ZXJu
YXRpb25hbEJ1c2luZXNzTWFjaGluZXNDb3JwQ29ycG9yYXRlQ0lPL0xhdGVzdENSTDCCASkGA1Ud
IASCASAwggEcMIIBGAYLYIZIAYb4RQEHFwIwggEHMCsGCCsGAQUFBwIBFh9odHRwczovL3d3dy52
ZXJpc2lnbi5jb20vcnBhLWtyMIHXBggrBgEFBQcCAjCByhqBx05vdGljZSBUZXh0PU5PVElDRTog
UHJpdmF0ZSBrZXkgbWF5IGJlIHJlY292ZXJlZCBieSBWZXJpU2lnbidzIGN1c3RvbWVyIHdobyBt
YXkgYmUgYWJsZSB0byBkZWNyeXB0IG1lc3NhZ2VzIHlvdSBzZW5kIHRvIGNlcnRpZmljYXRlIGhv
bGRlci4gIFVzZSBpcyBzdWJqZWN0IHRvIHRlcm1zIGF0IGh0dHBzOi8vd3d3LnZlcmlzaWduLmNv
bS9ycGEta3IwHwYDVR0jBBgwFoAUkcFzsHPV2ZJ0Z80b8VEUNDG2LFowHQYDVR0OBBYEFGzniCGJ
98fhoCOQJtCh7UetmOOfMC4GA1UdEQQnMCWgIwYKKwYBBAGCNxQCA6AVDBNoYXZlcmthbUBkZS5p
Ym0uY29tMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDARBglghkgBhvhCAQEEBAMCBaAw
DQYJKoZIhvcNAQEEBQADgYEACevwLfjkn+KvAkSlkZiMW95tEpOmH0kyOoLvmCLui4jiKtwRR+14
URojPiqkGisinvQK/i/0MyPWEDCEoawPZtnhSla37AU3kp9v3fsE2DOK48mLb9uKnmEihfcqlhjF
vjsvUiI2/UwIBQNK0K6YgBMXhoKCLgwLGRa+PhH1JHAxggRjMIIEXwIBATCCAQ4wgfkxCzAJBgNV
BAYTAlVTMTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnBvcmF0
aW9uMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYDVQQLEzJUZXJtcyBvZiB1
c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykwMzEwMC4GA1UECxMnQ2xhc3Mg
MiBPblNpdGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQwIgYDVQQDExtJQk0gQ2VydGlmaWNh
dGlvbiBBdXRob3JpdHkCEAcdeVHPHYCkTLmtCatv8jUwCQYFKw4DAhoFAKCCAqkwGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDgwMTAzMTI1MTM1WjAjBgkqhkiG9w0B
CQQxFgQUXEBbsQ/VM30vY5XY3Axcbc2mWYowggEhBgkrBgEEAYI3EAQxggESMIIBDjCB+TELMAkG
A1UEBhMCVVMxNDAyBgNVBAoTK0ludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgQ29ycG9y
YXRpb24xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNVBAsTMlRlcm1zIG9m
IHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTAzMTAwLgYDVQQLEydDbGFz
cyAyIE9uU2l0ZSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0ExJDAiBgNVBAMTG0lCTSBDZXJ0aWZp
Y2F0aW9uIEF1dGhvcml0eQIQBx15Uc8dgKRMua0Jq2/yNTCCASMGCyqGSIb3DQEJEAILMYIBEqCC
AQ4wgfkxCzAJBgNVBAYTAlVTMTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hp
bmVzIENvcnBvcmF0aW9uMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYDVQQL
EzJUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykwMzEwMC4G
A1UECxMnQ2xhc3MgMiBPblNpdGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQwIgYDVQQDExtJ
Qk0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkCEAcdeVHPHYCkTLmtCatv8jUwDQYJKoZIhvcNAQEB
BQAEgYCI9JxTW5R3DG+LJ/YUKfoaiHfeNuytuypADKW5VACXuw0WtpUrcekw1cTD5njLm9SHvxSW
wZniu8igcjK87E5hobBxr0pWu/S1nTz9D1XxAKmF0z8hf8DVXtazWQ9P/EeYSCMisNUhIDVFL6H/
Qf46FzMs8H8zIwuhPpK4c5LJrQAAAAAAAA==


--=-M0bF9VGbh0J/hxtXi+uJ--
