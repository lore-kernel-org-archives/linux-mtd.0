Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bI6X9-0005h7-W3
 for linux-mtd@lists.infradead.org; Wed, 29 Jun 2016 03:51:28 +0000
Message-ID: <1467172263.2456.66.camel@gmail.com>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Date: Wed, 29 Jun 2016 06:51:03 +0300
In-Reply-To: <20160628174949.GC80724@google.com>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
 <20160628140500.GN20657@pengutronix.de>
 <20160628174949.GC80724@google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-06-28 at 10:49 -0700, Brian Norris wrote:
> In reading Artem's first objection, I was noticing the same thing and
> came to a similar conclusion. I guess we can't really get by with UBI
> just guessing at the ideal read size. Right now, it gets it too large
> most of the time, since often, NAND controllers can support sub-page
> reads, but not sub-page writes (or even if the controller can, the
> flash
> can't -- like all MLC or even many modern SLC), so a single number
> (writesize >> subpage_sf) is not sufficient.

Yes, this is a good opportunity for speed optimizations indeed.
