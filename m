Received: from mail2.asianet.co.th ([203.144.222.230] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C5i9z-0007vQ-SO
	for linux-mtd@lists.infradead.org; Fri, 10 Sep 2004 05:57:41 -0400
Received: from virscan3.asianet.co.th (HELO virus3.asianet.co.th)
	([203.144.222.224]) (envelope-sender <jay4mail@yahoo.com>)
	by mail2.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 10 Sep 2004 16:57:30 +0700
Received: from ppp-210.86.146.131.revip.asianet.co.th (HELO [10.1.1.33]) ([2
	10.86.146.131])(envelope-sender <jay4mail@yahoo.com>)by
	mx3.asianet.co.th (
	qmail-ldap-1.03) with SMTPfor <linux-mtd@lists.infradead.org>;
	10 Sep 2004 16:57:29 +0700
Message-ID: <41417B06.2000005@yahoo.com>
Date: Fri, 10 Sep 2004 16:59:34 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed
Content-Transfer-Encoding: 7bit
Subject: kernel oops in jffs2_flash_writev
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've got a problem with jffs2. Sometime when I write to jffs2 partition 
mounted on NAND flash I get an Oops in jffs2_flash_writev. Have anyone 
experienced this, have a fix or know what is wrong? I've attached the 
kernel backtrace.

Best regards,
Pathompong Puengrostham


Write of 3906 bytes at 0x00ba45fc failed. returned -5, retlen 4
jffs2_flash_writev(): Non-contiguous write to 00ba5540
kernel BUG at fs/jffs2/wbuf.c:614!
Unable to handle kernel NULL pointer dereference at virtual address 
00000000
pgd = c0368000
[00000000] *pgd=0b17e011, *pte=00000000, *ppte=00000000
Internal error: Oops: 807 [#1]
Modules linked in:  snd_sa11xx_uda1341 snd_uda1341 l3 snd_pcm 
snd_page_alloc snd_timer snd soundcore button spi_mx1 akcpmxl_rtc 
i2c_dev ext2 rd csi2c i2c_imx i2c_core
CPU: 0
PC is at $a+0x40/0x48
LR is at 0x1
pc : [<c001fb0c>]    lr : [<00000001>]    Tainted: P
sp : c3743c6c  ip : 60000093  fp : c3743c7c
r10: 00000000  r9 : 00ba5540  r8 : c3fe0800
r7 : c0318bb0  r6 : c3fe0800  r5 : 00000000  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C000717F  Table: 08368000  DAC: 00000015
Process test (pid: 410, stack limit = 0xc3742190)
Stack: (0xc3743c6c to 0xc3744000)
3c60:                            00000000 c3743cfc c3743c80 c00c85bc 
001fadc
3c80: 000010c9 000010c9 c3743cc0 c3743c98 c0028cd0 c0028a2c 00ba5540 
00000000
3ca0: c01a3a84 ffffffff 00000000 00000000 00000002 c3743d38 00004000 
00000f44
3cc0: c3742000 c3743d30 c3743d78 c3743d00 c3743cdc 00ba5540 00000000 
c19b5000
3ce0: c0318bb0 c3fe0800 c3555220 c24e4844 c3743d70 c3743d04 c00be920 
c00c84d4
3d00: 00ba5540 00000000 c3743d34 00000000 00001000 c3743dbc 00000f45 
00000f42
3d20: 00000002 00000001 c35cf534 c3743de4 00002ac0 00000004 c3743de4 
00000044
3d40: c2345000 00000efe 38c618ed 00000006 c19b5000 c3555220 00000000 
c19b5000
3d60: 00000002 c3743ee4 c3743d74 c00c2d94 c00be7b4 00000efe 00ba5540 
00000002
3d80: c3743eb4 c3555234 00001000 c3743eac c3742000 c3743eb4 00001000 
00001000
3da0: c3742000 00000000 00001000 00000acf c3fe0800 c00d2704 00000efe 
00001000
3dc0: c2345000 00003a04 00ba45fc c02216a0 c3743ddc c004f448 c0043758 
c3743eb4
3de0: c3743f44 e0021985 00000f42 b6c0e3fc 00000143 0000002e 000081a4 
03e803e8
3e00: 0000194c 41416915 41416915 41416915 00000000 00000efe 00001000 
00000006
3e20: 38c618ed 7be9c02a c0d89d60 c3743fa4 00000001 00000001 00000000 
00000000
3e40: 00000000 00000000 c01a5570 00000000 00000000 00000000 00000000 
00000000
3e60: 0000000d c3742000 c3555248 38c618ed 38c618ed c007f758 c007e65c 
00000143
3e80: c3fe0a00 00000001 00000143 c24f68d4 c3743ee4 c3743ea0 c00c6a28 
c0080700
3ea0: 00000000 c3743ecc c3743fa4 00000000 00000000 00010d00 000002b1 
c3555220
3ec0: c3742000 c3fe0800 c3fe0830 c24f68d4 00000001 c0317fb0 c3743f50 
c3743ee8
3ee0: c00c3ecc c00c2694 00000000 c3743f0c 00000000 c3743f44 00000000 
c2d3c540
3f00: c01a5570 c001ac84 c3742000 4013b3a8 c3743f84 c3743f20 c0042b9c 
c0087fc0
3f20: 00000000 00000001 c3fe0830 c3fe0800 000001f9 00000000 00ba4400 
c3742000
3f40: 4013b3a8 c3743f74 c3743f54 c00c8404 c00c38a8 c3742000 00000000 
c0d89d60
3f60: c2d3c540 c001ac84 c3743f84 c3743f78 c00ba33c c00c8358 c3743fa4 
c3743f88
3f80: c00631f4 c00ba32c befffe84 000089ec 00000002 00000076 00000000 
c3743fa8
3fa0: c001ab00 c0063150 befffe84 c001ba20 00000003 00010d00 000002b1 
000c1244
3fc0: befffe84 000089ec 00000002 00008a50 000086f0 00000000 4013b3a8 
befffe58
3fe0: 00000000 befffdb4 00003f98 400e4770 40000010 00000003 c1c157cd 
3ff2e621
Backtrace:
[<c001facc>] ($a+0x0/0x48) from [<c00c85bc>] 
(jffs2_flash_writev+0xfc/0x468)
  r4 = 00000000
[<c00c84c4>] (jffs2_flash_writev+0x4/0x468) from [<c00be920>] 
($a+0x17c/0x6c8)
[<c00be7a4>] ($a+0x0/0x6c8) from [<c00c2d94>] ($a+0x24c/0xd0c)
[<c00c2684>] ($a+0x0/0x468) from [<c00c3ecc>] ($a+0x164/0x45c)
[<c00c3898>] ($a+0x0/0x100) from [<c00c8404>] ($a+0xbc/0x160)
[<c00c8348>] ($a+0x0/0x160) from [<c00ba33c>] ($a+0x20/0x28)
  r8 = C001AC84  r7 = C2D3C540  r6 = C0D89D60  r5 = 00000000
  r4 = C3742000
[<c00ba31c>] ($a+0x0/0x28) from [<c00631f4>] (sys_fsync+0xb4/0x10c)
[<c0063140>] (sys_fsync+0x0/0x10c) from [<c001ab00>] ($a+0x0/0x2c)
  r7 = 00000076  r6 = 00000002  r5 = 000089EC  r4 = BEFFFE84
Code: 1b0024d9 e59f0014 eb0024d7 e3a03000 (e5833000) 
