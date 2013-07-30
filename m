Received: from mail-bk0-x232.google.com ([2a00:1450:4008:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V49t5-00075Q-Nl
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 13:22:52 +0000
Received: by mail-bk0-f50.google.com with SMTP id ik8so1612922bkc.23
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 06:22:29 -0700 (PDT)
Message-ID: <51F7BE11.2020101@gmail.com>
Date: Tue, 30 Jul 2013 15:22:25 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51F76EBA.1020504@gmail.com> <20130730095310.38400ca6@skate>
 <51F772FC.90404@gmail.com> <20130730101809.7c28525c@skate>
 <20130730131538.GB2375@localhost>
In-Reply-To: <20130730131538.GB2375@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 leiwen@marvell.com, haojian.zhuang@gmail.com, Chao Xie <chao.xie@marvell.com>,
 linux-mtd@lists.infradead.org, grinberg@compulab.co.il,
 Gregory Clement <gregory.clement@free-electrons.com>, eric.miao@marvell.com,
 computersforpeace@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30.07.2013 15:15, Ezequiel Garcia wrote:
> Hello Daniel,
> 
> On Tue, Jul 30, 2013 at 10:18:09AM +0200, Thomas Petazzoni wrote:
>> On Tue, 30 Jul 2013 10:02:04 +0200, Daniel Mack wrote:
>>> On 30.07.2013 09:53, Thomas Petazzoni wrote:
>>>> On Tue, 30 Jul 2013 09:43:54 +0200, Daniel Mack wrote:
>>>>> Interesting, because I'm working on a dmaengine implementation for
>>>>> PXA right now. I'm not even half through, but I'm making progress,
>>>>> and I'm not sure yet how to merge it. Because there won't be any
>>>>> migration path, it'll be a bigger set that has to go in in one in
>>>>> order to prevent build breakage.
>>>>
>>>> Aren't drivers/dma/mmp_pdma.c and drivers/dma/mmp_tdma.c already
>>>> dmaengine drivers for PXA ?
>>>
>>> Yes, I saw the pdma driver as well, after I started my own
>>> implementation. However, the tree is full of users of the proprietary
>>> API, and moving them over won't be gap-less.
>>
> 
> Mmmm.. I'm a bit confused by this: is your dmaengine driver any
> different/better from the already existent mmp_{p,t}dma.c ?

As I said, I saw this after I started my own implementation, which isn't
a big deal. At least, I now understand the internals of dmaengine
drivers :) The mmp_pdma looks suitable for PXA2xx chips, but it doesn't
work yet for me. I'll try and fix this first, and then port over all the
drivers.

> Here's a patch posted in July 2012 converting pxa3xx-nand to dmaengine.

Where?

> That patch was never merged because (just as Thomas says) both
> dma drivers (mmp dmaengine on one side, mach-pxa dma on the other) don't
> work together. In other words, you have to convert *all* drivers at the
> same time.
> 
> Thomas proposed an idea for this conversion a few months ago: (quoting
> him from IRC)
> 
> """
> First have a patch that reimplements the existing plat-pxa/dma.c API on
> top of dmaengine, so that you don't have to change any driver.
> Then, go through each driver, one per patch to switch to the dmaengine API.
> And finally get rid of the compatibility layer created in the first
> patch.
> """
> 
> Does this sound sane?

Unfortunately, no. I thought so too, but the problem is that all users
of the proprietary PXA DMA implementation access the registers directly,
and also allocate their own DMA coherent register space, which is
unneeded with a proper dmaengine implementation.

So there's nothing else we can do than really change all the drivers,
which is what I'm currently doing. I'll put you on Cc: once I post patches.


Thanks,
Daniel
