Received: from send.forptr.21cn.com ([202.105.45.49] helo=21cn.com)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DNXE8-0001Ii-JZ
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2005 10:27:54 -0400
Date: Mon, 18 Apr 2005 22:26:04 +0800
From: "carl liao" <carlliao@21cn.com>
To: "linux mtd" <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Message-ID: <d3949581777141.19232@send5.inner-21cn.com>
Subject: 2.6.10 nand driver -- drivers/mtd/nand/au1550nd.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am confused by the codes in 2.6.10 nand driver drivers/mtd/nand/au1550nd.c:

407:	au_writel((1<<28) | (NAND_PHYS_ADDR>>4) | 
408:			(((NAND_PHYS_ADDR + 0x1000)-1) & (0x3fff<<18)>>18), 
409:			MEM_STADDR1); 
410:	au_sync();
411:
412:	p_nand = ioremap(NAND_PHYS_ADDR, 0x1000);        

I think it should be like the following assuming 4KB NAND:
		au_writel((1<<28) | (NAND_PHYS_ADDR>>4) | 
				(~(0x1000-1) & (0x3fff<<18) >> 18), 
				MEM_STADDR1); 

Could someone give me a hint? Thanks!
