Received: from mail.aswsp.com ([193.34.35.150])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Votex-0002Q7-2D
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 11:33:28 +0000
Date: Fri, 6 Dec 2013 12:33:03 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: UBI+UBIFS on Read-Only NAND
Message-ID: <20131206123303.0702ec88@parrot.com>
In-Reply-To: <CACQ1gAiYBT987kad3Tk6cwsSfv29_uiAm8S=NzA=7FOR6FybYg@mail.gmail.com>
References: <52A0775B.3080005@ADwin.de>
 <CACQ1gAiYBT987kad3Tk6cwsSfv29_uiAm8S=NzA=7FOR6FybYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Herrmann <THerrmann@adwin.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Fri, 6 Dec 2013 09:24:40 +0100,
Richard Genoud <richard.genoud@gmail.com> a =E9crit :

> 2013/12/5 Thomas Herrmann <THerrmann@adwin.de>:
> > We had an old JFFS based system that had a dip switch connected to
> > the write-enable pin of the flash device, and it worked as
> > expected. Users were able to configure and use the system in r/w
> > mode and then "lock" the configuration.
> >
> > I tried the same with our newer hardware, and UBI/UBIFS. I did not
> > use static volumes, since write support is essential for initial
> > setup. However, the system will not boot if the flash is
> > write-protected in hardware, because UBI assumes that it is R/W.
> >
> > What is the suggested solution for such a setup? I could not find
> > anything in the FAQ or in the archive, but I may have been
> > searching for the wrong keywords...
>=20
> AFAIK, UBI is not design to be used on a write protected NAND.
> As it is basically a wear-leveling / bad block handling layer, it
> wouldn't make much sense without a write capability.
> The closest use case I can imagine would be to mount the UBIFS volume
> RO by default and remount it RW when a gpio button is pushed.
> But with a dip switch directly on the NAND WP pin, I don't think
> there's an UBI based solution.
>=20
When you open a UBI volume you can choose the mode (UBI_READONLY,
UBI_READWRITE, UBI_EXCLUSIVE).
But ubifs always open it in UBI_READWRITE mode (in ubifs_fill_super),
even if we are in ro mode.

If it wasn't the case you can implement a software write protect at ubi
level.


Matthieu
