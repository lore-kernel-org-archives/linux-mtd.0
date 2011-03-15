Received: from smtprelay01.ispgateway.de ([80.67.18.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PzPCa-00073R-Mz
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:02:01 +0000
Received: from [89.246.71.91] (helo=mail6.tqsc.de)
	by smtprelay01.ispgateway.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1PzPCW-0003xX-Do
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 09:01:56 +0100
Received: from sc0810201.tqsc.de ([192.168.80.70] helo=[127.0.0.1])
	by mail6.tqsc.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1PzPCX-0002js-2O
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 09:01:57 +0100
Message-ID: <4D7F1CF3.5010301@tqsc.de>
Date: Tue, 15 Mar 2011 09:01:55 +0100
From: Markus Niebel <list-09_linux_mtd@tqsc.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
References: <4D797E23.6070409@emcraft.com>
In-Reply-To: <4D797E23.6070409@emcraft.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: list-09_linux_mtd@tqsc.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ilya,

what type of chips are causing your problems?

AFAIK in cfi_cmdset_0002 the use of max timouts from cfi query struct is 
missing (support in the per chip struct is prepared). This should be 
done first (I think).

Regarding the handling of status bits you can use MERGESTATUS / 
cfi_merge_status (from linux/mtd/cfi.h)

Would it be useful to send rough patches for 2.6.34 for the max timout?

Markus

-

Am 11.03.2011 02:42, schrieb Ilya Yanok:
> Hello,
>
> current cfi_cmdset_0002.c code does not implement handling of error
> statuses reported by the chip during write/erase and just waits for a
> software timeout instead.
>
> We think that proper handling of these conditions could help us to debug
> the issue we have with the NOR flash and UBIFS so we'd like to implement
> such handling.
>
> I've tried to do this, please see my initial patch below. For now errors
> are just reported via pr_debug().
>
> I'd like to hear any comments. Am I doing things right or not? Maybe I'm
> missing something?
>
> Here is the patch:
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 156aaa6..804cfc9 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -507,6 +507,78 @@ static struct mtd_info *cfi_amdstd_setup(struct
> mtd_info *mtd)
> return NULL;
> }
>
> +static u32 get_chip_status(struct map_info *map, map_word val, int n)
> +{
> + struct cfi_private *cfi = map->fldrv_priv;
> + int wordwidth, words_per_bus, chip_mode, chips_per_word;
> + unsigned long onestat;
> + u32 res;
> +
> + BUG_ON(n >= cfi_interleave(cfi));
> +
> + if (map_bankwidth_is_large(map)) {
> + wordwidth = sizeof(unsigned long);
> + words_per_bus = (map_bankwidth(map)) / wordwidth; // i.e. normally 1
> + } else {
> + wordwidth = map_bankwidth(map);
> + words_per_bus = 1;
> + }
> +
> + chip_mode = map_bankwidth(map) / cfi_interleave(cfi);
> + chips_per_word = wordwidth * cfi_interleave(cfi) / map_bankwidth(map);
> +
> + onestat = val.x[n/chips_per_word];
> + onestat >>= chip_mode * 8 * (n % chips_per_word);
> +
> + res = (u32) onestat;
> +
> + /* Last, determine what the bit-pattern should be for a single
> + device, according to chip mode and endianness... */
> + switch (chip_mode) {
> + case 1:
> + break;
> + case 2:
> + res = cfi16_to_cpu(res);
> + break;
> + case 4:
> + res = cfi32_to_cpu(res);
> + break;
> + default: BUG();
> + }
> + return res;
> +}
> +
> +/*
> + * Chip statuses
> + */
> +#define CHIP_READY 0
> +#define CHIP_BUSY 1
> +#define CHIP_TIMEOUT 2
> +#define CHIP_ABORT 3
> +
> +static int check_chip(struct map_info *map, int n, map_word read_1,
> + map_word read_2, map_word read_3)
> +{
> + u32 r1 = get_chip_status(map, read_1, n);
> + u32 r2 = get_chip_status(map, read_2, n);
> + u32 r3 = get_chip_status(map, read_3, n);
> +
> + if ((r1 == r2) && (r2 == r3))
> + return CHIP_READY;
> +
> + if (r1 & (1 << 1)) {
> + pr_debug("Write abort on chip %d\n", n);
> + return CHIP_ABORT;
> + }
> +
> + if (r1 & (1 << 5)) {
> + pr_debug("Timeout on chip %d\n",n);
> + return CHIP_TIMEOUT;
> + }
> +
> + return CHIP_BUSY;
> +}
> +
> /*
> * Return true if the chip is ready.
> *
> @@ -520,12 +592,17 @@ static struct mtd_info *cfi_amdstd_setup(struct
> mtd_info *mtd)
> */
> static int __xipram chip_ready(struct map_info *map, unsigned long addr)
> {
> - map_word d, t;
> + struct cfi_private *cfi = map->fldrv_priv;
> + map_word r1, r2, r3;
> + int i, res = 0;
>
> - d = map_read(map, addr);
> - t = map_read(map, addr);
> + r1 = map_read(map, addr);
> + r2 = map_read(map, addr);
> + r3 = map_read(map, addr);
>
> - return map_word_equal(map, d, t);
> + for (i = 0; i < cfi_interleave(cfi); i++)
> + res += check_chip(map, i, r1, r2, r3);
> + return !res;
> }
>
> /*
>
> Thanks!
>
> Regards, Ilya.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
