Received: from webmail.frequentis.com ([213.47.210.151])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JtPxI-0006kW-Ox
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 16:23:53 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C8AF95.8FF9F4CC"
Subject: [RFC][PATCH] making jffs2 more realtime friendly when scanning a
	partly empty eraseblock
Date: Tue, 6 May 2008 18:23:41 +0200
Message-ID: <B80D0E83691CB840ACE9714151F86385014862F9@VIECLEX01.frequentis.frq>
From: "Nielsen David Marqvar" <David.Nielsen@frequentis.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C8AF95.8FF9F4CC
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I've had problems with jitter in a RTP stream occurring during mount of =
a
jffs2 fs.
With the code below, the jitter are significantly decreased.

The problem occurs when scanning an erase block with empty space in it. =
This
scan may take long depending on the size of the empty space within the =
erase
block and the speed of the flash. On my system scanning an almost empty =
(but
NOT completely empty!) erase block can take 80-100 ms (worst case).

I have added the code below to call cond_resched() for each 2 KiB =
scanned
(while the first check will be done before 2 KiB the code is simple and
fast).

Please take a look at the code below - comments are much appreciated.


Patch attached.
(How do I proceed to suggest this committed to the jffs2 source?)

Best regards,
David Marqvar Nielsen

-----
jffs2_scan_eraseblock(), line 653 in scan.c:

			D1(printk(KERN_DEBUG "Found empty flash at 0x%08x\n",
ofs));
		more_empty:
			inbuf_ofs =3D ofs - buf_ofs;
			while (inbuf_ofs < buf_len) {
				if (*(uint32_t *)(&buf[inbuf_ofs]) !=3D
0xffffffff) {
					printk(KERN_WARNING "Empty flash at
0x%08x ends at 0x%08x\n",
					       empty_start, ofs);
					if ((err =3D jffs2_scan_dirty_space(c,
jeb, ofs-empty_start)))
						return err;
					goto scan_more;
				}

+                       /* check for resched - searching an eraseblock =
may
take several ms */
+                       if ( (ofs & 0x7ff /* for each 2KiB */) =3D=3D 0)
+                               cond_resched();
+
				inbuf_ofs+=3D4;
				ofs +=3D 4;
			}
			/* Ran off end. */
			D1(printk(KERN_DEBUG "Empty flash to end of buffer at
0x%08x\n", ofs));



------_=_NextPart_001_01C8AF95.8FF9F4CC
Content-Type: application/octet-stream; name="scan_eraseblock_empty_rt.patch"
Content-Transfer-Encoding: base64
Content-Description: scan_eraseblock_empty_rt.patch
Content-Disposition: attachment;
	filename="scan_eraseblock_empty_rt.patch"

LS0tIC9ob21lX3ZpZS9kbmllbHNlbi9saW51eC0yLjYuMjUuMS9mcy9qZmZzMi9zY2FuLmMJMjAw
OC0wNS0wMSAyMzo0NToyNS4wMDAwMDAwMDAgKzAyMDAKKysrIGZzL2pmZnMyL3NjYW4uYwkyMDA4
LTA1LTA2IDE3OjI1OjU3LjAwMDAwMDAwMCArMDIwMApAQCAtNjUzLDYgKzY1MywxMCBAQAogCQkJ
CQlnb3RvIHNjYW5fbW9yZTsKIAkJCQl9CiAKKwkJCQkvKiBjaGVjayBmb3IgcmVzY2hlZCAtIHNl
YXJjaGluZyBhbiBlcmFzZWJsb2NrIG1heSB0YWtlIHNldmVyYWwgbXMgKi8KKwkJCQlpZiAoIChv
ZnMgJiAweDdmZiAvKiBmb3IgZWFjaCAyS2lCICovKSA9PSAwKQorCQkJCQljb25kX3Jlc2NoZWQo
KTsKKwogCQkJCWluYnVmX29mcys9NDsKIAkJCQlvZnMgKz0gNDsKIAkJCX0K

------_=_NextPart_001_01C8AF95.8FF9F4CC--
