Received: from [212.43.253.35] (helo=synergie-inf.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VfT9-0005VS-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 22:11:39 +0000
Received: from archie.gsi.synergie-inf.com ([10.53.2.1])
	by gateway.synergie-inf.com ([127.0.0.1])
	with SMTP (MDaemon.PRO.v6.5.1.R)
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 23:42:19 +0100
Message-ID: <515CABE7496FD111AA3300201829FCBE3552DD@archie.gsi.synergie-inf.com>
From: Marc Neiger <m.neiger@synergie-inf.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: 16 NANDS
Date: Mon, 6 Jan 2003 23:42:08 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Reply-To: m.neiger@synergie-inf.com
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

Hi Charles,

Of course you properly understood I forgot to type "16bits wide".

I was thinking about products such as Samsung K9F5616U0B wich is a =
256Mbit
NAND flash. Page size is 512 + 16 OOB bytes. So the problem is just
regarding the data transfer width as the page size are the same as the
already supported chips/architectures. Moreover it is quite complicated =
as
the commands and addresses are still transfered as 8 bits, only data =
are
transfered as 16bits.

However, as a newcomer in the embbeded linux world, and although I feel =
like
it should be quite simple, I don't feel like doing the software =
modification
myself...

Cheers,
Marc Neiger



> -----Message d'origine-----
> De : Charles Manning [mailto:manningc2@actrix.gen.nz]
> Envoy=E9 : lundi 6 janvier 2003 22:15
> =C0 : m.neiger@synergie-inf.com; 'linux-mtd@lists.infradead.org'
> Objet : Re: 16 NANDS
>=20
>=20
> By this I expect you mean the NAND chips with a 16-bit wide =
interface.
>=20
> There are really two sub-issues:
> * Hook-up to the chips themselves (ie. doing x16 instead of=20
> x8 trasfers).
> * The 16-bit wide chips have larger pages and blocks (2kB=20
> pages, 128kB=20
> blocks) than the previous generation stuff. This needs to be=20
> handled too at=20
> both the mtd and file system level. I believe (but don't=20
> quote me) that JFFS2=20
> will work as it is now. YAFFS is currently undergoing=20
> extensions/mods to=20
> support the larger pages/blocks.
>=20
> -- Charles
>=20
>=20
> On Fri, 03 Jan 2003 23:27, Marc Neiger wrote:
> > Hi,
> >
> > what are the current status/plan regarding the use of 16 NAND =
Flash,
> > including with JFFS2
> >
> > Cheers and happy new year,
> > Marc Neiger
> >
> > Marc Neiger
> >
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
