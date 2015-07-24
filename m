Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIfsg-0000qC-3L
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 16:31:31 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V4 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Fri, 24 Jul 2015 18:25:00 +0200
Cc: linux-mtd@lists.infradead.org, Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1427117782-14764-1-git-send-email-grmoore@opensource.altera.com>
 <201507241445.07988.marex@denx.de> <55B263D1.8080506@opensource.altera.com>
In-Reply-To: <55B263D1.8080506@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507241825.00826.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, July 24, 2015 at 06:12:01 PM, Graham Moore wrote:
> On 07/24/2015 07:45 AM, Marek Vasut wrote:
> > On Monday, March 23, 2015 at 02:36:21 PM, Graham Moore wrote:
> >> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> >> ---
> >> V2: Add cdns prefix to driver-specific bindings.
> >> V3: Use existing property "is-decoded-cs" instead of creating a
> >> duplicate, "ext-decoder".  Timing parameters are in nanoseconds, not
> >> master reference clocks.  Remove bus-num completely.
> > 
> > Hi!
> > 
> > do you plan to continue on this driver any soon? If not, I'd like to take
> > over the mainlining if you're not opposed. I'd like to see this in
> > mainline soon.
> 
> I don't have a problem with you taking over the mainlining.  I've been
> stalled on the micron quad protocol issue that Cyrille Pitchen has solved.

Do you mean the protocol change notification please?

> > btw you'll need some kind of a variation on the attached two patches in
> > the next iteration.
> 
> I have a V5 with fixes for sparse and smatch issues.  Do you want me to
> post it and you add those two patches?  Alternatively I can incorporate
> them into my V5.

Please post those patches, yup, that'd be nice :)

Also, just squash those two micropatches into yours, no problem.

Be careful about the 0002 patch, see the commit message. I do NOT think
it is correct to pass the pdev->dev which represents the controller, not
the subnode, into spi_nor_scan() in cqspi_probe() . I might be wrong here
though, I am not sure. I think Brian or David would be much better people
to comment on this part.

Best regards,
Marek Vasut
