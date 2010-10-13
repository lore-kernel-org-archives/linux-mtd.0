Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5sGh-0005zF-2A
	for linux-mtd@lists.infradead.org; Wed, 13 Oct 2010 03:44:48 +0000
Received: by yxf34 with SMTP id 34so434466yxf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 20:44:40 -0700 (PDT)
Sender: Grant Likely <glikely@secretlab.ca>
Date: Tue, 12 Oct 2010 21:44:37 -0600
From: Grant Likely <grant.likely@secretlab.ca>
To: Mingkai Hu <Mingkai.hu@freescale.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 5/5] mtd: m25p80: add support to parse the
	partitions by OF node
Message-ID: <20101013034437.GE7254@angua.secretlab.ca>
References: <1286878714-13090-1-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-2-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-3-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-4-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-5-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-6-git-send-email-Mingkai.hu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1286878714-13090-6-git-send-email-Mingkai.hu@freescale.com>
Cc: kumar.gala@freescale.com, david-b@pacbell.net, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net,
	tie-fei.zang@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 12, 2010 at 06:18:34PM +0800, Mingkai Hu wrote:
> Signed-off-by: Mingkai Hu <Mingkai.hu@freescale.com>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>

dwmw2: what are your thoughts on this one?

g.



> ---
> v4:
>  - Updated to latest kernel base(Linux 2.6.36-rc7).
>  - Made changes according to Grant's comments.
> 
>  drivers/mtd/devices/m25p80.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 6f512b5..9d20738 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -924,6 +924,11 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  			nr_parts = data->nr_parts;
>  		}
>  
> +		if (nr_parts <= 0 && spi->dev.of_node) {
> +			nr_parts = of_mtd_parse_partitions(&spi->dev,
> +					spi->dev.of_node, &parts);
> +		}
> +
>  		if (nr_parts > 0) {
>  			for (i = 0; i < nr_parts; i++) {
>  				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
> -- 
> 1.6.4
> 
> 
