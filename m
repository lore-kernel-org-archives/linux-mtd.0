Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190iXz-0005B6-DB
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 14:44:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Burch <jburch@vincisystems.com>
In-Reply-To: <002201c2f91d$8c6ff330$1200a8c0@JOHNB>
References: <002201c2f91d$8c6ff330$1200a8c0@JOHNB>
Message-Id: <1049291095.2652.2.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: 02 Apr 2003 14:44:56 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: reach of jffs2 within image vs. partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-02 at 14:41, John Burch wrote:
> Is there any advantage or disadvantage to creating the jffs2 image file
> with the exact same size (via padding) as the partition, as opposed to
> creating the jffs2 image with some size that's less than the partition
> size?

Not generally, no.

If you use the 'cleanmarker' option then it'll prevent the kernel from
erasing the remaining blocks on the first mount, and with some
bootloaders you can't define a partition while installing an image which
is smaller than the total intended size of that partition -- so you had
to pad with 0xFF to avoid writing crap to the end of it.

-- 
dwmw2
