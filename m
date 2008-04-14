Received: from mail.sc-software.com ([67.159.161.210] helo=sc-software.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlQUc-0005LR-HZ
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 15:21:15 +0000
Date: Mon, 14 Apr 2008 08:22:14 -0700 (PDT)
From: mtddev@sc-software.com
To: linux-mtd@lists.infradead.org
Subject: 2.6.24.4: problem accessing nand based cramfs
Message-ID: <Pine.LNX.4.64.0804101338190.1418@sc-software.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: John Heil <mtddev@sc-software.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


kernel 2.6.24.4 
I have an SMC card w a cramfs rootfs on it.
I'm trying to replace an fs driver I wrote on 2.5.13 for the same SMC.
I thought I could do it more cleanly and easily now... 
I've defined a plaform driver and, correctly or 
incorrectly hooked the nand code that calls nand_scan, so as to call my
probe code to do my partition mapping.

The cramfs maps to mtdblock3.  mtdblock_open is called as is
cramfs_fill_super and cramfs_read.

However, no data is returned and no attempt is made to access the nand SMC
afaics.

What do I need to add to get this nand based cramfs booted ?



Thnx v much
johnh

.
===========================================================
John Heil
South Coast Software
Custom firmware, device drivers and board bring up services
Ph: 1-714-774-6952
Fx: 1-714-774-7053
www.sc-software.com
email: johnhscs@sc-software.com
===========================================================
