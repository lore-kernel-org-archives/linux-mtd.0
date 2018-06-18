Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV0GP-0006ij-3f
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 19:56:35 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 00/14] ARM: pxa: switch to DMA slave maps
References: <20180617170217.24177-1-robert.jarzmik@free.fr>
 <20180618104159.24b9fffb@bbrezillon>
Date: Mon, 18 Jun 2018 21:56:20 +0200
In-Reply-To: <20180618104159.24b9fffb@bbrezillon> (Boris Brezillon's message
 of "Mon, 18 Jun 2018 10:41:59 +0200")
Message-ID: <87d0wnrhqz.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> Hi Robert,
>
> On Sun, 17 Jun 2018 19:02:03 +0200
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
>> As I gathered almost all the required acks, this is an information only post
>> before queuing to the PXA tree.
>
> We'll need an immutable branch/tag containing those changes, just in
> case other conflicting changes get submitted to the NAND driver.
Sure, this branch will be usable from next Wednesday onward, here :
 - git fetch https://github.com/rjarzmik/linux.git
   tags/pxa-for-4.19-dma_slave_map

I must insist on "Wednesday", as I need to have one last pass from 0-day kernel
checker to be fully covered, and I'd like as well to know which tree the ASoC
patch will take, ie. if Mark commits to take it, or rather wants to pull from
the imutable branch.

Until Wednesday, even if the branch exist, consider it doesn't please, and
Thursday morning you can pull if you wish.

Cheers.

-- 
Robert
