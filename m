Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198dve-0007Lw-CV
	for <linux-mtd@lists.infradead.org>; Thu, 24 Apr 2003 11:26:10 +0100
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-30.mail.demon.net with esmtp (Exim 3.35 #1)
	id 198dvn-0004Er-0U
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2003 11:26:19 +0100
From: "" <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 24 Apr 2003 11:22:06 +0100
MIME-Version: 1.0
Message-ID: <3EA7C8DE.8333.56C7F7@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: NAND and JFFS2 crash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,  

I checked into what you had said. The filesystem in question is the 
root filesystem and it gets mounted and dismounted at startup and  
shutdown. I cannot see how I this could be my problem. As you  
seem to be a busy man I thought I would not bother you again and  
I would try an update at a later date. 

Last week I downloaded a new CVS tree. I create my SMC data by 
booting the system off a hard disk running Linux. I first use dd to  
copy the hard disk boot partition to the SMC. I noticed all these  
messages basically saying writing NAND witout ECC was a bad  
idea. In my NAND specific driver I set up the mtd_info structure for  
soft ecc. However there appears to be a new field useecc which  
only appears to be used by jffs2. I did not know what I was  
expected to do here so I modified my driver to set this and the  
associated bit positions. Beacuse I use partitions I had to modify  
mtdpart to copy this information to the mtd_info structure which is  
set up on a partition basis. Now I could boot from the hard disk and 
 copy my boot disk to the SMC with no problem. I then erased and  
created a new JFFS2 filesystem, on another partition, and copied  
all the files for the root filesystem.  

I then booted from the smc and although I got a few 

Empty flash at 0x00469ffcb ends at 0x0046a000 

messages all seemed ok. The root file system was mounted and I  
got the login prompt. However when I started to log in I got a crash. 

kernel BUG at gc.c:140!                                 
               
invalid operand: 0000                                   
                              
CPU:    0                                               
                              
EIP:    0010:[<c018bb28>]    Not tainted                
                              
EFLAGS: 00010296                                        
                              
eax: 0000003f   ebx: 000000d4   ecx: c0262220  edx:  
0000c200                        
esi: 000000d4   edi: 0000106e   ebp: cffc04cc   esp:  
cfbc5f1c                        
ds: 0018   es: 0018   ss: 0018                          
                              
Process jffs2_gcd_mtd2 (pid: 22, stackpage=cfbc5000)    
                              
Stack: 00000000 c0111ce6 cfbc5f50 cfbc4000 cfe6a120  
cfe6a120 cfbc4000 00000000       
       cfbc4000 00000000 cfbc4000 cffc04cc cfbc4564  
c018ea16 cffc04cc cfbc4574       
       cffc04cc 00000001 00000000 00000080 00000000  
00000000 00000000 00000000       
Call Trace:    [<c0111ce6>] [<c018ea16>] [<c0108be6>]  
[<c018e890>] [<c01073f6>]      
  [<c018e890>]                                          
                              
                                                        
                              
Code: 0f 0b 8c 00 b9 8f 25 c0 8b 45 08 8b 55 08 40 52  
89 45 08 55                    


I have noticed someone else post a similar crash in the list and  
you suggest sending a dump of the SMC.  

I would like to know if you could assist me in the same way. If so  
do you need a dump of the whole SMC or just the JFFS2 partition 
? 

During playing about with this I also noticed 
a message similar to  

jffs2_scan_dirent_node(): Node CRC failed on node at 0x0046a7f0  
read  0xffffffff calculated 0xdec8161b 

but the routine was jffs2_scan_inode_node, so I guess I am still  
loosing data somewhere ? 

To be able to use this technology I need to make it reliable. Can  
you suggest how I might find the cause of this problem ? 

Enable a specific debug level ? 
Check hardware by writing patterns via the raw device ? 




Many Thanks 


Simon 


On 6 Jan 2003, at 19:59, Thomas Gleixner wrote: 

> On Monday 06 January 2003 18:04, simon@baydel.com wrote: 
> > I download the CVS stuff mid December and again today. The 
> > hardware ran ok before and could use jffs2 without errors but 
as I 
> > added files it was slow and I could not make file systems on 
> > partitions which contained bad blocks. 
> > 
> > The new CVS code seems to be much quicker and I can 
erase, 
> > mount and copy files to my new filesystem without error. I have 
set 
> > up the specific driver to do soft ecc. I noticed that when I 
reboot 
> > the system and the filesystem gets mounted I get errors. The 
more 
> > writes that occur the more errors I seem to get. I ran a test for 
a 
> > week or so over the break which generated log files. A reboot 
after 
> > this produced thousands of errors but the filesystem seemed 
ok. 
> > 
> > The errors are something like 
> > 
> > Empty flash at 0x00469ffcb ends at 0x0046a000 
> This happens due to NAND specific timed buffer flushing. JFFS2 
fills 
> up the write buffer to a full page boundary with 0xff and writes out 
> the buffer to the chip, if you have no consecutive write within 2 
> seconds. This is done to ensure, that data is written to FLASH. 
This 
> fill looks like empty FLASH on mount. So JFFS2 is wondering 
why there 
> is data after the "empty" FLASH. No reason to worry. 
>  
> > or 
> > 
> > jffs2_scan_dirent_node(): Node CRC failed on node at 
0x0046a7f0 read 
> > 0xffffffff calculated 0xdec8161b 
> This happens, if the write buffer is not written to FLASH before 
you 
> power down your system without umount. Then the write buffer is 
lost 
> and you get this error on mount. This indicates, that you may 
have 
> lost data. 
>  
> > I was wondering if any of you could shed any light on this. 
>  
> --  
> Thomas 
> 
________________________________________________________
______________ 
> __ linutronix - competence in embedded & realtime linux 
> http://www.linutronix.de mail: tglx@linutronix.de 
>  
>  
> 
______________________________________________________ 
> Linux MTD discussion mailing list 
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 


__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
