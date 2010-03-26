Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NuzSI-0000QQ-Ux
	for linux-mtd@lists.infradead.org; Fri, 26 Mar 2010 02:39:31 +0000
Date: Fri, 26 Mar 2010 02:39:22 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: Enabling D-cache for OneNAND bufferram
Message-ID: <20100326023922.GM19308@shareable.org>
References: <4BAA11DF.3060306@algotrim.com>
	<OF34D80617.67587BAB-ONC12576F0.00554519-C12576F0.005583EF@transmode.se>
	<4BAB4186.5080805@algotrim.com>
	<OF3A2BD3B7.06165486-ONC12576F1.003DEF5F-C12576F1.003E8F26@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF3A2BD3B7.06165486-ONC12576F1.003DEF5F-C12576F1.003E8F26@transmode.se>
Cc: linux-mtd@lists.infradead.org, Leo Barnes <leo.barnes@algotrim.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> ioremap returns a *second* mapping to the same RAM so you first
> original mapping should be fine.

Note that having two mappings with different attributes to the same
address is architecturally prohibited on (at least) some ARMs.
I.e. it may not behave correctly.

Then again, dma_alloc_coherent has to do it.  But be careful!
Remember to flush the cache before unmapping the cached area
if the driver has an exit function.

-- Jamie
