Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dYeIV-0005lz-Ao
 for linux-mtd@lists.infradead.org; Fri, 21 Jul 2017 20:13:17 +0000
Received: by mail-wr0-x242.google.com with SMTP id c24so9423307wra.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2017 13:12:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1496418222-23483-6-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-6-git-send-email-pali.rohar@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 21 Jul 2017 22:12:51 +0200
Message-ID: <CAFLxGvzg2+wv91HuJCK6Z0U865NvqY2q=e7mmJKOe3_MrQskhA@mail.gmail.com>
Subject: Re: [PATCH 5/5] ubi: Allow to use read-only UBI volume with not
 enough PEBs
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Pali,

On Fri, Jun 2, 2017 at 5:43 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> In read-only mode is skipped auto-resize. For pre-build images ready for
> auto-resize there can be reserved more PEBs as whole size of pre-build
> image. In read-only we do not do any write operation therefore this would
> allow to use read-only UBI volume which is not auto-resized yet.
>
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---
>  drivers/mtd/ubi/vtbl.c |   14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index 263743e..1d708c5 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -240,8 +240,10 @@ static int vtbl_check(const struct ubi_device *ubi,
>                 if (reserved_pebs > ubi->good_peb_count) {
>                         ubi_err(ubi, "too large reserved_pebs %d, good PE=
Bs %d",
>                                 reserved_pebs, ubi->good_peb_count);
> -                       err =3D 9;
> -                       goto bad;
> +                       if (!ubi->ro_mode) {
> +                               err =3D 9;
> +                               goto bad;
> +                       }

I fear this is not correct, it will disable a legit self-check of UBI volum=
es.
If the read-only volume is corrupted/truncated and you miss PEBs, this
check will no longer
trigger.

Especially when dealing with nanddumps, truncation is a common problem.

--=20
Thanks,
//richard
