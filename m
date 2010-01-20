Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXXKC-0000vC-U0
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 09:58:17 +0000
Received: by pzk30 with SMTP id 30so546727pzk.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 01:58:07 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 20 Jan 2010 17:58:06 +0800
Message-ID: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
Subject: Is it an atomic operation for writing a page in NAND flash
From: Liu Hui <onlyflyer@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

This is a question confused me for a long time. As I know, writing a
sector for a hard disk is atomic. That is to say, when we are writing
a sector to hard disk and power failure happen, the sector will be
written completely or not at all.

For NAND flash, I didn't see the atomic guarantee in any material.
Could you please tell me if writing a page for NAND flash is atomic?
This is very important for a transaction based file system.


--
Thanks & Best Regards
Liu Hui
--
