Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JrvW-0000Yt-OZ
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 10:36:27 +0100
Received: from avicenna.cc.boun.edu.tr ([193.140.210.25])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19Jddq-0001Cm-00
	for linux-mtd@lists.infradead.org; Sat, 24 May 2003 19:21:15 +0100
Received: from saritepe.cc.boun.edu.tr ([193.140.192.31])
	M2003052421193827204
	for <linux-mtd@lists.infradead.org>; Sat, 24 May 2003 21:19:38 +0300
Message-ID: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
Date: Sat, 24 May 2003 21:20:51 +0000
From: kusdogan@boun.edu.tr
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso8859-9;q=1.0
Content-Transfer-Encoding: 8bit
Subject: Oops ERROR : Unable to handle kernel NULL pointer dereference at
 virtual address 00000000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I patched my 2.4.18 kernel with latest MTD source. Now it crashes in in fucntion 
add_mtd_device (mtdcore.c). I need help on this topic. I patched the code because 
the previous one was crashing while invalidating the device after it detects partitions.

---- source -----

                        DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->nam$                   
                       /* No need to get a refcount on the module containing
                           the notifier, since we hold the mtd_table_mutex */
                        list_for_each(this, &mtd_notifiers) {
                                struct mtd_notifier *not = list_entry(this, stru$                                
		    not->add(mtd);		<------------- CRASH
                        }

---- output ------

H720x-MTD probing 16bit FLASH
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
cmdlinepart partition parsing not available
Using builtin partition table
Creating 1 MTD partitions on "SinX Flash":
0x00100000-0x00200000 : "jffs2"
mtd: Giving out device 0 to jffs2
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c00879a8>]    lr : [<00000001>]    Not tainted
sp : c0117f68  ip : 60000013  fp : 00000000
r10: 00000000  r9 : 00000001  r8 : c00c5970
r7 : c00c57d4  r6 : c00c584c  r5 : ffffffff  r4 : c011f2e0
r3 : 00000000  r2 : c00c5898  r1 : fffffff8  r0 : c011f2e0
Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 217F  Table: 4000401D  DAC: 0000001D
Process swapper (pid: 1, stackpage=c0117000)
Stack: (0xc0117f58 to 0xc0118000)
7f40:                                                       00000001 c00879a8
7f60: 00000013 ffffffff c00c587c c01e1160 c00c5890 c00c57d4 c0087da0 c00c58cc
7f80: c01e1160 c00c57e8 c0084080 c01e1160 c01e1060 00000005 00000000 
c0085724
7fa0: 00200000 00000001 c00b9bac c00e44b4 c00e44b8 00000000 c00e44b0 
41807202
7fc0: 4000f848 c000f5e8 c0010318 c001031c c00c7418 c00c740c c00c2b40 
c00088b4
7fe0: 00000800 c00e5358 c001104c 00000800 c00e5358 c00c7418 c00c740c 
c0012d28
Backtrace: no frame pointer
Code: e582e000 e121f00c d1a0c002 dbfe30e5 (e5833000)
Kernel panic: Attempted to kill init!
