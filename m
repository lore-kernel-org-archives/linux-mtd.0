Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2caw-0007Su-KY
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 08:10:03 +0000
Date: Mon, 13 Jan 2014 15:34:34 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140113073433.GB26113@shlinux2.ap.freescale.net>
References: <1389581697-28309-1-git-send-email-b32955@freescale.com>
 <CAGWqfiiRtRoT_qE4SjrkMDspxEWePRbX9krZxXM-TtVSxuhSLg@mail.gmail.com>
 <20140113065914.GA26113@shlinux2.ap.freescale.net>
 <CAGWqfiiZMaH1i9aTLQpqjMFnnXqi0xHoFquOLjZ_FNNYkg_AhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGWqfiiZMaH1i9aTLQpqjMFnnXqi0xHoFquOLjZ_FNNYkg_AhA@mail.gmail.com>
Cc: Vikram.Narayanan@in.bosch.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, bpringlemeir@nbsps.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 08:52:48AM +0100, Elie De Brauwer wrote:
> >> A second note, you patch v2 is a lie, there in the v1->v2 you mention
> >> you return the number of bitflips to the upper layer, however your
> >> code was not modified accordingly, gpmi_erase_check still does not
> >> return the number of bitflips. Unless I'm missing something there too.
> > I added a new argument @max_bitflips for gpmi_erased_check which will
> > return the number of bitflips.
> 
> True, but if you look just  below your patch you see that
> mtd->ecc_stats.correct will not
> get properly updated. It normally gets updated with the number of
> bitflips reported
My bad now :(

I really missed the mtd->ecc_stats.corrected.
thanks a lot for pointing this.


> through the status. (Well to be honest the entire switching between chunks and
> pages confused me a lot on this monday morning, it could be me but when
> iterating over chunks, switching to pages and breaking out of the for
> loop isn't
> something I would consider very clean, I think some more elaborate comment
If we do not read the whole page, we have to issue the change column comand 0x5
and calculate the offset of the chunk.

> on the erased check might help.).
ok. i will add more comment in the next version.

thanks
Huang Shijie
