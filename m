Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4xoe-00010g-2J
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 13:51:27 +0000
Subject: Re: [PATCH] [REPOST] mtd: extend plat_nand for (read|write)_buf
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Clouter <alex@digriz.org.uk>
In-Reply-To: <20090511182801.GK32684@woodchuck>
References: <20090511182801.GK32684@woodchuck>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 16:51:00 +0300
Message-Id: <1242395460.27996.249.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hsweeten@visionengravers.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-11 at 19:28 +0100, Alexander Clouter wrote:
> This patch adds (write|read)_buf callbacks to plat_nand.
> 
> The NAND on the TS-7800 provisioned by the FPGA allows readw() and 
> readl() to be used which gives a 2.5x speed up.  To be able to use this 
> from the plat_nand driver a hook for read_buf (and also write_buf whilst 
> we are in there) need to be made available.  This patch adds the hook.
> 
> This is a repost[1] of a feature asked for before[2], plus other helpful 
> patches to plat_nand[3] would be welcomed if at all possible too.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024747.html
> [2] http://lists.infradead.org/pipermail/linux-mtd/2007-October/019659.html
> [3] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024780.html
> 
> Signed-off-by: Alexander Clouter <alex@digriz.org.uk>

I think this should be submitted with the user at the same
time. Adding hooks without having a user is not very good.
E.g., you may find out later that this does not help, or
cancel your project, or end up with different call-backs,
etc.

You may keep this patch privately, work on your NAND driver,
and when you have it ready, you submit it with this at the
same time.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
