Received: from mail.erinc.com ([216.158.10.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189PW2-0002pF-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 12:42:38 +0000
Message-ID: <F4608F665DF5D311B231009027B70F700131E10A@MAIL>
From: Junping Zhang <JZhang@erinc.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: seeking help on JFFS2
Date: Wed, 6 Nov 2002 08:13:33 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I specified CONFIG_MTD_CFI_INTELEXT only. Here is that section in =
.config
-----------------------------------------------------------
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
CONFIG_MTD_CFI_NOSWAP=3Dy
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=3Dy
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
CONFIG_MTD_CFI_B4=3Dy
# CONFIG_MTD_CFI_B8 is not set
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_I4=3Dy
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_CFI_INTELEXT=3Dy
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
# CONFIG_MTD_RAM is not set
CONFIG_MTD_ROM=3Dy
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
--------------------------------------

Since in xconfig, it has Intel/Sharp in the option together and my =
chips
have Sharp printed on it, I guess
it's right. Also, I referenced the .config file from Christian, who =
made
JFFS2 work for 2.4.4 (from denx) and
some older version of mtd, so I think the setup is ok.

Before I chase the source of the crashed trace, I want to look at =
something
I had to change to make it
compile, now seems to co-relate with my crash. I had to change =
mtdpart.c's
part_unpoint() to make
unpoint() only pass two parameters because mtd_info structure dictates =
it,
but in cfi_cmdset_0001.c,
the do_unpoint, which has four params, is assigned to unpoint func ptr
(warning in compile). It looks wrong
to me, and all those files are sym-linked from mtd-20021022 snapshot, =
can
you guys verify it's really
an inconsistancy, not my mistake?

When I stress test JFFS2 subsystem from 2.4.19 kernel, it seems to me =
it
always crashs at the beginning
of the 2nd cycle. I have a 7M JFFS2, and I copy 3M stuff on it, remove =
it,
and do it again, it always fails at
the 4th time, which, onsidering zlib compression on binary files, seems =
to
be the next cycle.

I will later provide the oops with the source lines.

Thanks a lot

- Junping

> -----Original Message-----
> From:	J=F6rn Engel [SMTP:joern@wohnheim.fh-wedel.de]
> Sent:	Tuesday, November 05, 2002 4:09 PM
> To:	Junping Zhang
> Cc:	linux-mtd@lists.infradead.org
> Subject:	Re: seeking help on JFFS2
>=20
> On Tue, 5 November 2002 14:56:56 -0500, Junping Zhang wrote:
> >=20
> >    I just tested 2.4.19 with shared-zlib patch, same behavior. I =
could
> use
> > the JFFS2 system,
> > but it will eventually crash after a while.
> >=20
> >    The flash chip is original from Motorola: 8M, 80 pin SIMM, =
SM73228. I
> > used Christian's
> > map file. Since JFFS works on it without any problem, should I =
safely
> assume
> > the MTD layer
> > is correct?
>=20
> Ok, glancing at the spec, it said something about being compatible to
> Am29F040 chips, which use the amd command set. And looking back at =
the
> trace, we see
>     Trace; c00df668 <cfi_intelext_read+b4/100>
>                          ^^^^^
> This is strange.
>=20
> Have you configured only CONFIG_MTD_CFI_AMDSTD, only
> CONFIG_MTD_CFI_INTELEXT or both?
>=20
> J=F6rn
>=20
> --=20
> The competent programmer is fully aware of the strictly limited size =
of
> his own skull; therefore he approaches the programming task in full
> humility, and among other things he avoids clever tricks like the =
plague.=20
> -- Edsger W. Dijkstra
