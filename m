Received: from wproxy.gmail.com ([64.233.184.198])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DCOiZ-0006rO-DK
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2005 16:09:16 -0500
Received: by wproxy.gmail.com with SMTP id 70so418666wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Mar 2005 13:09:16 -0800 (PST)
Message-ID: <4f6ba3b0503181309379fa385@mail.gmail.com>
Date: Fri, 18 Mar 2005 16:09:16 -0500
From: Bob Beers <bob.beers@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: doc200x_wait Oops
Reply-To: Bob Beers <bob.beers@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On a custom SC1100-based board with 16M diskonchip using 2.6.11.2.

I have two ext2 partitions on the diskonchip, nftla1 and nftla2.
I use lilo to boot a kernel and initrd from nftla1, then mount nftla2
 via startup scripts for config settings, but after ~15 minutes basically
 idle, this happened:

Unable to handle kernel NULL pointer dereference at virtual address 00000001
 printing eip:
c0238848
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: wd1100 ip_nat_irc ip_nat_ftp ip_conntrack_irc
ip_conntrack_ftp iptable_nat ip_conntrack iptable_filter ip_tables
prism54 eepro100 mii
CPU:    0
EIP:    0060:[<c0238848>]    Tainted: P      VLI
EFLAGS: 00010292   (2.6.11.2)
EIP is at DoC_Delay+0x48/0x60
eax: 00000001   ebx: c3b1d220   ecx: c00c8000   edx: 00000003
esi: c00c8000   edi: c3b1d168   ebp: c3b1d000   esp: c3bb7e8c
ds: 007b   es: 007b   ss: 0068
Process nftld (pid: 790, threadinfo=c3bb6000 task=c3badaa0)
Stack: 01e0d230 c3b1d230 c0238c9f c3b1d230 00000004 00000010 c3bb7f40 c3b1d168
       c3b1d000 c02357df c3b1d000 c3b1d168 00000002 c3b1d000 00000010 ffffffff
       ffffffff 00000000 00000000 fffffffb 00004600 00000008 00004000 c3bcfa00
Call Trace:
 [<c0238c9f>] doc200x_wait+0xff/0x130
 [<c02357df>] nand_write_oob+0x12f/0x1d0
 [<c022fb27>] nftl_writeblock+0x237/0x2f0
 [<c01f5fc1>] as_dispatch_request+0x131/0x2b0
 [<c0230b2b>] do_blktrans_request+0x6b/0xc0
 [<c0230c9a>] mtd_blktrans_thread+0x11a/0x1f0
 [<c0110bb0>] default_wake_function+0x0/0x20
 [<c0102326>] ret_from_fork+0x6/0x20
 [<c0110bb0>] default_wake_function+0x0/0x20
 [<c0230b80>] mtd_blktrans_thread+0x0/0x1f0
 [<c01007b5>] kernel_thread_helper+0x5/0x10
Code: 24 02 89 c2 80 fb 30 74 2a 80 7c 24 02 01 77 15 8a 81 02 10 00
00 25 ff 00 00 00 4a 88 44 24 03 75 e2 59 5b c3 8a 81 01 10 00 00 <eb>
e9 8d b6 00 00 00 00 8a 81 20 10 00 00 eb db 90 8d b4 26 00

I notice it says my kernel is tainted; that's because of the wd1100 watchdog
 driver required for reboot functionality on the geode SC1100.  I will try again
 without loading the watchdog and then, with the latest mtd source, and if
 someone says it's worthwhile, I 'll try 2.6.12-rc1 and latest mtd. 

Want anything else while I'm compiling?

Thanks.

bbeers
