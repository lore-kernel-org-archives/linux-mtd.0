Received: from mail-bk0-f46.google.com ([209.85.214.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMlkG-0000gz-MO
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 21:26:41 +0000
Received: by mail-bk0-f46.google.com with SMTP id 6so3624249bkj.5
 for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2013 14:26:03 -0700 (PDT)
Message-ID: <523B6BE9.1000104@gmail.com>
Date: Thu, 19 Sep 2013 23:26:01 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <523B38BE.2010203@gmail.com> <20130919211727.GC3369@localhost>
In-Reply-To: <20130919211727.GC3369@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19.09.2013 23:17, Ezequiel Garcia wrote:
> On Thu, Sep 19, 2013 at 07:47:42PM +0200, Daniel Mack wrote:

>> However, it seems that with CONFIG_HAS_DMA=y, pxa3xx_nand_irq() is now
>> called before pxa3xx_nand_init_buff(), which results in a NULL pointer
>> dereference.
> 
> Yup, the problem is very clear: pxa3xx_nand_irq() is now called before
> pxa3xx_nand_init_buff() because there must be a first device detection
> to know which size the page will be. Then pxa3xx_nand_init_buff() is
> called with this detected page size.
> 
> See the first patch "Allocate data buffer on detected flash size", which
> removes the need to always allocate a buffer as big as the biggest page,
> and tries to be smarter.
> 
> Of course, this doesn't work for DMA transfers. I guess the first device
> detection should be done by PIO always.

Yes, that was my idea as well.

> If you agree with this I'll re-work the patches.

Please do, I'll go test again :)


Daniel
