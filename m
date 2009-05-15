Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4zO5-0000T2-U5
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 15:32:01 +0000
Subject: Re: [PATCH] [REPOST] mtd: extend plat_nand for (read|write)_buf
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Clouter <alex@digriz.org.uk>
In-Reply-To: <20090515150549.GE32684@woodchuck>
References: <20090511182801.GK32684@woodchuck>
	<1242395460.27996.249.camel@localhost.localdomain>
	<20090515150549.GE32684@woodchuck>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 18:31:26 +0300
Message-Id: <1242401486.27996.257.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-15 at 16:05 +0100, Alexander Clouter wrote:
> > You may keep this patch privately, work on your NAND driver,
> > and when you have it ready, you submit it with this at the
> > same time.
> > 
> Erm, it's been ready for a *long* time, about a year[1], and is being 
> used.  Recently the bits of my plat_nand impementation[2] is on it's way 
> to going mainline (Orion -> ARM -> Linus):

Ok, I thought you do not use this so far.

I've pushed your patch to l2-mtd-2.6.git. This does not guarantee
anything, just means I'll ping David to look at it and send upstream.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
