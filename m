Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHo4R-0004Wf-EE
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 10:49:56 +0000
Received: by mail-lj1-x241.google.com with SMTP id z21-v6so14366506ljz.0
 for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2018 03:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
 <20181019074908.13226-14-boris.brezillon@bootlin.com>
In-Reply-To: <20181019074908.13226-14-boris.brezillon@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Oct 2018 11:49:31 +0100
Message-ID: <CACRpkdZN_L_M+KRGKYjVM0FbKiT0=mRGVGS-EerXgWTCqif8=Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] dt-binding: mtd: physmap: Document the
 addr-gpios property
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 19, 2018 at 9:49 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
> Add documentation for the addr-gpios. This extension to the physmap
> binding allow creating flash devices that are paged using GPIOs.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - Drop Rob's R-b (waiting for a second review)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
