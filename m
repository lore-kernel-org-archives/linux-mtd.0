Received: from mail85.messagelabs.com ([216.82.241.211])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6zkt-0002Bu-61
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 08:05:35 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Thu, 30 Aug 2012 18:05:29 +1000
Subject: RE: [PATCH] Test for multi-bit error correction
Message-ID: <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>,
 <1346310033.2848.536.camel@sauron.fi.intel.com>
In-Reply-To: <1346310033.2848.536.camel@sauron.fi.intel.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Aug 2012 17:00:33 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Wed, 2012-08-29 at 17:26 +1000, Iwo Mergler wrote:
> > This tests ECC biterror recovery on a single NAND page. Mostly intende=
d
> > to test ECC hardware and low-level NAND driver.
> >=20
> > There are two test modes:
> >=20
> >     0 - artificially inserting bit errors until the ECC fails
> >         This is the default method and fairly quick. It should
> >         be independent of the quality of the FLASH.
> >=20
> >     1 - re-writing the same pattern repeatedly until the ECC fails.
> >         This method relies on the physics of NAND FLASH to eventually
> >         generate '0' bits if '1' has been written sufficient times. De=
pending
> >         on the NAND, the first bit errors will appear after 1000 or
> >         more writes and then will usually snowball, reaching the limit=
s
> >         of the ECC quickly.
>=20
> Aiaiai! [1] [2]
>=20
> drivers/mtd/tests/mtd_nandbiterrs.c: In function 'rewrite_page':
> drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: 'MTD_OOB_RAW' undecla=
red (first use in this function)
> drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identi=
fier is reported only once for each function it
> appears in make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

Sorry about that. It should be MTD_OPS_RAW instead.

> ------------------------------------------------------------------------=
--------
>=20
> checkpatch.pl has some complaints:
>=20
> ------------------------------------------------------------------------=
--------
>=20
> checkpatch.pl results for patch "[PATCH] Test for multi-bit error correc=
tion"
>=20
> WARNING:LONG_LINE: line over 80 characters
> #320: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:270:
> +                       msg("After %d biterrors per subpage, read report=
ed error %d\n",
>=20
> WARNING:LONG_LINE: line over 80 characters
> #328: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:278:
> +                       msg("ECC failure, read data is incorrect despite=
 read success\n");
>=20
> WARNING:LONG_LINE: line over 80 characters
> #382: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:332:
> +                               msg("Implausible number of bit errors co=
rrected\n");
>=20
> WARNING:LONG_LINE: line over 80 characters
> #401: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:351:
> +                       msg("ECC failure, read data is incorrect despite=
 read success\n");
>=20
> total: 0 errors, 4 warnings, 464 lines checked
>=20

I'm not sure what to do about this. Checkpatch.pl also complains if I spli=
t the strings.
I could declare the format strings as const char * somewhere else, but I c=
onsider the
resulting code being less readable. Any suggestions?

I'll re-submit the fixed patch as soon as I know what to do.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient,=20be aware th=
at any disclosure, copying, distribution or use of the contents of this in=
formation is prohibited.  If you have received this communication in error=
, please notify me by telephone immediately.
______________________________________________________________________
