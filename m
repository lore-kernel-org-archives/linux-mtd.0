Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3MIu-0001uF-BR
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2018 13:48:54 +0000
Date: Tue, 3 Apr 2018 16:48:36 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 1/2] spi-nor: intel-spi: Fix atomic sequence handling
Message-ID: <20180403134836.GD2173@lahna.fi.intel.com>
References: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
 <20180227165142.GL2424@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180227165142.GL2424@lahna.fi.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 27, 2018 at 06:51:42PM +0200, Mika Westerberg wrote:
> On Mon, Feb 05, 2018 at 02:32:59PM +0300, Mika Westerberg wrote:
> > Changes from v1:
> > 
> >   - Added atomic_preopcode field and only when it is set, enable atomic
> >     sequence.
> >   - Return -EINVAL if the requested WREN operation cannot be found from
> >     PREOP register instead of silently pretending it is supported.
> >   - Updated patch subject to match more closely what is being fixed.
> 
> Any comments on these two? I did the changes Cyrille asked me to do.

Ping. If no comments, could someone pick these up please.
