Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19p2GX-00080g-9W
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2003 09:54:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Dillow <ddillow@idleaire.com>
In-Reply-To: <1061236980.14477.20.camel@dillow.idleaire.com>
References: <1061236980.14477.20.camel@dillow.idleaire.com>
Message-Id: <1061283276.9943.1160.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 19 Aug 2003 09:54:37 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-08-18 at 16:03 -0400, Dave Dillow wrote:
> Has anybody used the INFTL that is the CVS tree and can confirm that it
> works for writing?

Yes, but only on the DiskOnChip Millennium. There may be some incestuous
knowledge about what to put in the OOB area which isn't shared by the
DiskOnChip 2000 driver. 

Actually, I suspect it's possibly the reverse -- the doc2000 driver
brokenly inserts the '5555' marker in the middle of the oob area, which
should really have been done in the NFTL code instead.

-- 
dwmw2
