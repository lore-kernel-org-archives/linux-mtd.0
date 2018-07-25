Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiKa7-0000kp-V1
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 14:16:01 +0000
Date: Wed, 25 Jul 2018 08:15:47 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Marcel Ziswiler
 <marcel@ziswiler.com>, linux-mtd@lists.infradead.org, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, H Hartley Sweeten
 <hsweeten@visionengravers.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] mtd: nand: fix spelling in driver api documentation
Message-ID: <20180725081547.21ea6597@lwn.net>
In-Reply-To: <20180725092928.243bf07f@xps13>
References: <20180720075334.24254-1-marcel@ziswiler.com>
 <20180723093924.04af0e2f@lwn.net>
 <20180723181915.5f35f668@bbrezillon>
 <20180725092928.243bf07f@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 Jul 2018 09:29:28 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > > That's not a spelling mistake, that's a factual change.  I'll apply the
> > > patch since it appears to be correct, but will be tweaking the changelog.    
> > 
> > I think Miquel had planned to apply this patch to the NAND tree, but we
> > don't seem to have conflicting changes on this file, so feel free to
> > take it in the doc tree.
> > 
> > Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>  
> 
> Can you confirm you will take this patch?

Yeah, that's what the "I'll apply the patch" part above means :)  It's
already in docs-next.

Thanks,

jon
