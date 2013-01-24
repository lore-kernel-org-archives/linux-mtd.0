Received: from guitar.tcltek.co.il ([192.115.133.116] helo=sivan.tkos.co.il)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyIkl-0005by-1L
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 09:05:49 +0000
Date: Thu, 24 Jan 2013 11:05:47 +0200
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: physmap_of: fix cmdline partition method w/o
 linux,mtd-name
Message-ID: <20130124090547.GB7697@sapphire.tkos.co.il>
References: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il>
Cc: devicetree-discuss@lists.ozlabs.org,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi linux-mtd, Artem, David,

Ping?

It's been a month, and this is a simple uninitialized pointer dereference bug 
fix.

baruch

On Sun, Dec 23, 2012 at 01:10:50PM +0200, Baruch Siach wrote:
> Commit d68cbdd4fb (mtd: physmap_of: allow to specify the mtd name for retro
> compatiblity) broke cmdline partitioning using dev_name() in the kernel command
> line.  of_property_read_string() does not touch mtd_name when linux,mtd-name is
> not present in the device tree, which causes map.name to be set to a random
> value.  Fix this by initializing mtd_name to NULL.
> 
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/maps/physmap_of.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 37cdc20..6fb2bd8 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *dev)
>  	resource_size_t res_size;
>  	struct mtd_part_parser_data ppdata;
>  	bool map_indirect;
> -	const char *mtd_name;
> +	const char *mtd_name = NULL;
>  
>  	match = of_match_device(of_flash_match, &dev->dev);
>  	if (!match)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
