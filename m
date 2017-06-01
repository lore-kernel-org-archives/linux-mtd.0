Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGV6f-0007Df-5X
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 18:46:02 +0000
Received: by mail-pf0-x241.google.com with SMTP id f27so8247546pfe.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2017 11:45:40 -0700 (PDT)
Date: Thu, 1 Jun 2017 11:45:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v4 4/5] mtd: mchp23k256: add partitioning support
Message-ID: <20170601184538.GB102137@google.com>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-5-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170524234916.16181-5-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 25, 2017 at 11:49:15AM +1200, Chris Packham wrote:
> Setting the of_node for the mtd device allows the generic mtd code to
> setup the partitions. Additionally we must specify a non-zero erasesize
> for the partitions to be writeable.

The last sentence here is no longer applicable.
