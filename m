Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsdxS-00080d-HW
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 17:26:59 +0000
Received: by wera10 with SMTP id a10so1491776wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 01 Feb 2012 09:26:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1328100867.28171.88.camel@sauron.fi.intel.com>
References: <CALJbWeoznAvoSzdBp0Kunn+uxqB0XafrLmp7im=49ST340vSjw@mail.gmail.com>
 <CA+55aFzaErfoKG5KEyRMnjHS1=XbA7FNHRhF3J2iR8-m6PqtxQ@mail.gmail.com>
 <CALJbWep4pD69wP76Fcwupw0ppoztOpfHPnv7RvczW06Ko0E4YQ@mail.gmail.com>
 <CA+55aFyquFTUxgtHNRdz-rwha7H2bBocC6hw67a_g0FxG_=95Q@mail.gmail.com>
 <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
 <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
 <CAN8TOE9pJKD9aznYLDh2Se14og3nn-QHCvjQDXHQu2-dhbVavQ@mail.gmail.com>
 <CA+55aFwMinLTj4Jf5D-LHR73vfPLn4EUHooaBGSrsDdrRWsrrw@mail.gmail.com>
 <1328100867.28171.88.camel@sauron.fi.intel.com>
Date: Wed, 1 Feb 2012 22:56:55 +0530
Message-ID: <CALJbWepcYMmdiazhBMnF_izjjGVfABR0-ntfPUr07MuvuvCzmw@mail.gmail.com>
Subject: Re: [GIT PULL] logfs: bug fixes
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 1, 2012 at 6:24 PM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 1 Feb 2012 11:50:07 +0200
> Subject: [PATCH] mtd: fix merge conflict resolution breakage
>
> This patch fixes merge conflict resolution breakage introduced by merge
> commit 'd3712b9dfcf44ca145cf87e7f4096fa2d923471a'.
>
> The commit changed 'mtd_can_have_bb()' function and made it always return
> zero, which is incorrect. Instead, we need it to return whether the
> underlying flash device can have bad eraseblocks or not. UBI needs this
> information because it affects how it handles the underlying flash.
> E.g., if the underlying flash is NOR, it cannot have bad blocks and any
> write or erase error is fatal, and all we can do is to switch to R/O
> mode. We do not need to reserve a pool of good eraseblocks for bad
> eraseblocks handling, and so on.
>
> This patch also removes 'mtd_can_have_bb()' invocations from Logfs
> to ensure correct Logfs behavior.
>
> I've tested that with this patch UBI works on top of NOR and NAND
> flashes emulated by mtdram and nandsim correspondingly.
>
> This patch is based on patch from Linus Torvalds.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>


Acked-by: Prasad Joshi <prasadjoshi.linux@gmail.com>

> ---
>
> Linus, here is the emergency fix - basically your patch tested and
> and slightly modified. You should probably put yourself as the author.
>
> Also attached the patch for your convenience.
>
> =A0fs/logfs/dev_mtd.c =A0 =A0 =A0| =A0 =A06 ------
> =A0include/linux/mtd/mtd.h | =A0 =A02 +-
> =A02 files changed, 1 insertions(+), 7 deletions(-)
>
> diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
> index e97404d..9c50144 100644
> --- a/fs/logfs/dev_mtd.c
> +++ b/fs/logfs/dev_mtd.c
> @@ -152,9 +152,6 @@ static struct page *logfs_mtd_find_first_sb(struct su=
per_block *sb, u64 *ofs)
> =A0 =A0 =A0 =A0filler_t *filler =3D logfs_mtd_readpage;
> =A0 =A0 =A0 =A0struct mtd_info *mtd =3D super->s_mtd;
>
> - =A0 =A0 =A0 if (!mtd_can_have_bb(mtd))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> -
> =A0 =A0 =A0 =A0*ofs =3D 0;
> =A0 =A0 =A0 =A0while (mtd_block_isbad(mtd, *ofs)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*ofs +=3D mtd->erasesize;
> @@ -172,9 +169,6 @@ static struct page *logfs_mtd_find_last_sb(struct sup=
er_block *sb, u64 *ofs)
> =A0 =A0 =A0 =A0filler_t *filler =3D logfs_mtd_readpage;
> =A0 =A0 =A0 =A0struct mtd_info *mtd =3D super->s_mtd;
>
> - =A0 =A0 =A0 if (!mtd_can_have_bb(mtd))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> -
> =A0 =A0 =A0 =A0*ofs =3D mtd->size - mtd->erasesize;
> =A0 =A0 =A0 =A0while (mtd_block_isbad(mtd, *ofs)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*ofs -=3D mtd->erasesize;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index c09020a..d43dc25 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -487,7 +487,7 @@ static inline int mtd_has_oob(const struct mtd_info *=
mtd)
>
> =A0static inline int mtd_can_have_bb(const struct mtd_info *mtd)
> =A0{
> - =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 return !!mtd->block_isbad;
> =A0}
>
> =A0 =A0 =A0 =A0/* Kernel-side ioctl definitions */
> --
> 1.7.9
