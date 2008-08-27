Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KYDyz-0006Go-JV
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 05:54:17 +0000
Subject: Re: [RFC] mtd-utils: make cross build functional again
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20080826220705.GA4834@Chamillionaire.breakpoint.cc>
References: <20080826220705.GA4834@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset=utf-8
Date: Wed, 27 Aug 2008 08:50:58 +0300
Message-Id: <1219816258.18027.138.camel@sauron>
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

On Wed, 2008-08-27 at 00:07 +0200, Sebastian Siewior wrote:
> as of current HEAD "make CROSS=3Dwhatever-" breaks once we leave
> the main Makefile.
> With this patch everything builds except NTARGETS in ubi-utils and with
> CROSS being undefined.
>=20
> The problem with CROSS being undefined could be solved by setting
> BUILDDIR explicit to "native" for instance.
> The NTARGETS thing is a little tricky. The easiest solution would be
> probably to move the NTARGETS targets into its own Makefile.
>=20
> Anyway, is this something worth to fix since it is almost a year broken?
> Should the BUILDDIR thing be removed or is it used?
>=20
> Signed-off-by: Sebastian Siewior <sebastian@breakpoint.cc>

I'm very bad in Makefile, so I am not sure what is all this BUILDDIR
stuff about. However, your patch breaks build on x86:

[dedekind@gollum mtd-utils]$ make
gcc  -o .././ubi-utils/pfi2bin pfi2bin.o peb.o error.o list.o crc32.o
libubigen.o bootenv.o hashmap.o reader.o pfi.o
make[1]: *** No rule to make target `.././ubi-utils/ubiattach', needed
by `all'.  Stop.
make[1]: Leaving directory `/home/dedekind/git/mtd-utils/ubi-utils'
make: *** [all] Error 2
rm doc_loadbios.o flash_info.o docfdisk.o ftl_check.o rfdformat.o
nandwrite.o mtd_debug.o flash_otp_dump.o nftldump.o flash_lock.o
flash_otp_info.o rfddump.o flash_unlock.o nftl_format.o flashcp.o
flash_erase.o ftl_format.o nandtest.o nanddump.o

Also, please, make sure your patch does not break make install.

Thanks.
=20
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
