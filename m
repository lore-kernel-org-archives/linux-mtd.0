Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv9Az-0002HI-Mq
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 18:57:11 +0000
Received: by pdbnk13 with SMTP id nk13so78715813pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 11:56:48 -0700 (PDT)
Date: Wed, 20 May 2015 11:56:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Denys Vlasenko <dvlasenk@redhat.com>
Subject: Re: [PATCH] mtd: cfi: Deiline large functions
Message-ID: <20150520185641.GI11598@ld-irv-0074>
References: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Aaron Sierra <asierra@xes-inc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 18, 2015 at 12:58:40PM +0200, Denys Vlasenko wrote:
> With this .config: http://busybox.net/~vda/kernel_config,
> after uninlining these functions have sizes and callsite counts
> as follows:

Most of this is probably good, thanks. But I'm curious about one:

> cfi_udelay(): 74 bytes, 26 callsites

^^ This is pretty dead-simple. If it's generating bad code, we might
look at fixing it up instead. Almost all of its call sites are with
constant input, so it *should* just become:

	udelay(1);
	cond_resched();

in most cases. For the non-constant cases, we might still do an
out-of-line implementation. Or maybe we just say it's all not worth it,
and we just stick with what you have. But I'd like to consider
alternatives to out-lining this one.

Thanks,
Brian

> cfi_send_gen_cmd(): 153 bytes, 95 callsites
> cfi_build_cmd(): 274 bytes, 123 callsites
> cfi_build_cmd_addr(): 49 bytes, 15 callsites
> cfi_merge_status(): 230 bytes, 3 callsites
> 
> Reduction in code size is about 50,000:
> 
>     text     data      bss       dec     hex filename
> 85842882 22294584 20627456 128764922 7accbfa vmlinux.before
> 85789648 22294616 20627456 128711720 7abfc28 vmlinux
> 
> Signed-off-by: Denys Vlasenko <dvlasenk@redhat.com>
> CC: Dan Carpenter <dan.carpenter@oracle.com>
> CC: Jingoo Han <jg1.han@samsung.com>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: Aaron Sierra <asierra@xes-inc.com>
> CC: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> CC: David Woodhouse <David.Woodhouse@intel.com>
> CC: linux-mtd@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/mtd/chips/cfi_util.c | 188 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/cfi.h      | 188 ++-----------------------------------------
>  2 files changed, 196 insertions(+), 180 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> index 09c79bd..6f16552 100644
> --- a/drivers/mtd/chips/cfi_util.c
> +++ b/drivers/mtd/chips/cfi_util.c
> @@ -23,6 +23,194 @@
>  #include <linux/mtd/map.h>
>  #include <linux/mtd/cfi.h>
>  
> +void cfi_udelay(int us)
> +{
> +	if (us >= 1000) {
> +		msleep((us+999)/1000);
> +	} else {
> +		udelay(us);
> +		cond_resched();
> +	}
> +}
> +EXPORT_SYMBOL(cfi_udelay);
> +
> +/*
> + * Returns the command address according to the given geometry.
> + */
> +uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs,
> +				struct map_info *map, struct cfi_private *cfi)
> +{
> +	unsigned bankwidth = map_bankwidth(map);
> +	unsigned interleave = cfi_interleave(cfi);
> +	unsigned type = cfi->device_type;
> +	uint32_t addr;
> +
> +	addr = (cmd_ofs * type) * interleave;
> +
> +	/* Modify the unlock address if we are in compatibility mode.
> +	 * For 16bit devices on 8 bit busses
> +	 * and 32bit devices on 16 bit busses
> +	 * set the low bit of the alternating bit sequence of the address.
> +	 */
> +	if (((type * interleave) > bankwidth) && ((cmd_ofs & 0xff) == 0xaa))
> +		addr |= (type >> 1)*interleave;
> +
> +	return  addr;
> +}
> +EXPORT_SYMBOL(cfi_build_cmd_addr);
> +
> +/*
> + * Transforms the CFI command for the given geometry (bus width & interleave).
> + * It looks too long to be inline, but in the common case it should almost all
> + * get optimised away.
> + */
> +map_word cfi_build_cmd(u_long cmd, struct map_info *map, struct cfi_private *cfi)
> +{
> +	map_word val = { {0} };
> +	int wordwidth, words_per_bus, chip_mode, chips_per_word;
> +	unsigned long onecmd;
> +	int i;
> +
> +	/* We do it this way to give the compiler a fighting chance
> +	   of optimising away all the crap for 'bankwidth' larger than
> +	   an unsigned long, in the common case where that support is
> +	   disabled */
> +	if (map_bankwidth_is_large(map)) {
> +		wordwidth = sizeof(unsigned long);
> +		words_per_bus = (map_bankwidth(map)) / wordwidth; // i.e. normally 1
> +	} else {
> +		wordwidth = map_bankwidth(map);
> +		words_per_bus = 1;
> +	}
> +
> +	chip_mode = map_bankwidth(map) / cfi_interleave(cfi);
> +	chips_per_word = wordwidth * cfi_interleave(cfi) / map_bankwidth(map);
> +
> +	/* First, determine what the bit-pattern should be for a single
> +	   device, according to chip mode and endianness... */
> +	switch (chip_mode) {
> +	default: BUG();
> +	case 1:
> +		onecmd = cmd;
> +		break;
> +	case 2:
> +		onecmd = cpu_to_cfi16(map, cmd);
> +		break;
> +	case 4:
> +		onecmd = cpu_to_cfi32(map, cmd);
> +		break;
> +	}
> +
> +	/* Now replicate it across the size of an unsigned long, or
> +	   just to the bus width as appropriate */
> +	switch (chips_per_word) {
> +	default: BUG();
> +#if BITS_PER_LONG >= 64
> +	case 8:
> +		onecmd |= (onecmd << (chip_mode * 32));
> +#endif
> +	case 4:
> +		onecmd |= (onecmd << (chip_mode * 16));
> +	case 2:
> +		onecmd |= (onecmd << (chip_mode * 8));
> +	case 1:
> +		;
> +	}
> +
> +	/* And finally, for the multi-word case, replicate it
> +	   in all words in the structure */
> +	for (i=0; i < words_per_bus; i++) {
> +		val.x[i] = onecmd;
> +	}
> +
> +	return val;
> +}
> +EXPORT_SYMBOL(cfi_build_cmd);
> +
> +unsigned long cfi_merge_status(map_word val, struct map_info *map,
> +					   struct cfi_private *cfi)
> +{
> +	int wordwidth, words_per_bus, chip_mode, chips_per_word;
> +	unsigned long onestat, res = 0;
> +	int i;
> +
> +	/* We do it this way to give the compiler a fighting chance
> +	   of optimising away all the crap for 'bankwidth' larger than
> +	   an unsigned long, in the common case where that support is
> +	   disabled */
> +	if (map_bankwidth_is_large(map)) {
> +		wordwidth = sizeof(unsigned long);
> +		words_per_bus = (map_bankwidth(map)) / wordwidth; // i.e. normally 1
> +	} else {
> +		wordwidth = map_bankwidth(map);
> +		words_per_bus = 1;
> +	}
> +
> +	chip_mode = map_bankwidth(map) / cfi_interleave(cfi);
> +	chips_per_word = wordwidth * cfi_interleave(cfi) / map_bankwidth(map);
> +
> +	onestat = val.x[0];
> +	/* Or all status words together */
> +	for (i=1; i < words_per_bus; i++) {
> +		onestat |= val.x[i];
> +	}
> +
> +	res = onestat;
> +	switch(chips_per_word) {
> +	default: BUG();
> +#if BITS_PER_LONG >= 64
> +	case 8:
> +		res |= (onestat >> (chip_mode * 32));
> +#endif
> +	case 4:
> +		res |= (onestat >> (chip_mode * 16));
> +	case 2:
> +		res |= (onestat >> (chip_mode * 8));
> +	case 1:
> +		;
> +	}
> +
> +	/* Last, determine what the bit-pattern should be for a single
> +	   device, according to chip mode and endianness... */
> +	switch (chip_mode) {
> +	case 1:
> +		break;
> +	case 2:
> +		res = cfi16_to_cpu(map, res);
> +		break;
> +	case 4:
> +		res = cfi32_to_cpu(map, res);
> +		break;
> +	default: BUG();
> +	}
> +	return res;
> +}
> +EXPORT_SYMBOL(cfi_merge_status);
> +
> +/*
> + * Sends a CFI command to a bank of flash for the given geometry.
> + *
> + * Returns the offset in flash where the command was written.
> + * If prev_val is non-null, it will be set to the value at the command address,
> + * before the command was written.
> + */
> +uint32_t cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t base,
> +				struct map_info *map, struct cfi_private *cfi,
> +				int type, map_word *prev_val)
> +{
> +	map_word val;
> +	uint32_t addr = base + cfi_build_cmd_addr(cmd_addr, map, cfi);
> +	val = cfi_build_cmd(cmd, map, cfi);
> +
> +	if (prev_val)
> +		*prev_val = map_read(map, addr);
> +
> +	map_write(map, val, addr);
> +
> +	return addr - base;
> +}
> +EXPORT_SYMBOL(cfi_send_gen_cmd);
> +
>  int __xipram cfi_qry_present(struct map_info *map, __u32 base,
>  			     struct cfi_private *cfi)
>  {
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index 299d7d3..9b57a9b 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -296,183 +296,19 @@ struct cfi_private {
>  	struct flchip chips[0];  /* per-chip data structure for each chip */
>  };
>  
> -/*
> - * Returns the command address according to the given geometry.
> - */
> -static inline uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs,
> -				struct map_info *map, struct cfi_private *cfi)
> -{
> -	unsigned bankwidth = map_bankwidth(map);
> -	unsigned interleave = cfi_interleave(cfi);
> -	unsigned type = cfi->device_type;
> -	uint32_t addr;
> -	
> -	addr = (cmd_ofs * type) * interleave;
> -
> -	/* Modify the unlock address if we are in compatibility mode.
> -	 * For 16bit devices on 8 bit busses
> -	 * and 32bit devices on 16 bit busses
> -	 * set the low bit of the alternating bit sequence of the address.
> -	 */
> -	if (((type * interleave) > bankwidth) && ((cmd_ofs & 0xff) == 0xaa))
> -		addr |= (type >> 1)*interleave;
> -
> -	return  addr;
> -}
> -
> -/*
> - * Transforms the CFI command for the given geometry (bus width & interleave).
> - * It looks too long to be inline, but in the common case it should almost all
> - * get optimised away.
> - */
> -static inline map_word cfi_build_cmd(u_long cmd, struct map_info *map, struct cfi_private *cfi)
> -{
> -	map_word val = { {0} };
> -	int wordwidth, words_per_bus, chip_mode, chips_per_word;
> -	unsigned long onecmd;
> -	int i;
> -
> -	/* We do it this way to give the compiler a fighting chance
> -	   of optimising away all the crap for 'bankwidth' larger than
> -	   an unsigned long, in the common case where that support is
> -	   disabled */
> -	if (map_bankwidth_is_large(map)) {
> -		wordwidth = sizeof(unsigned long);
> -		words_per_bus = (map_bankwidth(map)) / wordwidth; // i.e. normally 1
> -	} else {
> -		wordwidth = map_bankwidth(map);
> -		words_per_bus = 1;
> -	}
> -
> -	chip_mode = map_bankwidth(map) / cfi_interleave(cfi);
> -	chips_per_word = wordwidth * cfi_interleave(cfi) / map_bankwidth(map);
> -
> -	/* First, determine what the bit-pattern should be for a single
> -	   device, according to chip mode and endianness... */
> -	switch (chip_mode) {
> -	default: BUG();
> -	case 1:
> -		onecmd = cmd;
> -		break;
> -	case 2:
> -		onecmd = cpu_to_cfi16(map, cmd);
> -		break;
> -	case 4:
> -		onecmd = cpu_to_cfi32(map, cmd);
> -		break;
> -	}
> -
> -	/* Now replicate it across the size of an unsigned long, or
> -	   just to the bus width as appropriate */
> -	switch (chips_per_word) {
> -	default: BUG();
> -#if BITS_PER_LONG >= 64
> -	case 8:
> -		onecmd |= (onecmd << (chip_mode * 32));
> -#endif
> -	case 4:
> -		onecmd |= (onecmd << (chip_mode * 16));
> -	case 2:
> -		onecmd |= (onecmd << (chip_mode * 8));
> -	case 1:
> -		;
> -	}
> +uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs,
> +				struct map_info *map, struct cfi_private *cfi);
>  
> -	/* And finally, for the multi-word case, replicate it
> -	   in all words in the structure */
> -	for (i=0; i < words_per_bus; i++) {
> -		val.x[i] = onecmd;
> -	}
> -
> -	return val;
> -}
> +map_word cfi_build_cmd(u_long cmd, struct map_info *map, struct cfi_private *cfi);
>  #define CMD(x)  cfi_build_cmd((x), map, cfi)
>  
> -
> -static inline unsigned long cfi_merge_status(map_word val, struct map_info *map,
> -					   struct cfi_private *cfi)
> -{
> -	int wordwidth, words_per_bus, chip_mode, chips_per_word;
> -	unsigned long onestat, res = 0;
> -	int i;
> -
> -	/* We do it this way to give the compiler a fighting chance
> -	   of optimising away all the crap for 'bankwidth' larger than
> -	   an unsigned long, in the common case where that support is
> -	   disabled */
> -	if (map_bankwidth_is_large(map)) {
> -		wordwidth = sizeof(unsigned long);
> -		words_per_bus = (map_bankwidth(map)) / wordwidth; // i.e. normally 1
> -	} else {
> -		wordwidth = map_bankwidth(map);
> -		words_per_bus = 1;
> -	}
> -
> -	chip_mode = map_bankwidth(map) / cfi_interleave(cfi);
> -	chips_per_word = wordwidth * cfi_interleave(cfi) / map_bankwidth(map);
> -
> -	onestat = val.x[0];
> -	/* Or all status words together */
> -	for (i=1; i < words_per_bus; i++) {
> -		onestat |= val.x[i];
> -	}
> -
> -	res = onestat;
> -	switch(chips_per_word) {
> -	default: BUG();
> -#if BITS_PER_LONG >= 64
> -	case 8:
> -		res |= (onestat >> (chip_mode * 32));
> -#endif
> -	case 4:
> -		res |= (onestat >> (chip_mode * 16));
> -	case 2:
> -		res |= (onestat >> (chip_mode * 8));
> -	case 1:
> -		;
> -	}
> -
> -	/* Last, determine what the bit-pattern should be for a single
> -	   device, according to chip mode and endianness... */
> -	switch (chip_mode) {
> -	case 1:
> -		break;
> -	case 2:
> -		res = cfi16_to_cpu(map, res);
> -		break;
> -	case 4:
> -		res = cfi32_to_cpu(map, res);
> -		break;
> -	default: BUG();
> -	}
> -	return res;
> -}
> -
> +unsigned long cfi_merge_status(map_word val, struct map_info *map,
> +					   struct cfi_private *cfi);
>  #define MERGESTATUS(x) cfi_merge_status((x), map, cfi)
>  
> -
> -/*
> - * Sends a CFI command to a bank of flash for the given geometry.
> - *
> - * Returns the offset in flash where the command was written.
> - * If prev_val is non-null, it will be set to the value at the command address,
> - * before the command was written.
> - */
> -static inline uint32_t cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t base,
> +uint32_t cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t base,
>  				struct map_info *map, struct cfi_private *cfi,
> -				int type, map_word *prev_val)
> -{
> -	map_word val;
> -	uint32_t addr = base + cfi_build_cmd_addr(cmd_addr, map, cfi);
> -	val = cfi_build_cmd(cmd, map, cfi);
> -
> -	if (prev_val)
> -		*prev_val = map_read(map, addr);
> -
> -	map_write(map, val, addr);
> -
> -	return addr - base;
> -}
> +				int type, map_word *prev_val);
>  
>  static inline uint8_t cfi_read_query(struct map_info *map, uint32_t addr)
>  {
> @@ -506,15 +342,7 @@ static inline uint16_t cfi_read_query16(struct map_info *map, uint32_t addr)
>  	}
>  }
>  
> -static inline void cfi_udelay(int us)
> -{
> -	if (us >= 1000) {
> -		msleep((us+999)/1000);
> -	} else {
> -		udelay(us);
> -		cond_resched();
> -	}
> -}
> +void cfi_udelay(int us);
>  
>  int __xipram cfi_qry_present(struct map_info *map, __u32 base,
>  			     struct cfi_private *cfi);
> -- 
> 1.8.1.4
> 
