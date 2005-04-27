Received: from zproxy.gmail.com ([64.233.162.200])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQoyf-0002FU-UB
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 12:01:30 -0400
Received: by zproxy.gmail.com with SMTP id 8so257878nzo
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Apr 2005 09:01:31 -0700 (PDT)
Message-ID: <6934efce05042709017bb77d95@mail.gmail.com>
Date: Wed, 27 Apr 2005 09:01:31 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <20050422195324.GA12115@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20050422195324.GA12115@slurryseal.ddns.mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DEBUG_LOCK_BITS fix for Intel NOR flash
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/22/05, Todd Poynor <tpoynor@mvista.com> wrote:
> This patch seems to correctly access block lock status bits for at least
> one Intel StrataFlash model.  Without at least half of this patch (the
> chip->start adjustment), DEBUG_LOCK_BITS won't work well with
> multi-partition flash, at the least.
>=20
> I also needed to change the code to follow the flowchart given in a
> recent StrataFlash datasheet: write command 0x90 followed by the block
> address + 2, then read block address + 2.  The old code writes command
> 0x90 followed by hardcoded address 0x55, then reads block address + 2.
>=20
> Can anybody verify whether Intel flash models exist that require the
> 0x55 address for block lock query?  If so, know of any way to
> distinguish the two cases?
>=20
> Absent any dissent this patch will go into CVS.  (Why all the concern
> over a debug feature?  Because I want to also write code to query lock
> status for other reasons.)  Thanks -- Todd
>=20
> Index: linux-mtd/drivers/mtd/chips/cfi_cmdset_0001.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-mtd.orig/drivers/mtd/chips/cfi_cmdset_0001.c  2005-04-22 19:15:=
05.000000000 +0000
> +++ linux-mtd/drivers/mtd/chips/cfi_cmdset_0001.c       2005-04-22 19:39:=
12.000000000 +0000
> @@ -1823,8 +1823,9 @@
>         struct cfi_private *cfi =3D map->fldrv_priv;
>         int status, ofs_factor =3D cfi->interleave * cfi->device_type;
>=20
> +       adr +=3D chip->start;
>         xip_disable(map, chip, adr+(2*ofs_factor));
> -       cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL)=
;
> +       map_write(map, CMD(0x90), adr+(2*ofs_factor));
>         chip->state =3D FL_JEDEC_QUERY;
>         status =3D cfi_read_query(map, adr+(2*ofs_factor));
>         xip_enable(map, chip, 0);
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

Not sure where the 0x55 came from.  This code looks generic enough to
work for multi and single partition Intel flash.
