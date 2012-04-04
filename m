Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFUdV-0006M2-Vf
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 18:08:50 +0000
Received: by dadn15 with SMTP id n15so658537dad.16
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2012 11:08:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120404070157.GB24930@pengutronix.de>
References: <CAOdLEarFOdmDBS0iDmafLeBU=NNWxWjejTvJ-eEkQjRO12+VYg@mail.gmail.com>
 <20120404070157.GB24930@pengutronix.de>
Date: Wed, 4 Apr 2012 11:08:48 -0700
Message-ID: <CAOdLEaqXyvHzTRSq2=RquZLqEO6kMEp11rjKJ+UtSqtF4nr-EA@mail.gmail.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
From: Sam Gandhi <samgandhi9@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Okay I will track this down

I don't see any of the mach-* files setting up the
gpmi_nand_platform_data so I wonder if this GPMI-NAND driver for has
ever been tested for NAND on mx28?

I will do that setup for our hardware, but would like to at least hear
from anyone that has used new gpmi-nand driver sucessfully, i will
report back my findings.

-Sam

On Wed, Apr 4, 2012 at 12:01 AM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
>
>> When booting kernel with initcall_debug we never see that
>> gpmi_nand_probe() function is never getting called.
>
> You probably don't have a NAND device registered. Then, there is nothing =
to
> bind a driver to.
>
>> I have gone through the MTD =A0mailinglist log, and I didn't find
>> details on how this GPMI-NAND driver was actually tested on hardware.
>
> It should be there somewhere, the mach relevant patches have been mention=
ed
> there, too.
>
> Regards,
>
> =A0 Wolfram
>
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Wo=
lfram Sang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
