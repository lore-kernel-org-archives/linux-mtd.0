Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KsXME-0002qK-NK
	for linux-mtd@lists.infradead.org; Wed, 22 Oct 2008 06:38:15 +0000
Received: by fg-out-1718.google.com with SMTP id l26so210341fgb.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Oct 2008 23:38:13 -0700 (PDT)
Message-ID: <6b5362aa0810212338k80de19ci893b9fb4b7802ce4@mail.gmail.com>
Date: Wed, 22 Oct 2008 12:08:12 +0530
From: "Brijesh Singh" <brijesh.s.singh@gmail.com>
To: kmpark@infradead.org, dwmw2@infradead.org
Subject: Re: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_19548_24467849.1224657492836"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_19548_24467849.1224657492836
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
    I was testing JFFS2 on 2.6.20 with fsstress for OneNand Chip. JFFS2 died
with the a BUG in gc.c.

     I have gone through all  the mailing archive possible. Kyungmin park
had reported the problem,
 but I could not find the fix.

     Here is the mail:
http://lists.infradead.org/pipermail/linux-mtd/2007-April/017979.html

     Any idea,why this BUG occurs/occurred? Is there any fix available?

Thanks,
Brijesh

-------------------------------------------------------------------------------------------------------------------
Log:

Kernel : 2.6.20
Processor and Board:  Omap based Arm
Chip: OneNand
---------------------------------------------------------------------------------------------------------------------------
(onenand_erase: attempt to erase a bad block at addr 0x1f4e0000)

Raw node at 0x154a9abc wasn't in node lists for ino #4184316
kernel BUG at fs/jffs2/gc.c:517!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0f90000
[00000000] *pgd=81987031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x20/0x2c
LR is at vprintk+0x33c/0x3a8
pc : [<c0026a94>]    lr : [<c003c774>]    Not tainted
sp : c088fd30  ip : c088fca8  fp : c088fd3c
r10: c1019aa0  r9 : c3c85e00  r8 : 00000000
r7 : 00000000  r6 : 00000000  r5 : c1f48d80  r4 : 00000000
r3 : 00000000  r2 : c088e000  r1 : c022be5c  r0 : 00000024
Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C5387F
Table: 80F90000  DAC: 00000015
Process fsstress_hq (pid: 3844, stack limit = 0xc088e248)
Stack: (0xc088fd30 to 0xc0890000)
fd20:                                     c088feb8 c088fd40 c00ee970
c0026a80
fd40: 00000002 00000002 c088fd74 c088fd58 c007d600 c0113fb8 00000000
c39724b4
fd60: c088fdf8 c088fdf8 c088fd84 c088fd78 c00e7f8c c1019ac4 00000000
00000000

---------------------------------------------------------------------------------------------------------------------------

fd80: c088fdb8 c1b826e8 00000000 00000000 c48c3984 c0e45c70 00000002
00000afb
fda0: 00000000 00000000 00000000 44ebcc56 00000000 00016614 c0e40000
c088fe68
fdc0: c088fdcc c00f1040 c0096da4 00000000 00000002 44ebcc56 00000000
00000000
fde0: 00000000 c0259da8 c031efd8 003fd8fc 003fd8fc 00003798 c031b840
c031efd8
fe00: c1019adc c088fe20 c088fe14 c1019adc c031efd8 c088fe3c c088fe24
c0096008
fe20: c0036918 003fd8fc c3c85800 003fd8fc c088fe68 c088fe40 c00960bc
c0095fc4
fe40: 003fd8fc c3c85800 c3c85e00 003fd8fc c48c3984 c3c85e4c 00000001
c088feb8
fe60: c088fe6c c00f1568 c0097670 c0037964 c088fe94 c088fe80 c0096bc0
c3c85f54
fe80: 00000000 c3c85e00 c1f48d80 c48c3984 c1019aa0 00000001 c3c85e00
c1f48d80
fea0: c48c3984 c3c85e4c c3c85f54 c088ff28 c088febc c00ef0e0 c00ed83c
c01df6ec
fec0: 00000000 c088ff4c c088fed4 c00f0220 c01df6e0 0072962e 00000002
c088ff04
fee0: c3c85f64 00000000 c3c85840 c0056690 c3c85858 c088ff40 c3c85f10
c3c85f10
ff00: c3c85e4c c3c85e00 00000000 00000108 144e9800 c088e000 40149dfc
c088ff4c
ff20: c088ff2c c00f31bc c00ee9a8 c3c85e00 00000000 c0259b5c 00000024
c0022fa4
ff40: c088ff64 c088ff50 c00f1240 c00f30f4 c3c85800 c3c8583c c088ff80
c088ff68
ff60: c00834dc c00f1208 00000001 4001e000 000105c0 c088ff94 c088ff84
c00a2eb0
ff80: c0083458 bebaed94 c088ffa4 c088ff98 c00a2f0c c00a2e98 00000000
c088ffa8
ffa0: c0022e00 c00a2f04 bebaed94 4001e000 000008c3 78a55cd6 78a55cd6
0000ee84
ffc0: bebaed94 4001e000 000105c0 00000009 4014c4c4 00009250 40149dfc
bebaeb2c
ffe0: 00019a0c bebaeb18 0000eea0 400f2644 60000010 000008c3 b5b5b5b5
b5b5b5b5
Backtrace:
[<c0026a74>] (__bug+0x0/0x2c) from [<c00ee970>]
(jffs2_garbage_collect_live+0x1140/0x116c)
[<c00ed830>] (jffs2_garbage_collect_live+0x0/0x116c) from [<c00ef0e0>]
(jffs2_garbage_collect_pass+0x744/0x814)
[<c00ee99c>] (jffs2_garbage_collect_pass+0x0/0x814) from [<c00f31bc>]
(jffs2_flush_wbuf_gc+0xd4/0x1ac)
[<c00f30e8>] (jffs2_flush_wbuf_gc+0x0/0x1ac) from [<c00f1240>]
(jffs2_write_super+0x44/0x48)
 r8 = C0022FA4  r7 = 00000024  r6 = C0259B5C  r5 = 00000000
 r4 = C3C85E00
[<c00f11fc>] (jffs2_write_super+0x0/0x48) from [<c00834dc>]
(sync_supers+0x90/0xd4)
 r5 = C3C8583C  r4 = C3C85800
[<c008344c>] (sync_supers+0x0/0xd4) from [<c00a2eb0>] (do_sync+0x24/0x6c)
 r6 = 000105C0  r5 = 4001E000  r4 = 00000001
[<c00a2e8c>] (do_sync+0x0/0x6c) from [<c00a2f0c>] (sys_sync+0x14/0x1c)
 r4 = BEBAED94
[<c00a2ef8>] (sys_sync+0x0/0x1c) from [<c0022e00>]
(ret_fast_syscall+0x0/0x2c)
Code: e1a01000 e59f000c eb005753 e3a03000 (e5833000)
 BUG: at kernel/exit.c:860 do_exit()

------=_Part_19548_24467849.1224657492836
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,&nbsp;&nbsp; <br>&nbsp; &nbsp; I was testing JFFS2 on 2.6.20 with fsstress for OneNand Chip. JFFS2 died with the a BUG in gc.c.<br><br>&nbsp;&nbsp; &nbsp; I have gone through all&nbsp; the mailing archive possible. Kyungmin park had reported the problem,<br>&nbsp;but I could not find the fix.<br>
<br>&nbsp; &nbsp;&nbsp; Here is the mail: <a href="http://lists.infradead.org/pipermail/linux-mtd/2007-April/017979.html">http://lists.infradead.org/pipermail/linux-mtd/2007-April/017979.html</a><br><br>&nbsp;&nbsp;&nbsp;&nbsp; Any idea,why this BUG occurs/occurred? Is there any fix available?<br>
<br>Thanks,<br>Brijesh<br><br>-------------------------------------------------------------------------------------------------------------------<br>Log:<br><br>Kernel : 2.6.20<br>Processor and Board:&nbsp; Omap based Arm<br>Chip: OneNand<br>
---------------------------------------------------------------------------------------------------------------------------<br>(onenand_erase: attempt to erase a bad block at addr 0x1f4e0000)<br><br>Raw node at 0x154a9abc wasn&#39;t in node lists for ino #4184316<br>
kernel BUG at fs/jffs2/gc.c:517!<br>Unable to handle kernel NULL pointer dereference at virtual address 00000000<br>pgd = c0f90000<br>[00000000] *pgd=81987031, *pte=00000000, *ppte=00000000<br>Internal error: Oops: 817 [#1]<br>
Modules linked in:<br>CPU: 0<br>PC is at __bug+0x20/0x2c<br>LR is at vprintk+0x33c/0x3a8<br>pc : [&lt;c0026a94&gt;]&nbsp;&nbsp;&nbsp; lr : [&lt;c003c774&gt;]&nbsp;&nbsp;&nbsp; Not tainted<br>sp : c088fd30&nbsp; ip : c088fca8&nbsp; fp : c088fd3c<br>r10: c1019aa0&nbsp; r9 : c3c85e00&nbsp; r8 : 00000000<br>
r7 : 00000000&nbsp; r6 : 00000000&nbsp; r5 : c1f48d80&nbsp; r4 : 00000000<br>r3 : 00000000&nbsp; r2 : c088e000&nbsp; r1 : c022be5c&nbsp; r0 : 00000024<br>Flags: nZcv&nbsp; IRQs on&nbsp; FIQs on&nbsp; Mode SVC_32&nbsp; Segment user<br>Control: C5387F<br>Table: 80F90000&nbsp; DAC: 00000015<br>
Process fsstress_hq (pid: 3844, stack limit = 0xc088e248)<br>Stack: (0xc088fd30 to 0xc0890000)<br>fd20:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c088feb8 c088fd40 c00ee970 c0026a80 <br>fd40: 00000002 00000002 c088fd74 c088fd58 c007d600 c0113fb8 00000000 c39724b4 <br>
fd60: c088fdf8 c088fdf8 c088fd84 c088fd78 c00e7f8c c1019ac4 00000000 00000000 <br><br>---------------------------------------------------------------------------------------------------------------------------<br><br>fd80: c088fdb8 c1b826e8 00000000 00000000 c48c3984 c0e45c70 00000002 00000afb <br>
fda0: 00000000 00000000 00000000 44ebcc56 00000000 00016614 c0e40000 c088fe68 <br>fdc0: c088fdcc c00f1040 c0096da4 00000000 00000002 44ebcc56 00000000 00000000 <br>fde0: 00000000 c0259da8 c031efd8 003fd8fc 003fd8fc 00003798 c031b840 c031efd8 <br>
fe00: c1019adc c088fe20 c088fe14 c1019adc c031efd8 c088fe3c c088fe24 c0096008 <br>fe20: c0036918 003fd8fc c3c85800 003fd8fc c088fe68 c088fe40 c00960bc c0095fc4 <br>fe40: 003fd8fc c3c85800 c3c85e00 003fd8fc c48c3984 c3c85e4c 00000001 c088feb8 <br>
fe60: c088fe6c c00f1568 c0097670 c0037964 c088fe94 c088fe80 c0096bc0 c3c85f54 <br>fe80: 00000000 c3c85e00 c1f48d80 c48c3984 c1019aa0 00000001 c3c85e00 c1f48d80 <br>fea0: c48c3984 c3c85e4c c3c85f54 c088ff28 c088febc c00ef0e0 c00ed83c c01df6ec <br>
fec0: 00000000 c088ff4c c088fed4 c00f0220 c01df6e0 0072962e 00000002 c088ff04 <br>fee0: c3c85f64 00000000 c3c85840 c0056690 c3c85858 c088ff40 c3c85f10 c3c85f10 <br>ff00: c3c85e4c c3c85e00 00000000 00000108 144e9800 c088e000 40149dfc c088ff4c <br>
ff20: c088ff2c c00f31bc c00ee9a8 c3c85e00 00000000 c0259b5c 00000024 c0022fa4 <br>ff40: c088ff64 c088ff50 c00f1240 c00f30f4 c3c85800 c3c8583c c088ff80 c088ff68 <br>ff60: c00834dc c00f1208 00000001 4001e000 000105c0 c088ff94 c088ff84 c00a2eb0 <br>
ff80: c0083458 bebaed94 c088ffa4 c088ff98 c00a2f0c c00a2e98 00000000 c088ffa8 <br>ffa0: c0022e00 c00a2f04 bebaed94 4001e000 000008c3 78a55cd6 78a55cd6 0000ee84 <br>ffc0: bebaed94 4001e000 000105c0 00000009 4014c4c4 00009250 40149dfc bebaeb2c <br>
ffe0: 00019a0c bebaeb18 0000eea0 400f2644 60000010 000008c3 b5b5b5b5 b5b5b5b5 <br>Backtrace: <br>[&lt;c0026a74&gt;] (__bug+0x0/0x2c) from [&lt;c00ee970&gt;] (jffs2_garbage_collect_live+0x1140/0x116c)<br>[&lt;c00ed830&gt;] (jffs2_garbage_collect_live+0x0/0x116c) from [&lt;c00ef0e0&gt;] (jffs2_garbage_collect_pass+0x744/0x814)<br>
[&lt;c00ee99c&gt;] (jffs2_garbage_collect_pass+0x0/0x814) from [&lt;c00f31bc&gt;] (jffs2_flush_wbuf_gc+0xd4/0x1ac)<br>[&lt;c00f30e8&gt;] (jffs2_flush_wbuf_gc+0x0/0x1ac) from [&lt;c00f1240&gt;] (jffs2_write_super+0x44/0x48)<br>
&nbsp;r8 = C0022FA4&nbsp; r7 = 00000024&nbsp; r6 = C0259B5C&nbsp; r5 = 00000000<br>&nbsp;r4 = C3C85E00 <br>[&lt;c00f11fc&gt;] (jffs2_write_super+0x0/0x48) from [&lt;c00834dc&gt;] (sync_supers+0x90/0xd4)<br>&nbsp;r5 = C3C8583C&nbsp; r4 = C3C85800 <br>[&lt;c008344c&gt;] (sync_supers+0x0/0xd4) from [&lt;c00a2eb0&gt;] (do_sync+0x24/0x6c)<br>
&nbsp;r6 = 000105C0&nbsp; r5 = 4001E000&nbsp; r4 = 00000001 <br>[&lt;c00a2e8c&gt;] (do_sync+0x0/0x6c) from [&lt;c00a2f0c&gt;] (sys_sync+0x14/0x1c)<br>&nbsp;r4 = BEBAED94 <br>[&lt;c00a2ef8&gt;] (sys_sync+0x0/0x1c) from [&lt;c0022e00&gt;] (ret_fast_syscall+0x0/0x2c)<br>
Code: e1a01000 e59f000c eb005753 e3a03000 (e5833000) <br>&nbsp;BUG: at kernel/exit.c:860 do_exit()<br><br>&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp; <br><br><br><br>

------=_Part_19548_24467849.1224657492836--
