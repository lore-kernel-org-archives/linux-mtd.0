Received: from ozlabs.org ([103.22.144.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCDKR-00018k-DX
 for linux-mtd@lists.infradead.org; Tue, 07 Nov 2017 23:30:49 +0000
In-Reply-To: <20171103024146.17086-2-cyrilbur@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, stewart@linux.vnet.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, sjitindarsingh@gmail.com
Subject: Re: [v5,
 01/10] mtd: powernv_flash: Use WARN_ON_ONCE() rather than BUG_ON()
Message-Id: <3yWlz118m4z9s7C@ozlabs.org>
Date: Wed,  8 Nov 2017 10:30:20 +1100 (AEDT)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2017-11-03 at 02:41:37 UTC, Cyril Bur wrote:
> BUG_ON() should be reserved in situations where we can not longer
> guarantee the integrity of the system. In the case where
> powernv_flash_async_op() receives an impossible op, we can still
> guarantee the integrity of the system.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/44e2aa2b16a872fa8aa4901b379313

cheers
