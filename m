Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190i1W-0004jQ-2a
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 14:11:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Burch <jburch@vincisystems.com>
In-Reply-To: <002101c2f918$bbd9a710$1200a8c0@JOHNB>
References: <002101c2f918$bbd9a710$1200a8c0@JOHNB>
Message-Id: <1049289082.32557.38.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: 02 Apr 2003 14:11:23 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: reach of jffs2 within image vs. partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-02 at 14:06, John Burch wrote:
> Will JFFS2 ever read/write an area of flash memory that is within the
> same mtd partition but outside of the jffs2 image (as defined -p switch
> of mkfs.jffs2)?  In other words, if the jffs2 image spans 0x0 - 0x120000
> and it lies within an mtd partition that spans 0x0 - 0x140000, will the
> last 128k, spanning from 0x120000 - 0x140000, ever be accessed in any
> way by jffs2?  Would that 128k area be as safe/non-volatile there as in
> a separate partition?

No. JFFS2 will use the entire partition regardless of the amount of
space taken by the original image.

-- 
dwmw2
