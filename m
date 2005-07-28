Received: from mail.datacom-telematica.com.br ([200.102.77.20]
	helo=eserver.datacom-telematica.com.br)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DyG7n-00047B-Hw
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 17:41:12 -0400
From: DataCom - =?iso-8859-1?q?Virg=EDlio?=
	<virgilio@datacom-telematica.com.br>
To: linux-mtd@lists.infradead.org
Date: Thu, 28 Jul 2005 18:40:03 -0300
References: <200507281640.54771.virgilio@datacom-telematica.com.br>
	<1122584803.26146.55.camel@tglx.tec.linutronix.de>
In-Reply-To: <1122584803.26146.55.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200507281840.03577.virgilio@datacom-telematica.com.br>
Subject: Re: Single bit error correction on NAND.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 28 July 2005 18:06, Thomas Gleixner wrote:
> On Thu, 2005-07-28 at 16:40 -0300, DataCom - Virg=EDlio wrote:
> > I have noticed that NAND support on MTD can detect/correct single bit
> > errors in 256 bytes, using software ECC. However, the correct data is n=
ot
> > written back to flash. In other words, the bit stays "flipped" in flash.
> > Isn't that dangerous? I mean, if another bitflip occurs in the same 256
> > bytes, we won't be able to correct by software ECC...
> >
> > Am I missing something here?
>
> Yes.
>
> It is not and can not be the responsibility of the NAND driver to handle
> this. Where to should it write the data ? The existing data _cannot_ be
> overwritten, without erasing the whole eraseblock and the implied risk
> of loosing _ALL_ the data on the block due to a powerfail.
>
> The NAND driver returns the corrected data and an appropriate error code

Maybe I'm missing something, but the function nand_do_read_ecc returns=20
=2DEBADMSG only if an uncorrectable error is detected by nand_correct_data.=
 If=20
just one bit is flipped, nand_correct_data corrects it, and nand_do_read_ec=
c=20
returns 0.

> and the calling (e.g. filesystem) driver has to deal with the data
> copying or whatever the developer has decided to be the correct
> solution.

So it would be JFFS2 responsability to write back the correct data to flash=
,=20
after a bit-flip is detected and corrected by the NAND driver. However,=20
apparently it doesn't.

My question is: do you think it's safe to just leave the bit flipped in fla=
sh?=20
I mean, everytime I try to read it, ECC will handle it. But what are the od=
ds=20
of another bit-flip in the same 256 bytes?

=2D-=20
VIRG=CDLIO Silva
