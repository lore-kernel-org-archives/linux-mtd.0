Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJTAK-0003Qe-ID
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 23:18:06 +0000
Received: by mail-pf0-x243.google.com with SMTP id f27so9945662pfe.0
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jun 2017 16:17:44 -0700 (PDT)
Date: Fri, 9 Jun 2017 16:17:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v6] mtd: handle partitioning on devices with 0 erasesize
Message-ID: <20170609231741.GP102137@google.com>
References: <20170609035831.6258-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170609035831.6258-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Chris!

On Fri, Jun 09, 2017 at 03:58:31PM +1200, Chris Packham wrote:
> erasesize is meaningful for flash devices but for SRAM there is no
> concept of an erase block so erasesize is set to 0. When partitioning
> these devices instead of ensuring partitions fall on erasesize
> boundaries we ensure they fall on writesize boundaries.
> 
> Helped-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Looks good to me. Did Boris have any last thoughts? Or else I'll merge
this.
