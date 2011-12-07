Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RYCRt-000475-Ny
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 08:01:54 +0000
Date: Wed, 7 Dec 2011 09:01:40 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
In-Reply-To: <4EDECC7A.1080202@newsguy.com>
Message-ID: <Pine.LNX.4.64.1112070848340.32119@lnxricardw.se.axis.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com> <4EDB89E9.6070306@newsguy.com>
 <1323065234.2316.2.camel@koala> <4EDCF840.7050107@newsguy.com>
 <4EDCFAAC.90709@bitbox.co.uk> <4EDD142B.6090303@newsguy.com>
 <87hb1de5b6.fsf@free.fr> <4EDECC7A.1080202@newsguy.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Peter Horton <phorton@bitbox.co.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 7 Dec 2011, Mike Dunn wrote:

> For UBI, the direction of the discussion was that the driver would=20
> indicate the ecc strength of the device (via a new element in struct=20
> mtd_info), and this would be the default UBI scrublevel.  A non-zero=20
> sysfs parameter would override the default.


>
> BTW, it is currently possible (and easy) to do what Peter suggests; i.e.,=
 to
> avoid any UBI rework and make the decision to scrub in the driver.  All t=
he
> driver has to do is not return -EUCLEAN unless it thinks the block should=
 be
> scrubbed.  Of course this would be a lie if there were in fact corrected
> bitflips.  For drivers using the mtd nand interface, the lie would be in =
the ecc
> stats, since the nand infrastructure code returns -EUCLEAN (or 0) based o=
n
> that.  This is what we willl have to do in the diskonchip drivers in orde=
r to
> get ubi/ubifs to work on them if we don't change the mtd api (and afterwa=
rds
> make the changes to ubi).

The idea of using -EUCLEAN to indicate that the lower levels think it's=20
time for scrubbing appeals to me. One reason is that an upper layer such=20
as UBI should not really be concerned with details such as ECC strength=20
and number of flipped bits, it seems to me that such things should be left=
=20
to a lower level. Also, one could imagine different variants of flash=20
technology requiring different consideration to bit flips and other=20
phenomena which again should not be something that for instance UBI needs=
=20
to know about. It makes sense for mtd to have a sweeping knowledge of the=
=20
general types of errors that can occur so that part of the decision can be=
=20
made there.

That said, the level at which the lowest level reports -EUCLEAN could be=20
something that is configurable from user space (sysfs), so that it's=20
userspace that sets the actual policy and no one else.

So, something like this:
- The driver reports number of bit flips and current ECC strength etc to
   the mtd layer.
- Based on some userspace knob, the mtd framework reports -EUCLEAN if
   scrubbing is needed.
- Upper layers perform scrubbing if they want to (i.e. UBI) or not (i.e.
   JFFS2).

I don't really see this as lying, more of a redefinition of what -EUCLEAN=
=20
really means. The current behavior was invented when single-bit errors=20
could be correct and nothing else, and furthermore such bitflips were=20
rare; now that multiple-bit errors are commonplace it's time to put more=20
detail into what -EUCLEAN implies.  It's not really breaking anything old=
=20
either, if sane defaults are used.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
