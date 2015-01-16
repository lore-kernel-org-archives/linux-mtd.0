Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCBK1-0002iN-EB
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 18:08:38 +0000
Received: by mail-ig0-f174.google.com with SMTP id hn15so4764370igb.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2015 10:08:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1501160954560.27318@lnxricardw1.se.axis.com>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
 <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
 <20150114191907.GX9759@ld-irv-0074>
 <CAAK6Zt3suTh9=GpYP8CYooqOsq6xFnLOUAPk=o4N2dnL7P-sgg@mail.gmail.com>
 <alpine.DEB.2.02.1501160954560.27318@lnxricardw1.se.axis.com>
Date: Fri, 16 Jan 2015 10:08:15 -0800
Message-ID: <CAAK6Zt3mWvNwDnVU0oORTDC1Es_0jyvNqNyQPxqEjsgJJETiFw@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "grundler@chromium.org" <grundler@chromium.org>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2015 at 1:31 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
> What kind of driver are you using? I always though UBI essentially needed
> an mtd device, meaning that if you're using a NAND flash, nand_base.c
> comes in to play, along with a board (hardware) specific driver of course=
.
>
> The bad block handling mechanism is basically hidden away inside mtd,
> there are mtd API calls to determine if a block is bad or not, and mtd
> handles that according to the configuration for the specific driver,
> either by reading from the flash every time, or using a BBT.

I'm currently using an out-of-tree NAND driver which is not based on
nand_base.c.
>
>> Where can I read about the other advantages of on-flash BBT when using
>> UBI? Maybe I can use this technique for other devices I'm working on
>> where nand_bbt could be used.
>
> There are no specific specific UBI-related advantages when using a BBT
> that I know of.
>
> One turning point for me was the realization that at least for some NAND
> chips, it is out of spec to read bad blocks except once, to determine
> which ones are bad by looking at the bad block markers in the individual
> blocks. Hence, using a BBT is a way of fulfilling that requirement. In
> practice, though, the flashes I've come in contact with (SLC up to say 2
> Gbit) don't seem to have any problems in this regard.

Does UBI not satisfy this requirement itself by its own bad block managemen=
t?
>
> Another advantage in a development environment, especially when working
> with upgrade software, is that if something goes wrong that causes blocks
> to be marked bad spuriously, if not using a BBT the new bad blocks are
> marked as such in the same way as factory bad blocks, making it impossibl=
e
> to separate the two and undo the bad block markings and revert to the
> factory condition. When using a BBT, new bad blocks are marked in the BBT
> only, so by erasing the BBT and rescanning the bad block markers in the
> OOBs of the blocks the flash can be reset to a known state.
>
> /Ricard

But when I'm using UBI, will the bad block table ever be read by
anyone other than this startup scan to count the number of bad blocks
in the partition?

Dan
> --
> Ricard Wolf Wanderl=C3=B6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
