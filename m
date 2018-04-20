Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9bMN-000890-K9
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 19:06:17 +0000
Date: Fri, 20 Apr 2018 21:05:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/3] mtd: fix AMD/Intel flash bugs
Message-ID: <20180420210551.6e193d84@bbrezillon>
In-Reply-To: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu,  1 Mar 2018 14:39:38 +0100
Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:

> This fixes a bug which allows read/write to a erase block currently
> erasing.
> Also works around a chip bug in Micron 28F00AP30 chips.
> 
> Joakim Tjernlund (3):
>   cfi_cmdset_0001: Do not allow read/write to suspend erase block.
>   cfi_cmdset_0001: Workaround Micron Erase suspend bug.
>   cfi_cmdset_0002: Do not allow read/write to suspend erase block.
> 

All these patches have a Cc-stable tag but no Fixes tag. Can you add
a proper Fixes to each of them?

>  drivers/mtd/chips/cfi_cmdset_0001.c | 33 ++++++++++++++++++++++++++++-----
>  drivers/mtd/chips/cfi_cmdset_0002.c |  9 ++++++---
>  include/linux/mtd/flashchip.h       |  1 +
>  3 files changed, 35 insertions(+), 8 deletions(-)
> 
