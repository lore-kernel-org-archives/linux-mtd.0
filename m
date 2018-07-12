Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdiez-0007KG-8X
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 20:58:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Thu, 12 Jul 2018 22:57:37 +0200
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v8 1/3] mtd: rawnand: vf610_nfc: make use of ->exec_op()
In-Reply-To: <20180318155929.16561-2-stefan@agner.ch>
References: <20180318155929.16561-1-stefan@agner.ch>
 <20180318155929.16561-2-stefan@agner.ch>
Message-ID: <14d062b2c92a70f2b16e0837696e0ff2@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18.03.2018 16:59, Stefan Agner wrote:
> This reworks the driver to make use of ->exec_op() callback. The
> command sequencer of the VF610 NFC aligns well with the new ops
> interface.
> 
> The operations are translated to a NFC command code while filling
> the necessary registers. Instead of using the special status and
> read ID command codes (which require to read status/ID from
> special registers instead of the regular data area) the driver
> now now uses the main data buffer for all commands. This
> simplifies the driver as no special casing is needed.
> 
> For control data (status byte, id bytes and parameter page) the
> driver needs to reverse byte order for little endian CPUs since
> the controller seems to store the bytes in big endian order in
> the data buffer.
> 
> The current state seems to pass MTD tests on a Colibri VF61.

It turns out that after around 50-200 boots this leads to a kernel
lockup. Reverting this patch seems to help:

[    4.327685] ubi0: default fastmap pool size: 50
[    4.332709] ubi0: default fastmap WL pool size: 25
[    4.338201] ubi0: attaching mtd3
[    4.409501] random: fast init done
[    4.615404] ubi0: attached by fastmap
[    4.619563] ubi0: fastmap pool size: 50
[    4.623631] ubi0: fastmap WL pool size: 25
[    4.662871] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[    4.669108] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    4.676681] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    4.683852] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    4.691528] ubi0: good PEBs: 1001, bad PEBs: 7, corrupted PEBs: 0
[    4.698231] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    4.706157] ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1281767328
[    4.716037] ubi0: available PEBs: 0, total reserved PEBs: 1001, PEBs reserved for bad PEB handling: 13
[    4.726666] ubi0: background thread "ubi_bgt0d" started, PID 60
[    4.743297] rtc-ds1307 0-0068: setting system clock to 2001-01-01 00:06:44 UTC (978307604)
[    4.756117] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    4.777983] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.830932] hrtimer: interrupt took 30379848 ns
[   12.135872] ALSA device list:
[   12.555474]   No soundcards found.
[   47.420730] INFO: rcu_sched self-detected stall on CPU
[   47.446162]  0-...!: (2592 ticks this GP) idle=3c2/1/1073741826 softirq=70/70 fqs=0 
[   47.464623]   (t=2600 jiffies g=-242 c=-243 q=2)
[   47.475431] rcu_sched kthread starved for 2600 jiffies! g4294967054 c4294967053 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x402 ->cpu=0
[   47.489822] RCU grace-period kthread stack dump:
[   47.497199] rcu_sched       I    0    10      2 0x00000000
[   47.506163] Backtrace: 
[   47.514811] [<c0bd47a0>] (__schedule) from [<c0bd52f0>] (schedule+0x48/0xac)
[   47.525962]  r10:c10b26d9 r9:c1005900 r8:c7cdd500 r7:c10088c8 r6:c7cdd500 r5:c4129ec4
[   47.536345]  r4:ffffe000
[   47.542663] [<c0bd52a8>] (schedule) from [<c0bda574>] (schedule_timeout+0xa0/0x564)
[   47.553692]  r5:c4129ec4 r4:ffff932e
[   47.563375] [<c0bda4d4>] (schedule_timeout) from [<c01a6eac>] (rcu_gp_kthread+0x670/0x189c)
[   47.575609]  r10:c101ce78 r9:c101cbc0 r8:c1005900 r7:ffffe000 r6:00000402 r5:c101ce50
[   47.585966]  r4:00000001
[   47.592163] [<c01a683c>] (rcu_gp_kthread) from [<c0151448>] (kthread+0x154/0x16c)
[   47.603068]  r7:c4128000
[   47.608760] [<c01512f4>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
[   47.619396] Exception stack(0xc4129fb0 to 0xc4129ff8)
[   47.627264] 9fa0:                                     00000000 00000000 00000000 00000000
[   47.638076] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   47.648825] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   47.658059]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c01512f4
[   47.668567]  r4:c40f7100
[   47.682794] NMI backtrace for cpu 0
[   47.692049] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.0-rc4 #120
[   47.701839] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[   47.710436] Backtrace: 
[   47.717705] [<c010e814>] (dump_backtrace) from [<c010eac4>] (show_stack+0x20/0x24)
[   47.728904]  r7:00000000 r6:60000193 r5:00000000 r4:c10abff4
[   47.738832] [<c010eaa4>] (show_stack) from [<c0bbd144>] (dump_stack+0xb4/0xec)
[   47.750608] [<c0bbd090>] (dump_stack) from [<c0bc3ca0>] (nmi_cpu_backtrace+0x10c/0x120)
[   47.762041]  r10:80000193 r9:c1008970 r8:c0c02be8 r7:00000000 r6:00000000 r5:00000000
[   47.772442]  r4:c182d928 r3:b15a9cad
[   47.778946] [<c0bc3b94>] (nmi_cpu_backtrace) from [<c0bc3d88>] (nmi_trigger_cpumask_backtrace+0xd4/0x128)
[   47.791492]  r7:00000000 r6:c01105f4 r5:c100bef0 r4:00000000
[   47.800780] [<c0bc3cb4>] (nmi_trigger_cpumask_backtrace) from [<c011146c>] (arch_trigger_cpumask_backtrace+0x1c/0x24)
[   47.814575]  r9:c1008970 r8:00000240 r7:c0c02be4 r6:c10088f4 r5:c101cbc0 r4:c101cbc0
[   47.826007] [<c0111450>] (arch_trigger_cpumask_backtrace) from [<c01adfd4>] (rcu_dump_cpu_stacks+0xb4/0xf4)
[   47.839338] [<c01adf20>] (rcu_dump_cpu_stacks) from [<c01acc44>] (rcu_check_callbacks+0x7ec/0xaa4)
[   47.851266]  r10:c1008e38 r9:c1008968 r8:c101cbc0 r7:06d21000 r6:c7ce2d00 r5:c0fc1d00
[   47.861815]  r4:c101cbc0
[   47.868917] [<c01ac458>] (rcu_check_callbacks) from [<c01b58f8>] (update_process_times+0x40/0x6c)
[   47.881573]  r10:c10088ec r9:c7cde600 r8:c01cb8f4 r7:0000000b r6:00000000 r5:c4108000
[   47.891955]  r4:ffffe000
[   47.898511] [<c01b58b8>] (update_process_times) from [<c01cb68c>] (tick_sched_handle+0x64/0x68)
[   47.910900]  r7:0000000b r6:09f63806 r5:c4103d38 r4:c7cdea98
[   47.919562] [<c01cb628>] (tick_sched_handle) from [<c01cb960>] (tick_sched_timer+0x6c/0xd0)
[   47.932061] [<c01cb8f4>] (tick_sched_timer) from [<c01b66e0>] (__hrtimer_run_queues+0x194/0x634)
[   47.944036]  r7:c10416d4 r6:00000000 r5:c7cdea98 r4:c7cde660
[   47.952849] [<c01b654c>] (__hrtimer_run_queues) from [<c01b7e70>] (hrtimer_interrupt+0x124/0x2ec)
[   47.964708]  r10:c7cde740 r9:ffffffff r8:7fffffff r7:c7cde700 r6:00000003 r5:20000193
[   47.975066]  r4:c7cde600
[   47.980799] [<c01b7d4c>] (hrtimer_interrupt) from [<c087f068>] (gt_clockevent_interrupt+0x4c/0x68)
[   47.992829]  r10:c10b26ac r9:00000010 r8:c1008e38 r7:c10088ec r6:c800c200 r5:c7ce3b00
[   48.003230]  r4:00000001
[   48.010306] [<c087f01c>] (gt_clockevent_interrupt) from [<c01970e8>] (handle_percpu_devid_irq+0xec/0x430)
[   48.023497]  r7:c10088ec r6:c100905c r5:c40dc680 r4:c40c9a00
[   48.032720] [<c0196ffc>] (handle_percpu_devid_irq) from [<c0191a68>] (generic_handle_irq+0x30/0x44)
[   48.045102]  r10:c1041928 r9:c401a400 r8:00000001 r7:00000000 r6:c1008e38 r5:00000010
[   48.055221]  r4:c0fc112c
[   48.060592] [<c0191a38>] (generic_handle_irq) from [<c0191af0>] (__handle_domain_irq+0x74/0xf0)
[   48.073419] [<c0191a7c>] (__handle_domain_irq) from [<c01023dc>] (gic_handle_irq+0x68/0xcc)
[   48.084801]  r9:c4103d38 r8:c100905c r7:c8002100 r6:000003ff r5:000003eb r4:c800210c
[   48.095734] [<c0102374>] (gic_handle_irq) from [<c0101a30>] (__irq_svc+0x70/0x98)
[   48.106321] Exception stack(0xc4103d38 to 0xc4103d80)
[   48.113845] 3d20:                                                       00000001 00000001
[   48.124357] 3d40: 00000000 c4108000 c7ce2600 00000000 c102d7f8 c410e400 00000000 c0bd4a6c
[   48.134917] 3d60: c4108000 c4103d9c 00000000 c4103d88 c0180a74 c0bdb778 20000013 ffffffff
[   48.145628]  r10:c4108000 r9:c4102000 r8:00000000 r7:c4103d6c r6:ffffffff r5:20000013
[   48.155699]  r4:c0bdb778
[   48.163614] [<c0bdb740>] (_raw_spin_unlock_irq) from [<c015a310>] (finish_task_switch+0xbc/0x274)
[   48.176306]  r5:00000000 r4:c7ce2600
[   48.183676] [<c015a254>] (finish_task_switch) from [<c0bd4a6c>] (__schedule+0x2cc/0xad4)
[   48.195315]  r10:c10b3ae0 r9:c102d7f8 r8:00000000 r7:c7ce2610 r6:c42a8000 r5:c4108000
[   48.205648]  r4:c7ce2600
[   48.210929] [<c0bd47a0>] (__schedule) from [<c0bd528c>] (preempt_schedule_common+0x18/0x34)
[   48.222162]  r10:c10b7d00 r9:c40dd3c0 r8:c02a7900 r7:c1008f84 r6:ffffff9c r5:006000c0
[   48.232651]  r4:ffffe000
[   48.237849] [<c0bd5274>] (preempt_schedule_common) from [<c0bd54bc>] (_cond_resched+0x50/0x58)
[   48.249555]  r5:006000c0 r4:00000001
[   48.257127] [<c0bd546c>] (_cond_resched) from [<c028f728>] (kmem_cache_alloc+0x1f0/0x31c)
[   48.268169]  r5:006000c0 r4:006000c0
[   48.275478] [<c028f538>] (kmem_cache_alloc) from [<c02a7900>] (getname_flags+0x30/0x160)
[   48.286767]  r10:c10b7d00 r9:00000000 r8:00000000 r7:c1008f84 r6:ffffff9c r5:c0e0560c
[   48.297226]  r4:00000002
[   48.302911] [<c02a78d0>] (getname_flags) from [<c02a7a50>] (getname+0x20/0x24)
[   48.313300]  r10:c10b7d00 r9:c10088ec r8:c0f7c85c r7:00000000 r6:ffffff9c r5:c10088c8
[   48.323768]  r4:00000002 r3:00000002
[   48.330039] [<c02a7a30>] (getname) from [<c029854c>] (do_sys_open+0xfc/0x21c)
[   48.341558] [<c0298450>] (do_sys_open) from [<c0f01878>] (kernel_init_freeable+0x3a4/0x460)
[   48.352809]  r10:c10b7d00 r9:c10088ec r8:c0f7c85c r7:c10b7d00 r6:c10b3900 r5:c0fb7140
[   48.363206]  r4:00000008
[   48.370025] [<c0f014d4>] (kernel_init_freeable) from [<c0bd2704>] (kernel_init+0x18/0x128)
[   48.381584]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0bd26ec
[   48.392130]  r4:00000000
[   48.397585] [<c0bd26ec>] (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
[   48.407874] Exception stack(0xc4103fb0 to 0xc4103ff8)
[   48.415229] 3fa0:                                     00000000 00000000 00000000 00000000
[   48.425675] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   48.436255] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   48.445286]  r5:c0bd26ec r4:00000000


Still need to investigate further, but if anybody has an idea/spot can
spot the potential problem, I am all ears :-)

--
Stefan

> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 423 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 411 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> index 5d7a1f8f580f..c027a3a6a005 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -74,6 +74,22 @@
>  #define RESET_CMD_CODE			0x4040
>  #define STATUS_READ_CMD_CODE		0x4068
>  
> +/* NFC_CMD2[CODE] controller cycle bit masks */
> +#define COMMAND_CMD_BYTE1		BIT(14)
> +#define COMMAND_CAR_BYTE1		BIT(13)
> +#define COMMAND_CAR_BYTE2		BIT(12)
> +#define COMMAND_RAR_BYTE1		BIT(11)
> +#define COMMAND_RAR_BYTE2		BIT(10)
> +#define COMMAND_RAR_BYTE3		BIT(9)
> +#define COMMAND_NADDR_BYTES(x)		GENMASK(13, 13 - (x) + 1)
> +#define COMMAND_WRITE_DATA		BIT(8)
> +#define COMMAND_CMD_BYTE2		BIT(7)
> +#define COMMAND_RB_HANDSHAKE		BIT(6)
> +#define COMMAND_READ_DATA		BIT(5)
> +#define COMMAND_CMD_BYTE3		BIT(4)
> +#define COMMAND_READ_STATUS		BIT(3)
> +#define COMMAND_READ_ID			BIT(2)
> +
>  /* NFC ECC mode define */
>  #define ECC_BYPASS			0
>  #define ECC_45_BYTE			6
> @@ -97,10 +113,13 @@
>  /* NFC_COL_ADDR Field */
>  #define COL_ADDR_MASK				0x0000FFFF
>  #define COL_ADDR_SHIFT				0
> +#define COL_ADDR(pos, val)			(((val) & 0xFF) << (8 * (pos)))
>  
>  /* NFC_ROW_ADDR Field */
>  #define ROW_ADDR_MASK				0x00FFFFFF
>  #define ROW_ADDR_SHIFT				0
> +#define ROW_ADDR(pos, val)			(((val) & 0xFF) << (8 * (pos)))
> +
>  #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
>  #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
>  #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
> @@ -165,6 +184,12 @@ struct vf610_nfc {
>  	enum vf610_nfc_variant variant;
>  	struct clk *clk;
>  	bool use_hw_ecc;
> +	/*
> +	 * Indicate that user data is accessed (full page/oob). This is
> +	 * useful to indicate the driver whether to swap byte endianness.
> +	 * See comments in vf610_nfc_rd_from_sram/vf610_nfc_wr_to_sram.
> +	 */
> +	bool data_access;
>  	u32 ecc_mode;
>  };
>  
> @@ -173,6 +198,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
>  	return container_of(mtd_to_nand(mtd), struct vf610_nfc, chip);
>  }
>  
> +static inline struct vf610_nfc *chip_to_nfc(struct nand_chip *chip)
> +{
> +	return container_of(chip, struct vf610_nfc, chip);
> +}
> +
>  static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
>  {
>  	return readl(nfc->regs + reg);
> @@ -214,6 +244,86 @@ static inline void vf610_nfc_memcpy(void *dst, const void __iomem *src,
>  	memcpy(dst, src, n);
>  }
>  
> +static inline bool vf610_nfc_kernel_is_little_endian(void)
> +{
> +#ifdef __LITTLE_ENDIAN
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
> +/**
> + * Read accessor for internal SRAM buffer
> + * @dst: destination address in regular memory
> + * @src: source address in SRAM buffer
> + * @len: bytes to copy
> + * @fix_endian: Fix endianness if required
> + *
> + * Use this accessor for the internal SRAM buffers. On the ARM
> + * Freescale Vybrid SoC it's known that the driver can treat
> + * the SRAM buffer as if it's memory. Other platform might need
> + * to treat the buffers differently.
> + *
> + * The controller stores bytes from the NAND chip internally in big
> + * endianness. On little endian platforms such as Vybrid this leads
> + * to reversed byte order.
> + * For performance reason (and earlier probably due to unawareness)
> + * the driver avoids correcting endianness where it has control over
> + * write and read side (e.g. page wise data access).
> + */
> +static inline void vf610_nfc_rd_from_sram(void *dst, const void __iomem *src,
> +					  size_t len, bool fix_endian)
> +{
> +	if (vf610_nfc_kernel_is_little_endian() && fix_endian) {
> +		unsigned int i;
> +
> +		for (i = 0; i < len; i += 4) {
> +			u32 val = be32_to_cpu(__raw_readl(src + i));
> +
> +			memcpy(dst + i, &val, min(sizeof(val), len - i));
> +		}
> +	} else {
> +		memcpy_fromio(dst, src, len);
> +	}
> +}
> +
> +/**
> + * Write accessor for internal SRAM buffer
> + * @dst: destination address in SRAM buffer
> + * @src: source address in regular memory
> + * @len: bytes to copy
> + * @fix_endian: Fix endianness if required
> + *
> + * Use this accessor for the internal SRAM buffers. On the ARM
> + * Freescale Vybrid SoC it's known that the driver can treat
> + * the SRAM buffer as if it's memory. Other platform might need
> + * to treat the buffers differently.
> + *
> + * The controller stores bytes from the NAND chip internally in big
> + * endianness. On little endian platforms such as Vybrid this leads
> + * to reversed byte order.
> + * For performance reason (and earlier probably due to unawareness)
> + * the driver avoids correcting endianness where it has control over
> + * write and read side (e.g. page wise data access).
> + */
> +static inline void vf610_nfc_wr_to_sram(void __iomem *dst, const void *src,
> +					size_t len, bool fix_endian)
> +{
> +	if (vf610_nfc_kernel_is_little_endian() && fix_endian) {
> +		unsigned int i;
> +
> +		for (i = 0; i < len; i += 4) {
> +			u32 val;
> +
> +			memcpy(&val, src + i, min(sizeof(val), len - i));
> +			__raw_writel(cpu_to_be32(val), dst + i);
> +		}
> +	} else {
> +		memcpy_toio(dst, src, len);
> +	}
> +}
> +
>  /* Clear flags for upcoming command */
>  static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
>  {
> @@ -489,6 +599,164 @@ static int vf610_nfc_dev_ready(struct mtd_info *mtd)
>  	return 1;
>  }
>  
> +static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
> +				 u32 cmd1, u32 cmd2, u32 trfr_sz)
> +{
> +	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
> +			    COL_ADDR_SHIFT, col);
> +
> +	vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +			    ROW_ADDR_SHIFT, row);
> +
> +	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, trfr_sz);
> +	vf610_nfc_write(nfc, NFC_FLASH_CMD1, cmd1);
> +	vf610_nfc_write(nfc, NFC_FLASH_CMD2, cmd2);
> +
> +	dev_dbg(nfc->dev,
> +		"col 0x%04x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, len %d\n",
> +		col, row, cmd1, cmd2, trfr_sz);
> +
> +	vf610_nfc_done(nfc);
> +}
> +
> +static inline const struct nand_op_instr *
> +vf610_get_next_instr(const struct nand_subop *subop, int *op_id)
> +{
> +	if (*op_id + 1 >= subop->ninstrs)
> +		return NULL;
> +
> +	(*op_id)++;
> +
> +	return &subop->instrs[*op_id];
> +}
> +
> +static int vf610_nfc_cmd(struct nand_chip *chip,
> +			 const struct nand_subop *subop)
> +{
> +	const struct nand_op_instr *instr;
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
> +	int op_id = -1, trfr_sz = 0, offset;
> +	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
> +	bool force8bit = false;
> +
> +	/*
> +	 * Some ops are optional, but the hardware requires the operations
> +	 * to be in this exact order.
> +	 * The op parser enforces the order and makes sure that there isn't
> +	 * a read and write element in a single operation.
> +	 */
> +	instr = vf610_get_next_instr(subop, &op_id);
> +	if (!instr)
> +		return -EINVAL;
> +
> +	if (instr && instr->type == NAND_OP_CMD_INSTR) {
> +		cmd2 |= instr->ctx.cmd.opcode << CMD_BYTE1_SHIFT;
> +		code |= COMMAND_CMD_BYTE1;
> +
> +		instr = vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type == NAND_OP_ADDR_INSTR) {
> +		int naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
> +		int i = nand_subop_get_addr_start_off(subop, op_id);
> +
> +		for (; i < naddrs; i++) {
> +			u8 val = instr->ctx.addr.addrs[i];
> +
> +			if (i < 2)
> +				col |= COL_ADDR(i, val);
> +			else
> +				row |= ROW_ADDR(i - 2, val);
> +		}
> +		code |= COMMAND_NADDR_BYTES(naddrs);
> +
> +		instr = vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
> +		trfr_sz = nand_subop_get_data_len(subop, op_id);
> +		offset = nand_subop_get_data_start_off(subop, op_id);
> +		force8bit = instr->ctx.data.force_8bit;
> +
> +		/*
> +		 * Don't fix endianness on page access for historical reasons.
> +		 * See comment in vf610_nfc_wr_to_sram
> +		 */
> +		vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + offset,
> +				     instr->ctx.data.buf.out + offset,
> +				     trfr_sz, !nfc->data_access);
> +		code |= COMMAND_WRITE_DATA;
> +
> +		instr = vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type == NAND_OP_CMD_INSTR) {
> +		cmd1 |= instr->ctx.cmd.opcode << CMD_BYTE2_SHIFT;
> +		code |= COMMAND_CMD_BYTE2;
> +
> +		instr = vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type == NAND_OP_WAITRDY_INSTR) {
> +		code |= COMMAND_RB_HANDSHAKE;
> +
> +		instr = vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
> +		trfr_sz = nand_subop_get_data_len(subop, op_id);
> +		offset = nand_subop_get_data_start_off(subop, op_id);
> +		force8bit = instr->ctx.data.force_8bit;
> +
> +		code |= COMMAND_READ_DATA;
> +	}
> +
> +	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
> +		vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
> +
> +	cmd2 |= code << CMD_CODE_SHIFT;
> +
> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
> +
> +	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
> +		/*
> +		 * Don't fix endianness on page access for historical reasons.
> +		 * See comment in vf610_nfc_rd_from_sram
> +		 */
> +		vf610_nfc_rd_from_sram(instr->ctx.data.buf.in + offset,
> +				       nfc->regs + NFC_MAIN_AREA(0) + offset,
> +				       trfr_sz, !nfc->data_access);
> +	}
> +
> +	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
> +		vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
> +
> +	return 0;
> +}
> +
> +static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
> +	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> +	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
> +	);
> +
> +static int vf610_nfc_exec_op(struct nand_chip *chip,
> +			     const struct nand_operation *op,
> +			     bool check_only)
> +{
> +	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op,
> +				      check_only);
> +}
> +
>  /*
>   * This function supports Vybrid only (MPC5125 would have full RB and four CS)
>   */
> @@ -526,9 +794,9 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
>  	if (!(ecc_status & ECC_STATUS_MASK))
>  		return ecc_count;
>  
> -	/* Read OOB without ECC unit enabled */
> -	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
> -	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
> +	nfc->data_access = true;
> +	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
> +	nfc->data_access = false;
>  
>  	/*
>  	 * On an erased page, bit count (including OOB) should be zero or
> @@ -539,15 +807,51 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
>  					   flips_threshold);
>  }
>  
> +static void vf610_nfc_fill_row(struct nand_chip *chip, int page, u32 *code,
> +			       u32 *row)
> +{
> +	*row = ROW_ADDR(0, page & 0xff) | ROW_ADDR(1, page >> 8);
> +	*code |= COMMAND_RAR_BYTE1 | COMMAND_RAR_BYTE2;
> +
> +	if (chip->options & NAND_ROW_ADDR_3) {
> +		*row |= ROW_ADDR(2, page >> 16);
> +		*code |= COMMAND_RAR_BYTE3;
> +	}
> +}
> +
>  static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  				uint8_t *buf, int oob_required, int page)
>  {
> -	int eccsize = chip->ecc.size;
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int trfr_sz = mtd->writesize + mtd->oobsize;
> +	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>  	int stat;
>  
> -	nand_read_page_op(chip, page, 0, buf, eccsize);
> +	cmd2 |= NAND_CMD_READ0 << CMD_BYTE1_SHIFT;
> +	code |= COMMAND_CMD_BYTE1 | COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2;
> +
> +	vf610_nfc_fill_row(chip, page, &code, &row);
> +
> +	cmd1 |= NAND_CMD_READSTART << CMD_BYTE2_SHIFT;
> +	code |= COMMAND_CMD_BYTE2 | COMMAND_RB_HANDSHAKE | COMMAND_READ_DATA;
> +
> +	cmd2 |= code << CMD_CODE_SHIFT;
> +
> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> +
> +	/*
> +	 * Don't fix endianness on page access for historical reasons.
> +	 * See comment in vf610_nfc_rd_from_sram
> +	 */
> +	vf610_nfc_rd_from_sram(buf, nfc->regs + NFC_MAIN_AREA(0),
> +			       mtd->writesize, false);
>  	if (oob_required)
> -		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +		vf610_nfc_rd_from_sram(chip->oob_poi,
> +				       nfc->regs + NFC_MAIN_AREA(0) +
> +						   mtd->writesize,
> +				       mtd->oobsize, false);
>  
>  	stat = vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
>  
> @@ -564,14 +868,103 @@ static int vf610_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  				const uint8_t *buf, int oob_required, int page)
>  {
>  	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int trfr_sz = mtd->writesize + mtd->oobsize;
> +	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
> +	u8 status;
> +	int ret;
>  
> -	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
> -	if (oob_required)
> -		vf610_nfc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	cmd2 |= NAND_CMD_SEQIN << CMD_BYTE1_SHIFT;
> +	code |= COMMAND_CMD_BYTE1 | COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2;
> +
> +	vf610_nfc_fill_row(chip, page, &code, &row);
> +
> +	cmd1 |= NAND_CMD_PAGEPROG << CMD_BYTE2_SHIFT;
> +	code |= COMMAND_CMD_BYTE2 | COMMAND_WRITE_DATA;
> +
> +	/*
> +	 * Don't fix endianness on page access for historical reasons.
> +	 * See comment in vf610_nfc_wr_to_sram
> +	 */
> +	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
> +			     mtd->writesize, false);
> +
> +	code |= COMMAND_RB_HANDSHAKE;
> +	cmd2 |= code << CMD_CODE_SHIFT;
> +
> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> +
> +	ret = nand_status_op(chip, &status);
> +	if (ret)
> +		return ret;
> +
> +	if (status & NAND_STATUS_FAIL)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int vf610_nfc_read_page_raw(struct mtd_info *mtd,
> +				   struct nand_chip *chip, u8 *buf,
> +				   int oob_required, int page)
> +{
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int ret;
> +
> +	nfc->data_access = true;
> +	ret = nand_read_page_raw(mtd, chip, buf, oob_required, page);
> +	nfc->data_access = false;
> +
> +	return ret;
> +}
> +
> +static int vf610_nfc_write_page_raw(struct mtd_info *mtd,
> +				    struct nand_chip *chip, const u8 *buf,
> +				    int oob_required, int page)
> +{
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int ret;
> +
> +	nfc->data_access = true;
> +	ret = nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
> +	if (!ret && oob_required)
> +		ret = nand_write_data_op(chip, chip->oob_poi, mtd->oobsize,
> +					 false);
> +	nfc->data_access = false;
> +
> +	if (ret)
> +		return ret;
> +
> +	return nand_prog_page_end_op(chip);
> +}
> +
> +static int vf610_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +			      int page)
> +{
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int ret;
> +
> +	nfc->data_access = true;
> +	ret = nand_read_oob_std(mtd, chip, page);
> +	nfc->data_access = false;
> +
> +	return ret;
> +}
> +
> +static int vf610_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +			       int page)
> +{
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int ret;
> +
> +	nfc->data_access = true;
> +	ret = nand_prog_page_begin_op(chip, page, mtd->writesize,
> +				      chip->oob_poi, mtd->oobsize);
> +	nfc->data_access = false;
>  
> -	/* Always write whole page including OOB due to HW ECC */
> -	nfc->use_hw_ecc = true;
> -	nfc->write_sz = mtd->writesize + mtd->oobsize;
> +	if (ret)
> +		return ret;
>  
>  	return nand_prog_page_end_op(chip);
>  }
> @@ -590,6 +983,7 @@ static void vf610_nfc_preinit_controller(struct vf610_nfc *nfc)
>  	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_BOOT_MODE_BIT);
>  	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_DMA_REQ_BIT);
>  	vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_FAST_FLASH_BIT);
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
>  
>  	/* Disable virtual pages, only one elementary transfer unit */
>  	vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG, CONFIG_PAGE_CNT_MASK,
> @@ -686,6 +1080,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  	chip->read_word = vf610_nfc_read_word;
>  	chip->read_buf = vf610_nfc_read_buf;
>  	chip->write_buf = vf610_nfc_write_buf;
> +	chip->exec_op = vf610_nfc_exec_op;
>  	chip->select_chip = vf610_nfc_select_chip;
>  	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
>  	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
> @@ -755,6 +1150,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  
>  		chip->ecc.read_page = vf610_nfc_read_page;
>  		chip->ecc.write_page = vf610_nfc_write_page;
> +		chip->ecc.read_page_raw = vf610_nfc_read_page_raw;
> +		chip->ecc.write_page_raw = vf610_nfc_write_page_raw;
> +		chip->ecc.read_oob = vf610_nfc_read_oob;
> +		chip->ecc.write_oob = vf610_nfc_write_oob;
>  
>  		chip->ecc.size = PAGE_2K;
>  	}
