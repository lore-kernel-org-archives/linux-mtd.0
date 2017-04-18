Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0Nmb-0002PO-Aa
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 07:42:42 +0000
Date: Tue, 18 Apr 2017 09:42:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 0/6] Introduction to SPI NAND framework
Message-ID: <20170418094220.290fb27f@bbrezillon>
In-Reply-To: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
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

Hi Peter,

On Mon, 10 Apr 2017 15:51:47 +0800
Peter Pan <peterpandong@micron.com> wrote:

> First of all, thank Boris, Marek and Cyrille for your comments
> on v4 and thank Arnaud for your testing on v4. Since I'm quite
> busy last week, I failed to reply all the comments, I'm really
> sorry for that.
> 
> According to Boris's suggestion, I rebased my patches on nand/next
> branch with Boris's generic NAND patches. This time I only send
> my SPI NAND patches out since it's the focus.
> 
> I created my own branch for convenience[3]. You can find both
> my SPI NAND patches and Boris's generic NAND framework patches.
> 
> This series introductes a SPI NAND framework.
> SPI NAND is a new NAND family device with SPI protocol as
> its interface. And its command set is totally different
> with parallel NAND.
> 
> Our first attempt was more than 2 years ago[1]. At that
> time, I didn't make BBT shareable and there were too many
> duplicate code with parallel NAND, so that serie stoped.
> But the discussion never stops. Now Boris has a plan to
> make a generic NAND framework which can be shared with
> both parallel and SPI NAND. Now the first step of the
> new generic NAND framework is finished. And it is waiting
> for a user. After discussion with Boris. We both think it's
> time to rebuild SPI NAND framework based on the new NAND
> framework and send out for reviewing.
> 
> This series is based on Boris's nand/generic branch[2], which
> is on 4.11-rc1. In this serie, BBT code is totally shared.
> Of course SPI NAND can share more code with parallel, this
> requires to put more in new NAND core (now only BBT included).
> I'd like to send this serie out first, then we can decide
> which part should be in new NAND core.
> 
> This series only supports basic SPI NAND features and uses
> generic spi controller for data transfer, on-die ECC for data
> correction. Support advanced features and specific SPI NAND
> controller with hardware ECC is the next step.
> 
> This series is tested on Xilinx Zedboard with Micron
> MT29F2G01ABAGDSF SPI NAND chip.

I think we're almost good here. Just need to address the comments made
by Marek an I and you can send a v6 containing all the materials
(including my generic-NAND layer).

If you don't mind, I'd recommend that we keep ECC support for later, or
at least separate the code in different patches so I can take
everything expect that if I'm not happy with the code.

Hopefully, everything should be ready for 4.13 (finally :-)).

Thanks for your patience.

Boris
