Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PC4Rk-000274-A2
	for linux-mtd@lists.infradead.org; Sat, 30 Oct 2010 05:57:45 +0000
Received: by wwb17 with SMTP id 17so3781599wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Oct 2010 22:57:41 -0700 (PDT)
Sender: Grant Likely <glikely@secretlab.ca>
Date: Sat, 30 Oct 2010 06:57:37 +0100
From: Grant Likely <grant.likely@secretlab.ca>
To: Andres Salomon <dilinger@queued.net>
Subject: Re: mtd: fix build error in m25p80.c
Message-ID: <20101030055737.GA2456@angua.secretlab.ca>
References: <20101029210419.70f99e96@queued.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20101029210419.70f99e96@queued.net>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
	Mingkai Hu <Mingkai.hu@freescale.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 29, 2010 at 09:04:19PM -0700, Andres Salomon wrote:
> 
> While building an x86 distro kernel, I hit the following:
> 
> Kernel: arch/x86/boot/bzImage is ready  (#7)
> ERROR: "of_mtd_parse_partitions" [drivers/mtd/devices/m25p80.ko]
> undefined!
> 
> of_mtd_parse_partitions is defined with MTD_OF_PARTS, and that's only
> built on PPC and microblaze.  The code in question should be wrapped w/
> a stricter #ifdef.
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>
> ---
>  drivers/mtd/devices/m25p80.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ea22520..184ddd5 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -924,7 +924,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  			nr_parts = data->nr_parts;
>  		}
>  
> -#ifdef CONFIG_OF
> +#ifdef CONFIG_MTD_OF_PARTS
>  		if (nr_parts <= 0 && spi->dev.of_node) {
>  			nr_parts = of_mtd_parse_partitions(&spi->dev,
>  					spi->dev.of_node, &parts);

True; but CONFIG_MTD_OF_PARTS should be built on all architectures
when CONFIG_OF & CONFIG_MTD_PARTITIONS is set.  I'll craft a patch.

g.
