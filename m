Received: from nz-out-0506.google.com ([64.233.162.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GvD6w-0001VV-NI
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 08:28:29 -0500
Received: by nz-out-0506.google.com with SMTP id i11so662520nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Dec 2006 05:28:25 -0800 (PST)
Message-ID: <15756b990612150528w4a75a606g9b46f260e082b9d2@mail.gmail.com>
Date: Fri, 15 Dec 2006 18:58:24 +0530
From: "K G Srivastava" <kg.srivastava@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [UBI] Issues while running UBI on 64 Bit Turion machine
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  I am trying to setup UBI over mtdram/nandsim on a AMD 64-bit (1.66
MHz) Turion Dual core machine. The MTD device is of size 128 MB and
the UBI volume is of size 111 MB. I have tried it on Intel P-4 CPU
2.66GHz and it works fine. But as soon as i do a modprobe for ubi
module, the kernel gives an oops. Can you please tell me if UBI works
fine on 64-bit architecture or if there are any known issues and if
there are any fixes available. The trace of the same is as follows -

<SNIP>
UBI: logical eraseblock size:    -2138913472 bytes
UBI: number of good PEBs:        -14
UBI: number of bad PEBs:         -6
UBI: smallest flash I/O unit:    -5
UBI: VID header offset:          888109832 (aligned 0)
UBI: data offset:                -4
UBI: max. allowed volumes:       -5
UBI: wear-levelling threshold:   -5
UBI: number of internal volumes: -5
UBI: number of user volumes:     -5
UBI: available PEBs:             -5
UBI: total number of reserved PEBs: -5
UBI: number of PEBs reserved for bad PEB handling: -5
[UBI DBG bgt] (pid:5125) ubi_bgt_enable: <1>Unable to handle kernel
paging request at 00000000fffffffb RIP:
 [<ffffffff803422fe>] strnlen+0x11/0x1a
PGD 1356067 PUD 0
Oops: 0000 [1] SMP
CPU 0
Modules linked in: ubi mtdram mtdpart mtdcore
Pid: 5125, comm: modprobe Not tainted 2.6.19-rc2 #1
RIP: 0010:[<ffffffff803422fe>]  [<ffffffff803422fe>] strnlen+0x11/0x1a
RSP: 0018:ffff810034ef7b80  EFLAGS: 00010097
RAX: 00000000fffffffb RBX: ffff810034ef7cb8 RCX: ffffffff8801b97c
RDX: ffff810034ef7cf8 RSI: fffffffffffffffe RDI: 00000000fffffffb
RBP: ffffffff8082c028 R08: 00000000ffffffff R09: ffff810034ef7a18
R10: 0000000000000004 R11: 0000000000000000 R12: 00000000fffffffb
R13: 00000000ffffffff R14: 0000000000000000 R15: ffffffff8082c420
FS:  00002b622282c6d0(0000) GS:ffffffff8077d000(0000) knlGS:00000000f7e006b0
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 00000000fffffffb CR3: 0000000027eeb000 CR4: 00000000000006e0
Process modprobe (pid: 5125, threadinfo ffff810034ef6000, task ffff810032702080)
Stack:  ffffffff803432e2 ffff810034ef7cb8 ffffffff802315f6 0000000000000400
 ffffffff8082c020 ffffffff8801b97c 0000000000000400 0000000000000246
 ffffffff8801b973 ffffffff8082c020 ffff810034ef7cb8 ffffffff8801b973
Call Trace:
 [<ffffffff803432e2>] vsnprintf+0x337/0x59b
 [<ffffffff8034371b>] vscnprintf+0x9/0x1a
 [<ffffffff80231397>] vprintk+0xce/0x2df
 [<ffffffff88016891>] :ubi:ubi_dbg_vprint_nolock+0x25e/0x32f
 [<ffffffff88016a17>] :ubi:ubi_dbg_print+0x69/0x82
 [<ffffffff8801537f>] :ubi:ubi_bgt_enable+0x2c/0x7a
 [<ffffffff8802c037>] :ubi:ubi_bld_attach_mtd_dev+0x377/0x3f2
 [<ffffffff8802c73f>] :ubi:ubi_init+0x222/0x2d5
 [<ffffffff8024c03a>] sys_init_module+0x15e3/0x17a5
 [<ffffffff8020955e>] system_call+0x7e/0x83
DWARF2 unwinder stuck at system_call+0x7e/0x83

Leftover inexact backtrace:



Code: 80 38 00 75 ef 48 29 f8 c3 31 c0 eb 12 41 38 c8 74 0a 48 ff
RIP  [<ffffffff803422fe>] strnlen+0x11/0x1a
 RSP <ffff810034ef7b80>
CR2: 00000000fffffffb
</SNIP>


Thanks and Regards,
Kumar
