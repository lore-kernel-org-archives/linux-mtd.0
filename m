Received: from wx-out-0506.google.com ([66.249.82.229])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ii1Em-0001md-B6
	for linux-mtd@lists.infradead.org; Wed, 17 Oct 2007 06:14:34 +0100
Received: by wx-out-0506.google.com with SMTP id s7so2074973wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Oct 2007 22:13:57 -0700 (PDT)
Message-ID: <a8e1da0710162213g212d92a1q7fd94b578100c58d@mail.gmail.com>
Date: Wed, 17 Oct 2007 13:13:56 +0800
From: "Dave Young" <hidave.darkstar@gmail.com>
To: "Randy Dunlap" <randy.dunlap@oracle.com>
Subject: Re: mtd: pnc2000 module crashes
In-Reply-To: <20071016214704.05a42338.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20071016214704.05a42338.randy.dunlap@oracle.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>On 10/17/07, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 2.6.23-git7, on x86_64, no MTD devices:
>
> modprobe pnc2000 crashes like so:
>
> Photron PNC-2000 flash mapping: 400000 at bf000000
> Unable to handle kernel paging request at 00000000bf000000 RIP:
>  [<ffffffff8800a0b9>] :map_funcs:simple_map_write+0x54/0x82
> PGD 3476f067 PUD 0
> Oops: 0002 [1] SMP
> CPU 0
> Modules linked in: cfi_probe gen_probe pnc2000 mtd chipreg map_funcs hidp l2cap bluetooth snd_via82xx snd_ac97_codec ac97_bus snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq snd_pcm_oss snd_mixer_oss snd_pcm snd_timer snd_page_alloc snd_mpu401_uart parport_pc ohci1394 parport snd_rawmidi ieee1394 snd_seq_device shpchp snd soundcore pci_hotplug
> Pid: 4027, comm: modprobe Not tainted 2.6.23-git7 #11
> RIP: 0010:[<ffffffff8800a0b9>]  [<ffffffff8800a0b9>] :map_funcs:simple_map_write+0x54/0x82
> RSP: 0018:ffff81002ec9f828  EFLAGS: 00010206
> RAX: 00000000f0f0f0f0 RBX: 0000000000000008 RCX: 0000000000000000
> RDX: 0000000000000004 RSI: ffff81002ec9f878 RDI: ffff81002ec9f848
> RBP: ffff81002ec9f848 R08: 00000000bf000000 R09: ffffffff880e35a0
> R10: 0000000000000004 R11: 0000000000000002 R12: 0000000000000000
> R13: ffffffff880e35a0 R14: 0000000000000000 R15: ffff81002ec9fd68
> FS:  00002ac0707cf6f0(0000) GS:ffffffff806b4000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> CR2: 00000000bf000000 CR3: 000000002f5ea000 CR4: 00000000000006e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> Process modprobe (pid: 4027, threadinfo ffff81002ec9e000, task ffff81002ec269c0)
> Stack:  00000000f0f0f0f0 0000000000000000 0000000000000000 0000000000000000
>  ffff81002ec9fd28 ffffffff8810b5ce 00000000f0f0f0f0 0000000000000000
>  0000000000000000 0000000000000000 ffff81002ec9f898 0000000000000000
> Call Trace:
>  [<ffffffff8810b5ce>] :cfi_probe:cfi_probe_chip+0x17f/0x1379
>  [<ffffffff8026e3f7>] get_page_from_freelist+0x38b/0x4d4
>  [<ffffffff802503c6>] __lock_acquire+0x3ed/0x6af
>  [<ffffffff802503c6>] __lock_acquire+0x3ed/0x6af
>  [<ffffffff8024f8c1>] lock_release_holdtime+0x45/0x4a
>  [<ffffffff8022ca0d>] update_curr+0xf8/0x119
>  [<ffffffff8022cf95>] enqueue_entity+0x24a/0x279
>  [<ffffffff8024f8c1>] lock_release_holdtime+0x45/0x4a
>  [<ffffffff802503c6>] __lock_acquire+0x3ed/0x6af
>  [<ffffffff8024f8c1>] lock_release_holdtime+0x45/0x4a
>  [<ffffffff8050f046>] kprobe_flush_task+0x63/0xa9
>  [<ffffffff80232eec>] __mmdrop+0x87/0x90
>  [<ffffffff802503c6>] __lock_acquire+0x3ed/0x6af
>  [<ffffffff8024f8c1>] lock_release_holdtime+0x45/0x4a
>  [<ffffffff8022e29d>] __wake_up+0x43/0x50
>  [<ffffffff80244c75>] request_module+0x14b/0x162
>  [<ffffffff80235d98>] vprintk+0x2bd/0x2ff
>  [<ffffffff8810114f>] :gen_probe:mtd_do_chip_probe+0x7f/0x35c
>  [<ffffffff802503c6>] __lock_acquire+0x3ed/0x6af
>  [<ffffffff8024f8c1>] lock_release_holdtime+0x45/0x4a
>  [<ffffffff8050b906>] _spin_unlock+0x26/0x2a
>  [<ffffffff8810b44d>] :cfi_probe:cfi_probe+0x10/0x12
>  [<ffffffff880e0119>] :chipreg:do_map_probe+0x4a/0x66
>  [<ffffffff880ff03b>] :pnc2000:init_pnc2000+0x3b/0x6d
>  [<ffffffff80258af4>] sys_init_module+0x146c/0x15cd
>  [<ffffffff8800a000>] :map_funcs:simple_map_init+0x0/0x4b
>  [<ffffffff8020ef44>] syscall_trace_enter+0x95/0x99
>  [<ffffffff8020beec>] tracesys+0xdc/0xe1
>
>
> Code: 41 89 00 eb 24 83 fa 08 75 0d 4d 03 41 18 48 8b 45 e0 49 89
> RIP  [<ffffffff8800a0b9>] :map_funcs:simple_map_write+0x54/0x82
>  RSP <ffff81002ec9f828>
> CR2: 00000000bf000000
>

Possible reason :  it's iomem region is not be remaped.

I have reported this bug, but get no response.
http://lkml.org/lkml/2007/8/1/83

Regards
dave

>
> config file is attached.
>
> ---
> ~Randy
>
>
