Received: from mail-pf0-f195.google.com ([209.85.192.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvANY-0006U0-4Y
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 22:55:34 +0000
Received: by mail-pf0-f195.google.com with SMTP id h4so3028688pfk.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2017 15:55:11 -0700 (PDT)
Date: Thu, 21 Sep 2017 17:55:09 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] dt-bindings: nand: denali: reduce the register space in
 the example
Message-ID: <20170921225509.u5x7sxenxzx3lndm@rob-hp-laptop>
References: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 14, 2017 at 04:17:36PM +0900, Masahiro Yamada wrote:
> This example allocates too much for register regions.  Especially,
> there are only two registers in the "nand_data" interface of this
> hardware (ADDR: 0x00, DATA: 0x10).
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
