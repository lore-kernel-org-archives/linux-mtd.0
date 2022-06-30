Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B35C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jun 2022 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lz0Bgi5gClY6XAxJk8t6PwiI/1a9CntCvHBKTs+3N7Y=; b=4GR
	D0fe6hw0jCGwC8JZmYLZ4dJEoXMUsMpFxsIMZUntybvMtZj6p+MeUNZsegSglQm5DrVzXHX8ZVZfS
	ZGYINigAdf0/16PHwLWR9L+0iSomywnRC355vwyivZY3UFEKPZ1//roUf4LCr6/nKG9xRciJidBUH
	6k0F+JJD2+Zj5avxXHeD4i5STNXKPSx6GQca+pXMZ+tgQUBJbY3iZi9RxdvlZ0Tx/8X5h8JkVXZgs
	wMrgEPlgwRaTtGf7E1AJpjR/DM3lxlnbUKUmGt4oPRr/cvTj+n2JPzNf70rvIY9fux8EHvloH++XH
	ybDn13H6o1qcpb6XhU4m9jCW5e8JBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qXL-00GH8h-Lk; Thu, 30 Jun 2022 09:32:36 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qX9-00GH2p-65
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2022 09:32:31 +0000
Received: by mail-il1-f197.google.com with SMTP id i2-20020a056e021d0200b002d8ff49e7c4so10287804ila.8
        for <linux-mtd@lists.infradead.org>; Thu, 30 Jun 2022 02:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Aqv+uR4xJVCILY0FJU8Eeg6DETdWn8J1zwf9rn3G8z0=;
        b=7ouNJ3hyn8bPJz89NAsAVgJ70sf/71InurjEzSW+Bwvvq87PfwIFXQSLHtoQ7zCk9O
         KV0v8wJPImVwaMFJgcSABs68c2gcmiXkHnWXStTW/4UAK0AR5TthIKTh+TQMVYTSBgNE
         aRnM8PPTHFg4Lrzp5qTzyRMO6YHXK8e1+cfbigHW5Y2TWEtG8TBvz6NUd3ZpVmDCoJFR
         l3bljJ/Y7bpH7hcl+pvPDS/RjDzWt8UJ9KIUKy6G/LQ8Lq5OOWLyXNUDlC6GrZWKHL9P
         OYPyCcR8F3tq6+tdhch8KIhcrC9TdI4/PB7ovsnAJGES5cYHryFA6kPCHzAs25NDAscZ
         UPvA==
X-Gm-Message-State: AJIora+Dm9AyTrzShaEMzvWK07lnhaQ7jK5CYHa6jYu+iXs8mDvGDGOR
	ZXFoXNNm3b/rz7x1lMmSOYc8LKermQ7tM2/DE5emXj6gQj17
X-Google-Smtp-Source: AGRyM1tQnCRMVWqdnKP691JsDC+C/VhOGWuSIMBmaC32Fz51TGwXC4HTF9SRQpsDPD2ZrP/W2dfjDjkdO+9p+kxH/SsN10TMbvdu
MIME-Version: 1.0
X-Received: by 2002:a02:85e3:0:b0:339:cf24:68f6 with SMTP id
 d90-20020a0285e3000000b00339cf2468f6mr4806247jai.161.1656581540305; Thu, 30
 Jun 2022 02:32:20 -0700 (PDT)
Date: Thu, 30 Jun 2022 02:32:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040624a05e2a6f2db@google.com>
Subject: [syzbot] linux-next boot error: general protection fault in add_mtd_device
From: syzbot <syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-next@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_023223_320540_5666BE10 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

syzbot found the following issue on:

HEAD commit:    6cc11d2a1759 Add linux-next specific files for 20220630
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1640f850080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=54f75b620e3845dd
dashboard link: https://syzkaller.appspot.com/bug?extid=fe013f55a2814a9e8cfd
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com

Block layer SCSI generic (bsg) driver version 0.4 loaded (major 240)
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
ACPI: button: Power Button [PWRF]
input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/input/input1
ACPI: button: Sleep Button [SLPF]
ACPI: \_SB_.LNKC: Enabled at IRQ 11
virtio-pci 0000:00:03.0: virtio_pci: leaving for legacy driver
ACPI: \_SB_.LNKD: Enabled at IRQ 10
virtio-pci 0000:00:04.0: virtio_pci: leaving for legacy driver
ACPI: \_SB_.LNKB: Enabled at IRQ 10
virtio-pci 0000:00:06.0: virtio_pci: leaving for legacy driver
virtio-pci 0000:00:07.0: virtio_pci: leaving for legacy driver
N_HDLC line discipline registered with maxframe=4096
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
00:05: ttyS2 at I/O 0x3e8 (irq = 6, base_baud = 115200) is a 16550A
00:06: ttyS3 at I/O 0x2e8 (irq = 7, base_baud = 115200) is a 16550A
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
ACPI: bus type drm_connector registered
[drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
[drm] Initialized vkms 1.0.0 20180514 for vkms on minor 1
Console: switching to colour frame buffer device 128x48
platform vkms: [drm] fb0: vkmsdrmfb frame buffer device
usbcore: registered new interface driver udl
brd: module loaded
loop: module loaded
zram: Added device: zram0
null_blk: disk nullb0 created
null_blk: module loaded
Guest personality initialized and is inactive
VMCI host device registered (name=vmci, major=10, minor=119)
Initialized host personality
usbcore: registered new interface driver rtsx_usb
usbcore: registered new interface driver viperboard
usbcore: registered new interface driver dln2
usbcore: registered new interface driver pn533_usb
nfcsim 0.2 initialized
usbcore: registered new interface driver port100
usbcore: registered new interface driver nfcmrvl
Loading iSCSI transport class v2.0-870.
scsi host0: Virtio SCSI HBA
st: Version 20160209, fixed bufsize 32768, s/g segs 256
Rounding down aligned max_sectors from 4294967295 to 4294967288
db_root: cannot open: /etc/target
slram: not enough parameters.
general protection fault, probably for non-canonical address 0xdffffc00000000ac: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000560-0x0000000000000567]
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc4-next-20220630-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/18/2022
RIP: 0010:dev_of_node include/linux/device.h:862 [inline]
RIP: 0010:mtd_check_of_node drivers/mtd/mtdcore.c:563 [inline]
RIP: 0010:add_mtd_device+0xbc8/0x1520 drivers/mtd/mtdcore.c:721
Code: 48 81 fd 60 fe ff ff 0f 84 90 fd ff ff e8 b0 10 97 fc 48 8d bd 60 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 da 08 00 00 48 8b ad 60 05 00 00 48 85 ed 0f 84
RSP: 0000:ffffc90000067c98 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff88801ebf2000 RCX: 0000000000000000
RDX: 00000000000000ac RSI: ffffffff84e3a650 RDI: 0000000000000560
RBP: 0000000000000000 R08: 0000000000000006 R09: 0000000000000000
R10: ffffffff89c00000 R11: 0000000000000001 R12: ffff88801ebf2004
R13: ffff88801ebf2028 R14: 0000000000000000 R15: 0000000005a00000
FS:  0000000000000000(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000ba8e000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 mtd_device_parse_register+0x50c/0x850 drivers/mtd/mtdcore.c:1032
 mtdram_init_device+0x291/0x350 drivers/mtd/devices/mtdram.c:146
 init_mtdram+0xe5/0x177 drivers/mtd/devices/mtdram.c:171
 do_one_initcall+0xfe/0x650 init/main.c:1300
 do_initcall_level init/main.c:1375 [inline]
 do_initcalls init/main.c:1391 [inline]
 do_basic_setup init/main.c:1410 [inline]
 kernel_init_freeable+0x6b1/0x73a init/main.c:1617
 kernel_init+0x1a/0x1d0 init/main.c:1506
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:302
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dev_of_node include/linux/device.h:862 [inline]
RIP: 0010:mtd_check_of_node drivers/mtd/mtdcore.c:563 [inline]
RIP: 0010:add_mtd_device+0xbc8/0x1520 drivers/mtd/mtdcore.c:721
Code: 48 81 fd 60 fe ff ff 0f 84 90 fd ff ff e8 b0 10 97 fc 48 8d bd 60 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 da 08 00 00 48 8b ad 60 05 00 00 48 85 ed 0f 84
RSP: 0000:ffffc90000067c98 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff88801ebf2000 RCX: 0000000000000000
RDX: 00000000000000ac RSI: ffffffff84e3a650 RDI: 0000000000000560
RBP: 0000000000000000 R08: 0000000000000006 R09: 0000000000000000
R10: ffffffff89c00000 R11: 0000000000000001 R12: ffff88801ebf2004
R13: ffff88801ebf2028 R14: 0000000000000000 R15: 0000000005a00000
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000ba8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 81 fd 60 fe ff ff 	cmp    $0xfffffffffffffe60,%rbp
   7:	0f 84 90 fd ff ff    	je     0xfffffd9d
   d:	e8 b0 10 97 fc       	callq  0xfc9710c2
  12:	48 8d bd 60 05 00 00 	lea    0x560(%rbp),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 da 08 00 00    	jne    0x90e
  34:	48 8b ad 60 05 00 00 	mov    0x560(%rbp),%rbp
  3b:	48 85 ed             	test   %rbp,%rbp
  3e:	0f                   	.byte 0xf
  3f:	84                   	.byte 0x84


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
