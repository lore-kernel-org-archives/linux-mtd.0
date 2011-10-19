Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGV3u-0003Ll-7c
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 12:15:59 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Ivan Djelic' <ivan.djelic@parrot.com>, Ricard Wanderlof
	<ricard.wanderlof@axis.com>
Date: Wed, 19 Oct 2011 08:17:31 -0400
Subject: RE: UBIFS recovery fails
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33254FA3B98@dekaexchange07.deka.local>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
	<20111018153236.GA10466@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8F2@prod-svr-1.intranet.str.ca>
	<Pine.LNX.4.64.1110190845390.30940@lnxricardw.se.axis.com>
	<20111019102235.GA13501@parrot.com>
In-Reply-To: <20111019102235.GA13501@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?iso-8859-1?Q?Jean-S=E9bastien_Gagnon?= <jsgagnon@vizimax.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All:

> On modern SLCs (at least I first saw it on 34 nm SLC flash), those bitfli=
ps
> can be _unstable_, i.e. they can appear and disappear randomly as you rea=
d
> pages. I experienced this phenomenon only on pages which were being progr=
ammed
> or erased during a power cut.

  This makes perfectly good sense. During erasing or programming,
  charge is being deposited-upon or removed from the floating gates
  and that's not an instantaneous process, so it can be interrupted
  while on-going, leaving a gate that's only half charged or half
  discharged.

  At that point, the floating gate may have charge on it that's
  all-too-near the threshold voltage for the cell and any given
  read of that cell could "go either way" depending on minute
  variations in other conditions.

                                   Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Ivan Djelic
Sent: Wednesday, October 19, 2011 06:23
To: Ricard Wanderlof
Cc: linux-mtd@lists.infradead.org; Jean-S=E9bastien Gagnon
Subject: Re: UBIFS recovery fails

On Wed, Oct 19, 2011 at 07:50:42AM +0100, Ricard Wanderlof wrote:
> That said, it seems to me that power failure during write causing
> excessive bitflips would be a problem with any flash, not just MLC or
> modern "unstable" SLC. Ivan, you said you've only seen it with modern
> flashes, not older SLC ?

Excessive bitflips after a power failure happen on all types of flash (SLC,
MLC, even NOR flash); it is an expected possible consequence of the power c=
ut.
It is not really a problem as long as what you read in flash is _stable_.

On modern SLCs (at least I first saw it on 34 nm SLC flash), those bitflips
can be _unstable_, i.e. they can appear and disappear randomly as you read
pages. I experienced this phenomenon only on pages which were being program=
med
or erased during a power cut.

BR,
--
Ivan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/qIXI9rK6r8XTndxI!oX7Uun8LHo!qpr3bLEMk=
tINnvGjzny7tu5OdmysYq8E2OEC21OCp49t+CbFX!XDabuzkg=3D=3D  to report this ema=
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
