Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8qjo-0004kN-WC
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 08:43:05 +0000
Received: by fxm15 with SMTP id 15so3566785fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 01:43:03 -0700 (PDT)
Subject: Re: [PATCH] mtd: Apply Numonyx Axcell P33/P30 workaround for
	Lock/Unlock bug.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Philippe De Muyter <phdm@macqel.be>
In-Reply-To: <1287498263-5561-1-git-send-email-phdm@macqel.be>
References: <1287498263-5561-1-git-send-email-phdm@macqel.be>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Oct 2010 11:39:58 +0300
Message-ID: <1287650398.2932.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-19 at 16:24 +0200, Philippe De Muyter wrote:
> Some flash chips have a small but annoying bug, documented in
>     "Numonyx Axcell P33/P30 256-Mbit Specification Update"
> 
>     It states :
>     When customer uses [...] block unlock, the block lock status might
>     be altered inadvertently. Lock status might be set to either 01h
>     or 03h unexpectedly (00h as expected data), which leads to
>     program/erase failure on certain blocks.
> 
>     A workaround is given, (summary : issue a "Read Lock Status" before
>     the "Lock" or "Unlock" command) which I have applied and tested
>     with success.
> 
> Signed-off-by: Philippe De Muyter <phdm@macqel.be>

Is this Numonyx-specific issue? Should there be some kind of "if
(numonyx)" statement?

May be Nicolas could validate the patch?

> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 9e2b7e9..0d0ae41 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2047,6 +2047,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
>  {
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
> +	int ofs_factor = cfi->interleave * cfi->device_type;
>  	int udelay;
>  	int ret;
>  
> @@ -2062,6 +2063,14 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
>  	ENABLE_VPP(map);
>  	xip_disable(map, chip, adr);
>  
> +	/*
> +	 * Issue a "Read Lock Status" before the "Lock" or "Unlock" :
> +	 * see errata "Numonyx Axcell P33/P30 Specification Update" :)
> +	 */
> +	map_write(map, CMD(0x90), adr+(2*ofs_factor));
> +	chip->state = FL_JEDEC_QUERY;
> +	cfi_read_query(map, adr+(2*ofs_factor));
> +
>  	map_write(map, CMD(0x60), adr);
>  	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
>  		map_write(map, CMD(0x01), adr);

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
