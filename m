Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zlnc6-0003vV-5p
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 00:38:46 +0000
Received: by padhy16 with SMTP id hy16so2753734pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 17:38:25 -0700 (PDT)
Date: Mon, 12 Oct 2015 17:38:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for s25fl004k
Message-ID: <20151013003822.GT107187@google.com>
References: <1444131263-11295-1-git-send-email-sean.nyekjaer@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444131263-11295-1-git-send-email-sean.nyekjaer@prevas.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 06, 2015 at 01:34:23PM +0200, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f59aedf..25dc38d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -618,6 +618,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
>  	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
>  	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
> +	{ "s25fl004k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K) },

This doesn't apply to the latest l2-mtd.git / linux-next.git. See:

http://linux-mtd.infradead.org/source.html

Also, does this flash (like its family members) support dual and quad
mode? We have flags for that now.

Brian

>  	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K) },
>  	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
>  	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
> -- 
> 2.6.0
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
