Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zir97-0005IL-NN
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2015 21:48:42 +0000
Received: by wicgb1 with SMTP id gb1so95014472wic.1
 for <linux-mtd@lists.infradead.org>; Sun, 04 Oct 2015 14:48:19 -0700 (PDT)
Date: Sun, 4 Oct 2015 22:48:16 +0100
From: Brian Norris <computersforpeace@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Roland Stigge <stigge@antcom.de>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/3] mtd: nand: lpc32xx_slc: fix calculation of timing
 arcs from given values
Message-ID: <20151004214816.GB27301@localhost>
References: <1443655417-14689-1-git-send-email-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443655417-14689-1-git-send-email-vz@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 02:23:34AM +0300, Vladimir Zapolskiy wrote:
> The changeset is intended to accelerata read/write speed of LPC32xx SLC
> controller improving configuration of controller timing arcs.
> 
> Patch 2/3 is a defensive check against an unlikely case, when controller's
> clock rate is too high.
> 
> Thanks to Brian Norris for review and the idea of v2 3/3 improvement.
> 
> Vladimir Zapolskiy (3):
>   mtd: nand: lpc32xx_slc: improve SLCTAC_*() macro definitions
>   mtd: nand: lpc32xx_slc: fix potential overflow over 4 bits
>   mtd: nand: lpc32xx_slc: fix calculation of timing arcs from given values

All looks good to me. I won't hold my breath for Roland. Pushed to
l2-mtd.git, and if we get any further comments, we can address them
then.

Thanks,
Brian
