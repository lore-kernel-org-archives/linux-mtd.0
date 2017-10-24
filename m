Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6vRl-0007aT-LI
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 09:24:31 +0000
Date: Tue, 24 Oct 2017 12:21:54 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] spi-nor: intel-spi: Remove EXPERT dependency
Message-ID: <20171024092154.GC29656@lahna.fi.intel.com>
References: <1508830853-4924-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508830853-4924-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 24, 2017 at 12:40:53AM -0700, Bin Meng wrote:
> The idea to have the intel-spi driver dependent on EXPERT was exactly
> because we did not want ordinary users playing with the device and
> inadvertently overwrite their BIOSes (if it is not protected). This
> seems to be superfluous hence remove it.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
