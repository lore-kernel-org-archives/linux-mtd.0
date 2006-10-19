Received: from web54408.mail.yahoo.com ([206.190.49.138])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GaYdL-0000Oy-WE
	for linux-mtd@lists.infradead.org; Thu, 19 Oct 2006 10:12:40 -0400
Message-ID: <20061019140534.10858.qmail@web54408.mail.yahoo.com>
Date: Thu, 19 Oct 2006 07:05:29 -0700 (PDT)
From: David Anders <dave123_aml@yahoo.com>
Subject: patch to leave cfi in read-array on suspend(reposted)
To: linux-mtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-470975596-1161266729=:9606"
Content-Transfer-Encoding: 8bit
Cc: nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0-470975596-1161266729=:9606
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Id: 
Content-Disposition: inline

greetings,

during some testing with several samsung s3c24xx based
devices it was discovered that often the
cfi_cmdset_0001.c would not leave the chip in
read-array mode on suspend. this is an issue if the
same flash chip is used for the bootloader that needs
to be read on resume. attached is a patch generated
against the 2.6.18 kernel and has been tested with
several s3c24xx based devices as well as several sharp
lh79520 devices. your feedback would be appreciated.

Signed-off-by: David Anders <danders@amltd.com>

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
--0-470975596-1161266729=:9606
Content-Type: application/octet-stream; name="cfi_cmdset_0001.patch"
Content-Transfer-Encoding: base64
Content-Description: 3238585821-cfi_cmdset_0001.patch
Content-Disposition: attachment; filename="cfi_cmdset_0001.patch"

LS0tIGxpbnV4LTIuNi4xOC9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDEuYwkyMDA2LTA5LTE5IDIzOjQyOjA2LjAwMDAwMDAwMCAtMDQwMAor
KysgbGludXgtMi42LjE4LW01OTAwL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMS5jCTIwMDYtMDktMjIgMDk6MTY6MjEuMDAwMDAwMDAwIC0w
NDAwCkBAIC0yMjI0LDYgKzIyMjQsOCBAQAogCQljYXNlIEZMX0NGSV9RVUVS
WToKIAkJY2FzZSBGTF9KRURFQ19RVUVSWToKIAkJCWlmIChjaGlwLT5vbGRz
dGF0ZSA9PSBGTF9SRUFEWSkgeworCQkJCS8qIHBsYWNlIHRoZSBjaGlwIGlu
IGEga25vd24gc3RhdGUgYmVmb3JlIHN1c3BlbmQgKi8KKwkJCQltYXBfd3Jp
dGUobWFwLCBDTUQoMHhGRiksIGNmaS0+Y2hpcHNbaV0uc3RhcnQpOwogCQkJ
CWNoaXAtPm9sZHN0YXRlID0gY2hpcC0+c3RhdGU7CiAJCQkJY2hpcC0+c3Rh
dGUgPSBGTF9QTV9TVVNQRU5ERUQ7CiAJCQkJLyogTm8gbmVlZCB0byB3YWtl
X3VwKCkgb24gdGhpcyBzdGF0ZSBjaGFuZ2UgLQo=

--0-470975596-1161266729=:9606--
