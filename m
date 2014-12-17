Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1EbP-000255-F0
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 13:25:20 +0000
Date: Wed, 17 Dec 2014 14:24:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH RFC] Alphascale ASM9260 NAND controller driver
Message-ID: <20141217142455.5970987e@bbrezillon>
In-Reply-To: <1418816718-29764-1-git-send-email-linux@rempel-privat.de>
References: <1418816718-29764-1-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Oleksij,

On Wed, 17 Dec 2014 12:45:17 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> I collected some questions with this driver. It will be great if you
> can help me:
> * Do HW_ECC driver should provideo option for SW_ECC?

This is not mandatory. I did it in the sunxi driver for testing
purpose, but it should work fine without it.

> * My HW do ECC correction for n-bits per 512B, it mean it will
> split block in 512B parts. If one of part has uncorrectable error, complete block will be
> reported as failed. Are there any way for partial recovery?

I think what you're calling block here is actually a page.
Regarding your question, there is no way to recover part of a page, but
each ECC block should be tested and max_bitflip should be returned
(even if some ECC blocks contains too many errors to be corrected).
Take a look at [1] for an example.

> * This HW reports count of ECC bitflips for each part. Do i need to return count of errors on
> all parts for one block?

Again: block == page, and no, you should only return the maximum
corrected bitflips (same example [1]).


> * If HW_ECC different stranges, how it should be configured? With DT or automatically
> calculated?

I don't get that one...
Are you talking about ECC requirements (ECC strength and steps) ?

Best Regards,

Boris

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L1157

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
