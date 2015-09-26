Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfvrO-0001vy-6z
 for linux-mtd@lists.infradead.org; Sat, 26 Sep 2015 20:14:18 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx-nand: switch to dmaengine
References: <1441545167-23383-1-git-send-email-robert.jarzmik@free.fr>
Date: Sat, 26 Sep 2015 22:08:47 +0200
In-Reply-To: <1441545167-23383-1-git-send-email-robert.jarzmik@free.fr>
 (Robert Jarzmik's message of "Sun, 6 Sep 2015 15:12:47 +0200")
Message-ID: <87eghleyeo.fsf@belgarion.home>
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

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Now pxa architecture has a dmaengine driver, remove the access to direct
> dma registers in favor of the more generic dmaengine code.
>
> This should be also applicable for mmp and orion, provided they work in
> device-tree environment.
>
> This patch also removes the previous hack which was necessary to make
> the driver work in a devicetree environment.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> Since v1: dma_unmap_sg() line break fix
Hi Brian,

Could you stage this to your next tree please ?

Cheers.

--
Robert
