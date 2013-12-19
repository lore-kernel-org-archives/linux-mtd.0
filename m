Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtYD6-00060u-Uv
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 07:39:57 +0000
Received: by mail-pa0-f42.google.com with SMTP id lj1so806602pab.15
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2013 23:39:34 -0800 (PST)
Date: Wed, 18 Dec 2013 23:39:30 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v4] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131219073930.GC10846@norris-Latitude-E6410>
References: <20131127073512.GB13929@norris.computersforpeace.net>
 <1386278524-25669-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131217054825.GE12034@norris-Latitude-E6410>
 <20131217214648.GB8319@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131217214648.GB8319@localhost>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, kernel@pengutronix.de,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 06:46:49PM -0300, Ezequiel Garcia wrote:
> The problem was I couldn't find time to figure out how to test the GetFeatures
> and SetFeatures command. Hints?

Browse the ONFI spec for something you should expect to be able to read
(for GET_FEATURES). Incidentally, I've been testing {GET,SET}_FEATURES
with my Micron MLC that need read-retry, but you might not have any
flash that support that.

Brian
