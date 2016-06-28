Received: from mail-qk0-f195.google.com ([209.85.220.195])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bI03S-0003f0-0f
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 20:56:23 +0000
Received: by mail-qk0-f195.google.com with SMTP id j2so5884230qkf.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2016 13:56:01 -0700 (PDT)
Date: Tue, 28 Jun 2016 15:55:55 -0500
From: Rob Herring <robh@kernel.org>
To: Han Xu <han.xu@nxp.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, pawel.moll@arm.com,
 mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 galak@codeaurora.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/6] Documentation: dt: mtd: gpmi: document the new
 supported chip in DT
Message-ID: <20160628205555.GJ3737@rob-hp-laptop>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
 <1466804411-19874-7-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466804411-19874-7-git-send-email-han.xu@nxp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2016 at 04:40:11PM -0500, Han Xu wrote:
> listed all supported chips in DT.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
