Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVvWU-0006Ql-5e
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2005 14:33:48 -0400
Message-ID: <4363C0EF.3000607@ru.mvista.com>
Date: Sat, 29 Oct 2005 22:35:27 +0400
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------070701050200010400020402"
Cc: Pete Popov <ppopov@embeddedalley.com>
Subject: [PATCH] NAND: AMD Au1550 driver reads write only register
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070701050200010400020402
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

       I have noticed that during the last commit to AMD Au1550 NAND driver the
old buglet was reintroduced: as MEM_STNDCTL register is write only, and
seem to always read as 0x31, read-modify-write of it in au1xxx_nand_init()
will cause undesirable effect of enabling -RCS0/1 pin override (bits 4/5 of
this reg.), thus possibly causing a contention on the static bus when the NOR
flash (which uses  -RCS0) or board control status regs. (using -RCS2) are
read. Luckily, this now goes away with a first NAND access, since
au1550_hwcontrol() doesn't try to read this register before writing anymore.
      There's another issue with that though -- to be addressed by the next
patch...

WBR, Sergei




--------------070701050200010400020402
Content-Type: text/plain;
 name="Au1550-NAND-STNDCTL-write-only.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Au1550-NAND-STNDCTL-write-only.patch"

Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>

Index: au1550nd.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/au1550nd.c,v
retrieving revision 1.12
diff -a -u -p -r1.12 au1550nd.c
--- au1550nd.c	23 Sep 2005 01:44:55 -0000	1.12
+++ au1550nd.c	29 Oct 2005 18:21:04 -0000
@@ -343,11 +343,8 @@ int __init au1xxx_nand_init (void)
 	au1550_mtd->priv = this;
 
 
-	/* disable interrupts */
-	au_writel(au_readl(MEM_STNDCTL) & ~(1<<8), MEM_STNDCTL);
- 
-	/* disable NAND boot */
-	au_writel(au_readl(MEM_STNDCTL) & ~(1<<0), MEM_STNDCTL);
+	/* MEM_STNDCTL: disable ints, disable nand boot */
+	au_writel(0, MEM_STNDCTL);
 
 #ifdef CONFIG_MIPS_PB1550
 	/* set gpio206 high */




--------------070701050200010400020402--
