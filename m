Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGzMN-0005kR-F2
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 01:27:28 +0000
Received: by mail-pa0-x236.google.com with SMTP id cy9so244855607pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 17:27:07 -0800 (PST)
Date: Wed, 6 Jan 2016 17:27:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 alex@alex-smith.me.uk, Alex Smith <alex.smith@imgtec.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v11 1/3] dt-bindings: binding for jz4780-{nand,bch}
Message-ID: <20160107012704.GW109450@google.com>
References: <1451910884-18710-1-git-send-email-harvey.hunt@imgtec.com>
 <1451910884-18710-2-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451910884-18710-2-git-send-email-harvey.hunt@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 12:34:42PM +0000, Harvey Hunt wrote:
> From: Alex Smith <alex.smith@imgtec.com>
> 
> Add DT bindings for NAND devices connected to the NEMC on JZ4780 SoCs,
> as well as the hardware BCH controller, used by the jz4780_{nand,bch}
> drivers.
> 
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: robh@kernel.org
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> v10 -> v11:
>  - Added Boris Brezillon's Reviewed-By.

Applied just patch 1 for now. I had some small comments on patch 2. And
you need to send patch 3 to linux-mips and the MIPS maintainer.

Brian
