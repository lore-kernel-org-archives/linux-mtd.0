Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyP5O-00016Z-5B
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 19:05:07 +0000
Received: from localhost.localdomain ([127.0.0.1]:59700 "EHLO linux-mips.org"
 rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
 id S27013948AbbKPTEn5Nqv8 (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 16 Nov 2015 20:04:43 +0100
Date: Mon, 16 Nov 2015 20:04:39 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Subject: Re: [PATCH] mtd: jz4740_nand: fix build on jz4740 after removing
 gpio.h
Message-ID: <20151116190439.GD9425@linux-mips.org>
References: <1447284976-96693-1-git-send-email-computersforpeace@gmail.com>
 <20151116132328.GB9425@linux-mips.org>
 <20151116184917.GM8456@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151116184917.GM8456@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 10:49:17AM -0800, Brian Norris wrote:

> Actually, if you don't mind, I'll take it through MTD. I think I'll have
> a few things to push upstream this week anyway, and I'd like to get some
> of my MIPS-based build test configs working again in my development
> trees.
> 
> So...pushed to linux-mtd.git

Cool, thanks!

  Ralf
