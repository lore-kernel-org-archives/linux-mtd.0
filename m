Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJFwq-0004qK-H6
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2015 07:02:12 +0000
Received: by igbij6 with SMTP id ij6so41575050igb.1
 for <linux-mtd@lists.infradead.org>; Sun, 26 Jul 2015 00:01:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437835063-58407-2-git-send-email-eastyjr@gmail.com>
References: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
 <1437835063-58407-2-git-send-email-eastyjr@gmail.com>
Date: Sun, 26 Jul 2015 09:01:50 +0200
Message-ID: <CACna6rx0KNfh6Y7JVVF6-QnFne2aRyxcrnNK0_R4=JEF8zV+9Q@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] mtd: bcm47xxpart.c: NVRAM partition handling
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Joseph East <eastyjr@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 July 2015 at 16:37, Joseph East <eastyjr@gmail.com> wrote:
> ---

You didn't describe your change, you didn't signed off the patch.


>  drivers/mtd/bcm47xxpart.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index c0720c1..55a1462 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -95,6 +95,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>         int trx_part =3D -1;
>         int last_trx_part =3D -1;
>         int possible_nvram_sizes[] =3D { 0x8000, 0xF000, 0x10000, };
> +       bool found_nvram =3D false;
>
>         /*
>          * Some really old flashes (like AT45DB*) had smaller erasesize-s=
, but
> @@ -288,12 +289,23 @@ static int bcm47xxpart_parse(struct mtd_info *maste=
r,
>                 if (buf[0] =3D=3D NVRAM_HEADER) {
>                         bcm47xxpart_add_part(&parts[curr_part++], "nvram"=
,
>                                              master->size - blocksize, 0)=
;
> +                       found_nvram =3D true;
>                         break;
>                 }
>         }
>
>         kfree(buf);
>
> +       if (!found_nvram) {
> +               pr_warning("Cannot find a nvram partition, reserving last=
 two blocks\n");
> +               bcm47xxpart_add_part(&parts[curr_part++], "nvram_guess",
> +                                    master->size - blocksize * 2, MTD_WR=
ITEABLE);
> +               for (i =3D 0; i < curr_part; i++) {
> +                       if (parts[i].size + parts[i].offset =3D=3D master=
->size)
> +                               parts[i].offset -=3D blocksize * 2;
> +               }
> +       }
> +

I'm not asking "what for", because it should be in a commit message.
Waiting for it.

One problem I can see: it won't work well on devices with multiple
flashes. Is it expected for NVRAM to be located only on a one flash
memory.

--=20
Rafa=C5=82
