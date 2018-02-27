Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqiVp-0000zl-H5
 for linux-mtd@lists.infradead.org; Tue, 27 Feb 2018 16:53:58 +0000
Date: Tue, 27 Feb 2018 18:51:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 1/2] spi-nor: intel-spi: Fix atomic sequence handling
Message-ID: <20180227165142.GL2424@lahna.fi.intel.com>
References: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 05, 2018 at 02:32:59PM +0300, Mika Westerberg wrote:
> Changes from v1:
> 
>   - Added atomic_preopcode field and only when it is set, enable atomic
>     sequence.
>   - Return -EINVAL if the requested WREN operation cannot be found from
>     PREOP register instead of silently pretending it is supported.
>   - Updated patch subject to match more closely what is being fixed.

Any comments on these two? I did the changes Cyrille asked me to do.

Thanks!
