Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0XpA-00005g-6v
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 15:44:41 +0000
Received: from localhost.localdomain ([127.0.0.1]:47356 "EHLO linux-mips.org"
 rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
 id S27008822AbaLOPoTIzaGY (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 15 Dec 2014 16:44:19 +0100
Date: Mon, 15 Dec 2014 16:44:08 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] mtd: nand: jz4740: Convert to GPIO descriptor API
Message-ID: <20141215154408.GD9382@linux-mips.org>
References: <1417549706-28420-1-git-send-email-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417549706-28420-1-git-send-email-lars@metafoo.de>
Cc: linux-mips@linux-mips.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 02, 2014 at 08:48:26PM +0100, Lars-Peter Clausen wrote:

> Use the GPIO descriptor API instead of the deprecated legacy GPIO API to
> manage the busy GPIO.
> 
> The patch updates both the jz4740 nand driver and the only user of the driver
> the qi-lb60 board driver.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> This patch should preferably be merged through the MTD tree with Ralf's ack for
> the MIPS bits.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

Though in my experience MIPS-specific patches to non-arch/mips code receive
best testing in the MIPS tree.

Cheers,

  Ralf
