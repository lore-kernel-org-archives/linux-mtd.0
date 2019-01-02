Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1geiDQ-0006LP-Bs
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2019 15:13:53 +0000
Received: by mail-it1-x141.google.com with SMTP id p197so39035282itp.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jan 2019 07:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20190102143654.24362-1-bbrezillon@kernel.org>
In-Reply-To: <20190102143654.24362-1-bbrezillon@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jan 2019 16:13:39 +0100
Message-ID: <CAMRc=MdOSHShSaQ5zmhJeevp+XTnQo8188CjVHSimRJ+MnzYiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: Fix the check on nvmem_register() ret code
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Alban Bedel <albeu@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=C5=9Br., 2 sty 2019 o 15:37 Boris Brezillon <bbrezillon@kernel.org> napisa=
=C5=82(a):
>
> Commit 20167b70c894 ("nvmem: use EOPNOTSUPP instead of ENOSYS") changed
> the nvmem_register() ret code from ENOSYS to EOPNOTSUPP when
> CONFIG_NVMEM is not enabled, but the check in mtd_nvmem_add() was not
> adjusted accordingly.
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Alban Bedel <albeu@free.fr>
> Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nv=
mem API")
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> ---
>  drivers/mtd/mtdcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 21e3cdc04036..999b705769a8 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -522,7 +522,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>         mtd->nvmem =3D nvmem_register(&config);
>         if (IS_ERR(mtd->nvmem)) {
>                 /* Just ignore if there is no NVMEM support in the kernel=
 */
> -               if (PTR_ERR(mtd->nvmem) =3D=3D -ENOSYS) {
> +               if (PTR_ERR(mtd->nvmem) =3D=3D -EOPNOTSUPP) {
>                         mtd->nvmem =3D NULL;
>                 } else {
>                         dev_err(&mtd->dev, "Failed to register NVMEM devi=
ce\n");
> --
> 2.17.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
