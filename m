Received: from 205-158-62-49.outblaze.com ([205.158.62.49] helo=ws1-1.us4.outblaze.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XSNP-0008Jp-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 21:04:51 +0100
Message-ID: <20020724200415.98373.qmail@mail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Mike Schumi" <schumi@techie.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 24 Jul 2002 15:04:15 -0500
Subject: jffs2_do_reserve_space
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

Hi, 

  I've looked for a solution to this problem, but haven't seen it posted anywhere, although some ppl have had it before. 

 I'm running on a ARM board with 2 partitions, a Firmware Partition with the board Bootloader, Blob and Kernel 2.4.7, and another partition with the file system jffs2.
When I try to write to the jffs2 I get the below dump.
I've noticed that I this dump happens a boot after I run cardmgr to mount the /dev/hda for a ATA card.(its doesn't happen with te PCNET card)
i.e. I bootup, all is fine and do a lot of writes. Then I run cardmgr, plug in the card... mount /dev/hda on /mnt/ide ...copy files from the card, and to the card, then reboot and here is where the writes start going crazy. Any help would be appreciated ...

 
bash-2.05a# ls > test
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jeb=offset= 0x120000
jeb->offset =0x120000 c->sector_size =0x20000 jeb->free_size= 0xffffffc4
jffs2_do_reserve_space(): Giving 0xffffffc4 bytes at 0x14003c
ret0-jffs2_reserve_space: ret is 0
ARGH. About to write node to 0x0014003c on flash, but there's data already there:
0x0014003c: ff ff ff ff 85 19 02 e0 a5 04 00 00 9c 75 3d f1
argh. node added in wrong place
ARGH. About to write node to 0x00140080 on flash, but there's data already there:
0x00140080: 0e 4a 26 55 78 5e 5c 54 4d 68 5c 55 14 3e ef 67
argh. node added in wrong place
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jeb=offset= 0x120000
jeb->offset =0x120000 c->sector_size =0x20000 jeb->free_size= 0xffffffc4
jffs2_do_reserve_space(): Giving 0xffffffc4 bytes at 0x14003c
ret0-jffs2_reserve_space: ret is 0
ARGH. About to write node to 0x0014003c on flash, but there's data already there:
0x0014003c: 85 19 02 e0 04 00 00 00 05 00 00 00 08 00 00 00
argh. node added in wrong place
Calculated used size 0001fffc != stored used size 0001ff58
kernel BUG at nodemgmt.c:334!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0ef8000
*pgd = c0f25801, *pmd = c0f25801, *pte = 00000000, *ppte = 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c001f330>]    lr : [<c002600c>]
sp : c0efde68  ip : c0efde24  fp : c0efde78
r10: 00000000  r9 : 00000000  r8 : c0766c20
r7 : c0181cc0  r6 : c07dfec4  r5 : c0794190  r4 : 00000000
r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C0EFB17F  Table: C0EFB17F  DAC: 00000015
Process ls (pid: 17, stackpage=c0efd000)
Stack:
c0efde40:                                                        c002600c c001f330 
c0efde60: 60000013 ffffffff c0181cc8 c0efdebc  c0efde7c c0085460 c001f2f8 c0efde88 
c0efde80: c00856d0 c0084530 c078a420 00000000  00000006 c0019100 c078a420 00000000 
c0efdea0: 00000006 c0019100 c0e2d0e0 c0e2d1ec  c0efdf20 c0efdec0 c00839f8 c0085248 
c0efdec0: 0014003c 00000000 00000065 00000000  00000065 00000000 c07dfec4 00000065 
c0efdee0: 00000000 c01e4ff8 ffffffc4 0014003c  00000060 00000062 00000065 c01e4ff8 
c0efdf00: 00000000 00000000 00000000 c01e5010  00000000 c0efdf80 c0efdf24 c003bb90 
c0efdf20: c0083648 c0e2d13c 00000000 00000065  00000000 00000000 c0e2d184 c0e2d0e0 
c0efdf40: c0017500 00000065 4001a000 c00174e0  00000000 0aefdf60 c00174e0 ffffffea 
c0efdf60: 00000000 00000065 4001a000 00000004  40137e60 c0efdfac c0efdf84 c0047394 
c0efdf80: c003b6b4 c001fe04 c0efdf94 00000065  40136e34 4001a000 c0efc000 c001a9a4 
c0efdfa0: 00000000 c0efdfb0 c001a820 c00472c8  00000065 c0020bc8 00000001 4001a000 
c0efdfc0: 00000065 40136e34 00000065 40136e34  4001a000 00000065 00000bf0 40135b00 
c0efdfe0: 40137e60 bffffe14 400e1f00 bffffdf8  40092f68 400e1f04 60000010 00000001 
Backtrace: 
Function entered at [<c001f2ec>] from [<c0085460>]
 r4 = C0181CC8 
Function entered at [<c008523c>] from [<c00839f8>]
Function entered at [<c008363c>] from [<c003bb90>]
Function entered at [<c003b6a8>] from [<c0047394>]
Function entered at [<c00472bc>] from [<c001a820>]
 r8 = C001A9A4  r7 = C0EFC000  r6 = 4001A000  r5 = 40136E34
 r4 = 00000065 
Code: eb001ab5 e3a03000 (e5833000) e91ba810 c013ef54 
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing

   
-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

Get 4 DVDs for $.49 cents! plus shipping & processing. Click to join. 
http://oas-central.realmedia.com/RealMedia/ads/click_lx.ads/mail.com/columbiahouse/1112745096/x09/ExactAdv/ColumbiaHouse_IO473_7.19_8.19/blank.gif/636632633232383133383736634333430
