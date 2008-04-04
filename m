Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhv2X-0004NJ-0D
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 23:09:45 +0000
From: David Brownell <david-b@pacbell.net>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: [PATCH]  jffs2 summary allocation
Date: Fri, 4 Apr 2008 16:09:40 -0700
References: <713171.37644.qm@web26213.mail.ukl.yahoo.com>
	<20080404124812.d39fa640.akpm@linux-foundation.org>
In-Reply-To: <20080404124812.d39fa640.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804041609.41092.david-b@pacbell.net>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Michael Trimarchi <trimarchimichael@yahoo.it>,
	spi-devel-general@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 04 April 2008, Andrew Morton wrote:

> I'm assuming from the trace that the arm code tried to put that memory
> under DMA (or at least, passed it into part of the DMA management code to
> get the various caches sorted out) and that the arm DMA support code
> doesn't like being given vmalloced memory.

Actually, Documentation/DMA-Mapping.txt has a section right up
front called "What memory is DMA'able?" ... which despite its
ungrammatical title, says clearly:

  ... This means specifically that you may _not_ use the
  memory/addresses returned from vmalloc() for DMA.  ...

So I'm rather surprised to see *ANY* kernel code trying to do
that.  That rule has been in effect for many, many years now.

- Dave
