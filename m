Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBN3X-0005OX-TP
 for linux-mtd@lists.infradead.org; Fri, 10 Jun 2016 14:05:04 +0000
Received: by mail-oi0-f65.google.com with SMTP id r4so13382521oib.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2016 07:04:43 -0700 (PDT)
Date: Fri, 10 Jun 2016 09:04:41 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/3] mtd: nand: Add an option to maximize the ECC
 strength
Message-ID: <20160610140441.GA4743@rob-hp-laptop>
References: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465398264-8202-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465398264-8202-2-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 08, 2016 at 05:04:22PM +0200, Boris Brezillon wrote:
> The generic NAND DT bindings allows one to tweak the ECC strength and
> step size to their need. It can be used to lower the ECC strength to
> match a bootloader/firmware config, but might also be used to get a better
> reliability.
> 
> In the latter case, the user might want to use the maximum ECC strength
> without having to explicitly calculate the exact value (this value not
> only depends on the OOB size, but also on the NAND controller, and can
> be tricky to extract).
> 
> Add a generic 'nand-ecc-maximize' DT property and the associated
> NAND_ECC_MAXIMIZE flag, to let ECC controller drivers select the best
> ECC strength and step-size on their own.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 9 +++++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/nand_base.c                   | 3 +++
>  include/linux/mtd/nand.h                       | 1 +
>  3 files changed, 13 insertions(+)
