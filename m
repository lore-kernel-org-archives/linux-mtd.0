Received: from dedekind (helo=localhost)
	by phoenix.infradead.org with local-esmtp (Exim 4.43 #1 (Red Hat
	Linux)) id 1CyU4D-0005Pu-8f
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 12:02:09 +0000
Date: Tue, 8 Feb 2005 12:02:04 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.58.0502081156310.20565@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1456859747-767461628-1107864124=:20565"
Sender: Artem Bityuckiy <dedekind@infradead.org>
Subject: [PATCH] nand_default_block_markbad fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--1456859747-767461628-1107864124=:20565
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hello, here is small bugfix.

Bug description: kernel oops if there is no BBT table and the 
nand_default_block_markbad() function is called.

The patch should be applied to the drivers/mtd/nand/nand_base.c file.

Ok to commit?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
--1456859747-767461628-1107864124=:20565
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="nand_base_bbt_fix.patch"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0502081202040.20565@phoenix.infradead.org>
Content-Description: 
Content-Disposition: attachment; filename="nand_base_bbt_fix.patch"

LS0tIG5hbmRfYmFzZS5jCTIwMDUtMDItMDggMTQ6NTQ6MDMuMzMwODk3MjE5
ICswMzAwDQorKysgbmFuZF9iYXNlX2ZpeGVkLmMJMjAwNS0wMi0wOCAxNDo1
Mjo0NC4zMzAzNzYxMDQgKzAzMDANCkBAIC00NjEsNyArNDYxLDggQEANCiAJ
DQogCS8qIEdldCBibG9jayBudW1iZXIgKi8NCiAJYmxvY2sgPSAoKGludCkg
b2ZzKSA+PiB0aGlzLT5iYnRfZXJhc2Vfc2hpZnQ7DQotCXRoaXMtPmJidFti
bG9jayA+PiAyXSB8PSAweDAxIDw8ICgoYmxvY2sgJiAweDAzKSA8PCAxKTsN
CisJaWYgKHRoaXMtPmJidCkNCisJCXRoaXMtPmJidFtibG9jayA+PiAyXSB8
PSAweDAxIDw8ICgoYmxvY2sgJiAweDAzKSA8PCAxKTsNCiANCiAJLyogRG8g
d2UgaGF2ZSBhIGZsYXNoIGJhc2VkIGJhZCBibG9jayB0YWJsZSA/ICovDQog
CWlmICh0aGlzLT5vcHRpb25zICYgTkFORF9VU0VfRkxBU0hfQkJUKQ0K

--1456859747-767461628-1107864124=:20565--
