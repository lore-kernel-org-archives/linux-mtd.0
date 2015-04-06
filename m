Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YewPo-0007rs-FK
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 02:05:29 +0000
Received: by pdbni2 with SMTP id ni2so29748676pdb.1
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 19:05:06 -0700 (PDT)
Date: Sun, 5 Apr 2015 19:05:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: m25p80: bind to "nor-jedec" ID, for
 auto-detection
Message-ID: <20150406020500.GM2677@norris-Latitude-E6410>
References: <1427477390-24069-1-git-send-email-computersforpeace@gmail.com>
 <1427477390-24069-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1427477390-24069-2-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 27, 2015 at 10:29:50AM -0700, Brian Norris wrote:
> Use the new 'nor-jedec' binding to provide automatic detection of flash
> that use the 0x9F READ ID opcode. This can help for use cases where
> platforms just specify compatibility with "m25p80", and then see
> messages like this:
> 
>   m25p80 spi32766.0: found s25fl256s1, expected m25p80
> 
> Instead, they can just specify the generic string and see this:
> 
>   m25p80 spi32766.0: s25fl256s1 (32768 Kbytes)
> 
> Also, update the language about m25p_ids[] to straighten out the
> expectations here. We should no longer need to continuously grow the
> m25p_ids[] table, and in fact, we might want to start removing entries
> which are not used in device trees so far, so we can just default to
> auto-detection as much as possible in the future.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Rafał Miłecki <zajec5@gmail.com>
> ---
> v2: no change

Saw no comments last week, and this patch is blocking several other
trivial patches. See comments below.

> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 85e35467fba6..7c8b1694a134 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
[...]
> @@ -247,9 +249,16 @@ static int m25p_remove(struct spi_device *spi)
>  }
>  
>  /*
> - * XXX This needs to be kept in sync with spi_nor_ids.  We can't share
> - * it with spi-nor, because if this is built as a module then modpost
> - * won't be able to read it and add appropriate aliases.

People patching the spi-nor.c table are not heeding this comment. So
either I need to get them to all rework their patches, or else I can
pull this in to get this all straightened out.

Given I fixed up all the comments from v1 and saw no major objections on
v2 or my plan for cleaning up the DT ABI for this class of devices...

Applied this and the binding documentation change to l2-mtd.git.

Brian

> + * Do NOT add to this array without reading the following:
> + *
> + * Historically, many flash devices are bound to this driver by their name. But
> + * since most of these flash are compatible to some extent, and their
> + * differences can often be differentiated by the JEDEC read-ID command, we
> + * encourage new users to add support to the spi-nor library, and simply bind
> + * against a generic string here (e.g., "nor-jedec").
> + *
> + * Many flash names are kept here in this list (as well as in spi-nor.c) to
> + * keep them available as module aliases for existing platforms.
>   */
>  static const struct spi_device_id m25p_ids[] = {
>  	{"at25fs010"},	{"at25fs040"},	{"at25df041a"},	{"at25df321a"},
> @@ -291,6 +300,12 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"w25x64"},	{"w25q64"},	{"w25q80"},	{"w25q80bl"},
>  	{"w25q128"},	{"w25q256"},	{"cat25c11"},
>  	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
> +
> +	/*
> +	 * Generic support for SPI NOR that can be identified by the JEDEC READ
> +	 * ID opcode (0x9F). Use this, if possible.
> +	 */
> +	{"nor-jedec"},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
> -- 
> 1.9.1
> 
