Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aSAri-0004AR-VN
 for linux-mtd@lists.infradead.org; Sat, 06 Feb 2016 21:58:16 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Josh Wu <josh.wu@atmel.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Stefan Agner <stefan@agner.ch>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, punnaiah choudary kalluri <punnaia@xilinx.com>,
 Priit Laes <plaes@plaes.org>
Subject: Re: [PATCH v2 20/51] mtd: docg3: switch to mtd_ooblayout_ops
References: <1454580434-32078-1-git-send-email-boris.brezillon@free-electrons.com>
 <1454580434-32078-21-git-send-email-boris.brezillon@free-electrons.com>
Date: Sat, 06 Feb 2016 22:57:39 +0100
In-Reply-To: <1454580434-32078-21-git-send-email-boris.brezillon@free-electrons.com>
 (Boris Brezillon's message of "Thu, 4 Feb 2016 11:06:43 +0100")
Message-ID: <87y4ax33jg.fsf@belgarion.home>
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

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Replace the nand_ecclayout definition by the equivalent mtd_ooblayout_ops
> definition.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
