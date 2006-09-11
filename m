Received: from speedy.integrated.at ([82.103.131.154])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMihg-0002rb-A4
	for linux-mtd@lists.infradead.org; Mon, 11 Sep 2006 11:07:49 +0100
Received: from tumirnix.home.joussein.com
	(chello062178026142.9.11.vie.surfer.at [62.178.26.142])
	by speedy.integrated.at (Postfix) with ESMTP id 270D52325B
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Sep 2006 12:05:20 +0200 (CEST)
Received: from [10.160.1.2] (ntb-joussein-01.wlan.joussein.com [10.160.1.2])
	by tumirnix.home.joussein.com (Postfix) with ESMTP id 5C794AFB
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Sep 2006 12:05:54 +0200 (CEST)
Message-ID: <450534E0.2000405@joussein.com>
Date: Mon, 11 Sep 2006 12:05:20 +0200
From: Felix Joussein <felix@joussein.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: howto jffs2 + mtd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list,

I would like to create a jffs2 filesystem on to an ordinary fresh- out 
of the box 512 Kingston Datatraveller USB Stick.
As I later want to boot from it, I performed the following steps:

fdisk /dev/sda
create 2 partitions
sda1, sda2

syslinux /dev/sda1
mount /dev/sda1 /mnt
cp $allYouNeedToBoot /dev/sda1
umount /mnt

Here now the mtd part:
modprobe block2mtd
echo "/dev/sda2" > /sys/module/block2mtd/parameters/block2mtd
cat /proc/mtd
mtd0: 0f480000 00001000 "block2mtd: /dev/sda2"

now I read in the internet 2 different commands:
either flash_eraseall -j /dev/mtd0
or flash_erase /dev/mtd0 0 00001000

Regardless of what I do, I am not able to mount -t jffs2 /dev/mtdblock0 /mnt
Either I get dmesg "mount jffs2_scan_eraseblock(): magic bitmask 0x1985 
not found" on all consoles, the only way to stop this is to reboot,
or I wait approx. 10 Mins, then I get
CPU:    0
EIP:    0060:[<d09bd77f>]    Not tainted VLI
EFLAGS: 00010206   (2.6.17.13-fwgw #1)
EIP is at block2mtd_erase+0x9b/0x148 [block2mtd]
eax: d0000000   ebx: d0003000   ecx: c11fffe0   edx: c11fffe0
esi: c11fffe0   edi: c11fffe0   ebp: 00000001   esp: c1325eb8
ds: 007b   es: 007b   ss: 0068
Process pdflush (pid: 216, threadinfo=c1324000 task=cfffa540)
Stack: cecc278c 0000dee8 cfe8c368 cf42a340 c1325efc cf42a370 d129db80 
c020209a
       cecc260c cf42a340 ced258d0 ced258d8 ced2592c ced258f8 00002000 
00000000
       0dee9000 20031985 0000000c e41eb0b1 c1325efc 0000000c 00001000 
0000000c
Call Trace:
 <c020209a> jffs2_erase_pending_blocks+0x21a/0x736  <c0202a02> 
jffs2_write_super+0x26/0x34
 <c015eb42> sync_supers+0x96/0xd4  <c0141ee0> pdflush+0x0/0x1a0
 <c0141686> wb_kupdate+0x26/0xd8  <c0141fc6> pdflush+0xe6/0x1a0
 <c0141660> wb_kupdate+0x0/0xd8  <c0130d97> kthread+0xbf/0xd8
 <c0130cd8> kthread+0x0/0xd8  <c0100cd5> kernel_thread_helper+0x5/0xc
Code: ff ff 0f 87 c0 00 00 00 50 e8 72 83 78 ef 8d 98 00 40 00 00 56 e8 
66 83 78 ef 5a 59 39 c3 77 0b eb 3c 89 f6 83 c0 04 39 c3 76 33 <83> 38 
ff 74 f4 90 0f ba 2e 00 19 c0 85 c0 75 36 56 e8 3f 83 78
EIP: [<d09bd77f>] block2mtd_erase+0x9b/0x148 [block2mtd] SS:ESP 
0068:c1325eb8
 BUG: warning at kernel/exit.c:855/do_exit()
 <c012296c> do_exit+0x83c/0x850  <c01147ff> bust_spinlocks+0x3f/0x48
 <c0104580> do_trap+0x0/0xd4  <c0114c6f> do_page_fault+0x353/0x5f4
 <c011491c> do_page_fault+0x0/0x5f4  <c0103c43> error_code+0x4f/0x54
 <d09bd77f> block2mtd_erase+0x9b/0x148 [block2mtd]  <c020209a> 
jffs2_erase_pending_blocks+0x21a/0x736
 <c0202a02> jffs2_write_super+0x26/0x34  <c015eb42> sync_supers+0x96/0xd4
 <c0141ee0> pdflush+0x0/0x1a0  <c0141686> wb_kupdate+0x26/0xd8
 <c0141fc6> pdflush+0xe6/0x1a0  <c0141660> wb_kupdate+0x0/0xd8
 <c0130d97> kthread+0xbf/0xd8  <c0130cd8> kthread+0x0/0xd8
 <c0100cd5> kernel_thread_helper+0x5/0xc


But: the filesystem is mounted.
How ever, accessing /mnt is not possible then... again: reboot is the 
only way out...

I would be very thankfull, if anybody could help me with this.

Thanks,

Felix Joussein



-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
