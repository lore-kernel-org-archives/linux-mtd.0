Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zrqvt-0001Zj-V5
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 17:24:15 +0000
From: Marek Vasut <marex@denx.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
Date: Thu, 29 Oct 2015 18:23:47 +0100
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <87611qjibi.fsf@belgarion.home> <20151029082448.2a89c791@bbrezillon>
In-Reply-To: <20151029082448.2a89c791@bbrezillon>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201510291823.47976.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, October 29, 2015 at 08:24:48 AM, Boris Brezillon wrote:
> Hi Robert,

Hi!

> On Thu, 29 Oct 2015 07:32:33 +0100
> 
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > Marek Vasut <marex@denx.de> writes:
> > >> Isn't there the case of a single NAND controller with 2 identical
> > >> chips, each a 8 bit NAND chip, and the controller aggregating them to
> > >> offer the OS a single 16-bit NAND chip ?
> 
> Honestly, I don't know how this can possibly work, do you have a real
> example of that use case.
> 
> Here are a few reasons making it impossible:
> 
> 1/ NAND are accessed using specific command sequences, and those
> commands and addresses cycles are sent on through the data bus (AFAIR
> only the lower 8bits of a 16bits bus are used for those
> command/address cycles), so even if you connect the CLE/ALE/CS/RB pins
> on both chips, the one connected on the MSB side of the data bus will
> just receive garbage during the command/address sequences, and your
> program/read operations won't work

Unless you duplicate the command to both MSB and LSB.

> 2/ NAND chips can have bad blocks, so even if you were able to address
> 2 chips (which according to #1 is impossible), you might try to write
> on a bad block on the chip connected on the MSB side of the data bus.

This one is a valid problem. The other valid issue here is where the
command might fail on one chip and pass on the other.

> 3/ There probably are plenty of other reasons why this is not
> possible ;-).

It's possible, implementable, but a really bad idea.

Best regards,
Marek Vasut
