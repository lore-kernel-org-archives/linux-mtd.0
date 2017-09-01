Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnib7-0002sJ-MJ
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 09:50:47 +0000
Date: Fri, 1 Sep 2017 12:45:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 03/10] spi-nor: intel-spi: Fix broken software sequencing
 codes
Message-ID: <20170901094553.GX2598@lahna.fi.intel.com>
References: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
 <1504252841-2445-4-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504252841-2445-4-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 01, 2017 at 01:00:34AM -0700, Bin Meng wrote:
> There are two bugs in current intel_spi_sw_cycle():
> 
> - The 'data byte count' field should be the number of bytes
>   transferred minus 1
> - SSFSTS_CTL is the offset from ispi->sregs, not ispi->base
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

This should be tagged for stable inclusion as well.
