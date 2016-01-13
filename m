Received: from goliath.siemens.com ([194.138.212.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJTHe-0000Wp-8W
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 21:48:51 +0000
Received: from mail3.usa.siemens.com (mail3.usa.siemens.com [161.134.217.108])
 by goliath.siemens.com (8.14.4/8.14.4) with ESMTP id u0DLmhqq009485
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
 verify=OK)
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jan 2016 16:48:43 -0500
Received: from USLZUA0EC02MSX.ww017.siemens.net ([161.134.243.217])
 by mail3.usa.siemens.com (8.14.4/8.14.4) with ESMTP id u0DLmSAa030417
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jan 2016 16:48:29 -0500
From: "Rice, Fredric" <fredric.rice@siemens.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "Rice, Fredric" <fredric.rice@siemens.com>
Subject: Erase Block Summary on JFFS2 "totlen for ref at" crashing
Date: Wed, 13 Jan 2016 21:48:27 +0000
Message-ID: <D3E72803070CF448823426F927E741C30E72C902@USLZUA0EM34MSX.ww017.siemens.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings, List!

This is a "totlen for ref at" miscalculated crash that I have been struggli=
ng with for a month now, trying numerous things in an attempt to get Erase =
Block Summary working on JFFS2 for my NOR. I see doing Google searches that=
 other people have gotten this crash over the years, and I scanned the MTD =
archives but did not see anyone reporting this crash behavior yet.

What's curious is that my JFFS2 image and Kernel both of which have Erase B=
lock Summary enabled on them will run just fine on some of my target device=
s, but not on others -- and I don't see any reason for that.

But what's even more curious is that after I upload my JFFS2 file image to =
my target the first time, Linux comes up and runs just fine -- the first ti=
me. After I reboot, I get the crash (you can see that behavior in the conso=
le spew below; works fine, reboot, it crashes.)

Can anyone tell me what the most likely cause for this is? I used:

mkfs.jffs2 -q -U -p -n --eraseblock=3D0x20000 --pagesize=3D0x20000 \
  --big_endian --pad=3D4 --devtable=3Ddevice_tabel.txt -e128KiB \
  -o chmm.jffs2 -d ./reference_filesystem

And that successfully produces a Linux image with the correct EBS and then =
I create a sumtool output

sumtool -b -i chmm.jffs2 chmm-sum.jffs2 -e128KiB

Which creates an imagine that has the blocks marks for EBS

So I expect that I'm building the kernel and the image correctly, and that =
Erase Block Summary is built correctly, but I get a crash when  it is run t=
he second time. :(



## Booting kernel from Legacy Image at ffc40000 ...
   Image Name:   Linux-2.6.24-ts-powerpc
   Created:      2016-01-11  20:16:45 UTC
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
[    0.000000] Linux version 2.6.24-ts-powerpc (root@railviu-desktop) (gcc =
version 4.4.3 (GCC) ) #13 PREEMPT Mon Jan 11 12:16:40 PST 2016
[ 1632.550296] JFFS2 version 2.2. (NAND) (SUMMARY)  (c) 2001-2006 Red Hat, =
Inc.
[ 1632.909874] Creating 5 MTD partitions on "f8000000.flash":
[ 1632.915344] 0x00000000-0x00040000 : "protected"
[ 1632.920642] 0x00040000-0x07c40000 : "filesystem"
[ 1632.925982] 0x07c40000-0x07ec0000 : "kernel"
[ 1632.931034] 0x07ec0000-0x07f00000 : "device-tree"
[ 1632.936453] 0x07f00000-0x08000000 : "u-boot"
[ 1632.941599] MPC5121 MTD nand Driver 0.2
[ 1632.946068] Initializing USB Mass Storage driver...

BusyBox v1.15.3 (2010-10-04 17:56:44 PDT) built-in shell (ash)
Enter 'help' for a list of built-in commands.

# echo Everybody is happy here, Linux file system is intact
# reboot


U-Boot 9VA44A01.C3 (Feb 17 2012 - 04:51:52) MPC512X
CPU:   MPC5121e rev. 2.0, Core e300c4 at 399.999 MHz, CSB at 199 MHz
## Booting kernel from Legacy Image at ffc40000 ...
   Image Name:   Linux-2.6.24-ts-powerpc
   Created:      2016-01-11  20:16:45 UTC
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)

[    0.821418] Creating 5 MTD partitions on "f8000000.flash":
[    0.826886] 0x00000000-0x00040000 : "protected"
[    0.832184] 0x00040000-0x07c40000 : "filesystem"
[    0.837515] 0x07c40000-0x07ec0000 : "kernel"
[    0.842496] 0x07ec0000-0x07f00000 : "device-tree"
[    0.847929] 0x07f00000-0x08000000 : "u-boot"

[    3.403855] Totlen for ref at cfb45500 (0x03940000-0x0394000c) miscalcul=
ated as 0x0 instead of c
[    3.412596] next cfb4550c (0x03940000-0x0394000c)
[    3.417282] jeb->wasted_size 0, dirty_size 0, used_size c, free_size 1ff=
f4
[    3.424183] ------------[ cut here ]------------
[    3.428749] Badness at c012a858 [verbose debug info unavailable]
[    3.434748] NIP: c012a858 LR: c012a858 CTR: c01a76f8
[    3.439707] REGS: cf81f9b0 TRAP: 0700   Not tainted  (2.6.24-ts-powerpc)
[    3.446397] MSR: 00029032 <EE,ME,IR,DR>  CR: 22044082  XER: 20000000
[    3.452746] TASK =3D cf815000[1] 'swapper' THREAD: cf81e000
[    3.457960] GPR00: c012a858 cf81fa60 cf815000 00000051 00001cab ffffffff=
 00000006 c0429798
[    3.466306] GPR08: 00001c5c 00000000 00000000 d10563d0 82044082 100ae370=
 c034686c 00020000
[    3.474652] GPR16: 00000000 00000000 cfa7e4b4 0000e002 0000378c 0000e001=
 0000378c c04314f4
[    3.482998] GPR24: cfa7b340 00000000 cf9e5d08 0000e002 00000000 cf9e5d08=
 cfb4550c cfb45500
[    3.491518] Call Trace:
[    3.493954] [cf81fa60] [c012a858]  (unreliable)
[    3.498474] [cf81fa80] [c012aabc] [    3.501865] [cf81faa0] [c013aa54] [=
    3.505255] [cf81fac0] [c013ae0c]
[    3.508646] [cf81fb30] [c0131668] [    3.512037] [cf81fbc0] [c0134610] [=
    3.515428] [cf81fc00] [c01362d4]
[    3.518818] [cf81fc20] [c01378ac] [    3.522209] [cf81fc40] [c01e56ac] [=
    3.525600] [cf81fc60] [c01e5970]
[    3.528991] [cf81fcf0] [c01375f8] [    3.532381] [cf81fd00] [c0084e68] [=
    3.535771] [cf81fd20] [c0084f30]
[    3.539162] [cf81fd40] [c00a38d4] [    3.542553] [cf81feb0] [c00a3edc] [=
    3.545944] [cf81fee0] [c0387cb8]
[    3.549334] [cf81fef0] [c0387fa4] [    3.552725] [cf81ff40] [c03883c8] [=
    3.556116] [cf81ff50] [c03873f4]
[    3.559506] [cf81fff0] [c001106c]
[    3.562896] Instruction dump:
[    3.565853] 5400003a 3c60c034 386351ec 7cc04a14 481ea955 80fd0020 3c60c0=
34 809d001c
[    3.573590] 38635230 80bd0018 80dd0014 481ea939 <0fe00000> 80df0008 4bff=
feb8 2f860000
[    3.581525] JFFS2 error: (1) jffs2_link_node_ref: Adding new ref cfb4550=
c at (0x03940000-0x03940350) not immediately after previous (0x03940000-0x0=
394000c)
[    3.595434] ------------[ cut here ]------------
[    3.600020] Kernel BUG at c012aafc [verbose debug info unavailable]
[    3.606286] Oops: Exception in kernel mode, sig: 5 [#1]
[    3.611495] PREEMPT MPC5121 ADS
[    3.614625] Modules linked in:
[    3.617671] NIP: c012aafc LR: c012aafc CTR: c01a76f8
[    3.622626] REGS: cf81f9d0 TRAP: 0700   Not tainted  (2.6.24-ts-powerpc)
[    3.629318] MSR: 00029032 <EE,ME,IR,DR>  CR: 22044082  XER: 20000000
[    3.635666] TASK =3D cf815000[1] 'swapper' THREAD: cf81e000
[    3.640881] GPR00: c012aafc cf81fa80 cf815000 000000a2 000024a3 ffffffff=
 00000006 c0429798
[    3.649228] GPR08: 00002403 00000000 00000000 d10563d0 82044082 100ae370=
 c034686c 00020000
[    3.657574] GPR16: 00000000 00000000 cfa7e4b4 0000e002 0000378c 0000e001=
 0000378c c04314f4
[    3.665920] GPR24: cfa7b340 00000000 cf9e5d08 0000e002 00000000 cfa7e400=
 cfb4550c cf9e5d08
[    3.674440] Call Trace:
[    3.676876] [cf81fa80] [c012aafc]  (unreliable)
[    3.681396] [cf81faa0] [c013aa54] [    3.684786] [cf81fac0] [c013ae0c] [=
    3.688177] [cf81fb30] [c0131668]
[    3.691568] [cf81fbc0] [c0134610] [    3.694959] [cf81fc00] [c01362d4] [=
    3.698349] [cf81fc20] [c01378ac]
[    3.701740] [cf81fc40] [c01e56ac] [    3.705131] [cf81fc60] [c01e5970] [=
    3.708521] [cf81fcf0] [c01375f8]
[    3.711912] [cf81fd00] [c0084e68] [    3.715303] [cf81fd20] [c0084f30] [=
    3.718694] [cf81fd40] [c00a38d4]
[    3.722085] [cf81feb0] [c00a3edc] [    3.725474] [cf81fee0] [c0387cb8] [=
    3.728865] [cf81fef0] [c0387fa4]
[    3.732256] [cf81ff40] [c03883c8] [    3.735646] [cf81ff50] [c03873f4]
[    3.739037] [cf81fff0] [c001106c]
[    3.742427] Instruction dump:
[    3.745383] 38a5e204 81290004 38a50018 81010008 54e7003a 5529003a 808200=
b4 7d434a14
[    3.753121] 3c60c034 7d083a14 38635274 481ea695 <0fe00000> 48000000 93df=
0028 801f000c
[    3.761036] ---[ end trace d7c655fe14ad9a92 ]---
[    3.765645] Kernel panic - not syncing: Attempted to kill init!
[    3.771553] Rebooting in 180 seconds..


This message and any attachments are solely for the use of intended recipie=
nts. The information contained herein may include trade secrets, protected =
health or personal information, privileged or otherwise confidential inform=
ation. Unauthorized review, forwarding, printing, copying, distributing, or=
 using such information is strictly prohibited and may be unlawful. If you =
are not an intended recipient, you are hereby notified that you received th=
is email in error, and that any review, dissemination, distribution or copy=
ing of this email and any attachment is strictly prohibited. If you have re=
ceived this email in error, please contact the sender and delete the messag=
e and any attachment from your system. Thank you for your cooperation
