Received: from bay7-f78.bay7.hotmail.com ([64.4.11.78] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B1MCe-0004mM-G9
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2004 09:10:08 +0000
From: "liu zixing" <liuzixing@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 11 Mar 2004 17:09:41 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY7-F78Z0By6mGrV6R0003f439@hotmail.com>
Subject: ReadDOC and WriteDOC error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello, would you please help me:
    I use a DiskOnChip 2000 (MD2202-D32)  on a XScale IXP425 board.
    There is one  8M flash which is selected by CS0, 
     and  one DiskOnChip I mention above which is  selected by CS1.
     A linux-2.4.21-rmk1-ds1 has worked normally which is booted by redboot 
burned in 8M flash, 
and now I try to make linux recognize the DiskOnChip.
    I read the Document mtd-jffs-HOWTO.txt and  make the kernel config as:
    CONFIG_MTD=y
    CONFIG_MTD_DEBUG=y
    CONFIG_MTD_DEBUG_VERBOSE=3
    CONFIG_NFTL=m
    CONFIG_NFTL_RW=y
    CONFIG_MTD_DOC2000=m
    CONFIG_MTD_NAND=m
    CONFIG_MTD_NAND_IDS=m,
but I did not patch the kernel , because the document says 2.4 kernel has 
already supported DOC.
    
    In doc2000.h , I make changes as:
   #define ReadDOC_(adr, reg)      ((unsigned char)(*(__u32 *)(((unsigned 
long)adr)+((reg)<<1))))
   #define WriteDOC_(d, adr, reg)  do{ *(__u32 *)(((unsigned 
long)adr)+((reg)<<1)) = (__u32)d; wmb();} while(0)
   because we connect SA_A1 ->DOC_A0 ...SA_A13->DOC_A12.
   In docprobe.c , I make changes as :
  static unsigned long __initdata doc_locations[] = {
     #if defined(__arm__)
	0xf1000000,
     ...
     #endif
    } , 
     because CS1 virtual base address is 0xf1000000.

   But when I traced the flow, I found that all the values read from DOC 
registers were 0x20, 
   eg, ReadDoc(0xf1000000, DOCContrl) = 0x20, and other control registers 
were the same.
   And WriteDOC took no effect.
   so, "DiskOnChip failed TOGGLE test, dropping." was  printed and no DOC 
recognised.
  
   Would some one help me , thanks.
                                                                            
                       hugh.liu
                                                                            
                       3.11

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  
