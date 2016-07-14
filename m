Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNVGu-0002NC-H6
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 01:17:01 +0000
Received: by mail-pf0-x242.google.com with SMTP id g202so3989767pfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 18:16:40 -0700 (PDT)
Date: Wed, 13 Jul 2016 18:16:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, marex@denx.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: atmel-quadspi: add binding file for
 Atmel QSPI driver
Message-ID: <20160714011637.GF54628@google.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
 <dee7a0e8e6b6fec134a79432a9bcb1553c056ad8.1465830154.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dee7a0e8e6b6fec134a79432a9bcb1553c056ad8.1465830154.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 13, 2016 at 05:10:25PM +0200, Cyrille Pitchen wrote:
> This patch documents the DT bindings for the driver of the Atmel QSPI
> controller embedded inside sama5d2x SoCs.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Pushed this patch to l2-mtd.git. Comments on the other.
