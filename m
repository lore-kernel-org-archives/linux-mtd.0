Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRoXw-0008DU-Do
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 14:36:28 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: vimal singh <vimalsingh@ti.com>
Date: Fri, 17 Jul 2009 09:35:54 -0500
Subject: RE: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
	read_page/read_page_raw APIs
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C011E71798F@dlee02.ent.ti.com>
References: <42655.192.168.10.89.1247812404.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <42655.192.168.10.89.1247812404.squirrel@dbdmail.itg.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>, "Paulraj,
	Sandeep" <s-paulraj@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: vimal singh [mailto:vimalsingh@ti.com]
> Sent: Friday, July 17, 2009 2:33 AM
> To: Narnakaje, Snehaprabha
> Cc: linux-mtd@lists.infradead.org; davinci-linux-open-
> source@linux.davincidsp.com; dwmw2@infradead.org; tglx@linutronix.de;
> akpm@linux-foundation.org; Paulraj, Sandeep
> Subject: Re: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
> read_page/read_page_raw APIs
>=20
> On Fri, Jul 17, 2009 at 3:29 AM, <nsnehaprabha@ti.com> wrote:
> > From: Sneha Narnakaje <nsnehaprabha@ti.com>
> >
> > This patch new "page" parameter to all NAND read_page/read_page_raw
> APIs.
> > The read_page API for the new mode ECC_HW_OOB_FIRST requires the page
> > information to send the READOOB command and read the OOB area before th=
e
> > data area.
> >
> > This patch series applies to linux-mtd next (mmotm) GIT tree.
> > This patch is the same as v2 version of this patch.
> >
> > Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
> > Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> > Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
> > ---
> >  drivers/mtd/nand/atmel_nand.c    |    2 +-
> >  drivers/mtd/nand/cafe_nand.c     |    2 +-
> >  drivers/mtd/nand/fsl_elbc_nand.c |    3 ++-
> >  drivers/mtd/nand/nand_base.c     |   18 ++++++++++--------
> >  drivers/mtd/nand/sh_flctl.c      |    2 +-
> >  include/linux/mtd/nand.h         |    4 ++--
> >  6 files changed, 17 insertions(+), 14 deletions(-)
> >
>=20
> Why not just adding 'page' or 'cur_page' parameter to 'mtd_info' structur=
e
> and
> populate the same in 'nand_do_read_ops' and 'nand_do_write_ops' as soon a=
s
> you
> calculate 'page' for every read and write access respectivily. And then
> this
> info can be used by any one who has knowledge of 'mtd_info'.

Yes, that was one option. This meant, some of the existing handlers for rea=
d_oob and write_oob required changes to get rid of "page", if we decide to =
use the page from mtd_info structure.

Thanks
Sneha

>=20
> -vimal
>=20
