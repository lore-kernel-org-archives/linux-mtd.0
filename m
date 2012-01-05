Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiwLK-00058X-4Y
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2012 23:03:30 +0000
Received: by wibhq15 with SMTP id hq15so936157wib.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Jan 2012 15:03:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1325506847-23470-3-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
 <1325506847-23470-3-git-send-email-dedekind1@gmail.com>
Date: Thu, 5 Jan 2012 15:03:26 -0800
Message-ID: <CAN8TOE9bgyf3Lvwh7CN--2c0qBrcRqnRRNJp6MWQQ9Y1Ddk2Cg@mail.gmail.com>
Subject: Re: [PATCH 02/17] mtd: do use mtd->point directly
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 2, 2012 at 4:20 AM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index c59d642..a01cdad 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -336,12 +336,11 @@ static int jffs2_block_check_erase(struct jffs2_sb_=
info *c, struct jffs2_erasebl
> =A0 =A0 =A0 =A0uint32_t ofs;
> =A0 =A0 =A0 =A0size_t retlen;
> =A0 =A0 =A0 =A0int ret =3D -EIO;

I think this initialization (ret =3D -EIO) was unnecessary in the first
place and certainly is unnecessary now. Remove it?

> + =A0 =A0 =A0 unsigned long *wordebuf;
>
> - =A0 =A0 =A0 if (c->mtd->point) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long *wordebuf;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mtd_point(c->mtd, jeb->offset, c->s=
ector_size, &retlen,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &ebuf, NULL=
);
> + =A0 =A0 =A0 ret =3D mtd_point(c->mtd, jeb->offset, c->sector_size, &ret=
len,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &ebuf, NULL);
> + =A0 =A0 =A0 if (ret !=3D -EOPNOTSUPP) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0D1(printk(KERN_DEBUG "MTD =
point failed %d\n", ret));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto do_flash_read;

Otherwise, looks OK.

Brian
