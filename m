Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ6wL-0006fP-OR
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 23:34:11 +0000
Received: by mail-pf0-x241.google.com with SMTP id u26so6691060pfd.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 16:33:49 -0700 (PDT)
Date: Thu, 8 Jun 2017 16:33:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v5 4/5] mtd: mchp23k256: add partitioning support
Message-ID: <20170608233346.GI102137@google.com>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
 <20170602032119.22282-5-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170602032119.22282-5-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 02, 2017 at 03:21:18PM +1200, Chris Packham wrote:
> Setting the of_node for the mtd device allows the generic mtd code to
> setup the partitions.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Andrew Lunn <andrew@lunn.ch>

Applied patches 4 and 5, with an editorial note on this one, to note the
outstanding issue about fixing up the eraseblock-boundary check in the
partitioning code.

1 and 2 were already applied, and I had a change request on patch 3.

Regards,
Brian
