Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fijUO-0002tx-3R
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 16:51:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Jul 2018 18:51:30 +0200
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v8 1/3] mtd: rawnand: vf610_nfc: make use of ->exec_op()
In-Reply-To: <20180712235725.1dc96dea@bbrezillon>
References: <20180318155929.16561-1-stefan@agner.ch>
 <20180318155929.16561-2-stefan@agner.ch>
 <14d062b2c92a70f2b16e0837696e0ff2@agner.ch>
 <20180712234105.47ed95d1@bbrezillon> <20180712235725.1dc96dea@bbrezillon>
Message-ID: <b53809ffc18cef3a02f7f9be7e5f8bfe@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12.07.2018 23:57, Boris Brezillon wrote:
> On Thu, 12 Jul 2018 23:41:05 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> 
>> On Thu, 12 Jul 2018 22:57:37 +0200
>> Stefan Agner <stefan@agner.ch> wrote:
>>
>> > On 18.03.2018 16:59, Stefan Agner wrote:
>> > > This reworks the driver to make use of ->exec_op() callback. The
>> > > command sequencer of the VF610 NFC aligns well with the new ops
>> > > interface.
>> > >
>> > > The operations are translated to a NFC command code while filling
>> > > the necessary registers. Instead of using the special status and
>> > > read ID command codes (which require to read status/ID from
>> > > special registers instead of the regular data area) the driver
>> > > now now uses the main data buffer for all commands. This
>> > > simplifies the driver as no special casing is needed.
>> > >
>> > > For control data (status byte, id bytes and parameter page) the
>> > > driver needs to reverse byte order for little endian CPUs since
>> > > the controller seems to store the bytes in big endian order in
>> > > the data buffer.
>> > >
>> > > The current state seems to pass MTD tests on a Colibri VF61.
>> >
>> > It turns out that after around 50-200 boots this leads to a kernel
>> > lockup. Reverting this patch seems to help:
>> >
>> > [    4.327685] ubi0: default fastmap pool size: 50
>> > [    4.332709] ubi0: default fastmap WL pool size: 25
>> > [    4.338201] ubi0: attaching mtd3
>> > [    4.409501] random: fast init done
>> > [    4.615404] ubi0: attached by fastmap
>> > [    4.619563] ubi0: fastmap pool size: 50
>> > [    4.623631] ubi0: fastmap WL pool size: 25
>> > [    4.662871] ubi0: attached mtd3 (name "ubi", size 126 MiB)
>> > [    4.669108] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> > [    4.676681] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> > [    4.683852] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
>> > [    4.691528] ubi0: good PEBs: 1001, bad PEBs: 7, corrupted PEBs: 0
>> > [    4.698231] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
>> > [    4.706157] ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1281767328
>> > [    4.716037] ubi0: available PEBs: 0, total reserved PEBs: 1001, PEBs reserved for bad PEB handling: 13
>> > [    4.726666] ubi0: background thread "ubi_bgt0d" started, PID 60
>> > [    4.743297] rtc-ds1307 0-0068: setting system clock to 2001-01-01 00:06:44 UTC (978307604)
>> > [    4.756117] cfg80211: Loading compiled-in X.509 certificates for regulatory database
>> > [    4.777983] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>> > [    4.830932] hrtimer: interrupt took 30379848 ns
>> > [   12.135872] ALSA device list:
>> > [   12.555474]   No soundcards found.
>> > [   47.420730] INFO: rcu_sched self-detected stall on CPU
>> > [   47.446162]  0-...!: (2592 ticks this GP) idle=3c2/1/1073741826 softirq=70/70 fqs=0
>> > [   47.464623]   (t=2600 jiffies g=-242 c=-243 q=2)
>> > [   47.475431] rcu_sched kthread starved for 2600 jiffies! g4294967054 c4294967053 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x402 ->cpu=0
>> > [   47.489822] RCU grace-period kthread stack dump:
>> > [   47.497199] rcu_sched       I    0    10      2 0x00000000
>> > [   47.506163] Backtrace:
>> > [   47.514811] [<c0bd47a0>] (__schedule) from [<c0bd52f0>] (schedule+0x48/0xac)
>> > [   47.525962]  r10:c10b26d9 r9:c1005900 r8:c7cdd500 r7:c10088c8 r6:c7cdd500 r5:c4129ec4
>> > [   47.536345]  r4:ffffe000
>> > [   47.542663] [<c0bd52a8>] (schedule) from [<c0bda574>] (schedule_timeout+0xa0/0x564)
>> > [   47.553692]  r5:c4129ec4 r4:ffff932e
>> > [   47.563375] [<c0bda4d4>] (schedule_timeout) from [<c01a6eac>] (rcu_gp_kthread+0x670/0x189c)
>> > [   47.575609]  r10:c101ce78 r9:c101cbc0 r8:c1005900 r7:ffffe000 r6:00000402 r5:c101ce50
>> > [   47.585966]  r4:00000001
>> > [   47.592163] [<c01a683c>] (rcu_gp_kthread) from [<c0151448>] (kthread+0x154/0x16c)
>> > [   47.603068]  r7:c4128000
>> > [   47.608760] [<c01512f4>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
>> > [   47.619396] Exception stack(0xc4129fb0 to 0xc4129ff8)
>> > [   47.627264] 9fa0:                                     00000000 00000000 00000000 00000000
>> > [   47.638076] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> > [   47.648825] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> > [   47.658059]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c01512f4
>> > [   47.668567]  r4:c40f7100
>> > [   47.682794] NMI backtrace for cpu 0
>> > [   47.692049] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.0-rc4 #120
>> > [   47.701839] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
>> > [   47.710436] Backtrace:
>> > [   47.717705] [<c010e814>] (dump_backtrace) from [<c010eac4>] (show_stack+0x20/0x24)
>> > [   47.728904]  r7:00000000 r6:60000193 r5:00000000 r4:c10abff4
>> > [   47.738832] [<c010eaa4>] (show_stack) from [<c0bbd144>] (dump_stack+0xb4/0xec)
>> > [   47.750608] [<c0bbd090>] (dump_stack) from [<c0bc3ca0>] (nmi_cpu_backtrace+0x10c/0x120)
>> > [   47.762041]  r10:80000193 r9:c1008970 r8:c0c02be8 r7:00000000 r6:00000000 r5:00000000
>> > [   47.772442]  r4:c182d928 r3:b15a9cad
>> > [   47.778946] [<c0bc3b94>] (nmi_cpu_backtrace) from [<c0bc3d88>] (nmi_trigger_cpumask_backtrace+0xd4/0x128)
>> > [   47.791492]  r7:00000000 r6:c01105f4 r5:c100bef0 r4:00000000
>> > [   47.800780] [<c0bc3cb4>] (nmi_trigger_cpumask_backtrace) from [<c011146c>] (arch_trigger_cpumask_backtrace+0x1c/0x24)
>> > [   47.814575]  r9:c1008970 r8:00000240 r7:c0c02be4 r6:c10088f4 r5:c101cbc0 r4:c101cbc0
>> > [   47.826007] [<c0111450>] (arch_trigger_cpumask_backtrace) from [<c01adfd4>] (rcu_dump_cpu_stacks+0xb4/0xf4)
>> > [   47.839338] [<c01adf20>] (rcu_dump_cpu_stacks) from [<c01acc44>] (rcu_check_callbacks+0x7ec/0xaa4)
>> > [   47.851266]  r10:c1008e38 r9:c1008968 r8:c101cbc0 r7:06d21000 r6:c7ce2d00 r5:c0fc1d00
>> > [   47.861815]  r4:c101cbc0
>> > [   47.868917] [<c01ac458>] (rcu_check_callbacks) from [<c01b58f8>] (update_process_times+0x40/0x6c)
>> > [   47.881573]  r10:c10088ec r9:c7cde600 r8:c01cb8f4 r7:0000000b r6:00000000 r5:c4108000
>> > [   47.891955]  r4:ffffe000
>> > [   47.898511] [<c01b58b8>] (update_process_times) from [<c01cb68c>] (tick_sched_handle+0x64/0x68)
>> > [   47.910900]  r7:0000000b r6:09f63806 r5:c4103d38 r4:c7cdea98
>> > [   47.919562] [<c01cb628>] (tick_sched_handle) from [<c01cb960>] (tick_sched_timer+0x6c/0xd0)
>> > [   47.932061] [<c01cb8f4>] (tick_sched_timer) from [<c01b66e0>] (__hrtimer_run_queues+0x194/0x634)
>> > [   47.944036]  r7:c10416d4 r6:00000000 r5:c7cdea98 r4:c7cde660
>> > [   47.952849] [<c01b654c>] (__hrtimer_run_queues) from [<c01b7e70>] (hrtimer_interrupt+0x124/0x2ec)
>> > [   47.964708]  r10:c7cde740 r9:ffffffff r8:7fffffff r7:c7cde700 r6:00000003 r5:20000193
>> > [   47.975066]  r4:c7cde600
>> > [   47.980799] [<c01b7d4c>] (hrtimer_interrupt) from [<c087f068>] (gt_clockevent_interrupt+0x4c/0x68)
>> > [   47.992829]  r10:c10b26ac r9:00000010 r8:c1008e38 r7:c10088ec r6:c800c200 r5:c7ce3b00
>> > [   48.003230]  r4:00000001
>> > [   48.010306] [<c087f01c>] (gt_clockevent_interrupt) from [<c01970e8>] (handle_percpu_devid_irq+0xec/0x430)
>> > [   48.023497]  r7:c10088ec r6:c100905c r5:c40dc680 r4:c40c9a00
>> > [   48.032720] [<c0196ffc>] (handle_percpu_devid_irq) from [<c0191a68>] (generic_handle_irq+0x30/0x44)
>> > [   48.045102]  r10:c1041928 r9:c401a400 r8:00000001 r7:00000000 r6:c1008e38 r5:00000010
>> > [   48.055221]  r4:c0fc112c
>> > [   48.060592] [<c0191a38>] (generic_handle_irq) from [<c0191af0>] (__handle_domain_irq+0x74/0xf0)
>> > [   48.073419] [<c0191a7c>] (__handle_domain_irq) from [<c01023dc>] (gic_handle_irq+0x68/0xcc)
>> > [   48.084801]  r9:c4103d38 r8:c100905c r7:c8002100 r6:000003ff r5:000003eb r4:c800210c
>> > [   48.095734] [<c0102374>] (gic_handle_irq) from [<c0101a30>] (__irq_svc+0x70/0x98)
>> > [   48.106321] Exception stack(0xc4103d38 to 0xc4103d80)
>> > [   48.113845] 3d20:                                                       00000001 00000001
>> > [   48.124357] 3d40: 00000000 c4108000 c7ce2600 00000000 c102d7f8 c410e400 00000000 c0bd4a6c
>> > [   48.134917] 3d60: c4108000 c4103d9c 00000000 c4103d88 c0180a74 c0bdb778 20000013 ffffffff
>> > [   48.145628]  r10:c4108000 r9:c4102000 r8:00000000 r7:c4103d6c r6:ffffffff r5:20000013
>> > [   48.155699]  r4:c0bdb778
>> > [   48.163614] [<c0bdb740>] (_raw_spin_unlock_irq) from [<c015a310>] (finish_task_switch+0xbc/0x274)
>> > [   48.176306]  r5:00000000 r4:c7ce2600
>> > [   48.183676] [<c015a254>] (finish_task_switch) from [<c0bd4a6c>] (__schedule+0x2cc/0xad4)
>> > [   48.195315]  r10:c10b3ae0 r9:c102d7f8 r8:00000000 r7:c7ce2610 r6:c42a8000 r5:c4108000
>> > [   48.205648]  r4:c7ce2600
>> > [   48.210929] [<c0bd47a0>] (__schedule) from [<c0bd528c>] (preempt_schedule_common+0x18/0x34)
>> > [   48.222162]  r10:c10b7d00 r9:c40dd3c0 r8:c02a7900 r7:c1008f84 r6:ffffff9c r5:006000c0
>> > [   48.232651]  r4:ffffe000
>> > [   48.237849] [<c0bd5274>] (preempt_schedule_common) from [<c0bd54bc>] (_cond_resched+0x50/0x58)
>> > [   48.249555]  r5:006000c0 r4:00000001
>> > [   48.257127] [<c0bd546c>] (_cond_resched) from [<c028f728>] (kmem_cache_alloc+0x1f0/0x31c)
>> > [   48.268169]  r5:006000c0 r4:006000c0
>> > [   48.275478] [<c028f538>] (kmem_cache_alloc) from [<c02a7900>] (getname_flags+0x30/0x160)
>> > [   48.286767]  r10:c10b7d00 r9:00000000 r8:00000000 r7:c1008f84 r6:ffffff9c r5:c0e0560c
>> > [   48.297226]  r4:00000002
>> > [   48.302911] [<c02a78d0>] (getname_flags) from [<c02a7a50>] (getname+0x20/0x24)
>> > [   48.313300]  r10:c10b7d00 r9:c10088ec r8:c0f7c85c r7:00000000 r6:ffffff9c r5:c10088c8
>> > [   48.323768]  r4:00000002 r3:00000002
>> > [   48.330039] [<c02a7a30>] (getname) from [<c029854c>] (do_sys_open+0xfc/0x21c)
>> > [   48.341558] [<c0298450>] (do_sys_open) from [<c0f01878>] (kernel_init_freeable+0x3a4/0x460)
>> > [   48.352809]  r10:c10b7d00 r9:c10088ec r8:c0f7c85c r7:c10b7d00 r6:c10b3900 r5:c0fb7140
>> > [   48.363206]  r4:00000008
>> > [   48.370025] [<c0f014d4>] (kernel_init_freeable) from [<c0bd2704>] (kernel_init+0x18/0x128)
>> > [   48.381584]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0bd26ec
>> > [   48.392130]  r4:00000000
>> > [   48.397585] [<c0bd26ec>] (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
>> > [   48.407874] Exception stack(0xc4103fb0 to 0xc4103ff8)
>> > [   48.415229] 3fa0:                                     00000000 00000000 00000000 00000000
>> > [   48.425675] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> > [   48.436255] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> > [   48.445286]  r5:c0bd26ec r4:00000000
>> >
>> >
>> > Still need to investigate further, but if anybody has an idea/spot can
>> > spot the potential problem, I am all ears :-)
>>
>> Probably a problem related to IRQs. Add a trace in you interrupt
>> handler to print the status. Maybe one of the IRQ is not properly
>> cleared/masked.
> 
> Try to clear WERREN, DONEEN and IDLEEN at probe time. Only enable them
> when you are actually waiting for such events and disable them as soon
> as you're done waiting (after a timeout or when you received the
> event you were waiting for in the interrupt handler). Also, in your
> interrupt handler, you only clear IDLE_EN. You should probably clear
> all other events you might have received. And of course,
> vf610_nfc_clear_status() should be called before setting IDLE_EN in
> vf610_nfc_done(), otherwise the completion might be triggered on one
> of the previous event instead of the one you are waiting for.

Thanks for all those hints!

I looked into the interrupt enable/clear story already in the past, and
it really is not ideal... However, I know that U-Boots driver is almost
the same, hence WERREN/DONEEN is not typically enabled. From current
code and with all those assumptions, In absence of any timeout and such
I really don't see how it could fail. Before ->exec_op() I used to make
100k's of boots with that driver and IRQ handling in stress testing
without issues...

During ->exec_op() rework nothing really changed in the IRQ handling
area, so it seems surprising to me that it suddenly causes issues. I
assume that the MTD subsystem still serializes all access to the
controller...?

Anyway, I will give this a try and let you know of my findings.

--
Stefan
