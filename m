Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mni0O-0001MA-Pq
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 00:04:21 +0000
Date: Wed, 16 Sep 2009 09:03:57 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: 2.6.32 -mm merge plans
Message-ID: <20090916000357.GD23923@linux-sh.org>
References: <20090915161535.db0a6904.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090915161535.db0a6904.akpm@linux-foundation.org>
Cc: kmpark@infradead.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 15, 2009 at 04:15:35PM -0700, Andrew Morton wrote:
> mtd-make-onenand-genericc-more-generic.patch
> mtd-nand-add-page-parameter-to-all-read_page-read_page_raw-apis.patch
> mtd-nand-add-new-ecc-mode-ecc_hw_oob_first.patch
> mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips.patch
> mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips-update.patch
> mtd-jffs2-fix-read-buffer-overflow.patch
> mtd-prevent-a-read-from-eraseregions.patch
> mtd-prevent-a-read-from-regions.patch
> mtd-jedec_probe-fix-nec-upd29f064115-detection.patch
> mtdpart-memory-accessor-interface-for-mtd-layer.patch
> 
>   -> dwmw2
> 
Regarding mtd-make-onenand-genericc-more-generic.patch, I'm not really
sure what happened. To recap:

It was posted to the mtd list here:

http://lists.infradead.org/pipermail/linux-mtd/2009-August/026805.html

Kyungmin objected to the driver name change here:

http://lists.infradead.org/pipermail/linux-mtd/2009-August/026807.html

I pointed out that the rough rationale for the name change here:

http://lists.infradead.org/pipermail/linux-mtd/2009-August/026808.html

and offered to redo the patch keeping the old name if Kyungmin felt the
rationale wasn't valid, but received no reply. Subsequently, Artem
mentioned that he had merged it in to his l2-mtd-2.6.git tree here:

http://lists.infradead.org/pipermail/linux-mtd/2009-August/026866.html

which subsequently seems to not actually have happened.

This is a pretty trivial patch, and I don't mind respinning it in
whatever form folks are content with. I had assumed given the mention
that it had been merged in to the l2 tree that the rationale was
sufficient for merging.
