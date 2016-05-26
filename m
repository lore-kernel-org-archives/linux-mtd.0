Date: Wed, 25 May 2016 20:10:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Brown <broonie@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] Revert "mtd: atmel_nand: Support variable RB_EDGE
 interrupts"
Message-ID: <20160526031005.GA137092@google.com>
References: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
 <1462776680-5284-2-git-send-email-wenyou.yang@atmel.com>
 <20160523095557.1efea63d@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160523095557.1efea63d@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, May 23, 2016 at 09:55:57AM +0200, Boris Brezillon wrote:
> On Mon, 9 May 2016 14:51:18 +0800
> Wenyou Yang <wenyou.yang@atmel.com> wrote:
> 
> > This reverts commit 5ddc7bd43ccc ("mtd: atmel_nand: Support variable
> > RB_EDGE interrupts")
> > 
> > Because for current SoCs, the RB_EDGE3(i.e. bit 27) of HSMC_SR
> > register does not exist, the RB_EDGE0 (i.e. bit 24) is the ready/busy
> > line edge status bit. It is a datasheet bug.
> > 
> > Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> 
> Wenyou, I know you sent it before v4.6 was released, but now we should
> probably add

Sorry for the delay...

> Cc: <stable@vger.kernel.org>

Added that and a Fixes: tag.

> Brian, can you apply this patch directly in your tree (as previously
> discussed, I'm not sure creating a nand/fixes branch is really useful)?

Pushed to linux-mtd.git. I'll probably send it to Linus in the next day
or two.

Brian
