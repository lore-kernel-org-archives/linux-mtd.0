Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqpMF-00033U-Vq
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 15:36:17 +0000
Received: by qyk35 with SMTP id 35so828271qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 08:36:12 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Sep 2010 17:36:09 +0200
Message-ID: <AANLkTinR9H7B5taVHmowOQ8Z==dQU4PdcnjLyHKPRibV@mail.gmail.com>
Subject: [RFC] [MTD-utils] mkfs.jffs2: JFFS2 and minimal erase block size
From: Yegor Yefremov <yegorslists@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=001636426f9be72ec7048f3474e3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001636426f9be72ec7048f3474e3
Content-Type: text/plain; charset=UTF-8

Hello,

I'm using a NOR flash SST39VF3201. According to its data sheet the
erase size is 2 Kword. That corresponds to -e 0x1000 value. But the
mkfs.jffs2 utility has a limit of 0x2000 bytes. If I change this limit
to 0x1000 and create an image, I can successfully mount and use it,
with 8KiB value the jffs2 driver fails to work with such an image. I
have found some similar complains like this one
http://lists.infradead.org/pipermail/linux-mtd/2009-February/024523.html,
but no one seems to have asked this question on the list.

Is there any reason for limiting erase block to 0x2000?

I've created a patch to decrease this value to 0x1000, but perhaps
there are any other way?

Regards,
Yegor

--001636426f9be72ec7048f3474e3
Content-Type: application/octet-stream; name="jffs2-erase-block-fix.patch"
Content-Disposition: attachment; filename="jffs2-erase-block-fix.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gdkcm7930

U2V0IG1pbmltYWwgZXJhc2UgYmxvY2sgdmFsdWUgdG8gMHgxMDAwIHRvIHN1cHBvcnQgZmxhc2hl
cwp3aXRoIHN1Y2ggZXJhc2UgYmxvY2sKClNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5
ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KCkluZGV4OiBiL21rZnMuamZmczIuYwo9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Ci0tLSBhL21rZnMuamZmczIuYwkyMDEwLTA5LTAxIDE2OjA3OjUzLjAwMDAwMDAwMCArMDIw
MAorKysgYi9ta2ZzLmpmZnMyLmMJMjAxMC0wOS0wMSAxNjowODozNi4wMDAwMDAwMDAgKzAyMDAK
QEAgLTE3NjUsMTAgKzE3NjUsMTAgQEAKIAkJCQkJCSAgZXJhc2VfYmxvY2tfc2l6ZSAqPSB1bml0
czsKIAogCQkJCQkJICAvKiBJZiBpdCdzIGxlc3MgdGhhbiA4S2lCLCB0aGV5J3JlIG5vdCBhbGxv
d2VkICovCi0JCQkJCQkgIGlmIChlcmFzZV9ibG9ja19zaXplIDwgMHgyMDAwKSB7CisJCQkJCQkg
IGlmIChlcmFzZV9ibG9ja19zaXplIDwgMHgxMDAwKSB7CiAJCQkJCQkJICBmcHJpbnRmKHN0ZGVy
ciwgIkVyYXNlIHNpemUgMHgleCB0b28gc21hbGwuIEluY3JlYXNpbmcgdG8gOEtpQiBtaW5pbXVt
XG4iLAogCQkJCQkJCQkJICBlcmFzZV9ibG9ja19zaXplKTsKLQkJCQkJCQkgIGVyYXNlX2Jsb2Nr
X3NpemUgPSAweDIwMDA7CisJCQkJCQkJICBlcmFzZV9ibG9ja19zaXplID0gMHgxMDAwOwogCQkJ
CQkJICB9CiAJCQkJCQkgIGJyZWFrOwogCQkJCQkgIH0K
--001636426f9be72ec7048f3474e3--
