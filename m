Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHx9J-0002XR-9L
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 17:50:13 +0000
Received: by mail-pa0-x242.google.com with SMTP id ts6so2215365pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2016 10:49:52 -0700 (PDT)
Date: Tue, 28 Jun 2016 10:49:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
Message-ID: <20160628174949.GC80724@google.com>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
 <20160628140500.GN20657@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160628140500.GN20657@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2016 at 04:05:00PM +0200, Sascha Hauer wrote:
> On Tue, Jun 28, 2016 at 04:00:29PM +0300, Artem Bityutskiy wrote:
> > If the VID header is in the first subpage, the MTD level probably needs
> > to read the entire subpage anyway, because of per-subpage ECC. This is
> > why we give it a buffer of subpage size.
> 
> The gpmi NAND driver allows reading subpages (NAND_SUBPAGE_READ is set), but
> it does not allow writing subpages (NAND_NO_SUBPAGE_WRITE is also set).
> With this mtd->subpage_sft becomes 0 and ubi->hdrs_min_io_size becomes
> the full page size.
> UBI does not distinguish between the minimum read size and the minimum
> write size. We could pass this information from mtd to UBI, then UBI
> could make use of it.

In reading Artem's first objection, I was noticing the same thing and
came to a similar conclusion. I guess we can't really get by with UBI
just guessing at the ideal read size. Right now, it gets it too large
most of the time, since often, NAND controllers can support sub-page
reads, but not sub-page writes (or even if the controller can, the flash
can't -- like all MLC or even many modern SLC), so a single number
(writesize >> subpage_sf) is not sufficient.

Brian
