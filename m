Received: from mail-ea0-x22c.google.com ([2a00:1450:4013:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V44bT-0003J0-Bd
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 07:44:19 +0000
Received: by mail-ea0-f172.google.com with SMTP id q10so3389014eaj.17
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 00:43:57 -0700 (PDT)
Message-ID: <51F76EBA.1020504@gmail.com>
Date: Tue, 30 Jul 2013 09:43:54 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Ezequiel,

On 30.07.2013 01:24, Ezequiel Garcia wrote:
> It's also worth noting that since pxa3xx has a mach-specific
> DMA API, I'm including a few patches to ifdef such pxa-specific
> code in non PXA/MMP platforms. This ugly workaround should be
> removed once the specific DMA API is replaced by dmaengine.

Interesting, because I'm working on a dmaengine implementation for PXA
right now. I'm not even half through, but I'm making progress, and I'm
not sure yet how to merge it. Because there won't be any migration path,
it'll be a bigger set that has to go in in one in order to prevent build
breakage.

Your patches will cause merge conflicts against mine, so I'm not sure
whether I should rebase my work on top of yours or if you should wait
until I'm finished.


Daniel
