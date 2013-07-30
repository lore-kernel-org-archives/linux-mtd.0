Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V44t3-0003ph-Cg
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 08:02:29 +0000
Received: by mail-ee0-f43.google.com with SMTP id e52so1622179eek.30
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 01:02:07 -0700 (PDT)
Message-ID: <51F772FC.90404@gmail.com>
Date: Tue, 30 Jul 2013 10:02:04 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51F76EBA.1020504@gmail.com> <20130730095310.38400ca6@skate>
In-Reply-To: <20130730095310.38400ca6@skate>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, linux-mtd@lists.infradead.org,
 grinberg@compulab.co.il, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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

On 30.07.2013 09:53, Thomas Petazzoni wrote:
> On Tue, 30 Jul 2013 09:43:54 +0200, Daniel Mack wrote:
>> Interesting, because I'm working on a dmaengine implementation for PXA
>> right now. I'm not even half through, but I'm making progress, and I'm
>> not sure yet how to merge it. Because there won't be any migration path,
>> it'll be a bigger set that has to go in in one in order to prevent build
>> breakage.
> 
> Aren't drivers/dma/mmp_pdma.c and drivers/dma/mmp_tdma.c already
> dmaengine drivers for PXA ?

Yes, I saw the pdma driver as well, after I started my own
implementation. However, the tree is full of users of the proprietary
API, and moving them over won't be gap-less.

> Considering the amount of time it will take for PXA to migrate over to
> the dmaengine API, I think we'd want those clean up patches to go in
> first, so that in parallel to the work you're doing on PXA dmaengine
> usage, we can move forward with improving the pxa3xx_nand driver to
> make it usable on Armada 370/XP.

Ok, fine. I'll rework my set on top of Ezequiel's then.



Thanks,
Daniel
