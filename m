Received: from law14-oe26.law14.hotmail.com ([64.4.20.83] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ffm9-0008CZ-Qv
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 14:04:54 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Thu, 24 Jul 2003 18:35:16 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE26PWywCP6K800001069@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: fs/jffs2/erase.c question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

in fs/jffs2/erase.c, a function jffs2_erase_block

calls

 ret = c->mtd->erase(c->mtd, instr);

I want to know where is the definition of this erase funtion....How can I
find it out


With regards
Vikram
