Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF2db-0007oH-CM
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 17:05:27 +0000
Received: by mail-pa0-x22b.google.com with SMTP id hl6so52523153pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jun 2016 10:05:07 -0700 (PDT)
Date: Mon, 20 Jun 2016 10:05:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Daniel Golle <daniel@makrotopia.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Message-ID: <20160620170503.GA33122@google.com>
References: <20160619130514.GB820@makrotopia.org>
 <20160619214820.GB1222@makrotopia.org>
 <c00ff150-9197-7bcf-8ea7-7ebba979d058@hauke-m.de>
 <6411961.soYuJ4Ixfs@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6411961.soYuJ4Ixfs@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'll take a moment to hijack this and solicit comments on this old
thread:

On Mon, Jun 20, 2016 at 10:09:50AM +0200, Arnd Bergmann wrote:
> - MTD partitioning unfortunately does not seem to have a widely used
>   method for identifying partitions from what's stored on the flash,
>   unlike block devices, so whatever we normally have in the partition
>   table has to be stored in DT. This really sucks, but I don't know
>   what else to do about it.

I got sidetracked, but I have attempted previously to at least diminish
the amount of MTD partitioning info that is stuck into DT:

http://lists.infradead.org/pipermail/linux-mtd/2015-December/064076.html

That series effectively accepts the fact that there isn't a single
standard or widely used method for identifying partitions, but it does
allow for a description that's at least more flexible than a static list
of partitions. I'd appreciate any thoughts on that. The main factors
that stalled that were that (a) there was some vague discomfort over the
use of the "compatible" property (I could probably have argued my case
better there) and (b) I didn't have more time to pursue that. I may pick
this up again when I get some time, especially if there are constructive
suggestions.

Brian
