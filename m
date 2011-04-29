Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFq29-0003ax-Av
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 15:55:10 +0000
Received: by wyb28 with SMTP id 28so3744181wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 08:55:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304073070-24526-3-git-send-email-bdefaria@adeneo-embedded.com>
References: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
	<1304073070-24526-3-git-send-email-bdefaria@adeneo-embedded.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 29 Apr 2011 21:24:47 +0530
Message-ID: <BANLkTikETiqOUYcyBDy8_JSpQq7Uh4OgEw@mail.gmail.com>
Subject: Re: [PATCH 2/3] omap : nand : fix omap2 module reinsertion
To: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: jjhiblot@adetelgroup.com, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 29, 2011 at 4:01 PM, Bryan DE FARIA
<bdefaria@adeneo-embedded.com> wrote:
> When the module is removed, a reinsertion will fail with a -16 error.
>
> Signed-off-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
> ---
> =A0drivers/mtd/nand/omap2.c | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index da9a351..eab51da 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1138,6 +1138,7 @@ static int omap_nand_remove(struct platform_device =
*pdev)
>
> =A0 =A0 =A0 =A0/* Release NAND device, its internal structures and partit=
ions */
> =A0 =A0 =A0 =A0nand_release(&info->mtd);
> + =A0 =A0 =A0 release_mem_region(info->phys_base, NAND_IO_SIZE);

I think using 'release_resource' would be better here. And you should
better do this after below 'iounmap' is done.

> =A0 =A0 =A0 =A0iounmap(info->nand.IO_ADDR_R);
> =A0 =A0 =A0 =A0kfree(&info->mtd);
> =A0 =A0 =A0 =A0return 0;
> --

--=20
Regards,
Vimal Singh
