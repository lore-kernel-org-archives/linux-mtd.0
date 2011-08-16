Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtEfd-00081n-Bo
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 08:06:46 +0000
Received: by gxk2 with SMTP id 2so3891989gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 01:06:41 -0700 (PDT)
Subject: Re: UBI FS on 2MiB eraseblock Hynix MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Tue, 16 Aug 2011 11:08:20 +0300
In-Reply-To: <CAKa7sPSB+p6Zxk8uM9famKsg_Bhdv7=LirUimaV+Jti2aRRPZA@mail.gmail.com>
References: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
	<1313424117.8691.19.camel@sauron>
	<CAKa7sPSB+p6Zxk8uM9famKsg_Bhdv7=LirUimaV+Jti2aRRPZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313482105.5993.1.camel@sauron>
Mime-Version: 1.0
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2011-08-16 at 10:48 +0300, Viktar Palstsiuk wrote:
> The problem was caused by behavior of H27UBG8T2ATR Hynix MLC NAND
> while UBI FS was trying to do page write operation. UBI FS was trying
> to write data to the first empty page assuming that 0xFF page is
> erased and writable. But this type of NAND returns error on page write
> operation even if it was entirely written with 0xFF before. As far as
> I'm using U-boot's 'nand write' to flash UBI image I've added skip if
> U-boot trying to write 0xFF-page.
> 
> --- drivers/mtd/nand/nand_base.c
> +++ drivers/mtd/nand/nand_base.c	(working copy)
> @@ -1761,7 +1761,18 @@
>  			   const uint8_t *buf, int page, int cached, int raw)
>  {
>  	int status;
> +	int i;
> 
> +	/* Skip empty page */
> +	for (i = 0; i < mtd->writesize; i++)
> +                if (buf[i] != 0xFF)
> +                        break;
> +	
> +	if (i == mtd->writesize) {
> +		printf ("nand_write_page: Skip 0xFF page\n");
> +		return 0;
> +	}
> +	

This solution is not acceptable as we are currently discussing in the
"GPMI-NAND Status" thread in this mailing list.

Instead, you should just change u-boot, and I believe someone has done
this recently - ask the u-boot mailing list. I think that was Ben -
CCed.

The alternative is to use the new UBIFS "fixup" feature, see
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup

Additionally, here is my old writing about how the UBI flasher should
work, just FYI:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

> So it works fine now.

No, with this change if my data happens to be all 0xFFs - it will be unprotected
against bit flips.

BTW, I asumme you read this:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> index dcdb722..307edff 100644
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c
> @@ -390,7 +390,7 @@ static int validate_options(void)
>  		return err_msg("LEB should be multiple of min. I/O units");
>  	if (c->leb_size % 8)
>  		return err_msg("LEB size has to be multiple of 8");
> -	if (c->leb_size > 1024*1024)
> +	if (c->leb_size > 2*1024*1024)
>  		return err_msg("too large LEB size %d", c->leb_size);
>  	if (c->max_leb_cnt < UBIFS_MIN_LEB_CNT)
>  		return err_msg("too low max. count of LEBs, minimum is %d",
> diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
> index 453494d..a71d067 100644
> --- a/ubi-utils/ubinize.c
> +++ b/ubi-utils/ubinize.c
> @@ -253,7 +253,7 @@ static int parse_opt(int argc, char * const argv[])
>  	if (args.peb_size < 0)
>  		return errmsg("physical eraseblock size was not specified (use -h
> for help)");
> 
> -	if (args.peb_size > 1024*1024)
> +	if (args.peb_size > 2*1024*1024)
>  		return errmsg("too high physical eraseblock size %d", args.peb_size);
> 
>  	if (args.min_io_size < 0)

Please, introduce a nice macro like MAX_PEB_SIZE and use it instead

-- 
Best Regards,
Artem Bityutskiy
