Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sbq4g-0000GC-E9
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 09:29:16 +0000
Date: Tue, 5 Jun 2012 11:29:08 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ran Shalit <ranshalit@gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
In-Reply-To: <CAJ2oMhK0isouNBTzMEXPvRLAjFFcSCzWn_gvszrgt1_6Nvw13A@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1206051122380.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhK0isouNBTzMEXPvRLAjFFcSCzWn_gvszrgt1_6Nvw13A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 5 Jun 2012, Ran Shalit wrote:

>  So If I'm using ubifs, should I copy the executables to RAM before execu=
te ?
>
> Most systems can't execute directly from NAND flash, so that is not reall=
y an option either way. In fact, since NAND flash cannot be mapped to an ad=
dress space, there is no way to directly execute from NAND flash, however, =
one could imagine a system with some form of memory managment scheme which =
buffers the data so that the flash appears to be directly addressable. I do=
n't know if there is such a system though; I've never heard of one (but tha=
t's not saying much).
>
> The 'copy to RAM' is nothing one normally has to worry about; all the bin=
aries are on the flash and loaded into RAM when run. Execute in place is a =
special situation that must be explicitly enabled (and I'm very hazy on tha=
t subject as I've never worked with it).
>
> So it seems that if also in terms of execution ubifs and cramfs are=20
> quite similiar (both are executed in RAM), then I see no advatage of=20
> using cramfs over ubifs in general (There are also other advantages of=20
> ubifs such as bad block skipping, writable filesystem, power up recovery=
=20
> etc.).

I should make it clear that cramfs can not be run directly on NAND flash=20
as it has no concept of bad blocks. But neither can ubifs, which requires=
=20
UBI. So both require UBI.

As a matter of fact, come to think of it, I'm not sure how to run cramfs=20
on UBI as it requires a block device which UBI doesn't supply. But I have=
=20
tested it in some way, so it's probably just my mind drawing a blank right=
=20
now. :-)

The only real advantage I can see with cramfs is that it does use up less=
=20
space in the flash for the same amount of data. On the other hand, flash=20
space is usually not a big concern in NAND flash systems anyway.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
