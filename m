Received: from up.free-electrons.com ([94.23.35.102]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4q0z-0003Fu-UJ
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 10:21:50 +0000
Date: Thu, 1 Aug 2013 07:21:20 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
Message-ID: <20130801102119.GA2410@localhost>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51FA357B.9000804@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51FA357B.9000804@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, linux-mtd@lists.infradead.org,
 grinberg@compulab.co.il, Gregory Clement <gregory.clement@free-electrons.com>,
 eric.miao@marvell.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>,
 nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 01, 2013 at 12:16:27PM +0200, Daniel Mack wrote:
> On 30.07.2013 01:24, Ezequiel Garcia wrote:
> > I'm Ccing some past pxa3xx-nand testers and reviewers, with the hope
> > they can take a look at this new patchset.
> > 
> > Any feedback and testing will be highly appreciated!
> 
> I take it that you use this driver without DMA on your Armada 370/XP?
> 
> Before implementing the dmaengine bits, I wanted to make sure that the
> driver still works on a PXA3xx in PIO mode with your latest patch set.
> But unfortunately, it doesn't (ARCH_HAS_DMA is made undefined for this
> test):
> 
> [    2.534138] pxa3xx-nand pxa3xx-nand: This platform can't do DMA on
> this device
> [    2.733782] pxa3xx-nand pxa3xx-nand: Wait time out!!!
> [    2.933807] pxa3xx-nand pxa3xx-nand: Wait time out!!!
> [    3.133806] pxa3xx-nand pxa3xx-nand: Wait time out!!!
> [    3.138908] No NAND device found
> [    3.142216] pxa3xx-nand pxa3xx-nand: failed to scan nand at cs 0
> 
> Any idea?
> 
> 

Probably one of the patches is wrong. Could you do a git-bisect?

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
