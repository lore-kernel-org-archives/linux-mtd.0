Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbp63-0005OD-QB
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 07:22:05 +0000
Received: by vws8 with SMTP id 8so879410vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 00:22:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <20110608101804.GA5527@july>
References: <20110608101804.GA5527@july>
Date: Wed, 29 Jun 2011 16:22:01 +0900
Message-ID: <BANLkTi=MMEzE-neUzRqBYqvsGsup_s+VMw@mail.gmail.com>
Subject: Re: [PATCH] mtd: OneNAND: samsung: Write DMA support
From: Kyungmin Park <kmpark@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

There's missing patch, can you add l2-mtd tree?

Thank you,
Kyungmin Park

On Wed, Jun 8, 2011 at 7:18 PM, Kyungmin Park <kmpark@infradead.org> wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
>
> Implement the write DMA feature. It can reduce the CPU usage when write.
>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.=
c
> index 3306b5b..f24cb6f 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -712,6 +712,74 @@ normal:
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +static int s5pc110_write_bufferram(struct mtd_info *mtd, int area,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const unsigned char *buffer, int offset, si=
ze_t count)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 struct device *dev =3D &onenand->pdev->dev;
> + =A0 =A0 =A0 void __iomem *p;
> + =A0 =A0 =A0 void *buf =3D (void *) buffer;
> + =A0 =A0 =A0 dma_addr_t dma_src, dma_dst;
> + =A0 =A0 =A0 int err, ofs, page_dma =3D 0;
> +
> + =A0 =A0 =A0 p =3D this->base + area;
> + =A0 =A0 =A0 if (ONENAND_CURRENT_BUFFERRAM(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (area =3D=3D ONENAND_DATARAM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p +=3D this->writesize;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p +=3D mtd->oobsize;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (count !=3D mtd->writesize || offset & 3 || (size_t) buf=
 & 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto normal;
> +
> + =A0 =A0 =A0 /* Handle vmalloc address */
> + =A0 =A0 =A0 if (buf >=3D high_memory) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct page *page;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (((size_t) buf & PAGE_MASK) !=3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((size_t) (buf + count - 1) & PAGE_=
MASK))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto normal;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D vmalloc_to_page(buf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(!page))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto normal;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Page offset */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ofs =3D ((size_t) buf & ~PAGE_MASK);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page_dma =3D 1;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* DMA routine */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_src =3D dma_map_page(dev, page, ofs, co=
unt, DMA_TO_DEVICE);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_dst =3D onenand->phys_base + (p - this-=
>base);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* DMA routine */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_src =3D dma_map_single(dev, buf, count,=
 DMA_TO_DEVICE);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_dst =3D onenand->phys_base + (p - this-=
>base);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (dma_mapping_error(dev, dma_src)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Couldn't map a %d byte buffer=
 for DMA\n", count);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto normal;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 err =3D s5pc110_dma_ops((void *) dma_dst, (void *) dma_src,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count, S5PC110_DMA_DIR_WRIT=
E);
> +
> + =A0 =A0 =A0 if (page_dma)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_unmap_page(dev, dma_src, count, DMA_TO_=
DEVICE);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_unmap_single(dev, dma_src, count, DMA_T=
O_DEVICE);
> +
> + =A0 =A0 =A0 if (!err)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> +normal:
> + =A0 =A0 =A0 memcpy(p + offset, buffer, count);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> =A0static int s5pc110_chip_probe(struct mtd_info *mtd)
> =A0{
> =A0 =A0 =A0 =A0/* Now just return 0 */
> @@ -844,6 +912,7 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0} else if (onenand->type =3D=3D TYPE_S5PC110) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Use generic onenand functions */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->read_bufferram =3D s5pc110_read_buff=
erram;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_bufferram =3D s5pc110_write_buf=
ferram;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->chip_probe =3D s5pc110_chip_probe;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0} else {
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
