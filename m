Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbRnH-0006LW-Pu
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 14:33:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,  linux-mips@linux-mips.org,
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,  Richard
 Weinberger <richard@nod.at>,  Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org,  David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,  Marek Vasut
 <marek.vasut@gmail.com>,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 21/27] bcma: Allow selection of this driver when
 COMPILE_TEST=y
References: <20180705094522.12138-1-boris.brezillon@bootlin.com>
 <20180705094522.12138-22-boris.brezillon@bootlin.com>
Date: Fri, 06 Jul 2018 17:32:50 +0300
In-Reply-To: <20180705094522.12138-22-boris.brezillon@bootlin.com> (Boris
 Brezillon's message of "Thu, 5 Jul 2018 11:45:16 +0200")
Message-ID: <87zhz4tox9.fsf@purkki.adurom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> This allows us to increase compile-test coverage without having to build
> a kernel for MIPS.  That's particularly interesting for subsystem
> maintainers that want to test as many drivers as possible in a single
> build.
>
> We also add a dependency on HAS_IOMEM in BCMA_HOST_SOC to make sure the
> driver is not selected when the arch does not implement IO accessors.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/bcma/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Kalle Valo <kvalo@codeaurora.org>

I assume this patch will go via some other tree and I can drop it.

-- 
Kalle Valo
