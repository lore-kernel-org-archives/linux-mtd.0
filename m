Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8cm2-0008RG-P3
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 01:20:12 +0000
Received: by mail-pg0-x244.google.com with SMTP id i63so1474560pgd.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 May 2017 18:19:50 -0700 (PDT)
Date: Wed, 10 May 2017 18:19:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpio: update binding
Message-ID: <20170511011946.GC70297@google.com>
References: <20170503121824.DD82C67889@pc13941vm.idsi0.si.c-s.fr>
 <20170508162655.hibk4khq5bsrcpsg@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170508162655.hibk4khq5bsrcpsg@rob-hp-laptop>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 08, 2017 at 11:26:55AM -0500, Rob Herring wrote:
> On Wed, May 03, 2017 at 02:18:24PM +0200, Christophe Leroy wrote:
> > This patch updates the binding documentation in accordance with
> > commit 44dd182861f99 ("mtd: nand: gpio: make nCE GPIO optional")
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Reported-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/gpio-control-nand.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>

Applied to l2-mtd.git
