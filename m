Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5Sb-00029x-UN
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 08:06:12 +0000
Subject: Re: [PATCH 00/11] Introduction to SPI NAND framework
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <8d67a301-cc8d-276a-12f5-4e5db24a8abc@nod.at>
Date: Tue, 21 Feb 2017 09:05:44 +0100
MIME-Version: 1.0
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter,

Am 21.02.2017 um 08:59 schrieb Peter Pan:
> This serie introductes a SPI NAND framework.
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
> This serie is based on Boris's nand/generic branch[2], which
> is on 4.9-rc1. In this serie, BBT code is totally shared.
> Of course SPI NAND can share more code with parallel, this
> requires to put more in new NAND core (now only BBT included).
> I'd like to send this serie out first, then we can decide
> which part should be in new NAND core.
> 
> This serie only supports basic SPI NAND features and uses
> generic spi controller for data transfer, on-die ECC for data
> correction. Support advanced features and specific SPI NAND
> controller with hardware ECC is the next step.

Can you please share on which SPI NAND chips this got tested?

Thanks,
//richard
