Received: from [202.108.35.176] (helo=vip.sina.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 191Ka5-0004z3-FZ
	for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2003 07:21:41 +0100
Message-ID: <20030404062136.7806.qmail@vip.sina.com>
From: <jimzeus@vip.sina.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Date: Fri, 04 Apr 2003 14:21:36 +0800
Subject: [SPAM] FAT on NAND 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all:


What I am doing now is to build a filesystem which can be 
recognized on _raw_ NAND flash. So, I think FAT will be the only
choice(though I know it's very unstable). And I have following question now:

1.How unstable would it be? Does it support: 
     a.journaling (crash/power-off safe ,I mean)
     b.bad block management
     c.wear levelling
     d.error correction
     e.something else I dont know to make the FS reliable
2.I have checked the NAND flash docoment (especially 
the "Filesystems supporting NAND"chapter) and I found out that
it seems no way to build a FAT on a bare NAND flash but only on 
the SmartMediaCards, am I right? Or the SM card and the bare NAND
are just the same thing when a FAT on it.
3.Maybe I misunderstood,but David Woodhouse had told me that I should apply layers like FAT->NFTL->NAND if I wanna build a FAT on
a NAND flash.But I learned that the NFTL only support Doc from the
NAND flash document, isnt it? And what should I do to support the 
FAT ?
4.Everybody tells me that the Fat on a NAND is not reliable,but I 
think USB mass storage are based on NAND and got a FAT (or some 
filesystem which windows can recognize) on it, so ,how comes it 
happen?

BTW:Why my mail sent to the maillist always "awaits moderator approval"?

TIA

Jim Zeus



______________________________________

===================================================================
