Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRKyC-0008Jx-Nu
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2016 14:33:46 +0000
Date: Thu, 4 Feb 2016 15:20:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lucas Stach <dev@lynxeye.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding
 <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-tegra@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 0/5] Tegra 2 NAND Flash Support
Message-ID: <20160204152019.3995f5cc@bbrezillon>
In-Reply-To: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
References: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lucas,

Sorry for the late reply, but in my defence, I was not in Cc of the
different iterations of this series.

On Mon,  2 Nov 2015 21:33:17 +0100
Lucas Stach <dev@lynxeye.de> wrote:

> Hi all,
> 
> New and hopefully last round of the Tegra NAND controller driver.
> I fixed some last bugs that people found during review and testing
> and I think the driver is ready for merging.
> 
> v4 fixes some minor errors in the ECC handling and makes timing
> calculations a bit more conservative.

Some of the comments I made on your v1 were left unanswered (and were
not addressed in your new versions). Can you address them or let me
know why you can't?

For example, I still think your NAND controller should be represented
with its own node in the DT, and all NAND devices as child nodes of the
controller node.
I also think you should create ECC layout dynamically instead of
defining a new one for each new OOB size value.

Also, could you confirm that you driver supports raw accesses (I think
it does, but I'd like to be sure)?

Thanks,

Boris



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
