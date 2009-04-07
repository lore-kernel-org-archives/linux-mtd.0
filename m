Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LrCth-00034y-HN
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 15:07:40 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 7 Apr 2009 10:07:16 -0500
Subject: RE: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
Message-ID: <7A436F7769CA33409C6B44B358BFFF0CFFAA8FCA@dlee02.ent.ti.com>
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
	<alpine.LFD.2.00.0904070102260.21577@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.0904070102260.21577@localhost.localdomain>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Paulraj, Sandeep" <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

> -----Original Message-----
> From: Thomas Gleixner [mailto:tglx@linutronix.de]
> Sent: Monday, April 06, 2009 7:08 PM
> To: Narnakaje, Snehaprabha
> Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; davinci-
> linux-open-source@linux.davincidsp.com; Paulraj, Sandeep
> Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
> NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
>=20
> Sneha,
>=20
> On Wed, 1 Apr 2009, nsnehaprabha@ti.com wrote:
>=20
> Would you please care to CC the still caring but admittedly lazy and
> distracted maintainer on such patches ?

Who would that be?

Is the list below correct?

Steven J. Hill (sjhill@realitydiluted.com)
Thomas Gleixner (tglx@linuxtronix.de)
David Woodhouse (dwmw2@infradead.org)

>=20
> > From: Sneha Narnakaje <nsnehaprabha@ti.com>
> >
> > The NAND controller on TI DaVinci DM355 supports NAND devices with larg=
e
> page size (2K and 4K), but the HW ECC is handled for every 512byte
> read/write chunks. The current HW_SYNDROME read_page/write_page APIs in
> the NAND core (nand_base) use the "infix OOB" scheme. The core APIs
> overwrite NAND manufacturer's bad block meta data, thus complicating the
> jobs of non-Linux NAND programmers (end equipment manufacturering). These
> APIs also imply ECC protection for the prepad bytes, causing nand
> raw_write operations to fail.
>=20
> Please use proper line breaks. 523 characters do not fit into a
> terminal.

OK.

Thanks
Sneha
=20
>=20
> Thanks,
>=20
> 	tglx
>=20
>=20
