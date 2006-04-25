Received: from nz-out-0102.google.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYJi7-00078p-Mg
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 05:19:58 -0400
Received: by nz-out-0102.google.com with SMTP id 16so1050089nzp
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Apr 2006 02:19:54 -0700 (PDT)
Message-ID: <cda58cb80604250219k5d564aa5n5dde6c55add3bd9d@mail.gmail.com>
Date: Tue, 25 Apr 2006 11:19:54 +0200
From: "Franck Bui-Huu" <vagabon.xyz@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <cda58cb80604240740j62e51ecctb3ad75673b98445a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <cda58cb80604240740j62e51ecctb3ad75673b98445a@mail.gmail.com>
Cc: Franck <vagabon.xyz@gmail.com>, Nicolas Pitre <nico@cam.org>
Subject: Re: Reduce the size of a probed flash for broken HW
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2006/4/24, Franck Bui-Huu <vagabon.xyz@gmail.com>:
> [discussed with Vitaly Wool on IRC]
>
> My hardware has some problem to access my onboard flashes specially
> the last 64Ko of them. So I need a way to restrict access to these areas.
>
> Several solutions comes in mind:
>
>   - In the mapping driver, try to modify the mtd_info and cfi_info
>     setup by the MTD probing functions to reduce the detected
>     size. This solution is really hackish since it modifies internal
>     structures of the MTD layer that the mapping driver is not
>     supposed to be aware of. I just did this in my driver:
>
>         *mtd =3D do_map_probe("xxx_probe", map);
>         while ((*mtd)->size > 32Mo - 64Ko)
>                 (*mtd)->size -=3D (*mtd)->erasesize;
>
>     and it seems to work fine...
>
>   - Use a partition that exclude the last 64Ko of the flash. This
>     solution was suggested by Nicolas Pitre, but I think it imposes
>     some restrictions on flash concatenation for example.
>

in case someone is interested, here is the implementation of the first
and second solutions:

static struct mtd_info * __init fix_mtd_size(struct mtd_info *mtd)
{
#if 0
=09while (mtd->size > MAX_BANK_SIZE)
=09=09mtd->size -=3D mtd->erasesize;

=09return mtd;
#else
=09struct mtd_partition fixed_part;
=09struct mtd_info *fixed_mtd =3D NULL;

=09memset(&fixed_part, 0, sizeof (struct mtd_partition));
=09fixed_part.name =3D mtd->name;
=09fixed_part.size =3D mtd->size;
=09while (fixed_part.size > MAX_BANK_SIZE)
=09=09fixed_part.size -=3D mtd->erasesize;
=09fixed_part.mtdp =3D &fixed_mtd;

=09add_mtd_partitions(mtd, &fixed_part, 1);

=09return fixed_mtd;
#endif
}

--
               Franck
