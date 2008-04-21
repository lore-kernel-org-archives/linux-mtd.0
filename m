Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JnwOQ-00027R-KM
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 13:49:15 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx06.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m3LDn1Wk014938
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2008 16:49:12 +0300
Subject: short UBI/UBIFS status update
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Mon, 21 Apr 2008 16:48:08 +0300
Message-Id: <1208785688.5965.386.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi UBI/UBIFS users,

here is a brief status update.

1. We fixed few bugs in UBIFS and mkfs.ubifs so we recommend to update.
However, beware that we changed media format so the old UBIFS images
won't mount. The latest UBIFS version is 0.6.

2. We've implemented a new user-space tool "ubiformat" which was our
response to this
http://lists.infradead.org/pipermail/linux-mtd/2008-April/021203.html
post where one of our users constantly used "flash_eraseall" and wiped
out the erase counters all the time, so she probably worn out some
eraseblocks. Or at least some eraseblocks are now much more used than
the others. Please, use this utility instead of "nandwrite" and
"flash_eraseall". Please, glance at:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_ubierase
http://www.linux-mtd.infradead.org/faq/ubi.html#L_flash_img

3. The UBI web-page now contains some hints for the people who are going
to add some UBI support to their flashing programs:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_format


Also, we've got one user who tried UBIFS on his NOR flash, and after
some minor bug-fixes it worked.

Regards,
Adrian, Artem.
