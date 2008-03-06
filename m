Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXFZ1-0004Fo-LK
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 12:51:12 +0000
Subject: Re: UBI: question about ubi_leb_change
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10803060426l2b90f9e2n4a0cd3e0dd1c4d19@mail.gmail.com>
References: <bae050c10803060426l2b90f9e2n4a0cd3e0dd1c4d19@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Mar 2008 14:50:35 +0200
Message-Id: <1204807835.23706.38.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2008-03-06 at 20:26 +0800, Nancy wrote:
> Hi,
>     As I know, ubi_leb_change only accept a whole LEB data as one of
> its parameter.
Correct.

>     If file system modify a little data which in a old mapped LEB, it
> needs to read the whole old mapped LEB data in its buffer first, then
> do the little modification, finally deliver to ubi_leb_change?  Is
> that right?
This is what can be done. But file systems should not normally do this,
because it is inefficient. It is more efficient to do out-of-place
updates, which means writing data to somewhere else (a free LEB), and
treat the older data as obsolete. This is what JFFS2 and UBIFS do.

UBIFS does use the in-place update method you have described, but very
rarely. It uses it only when the FS is nearly full, and only as
last-resort method of updating the FS index, when out-of-place updates
are impossible.

>     when remove files, there's only inodes .....some file system meta
> data changed,
> but the real file data still exist which means the LEB still mapped.
> Then when you write new data to this very LEB( but contains only
> trash), maybe this time, your new data is a whole LEB size.  Still
> goes the process:  read the mapped LEB old data to buffer,  replace
> the old data with the new one in buffer, deliver to ubi_leb_change?
> Really like that?

If you have an LEB, and the contents of LEB is not needed, you should
just unmap it and write your new data. No need to read it.

>   If the answer is yes, in this situation, waste a
> whole block reading time. Maybe UBIFS does not do this.

Of course UBIFS does not do it - it would be slow if it did :-)

>      But FTL on UBI will face this problem.  And there's no suitable
> UBI API for that needs.
>      It need :  old_pnum =3D ubi_leb_unmap( ); but do not erase the mappe=
d PEB
>                   new_pnum =3D ubi_leb_map( );
>                   ubi_read_peb( old_pnum,.....)  just like
> ubi_read_leb  function
>                   ubi_srub_peb( old_pnum ,....)
>=20
> the write_cache in FTL layer only store changed data, when flush it to
> Nand flash
> it call " flush_write_cache" function
> void flush_write_cache(.......){
>          fill_write_cache(......);
>         ubi_leb_change(......);
>         .....
> }
> fill_write_cache() will call ubi_read_peb() to fill write_cache with
> needed pages which come from the PEB(old_pnum)

I do not really get it what you meant. There are many ways to create an
FTL, and I do not know which one you choose. I suggested a simple one
here:
http://lists.infradead.org/pipermail/linux-mtd/2008-January/020381.html

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
