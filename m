Received: from mail-it0-x230.google.com ([2607:f8b0:4001:c0b::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRm34-00086w-BT
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 20:32:40 +0000
Received: by mail-it0-x230.google.com with SMTP id c7so19655237itd.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Jan 2017 12:32:17 -0800 (PST)
MIME-Version: 1.0
From: Travis Waters <waterstw@gmail.com>
Date: Thu, 12 Jan 2017 13:32:16 -0700
Message-ID: <CADRLR4HnkVM_W0W+Qtksb+ky+25xkqjhJRb40GyaL_wU8PCMyw@mail.gmail.com>
Subject: Buildroot fastmap attaching
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First-off, thanks for your work on UBI and the fastmap attaching -
it's going to be an integral part of our system.



I am working with a buildroot version of linux sitting on a 3.10.58
kernel for an embedded SPARC device.  I'm working on an MTD driver for
our FLASH device, and we are working to get UBIFS mounting on top of
that.  The FLASH is a 16GB part, so we are targeting fastmap.



I've been running into stability issues when attaching with fastmap -
the attaching fails with an occasional SPARC trap when counting the
number of available PEBS:



Unable to handle kernel NULL pointer dereference

tsk->{mm,active_mm}->context = 00000077

tsk->{mm,active_mm}->pgd = fc012400

              \|/ ____ \|/

              "@'/ ,. \`@"

              /_| \__/ |_\

                 \__U_/

ubiattach(122): Oops [#1]

CPU: 0 PID: 122 Comm: ubiattach Tainted: G           O
3.10.58-00020-gc9dee3c-dirty #747

task: fbd6c420 ti: fbe4e000 task.ti: fbe4e000

PSR: f31000c6 PC: f0405de4 NPC: f0405de8 Y: 0000001c    Tainted: G           O

PC: <count_fastmap_pebs+0x70/0x120>

%G: 00000000 ffffffe0  00001ea2 fbd6a26c  00000094 f0f574b0  fbe4e000 000024e8

%O: 0000000a 00000000  00000000 fbc004e0  f38000e6 fbc02e60  fbe4fba8 f0405dbc

RPC: <count_fastmap_pebs+0x48/0x120>

%L: fbf14000 00000000  fbe55000 0000000c  f050a398 00000000  0000000a fbf70000

%I: fbd6a260 fbd6a260  fe9e9578 00000019  fbe4fcb0 fbe4fcc8  fbe4fc10
f03186e0 Disabling lock debugging due to kernel taint

Caller[f03186e0]: ubi_scan_fastmap+0x1494/0x18a0

Caller[f0315af4]: ubi_attach+0x278/0x488

Caller[f0306b98]: ubi_attach_mtd_dev+0xa28/0x118c

Caller[f03088d8]: ctrl_cdev_ioctl+0x14c/0x1e4

Caller[f00b1fbc]: do_vfs_ioctl+0x2a8/0x6b8

Caller[f00b23f4]: SyS_ioctl+0x28/0x54

Caller[f0007ed0]: do_syscall+0x34/0x40

Caller[000117e0]: 0x117e0

Instruction DUMP: 02800009  01000000  c407bffc <c2006020> 8400a001
82007fe0  c427bffc  10bffff8  84006020 Killed



It appears that the list is somehow getting corrupted.  I haven't been
able to track down what would cause the corruption, so I'm hoping you
have some insight.



I'm also interested in patching the UBI/FASTMAP system to something
more recent.  It looks like the latest buildroot has is a couple years
old.  Could you help me identify what patches I need coming from the
3.10 kernel?



Thank you!
