Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEd3U-0005nZ-Tr
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 15:23:19 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992334AbdKNPWxrDLcG (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Tue, 14 Nov 2017 16:22:53 +0100
Date: Tue, 14 Nov 2017 16:22:52 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Roger Quadros <rogerq@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 5/7] mtd: onenand: omap2: Unify OMAP2 and OMAP3 DMA
 implementation
Message-ID: <20171114152252.bekjxrovpis6xfur@lenoch>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091529.x3pqqvbiywj5aulo@lenoch>
 <3d33265a-2520-2298-6068-f76a7257bfd0@ti.com>
 <20171110100443.zqk7uzxoaq4eyntk@lenoch>
 <20171110152423.GM28152@atomide.com>
 <d498102d-11ff-cdd0-430e-0ea650c2a12b@ti.com>
 <20171113121541.2tlezfjwk5bptakp@lenoch>
 <c13c503c-9435-7e88-7700-40bfcf806231@ti.com>
 <20171113152717.fj2vgga4gzfr3q2b@lenoch>
 <89008152-92e4-7e4a-0953-310a5240d50c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89008152-92e4-7e4a-0953-310a5240d50c@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 14, 2017 at 05:05:20PM +0200, Roger Quadros wrote:
> On 13/11/17 17:27, Ladislav Michl wrote:
> > Here it would be nice to have the same documentation Nokia had at the time
> > writing support for n8x0 as they clearly used few undocumented features.
> > Please see section 3.9.5 of above mentioned specs. Seems DMA slave should
> > be triggered by RDY not INT pin.
> 
> Correct. For RDY pin usage See 3.7.3 Handshaking Operation
> 
> "The handshaking feature allows the host system to simply monitor the RDY signal from the device to determine
> when the initial word of burst data is ready to be read."

To collect more documentation from Samsung, this appnote is also relevant:
http://trendol.free.fr/SMDK6410/842440S3C6410_ApplicationNotes_rev10.pdf
Section 7. OneNand, especially 7.5.1.3-6.
