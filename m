Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5XUP-0001CZ-AD
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 02:52:09 +0000
In-Reply-To: <20080608121020.GA13200@logfs.org>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: mtd_info->size again (lengthy)
MIME-Version: 1.0
Message-ID: <OF11291F86.B5413345-ON88257463.00023214-88257463.000FBA6F@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Sun, 8 Jun 2008 19:51:47 -0700
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel <joern@logfs.org> wrote on 06/08/2008 05:10:20 AM:

> On Sat, 7 June 2008 22:38:21 -0700, Bruce=5FLeonard@selinc.com wrote:
> >=20
> > But folks, I'm stuck.
>=20
> Sometimes the best answer comes in diff -u form, see below.
>=20
> This has been on my TODO list for a while.  Long-term we want to get rid

Jorn,

Thanks so much for the feedback.  I think I get what you're saying, but=20
let me paraphrase it back to make sure.  My approach should be to make a=20
new interface that is 64-bit clean, using one or more functions (I'm not=20
sure I should shove ALL the functions that exist in mtd=5Finfo into a singl=
e=20
submit=5Ffio(), but I don't know).  For my driver I should write the new=20
function(s) to be 64-bit clean and just use the new interface.  I can then =

change the core code that impacts my specific case to take advantage of=20
the new interface (being carefull to make sure I don't break the old=20
interface).  Existing drivers can continue to use the existing interface=20
but will eventually migrate to the new interface.  If they can't be made=20
64-bit clean for whatever reason, the new interface just becomes a wrapper =

to the old functions.  Sooner or later everything will be on the new=20
interface and the old one can be removed.  Does that sound about right?

Just a few questions about the details of your (admitidley un-compiled and =

un-tested :)  ) solution:

>=20
> +static int ram=5Fsubmit=5Ffio(struct mtd=5Finfo *mtd, struct fio *fio)
> +{

I gather fio is something that's to be filled in each time ram=5Fsubmit=5Ff=
io=20
is called rather than being a static thing in mtd=5Finfo?  Sort of like=20
struct mtd=5Foob=5Fops in the NAND layer gets filled in based on what's bei=
ng=20
called?

> +   int i, err =3D 0;
> +   u32 ofs;
> +   size=5Ft *retlen;
> +   const u=5Fchar *buf;
> +   struct fio=5Fvec *vec;
> +
> +   /* This driver cannot deal with device >32bit yet */
> +   if (fio->fi=5Fblockno * mtd->erasesize + fio->block=5Fofs + fio->fi=
=5Flen
> +         > 0xffffffff)
> +      return -EIO;
> +
> +   ofs =3D fio->fi=5Fblockno * mtd->erasesize + fio->block=5Fofs;
> +
> +   if (fio->fi=5Fcommand =3D=3D FI=5FERASE) {
> +      memset(mtd->priv + ofs, 0xff, fio->fi=5Flen);
> +      goto out;
> +   }
> +
> +   for (i =3D 0; i < fio->fi=5Fvcnt; i++) {
> +      vec =3D fio->fi=5Fio=5Fvec + i;
> +      buf =3D kmap=5Fatomic(vec->fv=5Fpage, KM=5FUSER0);
> +      switch (fio->fi=5Fcommand) {
> +      case FI=5FREAD:
> +         err =3D ram=5Fread(mtd, ofs, vec->fv=5Flen, &retlen,
> +               buf + vec->fv=5Foffset);

I'm not famliar enough with block I/O to know what advantages or=20
disadvantages is has, but since all the upper layers already allocate a=20
buffer for putting date into or taking data out of, wouldn't it make more=20
sense/be simpler to just keep using it?  For example, mtd=5Fread() in=20
mtdchar.c does a kmalloc to get a buffer that is then passed to=20
mtd->read().  Wouldn't it be simpler to just keep using that rather than=20
switching to struct page?  Or is there something that I'm missing that=20
struct page brings to the game?

> +         break;
> +      case FI=5FWRITE:
> +         err =3D ram=5Fwrite(mtd, ofs, vec->fv=5Flen, &retlen,
> +               buf + vec->fv=5Foffset);
> +      default:
> +         BUG();
> +      }
> +      kunmap=5Fatomic(buf, KM=5FUSER0);
> +      ofs +=3D vec->fv=5Flen;
> +      if (err)
> +         goto out;
> +   }
> +out:
> +   fio->fi=5Fend=5Fio(fio, err);

Not sure I follow the logic of the typedef here and what it is you're=20
trying to accomplish.

<snip>

> +
> +typedef void (fio=5Fend=5Fio=5Ft) (struct fio *, int);
> +/*

<snip>

>  struct mtd=5Finfo {
>     u=5Fchar type;
>     u=5Fint32=5Ft flags;
> -   u=5Fint32=5Ft size;    // Total size of the MTD
> +   /*
> +    * size is becoming redundant, as it can be calculated from
> +    * no=5Feraseblocks * erasesize.  There is a fair chance it will die
> +    * in the near future.  For flashes with variable erase sizes,
> +    * no=5Feraseblocks signifies the "normal" size, so above calculation
> +    * remains valid.
> +    */

Which calculation are you refering to?

> +   u=5Fint64=5Ft size;    // Total size of the MTD
> +   u=5Fint64=5Ft no=5Feraseblocks;
>=20

In my original email I mentioned that I ran into a few problems makeing=20
size a 64-bit value.  Did you have any problems with it?

Thanks again for the feedback.  It's given me something I think I can sink =

my teeth into and finally make some progress.  At least I hope so :)

Bruce
