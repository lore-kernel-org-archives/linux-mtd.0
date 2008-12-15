Message-ID: <4946E7DC.7010403@oracle.com>
Date: Mon, 15 Dec 2008 15:27:24 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for December 15 (MTD)
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
In-Reply-To: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-next@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20081212:
> 
> New tree:
> 	boot-params
> 
> Undropped tree:
> 	mtd


On i386 builds, I'm seeing

build-r7137.out:mtd_dataflash.c:(.text+0x10dff4): undefined reference to `__umoddi3'
build-r7137.out:mtd_dataflash.c:(.text+0x10e010): undefined reference to `__umoddi3'
build-r7137.out:mtd_dataflash.c:(.text+0x10e09f): undefined reference to `__udivdi3'

which are caused by % and / operations where the denominator is a variable:

	/* Sanity checks */
	if ((instr->addr + instr->len) > mtd->size
			|| (instr->len % priv->page_size) != 0
			|| (instr->addr % priv->page_size) != 0)
		return -EINVAL;

...
		/* Calculate flash page address; use block erase (for speed) if
		 * we're at a block boundary and need to erase the whole block.
		 */
		pageaddr = instr->addr / priv->page_size;


~Randy
