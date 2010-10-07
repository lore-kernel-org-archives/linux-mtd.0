MIME-Version: 1.0
In-Reply-To: <1285063280-4057-10-git-send-email-manjugk@ti.com>
References: <1285063280-4057-1-git-send-email-manjugk@ti.com>
	<1285063280-4057-10-git-send-email-manjugk@ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 7 Oct 2010 23:09:49 +0530
Message-ID: <AANLkTikUpZ9FxPUoQE64hJcT31GiAC7868MPCr=Bm_0o@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] OMAP2/3: Convert write/read functions to raw
	read/write
To: "G, Manjunath Kondaiah" <manjugk@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 21, 2010 at 3:31 PM, G, Manjunath Kondaiah <manjugk@ti.com> wro=
te:
> Following sparse warnings exists due to use of writel/w and readl/w funct=
ions.
>
> This patch fixes the sparse warnings by converting readl/w functions usag=
e into
> __raw_readl/__raw_readw functions.
>
[...]
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -481,7 +481,7 @@ static int omap_verify_buf(struct mtd_info *mtd, cons=
t u_char * buf, int len)
>
> =A0 =A0 =A0 =A0len >>=3D 1;
> =A0 =A0 =A0 =A0while (len--) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (*p++ !=3D cpu_to_le16(readw(info->nand.=
IO_ADDR_R)))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (*p++ !=3D cpu_to_le16(__raw_readw(info-=
>nand.IO_ADDR_R)))

There was an old comment to remove use of 'cpu_to_le16' from driver, I
just missed it. Can you rather use 'ioread16_rep' for reading data.

--=20
Regards,
Vimal Singh
