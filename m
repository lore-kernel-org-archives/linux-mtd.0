Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajNS1-0007Wb-FD
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 08:50:37 +0000
Date: Fri, 25 Mar 2016 09:50:15 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com, Peter
 Pan <peterpandong@micron.com>
Subject: Re: [PATCH 00/11] mtd: nand_bbt: introduce independent nand BBT
Message-ID: <20160325095015.341a11eb@bbrezillon>
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
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

On Mon, 14 Mar 2016 02:47:53 +0000
Peter Pan <peterpansjtu@gmail.com> wrote:

> Sorry for send the v3 out late. I went through a busy time in the past
> two month.
> 
> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> onenand has own bbt(onenand_bbt.c).
> 
> Separate struct nand_chip from BBT code can make current BBT shareable.
> We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
> Struct nand_bbt contains all the information BBT needed from outside and
> it should be embedded into NAND family chip struct (such as struct nand_chip).
> 
> Below is mtd folder structure we want:
> 	drivers/mtd/nand/<all-nand-core-code>
> 	drivers/mtd/nand/raw/<raw-nand-controller-drivers>
> 	drivers/mtd/nand/spi/<spi-nand-code>
> 	drivers/mtd/nand/onenand/<onenand-code>
> 	drivers/mtd/nand/chips/<manufacturer-spcific-code>

Hm, we should have a chips directory under each interface type, because
vendor specific handling is dependent on the NAND interface.
Otherwise, yes, that's the idea.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
