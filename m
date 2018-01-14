Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eaiuA-0001Qo-A2
 for linux-mtd@lists.infradead.org; Sun, 14 Jan 2018 14:04:59 +0000
Date: Sun, 14 Jan 2018 15:04:35 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: onenand: samsung: remove incorrect __iomem annotation
Message-ID: <20180114150435.2b575f7e@bbrezillon>
In-Reply-To: <20180113165616.19992-1-christophe.jaillet@wanadoo.fr>
References: <20180113165616.19992-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 13 Jan 2018 17:56:16 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'page_buf' and 'oob_buf' are allocated with 'devm_kzalloc()' and should not
> have __iommem decoration.

	^ __iomem

No need to send a new version, I'll fix it when applying.

> 
> Remove these decorations and some useless casting.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mtd/onenand/samsung.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
> index dfdfb478ba35..2e9d076e445a 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -129,8 +129,8 @@ struct s3c_onenand {
>  	void __iomem	*base;
>  	void __iomem	*ahb_addr;
>  	int		bootram_command;
> -	void __iomem	*page_buf;
> -	void __iomem	*oob_buf;
> +	void		*page_buf;
> +	void		*oob_buf;
>  	unsigned int	(*mem_addr)(int fba, int fpa, int fsa);
>  	unsigned int	(*cmd_map)(unsigned int type, unsigned int val);
>  	void __iomem	*dma_addr;
> @@ -408,8 +408,8 @@ static int s3c_onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
>  	/*
>  	 * Emulate Two BufferRAMs and access with 4 bytes pointer
>  	 */
> -	m = (unsigned int *) onenand->page_buf;
> -	s = (unsigned int *) onenand->oob_buf;
> +	m = onenand->page_buf;
> +	s = onenand->oob_buf;
>  
>  	if (index) {
>  		m += (this->writesize >> 2);
> @@ -481,11 +481,11 @@ static unsigned char *s3c_get_bufferram(struct mtd_info *mtd, int area)
>  	unsigned char *p;
>  
>  	if (area == ONENAND_DATARAM) {
> -		p = (unsigned char *) onenand->page_buf;
> +		p = onenand->page_buf;
>  		if (index == 1)
>  			p += this->writesize;
>  	} else {
> -		p = (unsigned char *) onenand->oob_buf;
> +		p = onenand->oob_buf;
>  		if (index == 1)
>  			p += mtd->oobsize;
>  	}
