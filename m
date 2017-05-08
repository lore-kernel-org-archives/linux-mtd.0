Received: from mail-oi0-f66.google.com ([209.85.218.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7lVF-0002nv-0k
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 16:27:18 +0000
Received: by mail-oi0-f66.google.com with SMTP id h4so10179264oib.0
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 09:26:56 -0700 (PDT)
Date: Mon, 8 May 2017 11:26:55 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpio: update binding
Message-ID: <20170508162655.hibk4khq5bsrcpsg@rob-hp-laptop>
References: <20170503121824.DD82C67889@pc13941vm.idsi0.si.c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170503121824.DD82C67889@pc13941vm.idsi0.si.c-s.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 03, 2017 at 02:18:24PM +0200, Christophe Leroy wrote:
> This patch updates the binding documentation in accordance with
> commit 44dd182861f99 ("mtd: nand: gpio: make nCE GPIO optional")
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reported-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpio-control-nand.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
