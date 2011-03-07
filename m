Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwbsN-0002KG-Eq
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 14:57:36 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Mon, 7 Mar 2011 08:57:29 -0600
Subject: RE: [PATCH] NAND: DaVinci: Removed header file that is not required
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5DC266C260@dlee01.ent.ti.com>
References: <1299019251-19518-1-git-send-email-s-paulraj@ti.com>
	<1299488468.2746.7.camel@localhost>
In-Reply-To: <1299488468.2746.7.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>=20
> On Tue, 2011-03-01 at 17:40 -0500, s-paulraj@ti.com wrote:
> > From: Sandeep Paulraj <s-paulraj@ti.com>
> >
> > The DaVinci NAND driver was including the mach-types.h header
> > file.
> > This prevented the DaVinci NAND driver from getting used
> > in a DSP only device. The linux port on c6x devices can make
> > use of the same driver and does not define a corresponding
> > header file; so removing it.
> >
> > Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
>=20
> Hi,
>=20
> you explain why this include is bad for DSP. Buy you do not explain why
> this include is there and why removing it is harmless for Linux.
>=20

Hi,

This header file was required in the driver because earlier there was code =
dependent on a machine_* check. This piece of code has now been factored ou=
t and is in /arch/arm/mach-davinci/aemif.c.

Thus removing it is harmless.

Please do let me know if you need an updated patch.

Regards,
Sandeep
