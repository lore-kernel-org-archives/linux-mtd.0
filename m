Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R4d8O-0004wb-0k
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2011 18:27:33 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Juergen Beisert' <jbe@pengutronix.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Fri, 16 Sep 2011 14:27:25 -0400
Subject: RE: How to distinguish MLC and SLC NANDs?
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33001C1D6DC@dekaexchange07.deka.local>
References: <201109151333.48684.jbe@pengutronix.de>
	<CAN8TOE9YctZ8hO7UTM9k7f8SBaWPzyBHyEgtK96Su5MRCrMjPA@mail.gmail.com>
	<201109160812.58260.jbe@pengutronix.de>
In-Reply-To: <201109160812.58260.jbe@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Juergen :

> BTW: Is there a known disadvantage or incompatibility if I protect the da=
ta of
> an SLC with the more stronger ECC sums intended for MLCs (beside the effe=
ct
> the OOB area is more filled than required)?

  Just speed and storage space (which you already realized).

  Better ECCs are otherwise, well, "better"!

  More generally, if you have a relatively small number of
  well-known NAND Flash types, you could probably use the
  Vendor ID and Device Type codes and a table to determine
  which parts are SLC and which are MLC. It's a shame this
  mechanism wasn't built in from the beginning; the same
  question came up just the other day in our shop and we
  ended up collecting all the Device Type codes (we only
  use one vendor and so far, three specific chip types).

                             Atlant


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Juergen Beisert
Sent: Friday, September 16, 2011 02:13
To: linux-mtd@lists.infradead.org
Cc: Brian Norris
Subject: Re: How to distinguish MLC and SLC NANDs?

Hi Brian,

Brian Norris wrote:
> On Thu, Sep 15, 2011 at 7:33 AM, Juergen Beisert <jbe@pengutronix.de> wro=
te:
> > Is there a unique pattern for MLC
> > or SLC in the mtd structure available after calling nand_scan_ident() t=
o
> > select what correction sum type should be used for the attached NAND?
>
> Actually, there isn't anything available in struct mtd_info. This
> belongs in struct nand_chip, actually, since it's a NAND-specific
> feature. In fact, there is some data available there. As you can see
> in nand_get_flash_type() in nand_base.c, we fill in the
> `chip->cellinfo' field, then later use a mask on it like this:
>
> chip->cellinfo & NAND_CI_CELLTYPE_MSK
>
> According to the data sheets for *most* NAND parts, this is a safe way
> of determining SLC vs. MLC (non-zero =3D> MLC; zero =3D> SLC), and we use
> it for certain detection code paths.

Hmm, *most* means this information is not reliable? Would it be better to g=
ive
the driver a hint what kind of NAND it should expect via the platform_data?

> Note that if the chip uses ONFI, you supply your own ID table, or the chi=
p
> uses some of the older ID codes, nand_base.c won't set chip->cellinfo for
> you; but it will default to SLC I think, which is the correct option for =
old
> parts.

BTW: Is there a known disadvantage or incompatibility if I protect the data=
 of
an SLC with the more stronger ECC sums intended for MLCs (beside the effect
the OOB area is more filled than required)?

> But it's up to you to determine your own reliance on this method. I
> don't know of any users who rely on `chip->cellinfo &
> NAND_CI_CELLTYPE_MSK' for this type of information.

I was in the hope of a perfect world and the MTD framework detects the NAND
type reliable ;-). Now I tend more to use user's info from the platform_dat=
a.

Thanks for your answer.

Juergen

--
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | http://www.pengutronix.de/ =
 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/IXaeqh!Rro7TndxI!oX7Us7Qlo!t9IHtvEZSm=
YARWeyYDIP5X8F0kaKcsMuDG4ISzSBCnLyI1OpLwdQMGDtFKA=3D=3D  to report this ema=
il as spam.

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
