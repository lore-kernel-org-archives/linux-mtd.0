Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdZoW-0005SM-2A
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 09:54:26 +0000
Date: Tue, 14 Feb 2017 11:47:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 RFC] mtd: spi-nor: intel: provide a range for
 poll_timout
Message-ID: <20170214094724.GB15721@lahna.fi.intel.com>
References: <1486973622-1072-1-git-send-email-der.herr@hofr.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486973622-1072-1-git-send-email-der.herr@hofr.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 13, 2017 at 09:13:42AM +0100, Nicholas Mc Guire wrote:
> The overall poll time here is INTEL_SPI_TIMEOUT * 1000 which is
> 5000 * 1000 - so 5seconds and it is coded as a tight loop here delay_us
> to readl_poll_timeout() is set to 0. As this is never called in an atomic
> context sleeping should be no issue and there is no reasons for the
> tight-loop here.
> 
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
