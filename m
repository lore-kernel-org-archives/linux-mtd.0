Received: from bay17-f6.bay17.hotmail.com ([64.4.43.56] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E5gPi-0005Pi-NP
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 05:10:24 -0400
Message-ID: <BAY17-F6714DCA884F8BC6296A5CE8B20@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Thu, 18 Aug 2005 17:10:16 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Bug report for JFFS2 in latest MTD CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artern

I found a kernel oops bug of JFFS2 when running LTP. Specifically
the test case "gf18" cause the kernel oops.

The following is the error log:

Unable to handle kernel NULL pointer dereference at virtual
address 00000000
printing eip:
e094e486
*pde = 1450b067
Oops: 0000 [#1]
Modules linked in: jffs2 zlib_deflate nandsim nand nand_ids
nand_ecc mtdpart mtdcore parport_pc lp parport usbserial
autofs4 ipv6 3c59x mii ipt_REJECT ipt_state ip_conntrack
iptable_filter ip_tables floppy sg scsi_mod dm_mod uhci_hcd
video button battery ac
CPU:    0
EIP:    0060:[<e094e486>]    Not tainted VLI
EFLAGS: 00010246   (2.6.12.2)
EIP is at jffs2_truncate_fragtree+0x86/0xe0 [jffs2]
eax: 00000000   ebx: 00000000   ecx: 0000128c   edx: ce76164c
esi: 00000000   edi: 00003e6d   ebp: cd21fdb4   esp: d4651e84
ds: 007b   es: 007b   ss: 0068
Process growfiles (pid: 3191, threadinfo=d4650000 task=d44d0a20)
Stack: ccab2400 ccab2400 00000000 cdd53488 00000000 cd21fdcc
       e09584c5 dca5ce00 cd21fdb4 00003e6d 00000000 00000000
       004c1bf8 00000000 00003e6d 00000000 00000048 00000000
       00000000 dca5ce00 cd21fda0 d4311b3c 004c1bf8 00000408
Call Trace:
  [<e09584c5>] jffs2_do_setattr+0x375/0x650 [jffs2]
  [<c0174ad6>] notify_change+0x1b6/0x340
  [<c01571b0>] do_truncate+0x60/0x80
  [<c01574da>] sys_ftruncate+0x11a/0x1b0
  [<c0158cc9>] sys_lseek+0x79/0xa0
  [<c010305f>] sysenter_past_esp+0x54/0x75
Code: 42 08 85 c0 74 18 eb 0d 90 90 90 90 90 90 90 90 90 90
90 90 90 89 c2 8b 40 08 85 c0 75 f7 89 d0 66 f7 40 18 ff 0f
75 11 8b 40 10 <8b> 10 8b 42 08 83 e0 fc 83 c8 02 89 42 08
83 c4 08 5b 5e 5f 5d

Thanks,
Forrest
