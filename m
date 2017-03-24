Received: from mail-ot0-f194.google.com ([74.125.82.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crRZj-00046V-LN
 for linux-mtd@lists.infradead.org; Fri, 24 Mar 2017 15:56:32 +0000
Received: by mail-ot0-f194.google.com with SMTP id i50so742143otd.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Mar 2017 08:56:06 -0700 (PDT)
Date: Fri, 24 Mar 2017 10:56:04 -0500
From: Rob Herring <robh@kernel.org>
To: Artur Jedrysek <jartur@cadence.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3, 4/4] dt-bindings: mtd: Add Octal SPI support to
 Cadence QSPI.
Message-ID: <20170324155604.2qwk3x3tz7bk5son@rob-hp-laptop>
References: <1490008935-28900-1-git-send-email-jartur@cadence.com>
 <1490009254-4284-1-git-send-email-jartur@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490009254-4284-1-git-send-email-jartur@cadence.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 20, 2017 at 11:27:34AM +0000, Artur Jedrysek wrote:
> This patch updates Cadence QSPI Device Tree documentation to include
> information about new compatible used to indicate, whether or not
> Octal SPI transfers are supported by the device.
> 
> Signed-off-by: Artur Jedrysek <jartur@cadence.com>
> ---
> Changelog:
> v2: Use new compatible, instead of boolean property, to indicate
> Octal SPI support.
> ---
> v3: Changes according to comments.
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
