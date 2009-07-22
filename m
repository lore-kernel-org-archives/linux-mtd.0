Received: from web32607.mail.mud.yahoo.com ([68.142.207.234])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTecY-0002zz-63
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 16:24:50 +0000
Message-ID: <82809.77923.qm@web32607.mail.mud.yahoo.com>
Date: Wed, 22 Jul 2009 09:24:43 -0700 (PDT)
From: Gertjan Hofman <gertjan_hofman@yahoo.com>
Subject: nandwrite & jffs2 summary question
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Dear MTD experts,

I need a little advice on a problem I am seeing after switching on the CONFIG_JFFS2_SUMMARY option in a ARM 2.6.29-5 kernel.
I write the kernel uImage file to nand flash using nandwrite -p, after a flash_eraseall /dev/mtd1.  Then I reboot and U-boot uncompresses my kernel and starts it.

Since switching on the kernel flag, I get occasional CRC failure from U-boot. I have also had a message from nandwrite saying something like 'no room to write summary file'. (MTD partition is 3MB, kernel about 1.6MB) Re-writing usually solves the problem. I tried this on 2 boards, its not 100% repeatable but does happen.

I dont think I understand the interaction between the summary option on JFFS2 and nandwrite. I run sumtool on my jffs2 root filesystem image and burning that to /dev/mtd2 gives me no problem. 

Should I be doing anything to my kernel uImage before nandwriting ? Why does nandwrite even know about the summary file option ? Does it need a change to mkimage (from uboot) ?

Much appreciated,

Gertjan











      
