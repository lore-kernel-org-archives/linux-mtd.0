Received: from idiom.com ([216.240.32.1] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wSIc-0001BQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2002 20:03:15 +0100
Received: from idiom.com (espin@localhost [127.0.0.1])
	by idiom.com (8.12.5/8.12.6) with ESMTP id g91J3AOe040809
	for <linux-mtd@lists.infradead.org>; Tue, 1 Oct 2002 12:03:10 -0700 (PDT)
	(envelope-from espin@idiom.com)
Received: (from espin@localhost)
	by idiom.com (8.12.5/8.12.6/Submit) id g91J39fh040800
	for linux-mtd@lists.infradead.org; Tue, 1 Oct 2002 12:03:09 -0700 (PDT)
	(envelope-from espin)
Date: Tue, 1 Oct 2002 12:03:09 -0700
From: Geoffrey Espin <espin@idiom.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: cfi_probe on arm940T (linux-2.4.6pre0 uclinux)
Message-ID: <20021001190308.GA16608@idiom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I can't seem to identify a TE28F160B3 (x1 Sharp 16Mbit (2M byte))
on my arm940 (mmu-less) system.  This is 2.4.6pre0/uclinux kernel.
Separately, I'm trying to upgrade to 2.4.19... but that's different
challenge.)  I added a little debugging to my sa1100-flash.c derived
map.  The same problem exist if I use physmap.c.

  ...
  conexant_write16: 0x400000
  conexant_write16: 0x405555         <<<<<<<<---------------
  Unable to handle kernel NULL pointer dereference at virtual address 0000003f
  fault-common.c(98): start_code=0xe1a00000, start_stack=0xe1a00000)
  Internal error: Oops: ffffffff

CFI options:

    CONFIG_MTD_PHYSMAP=y
    CONFIG_MTD_PHYSMAP_START=400000
    CONFIG_MTD_PHYSMAP_LEN=200000
    CONFIG_MTD_PHYSMAP_BUSWIDTH=2

    CONFIG_MTD_CFI=y
    CONFIG_MTD_CFI_ADV_OPTIONS=y
    CONFIG_MTD_CFI_NOSWAP=y
    CONFIG_MTD_CFI_GEOMETRY=y
    CONFIG_MTD_CFI_B2=y
    CONFIG_MTD_CFI_I1=y
    CONFIG_MTD_CFI_INTELEXT=y

I've tried this with the Data Cache enable/disabled.  The kernel
has fixup/abort handler code for bad alignment CONFIG_ALIGNMENT_TRAP
but turning this on/off makes no difference.  (I know this code
along, with MTD, has changed significantly since 2.4.6 to 2.4.19).

Geoff
-- 
Geoffrey Espin
espin@idiom.com
--
                                                                                
Linux version 2.4.6 (espin@espin.telus.net) (gcc version 2.95.3 20010315 (releas
e)) #108 Tue Oct 1 02:06:00 PDT 2002                                            
Processor: ARM/CNXT Arm940si revision 2                                         
Architecture: CNXT CX821XX                                                      
On node 0 totalpages: 1920        
...
EMAC Network Driver Cnxt 2002/04/29 irq=20 00:30:cd:00:02:f4:                   
Blkmem copyright 1998,1999 D. Jeff Dionne                                       
Blkmem copyright 1998 Kenneth Albanowski                 
Blkmem 1 disk images:                                                           
0: 500000-5D8BFF [VIRTUAL 500000-5D8BFF] (RO)                                   
physmap flash device: 200000 at 400000                                          
cfi_probe called with unsupported buswidth 1                                    
Physically mapped flash: Found no CFI device at location zero                   
CONEXANT flash: probing 16-bit flash bus @0x400000                              
conexant_read16: 0x400000                                                       
conexant_write16: 0x400000                                                      
conexant_write16: 0x4000aa                                                      
conexant_read16: 0x400020            
...
conexant_write16: 0x400554                                                      
conexant_write16: 0x400aaa                                                      
conexant_read16: 0x400000                                                       
conexant_read16: 0x400002                                                       
conexant_read16: 0x400000                                                       
conexant_write16: 0x400000                                                      
conexant_write16: 0x405555         <<<<------- ARRRGH!

Unable to handle kernel NULL pointer dereference at virtual address 0000003f    
fault-common.c(98): start_code=0xe1a00000, start_stack=0xe1a00000)              
Internal error: Oops: ffffffff                                                  
CPU: 0                                                                          
pc : [<0087a30c>]    lr : [<0087a308>]     
sp : 00a17dbc  ip : 00a17d84  fp : 00000000                                     
r10: 00808a18  r9 : 41029402  r8 : 008fec48                                     
r7 : 00000000  r6 : 00a17f68  r5 : 00005555  r4 : 000000aa                      
r3 : 00400000  r2 : 00000001  r1 : 00000001  r0 : 0000001e                      
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user                        
Control: C0001079  Table: 00000002  DAC: 00000002                               
Process swapper (pid: 1, stackpage=00a17000)                                    
Stack:                                                           
...
Code: ebfe6b5e e3a03501 (e18540b3) e8bd8030 008e7630                            
Kernel panic: Attempted to kill init!   

--
