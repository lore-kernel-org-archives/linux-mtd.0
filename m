Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqqGp-0007TV-9p
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 20:20:36 +0000
Date: Wed, 11 Dec 2013 17:20:16 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH for v3.13 0/2] pxa3xx-nand fixes for v3.13
Message-ID: <20131211202015.GB5461@localhost>
References: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 10, 2013 at 09:57:14AM -0300, Ezequiel Garcia wrote:
> Two almost-oneline fixes intended for v3.13.
> 
> The first commit fixes a current problem that can be reproduced
> on PXA boards, when use_dma = 1 and after a device fails to be detected.
> The driver currently tries to release DMA resources that are not allocated.
> 
> The second commit fixes a problem that can be triggered on PXA boards
> by writing a blank page (0xff).
> The bug itself was found by Arnaud Ebalard while testing 2048B page size
> support on the Armada 370/XP variant, yet the bug can be reproduced on the
> driver's PXA variant.
> 
> Ezequiel Garcia (2):
>   mtd: nand: pxa3xx: Use info->use_dma to release DMA resources
>   mtd: nand: pxa3xx: Clear need_wait flag when starting a command
> 
>  drivers/mtd/nand/pxa3xx_nand.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Brian:

Do you plan to include these in a pull for Linus?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
