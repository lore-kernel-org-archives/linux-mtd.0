Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGuZD-0000Ei-U3
 for linux-mtd@lists.infradead.org; Mon, 11 Aug 2014 18:43:36 +0000
Received: by mail-pa0-f43.google.com with SMTP id lf10so11592397pab.30
 for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2014 11:43:15 -0700 (PDT)
Date: Mon, 11 Aug 2014 11:43:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 6/8] mtd: spi-nor: drop replaceable wait-till-ready
 function pointer
Message-ID: <20140811184311.GX3711@ld-irv-0074>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-7-git-send-email-computersforpeace@gmail.com>
 <20140809095301.GA1076@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140809095301.GA1076@localhost.localdomain>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 09, 2014 at 05:53:03PM +0800, Huang Shijie wrote:
> On Wed, Aug 06, 2014 at 06:17:00PM -0700, Brian Norris wrote:
> > We don't need to expose a 'wait-till-ready' interface to drivers. Status
> > register polling should be handled by the core spi-nor.c library, and as
> > of now, I see no need to provide a special driver-specific hook for it.
> 
> Please do not drop this hook, please see why we add this hook:
> http://lists.infradead.org/pipermail/linux-mtd/2013-December/050561.html
> 
> "
> The default implementation would do just as you suggest, and I would
> expect most H/W drivers to use the default implementation.  However, some H/W
> Controllers can automate the polling of status registers, so having a hook allows
> the driver override the default behaviour.
> "
> 
> The spi-nor framework will used by more drivers besides the m25p80 and
> fsl-quadspi. Some NOR flash controller may be very strange.

OK, but the wait-till-ready hook should not look like the current one.
If it is used as an optimization of sorts, then we can provide it in
*addition* to the checks we do, but not *instead of*. I sincerely doubt
that any specialized SPI NOR controller will know how to check both SR
and FSR where appropriate, and it probably won't understand other
specialized sequences as they are developed / thrown on our lap by flash
vendors.

So, the spi-nor.c "wait until ready" might have a sequence like this:

1. (Optionally) use low-level driver's "wait" function; skip if not
   present

2. use the read register hooks to check SR/FSR to confirm completion

I do not want to toss #2 into the low-level driver, so if there is a
need for #1, it should be done in addition to our spi-nor.c code, not
instead. (To this end, I believe Marek also complained about this when
we were adding the FSR-checking code; we should not have drivers and
spi-nor.c fighting over callback functions.)

So I'm inclined to at most address #1 through an optional callback, and
possibly even to ignore that until we see an actual driver that needs
it.

Brian
