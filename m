Date: Wed, 13 Apr 2016 18:14:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin
 Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Nicolas
 Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard
 <plagnioj@jcrosoft.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Wenyou Yang
 <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Stefan Agner <stefan@agner.ch>, Kyungmin Park
 <kyungmin.park@samsung.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, punnaiah choudary kalluri
 <punnaia@xilinx.com>, Priit Laes <plaes@plaes.org>, Kamal Dasu
 <kdasu.kdev@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-api@vger.kernel.org, Harvey Hunt <harvey.hunt@imgtec.com>, Archit
 Taneja <architt@codeaurora.org>, Han Xu <b45815@freescale.com>, Huang
 Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH v5 00/52] mtd: rework ECC layout definition
Message-ID: <20160413181450.449634a5@bbrezillon>
In-Reply-To: <1459354505-32551-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459354505-32551-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 Mar 2016 18:14:15 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
> 
> Hopefully the last version of this patchset (but don't be sad, I'm not
> done bothering you with NAND related patches :-)).
> 
> If possible, I'd like to have as much Tested/Reviewed/Acked-by tags as
> possible, particularly on the changes done in arch/arm and arch/mips
> (since the last set of commits depends on those changes, I'd like to
> take them in my nand/next branch, even if this imply creating an
> immutable branch for the ARM and MIPS maintainers).

It's been around for quite some time now, and got several
Acked/Tested/Reviewed-by tags. Let's push that on nand/next and see if
someone complains in which case I drop those patches before sending my
PR to Brian.

Thanks for your reviews.

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
