Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MlLn0-0002XQ-Ss
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 11:56:47 +0000
Date: Wed, 9 Sep 2009 12:56:33 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Harald Welte <laforge@gnumonks.org>
Subject: Re: [RFC] extending nand_ecclayout.eccpos once again
Message-ID: <20090909115633.GA1732@shareable.org>
References: <20090902093045.GB7377@prithivi.gnumonks.org>
	<1252390415.5060.38.camel@localhost>
	<20090908152813.GC5579@shareable.org>
	<alpine.LFD.2.00.0909081321170.6044@xanadu.home>
	<20090909111318.GD4771@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090909111318.GD4771@prithivi.gnumonks.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	Jin-Sung Yang <jsgood.yang@samsung.com>,
	Ilho Lee <ilho215.lee@samsung.com>, Marc Zyngier <marc.zyngier@tomtom.com>,
	linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Harald Welte wrote:
> Creating raw images?  I'm also not sure how often that is being
> done.  Why would you precompute an image with ECC and then write
> that to NAND rather than having the NAND layer generate the ECC
> while writing the image (like writing any other data)?

One reason is to be resistant to errors (such as RAM bit-flips) which
occur in flight from the time the data was read or generated (perhaps
a long time ago or far away), until it is written.

Such errors do happen, but it's a bit premature to start coding it in
MTD, as it would be far more valuable to have it in ordinary
filesystems and copying tools, and that looks quite a long way off :-)

-- Jamie
