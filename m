Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atX9m-0000Yx-57
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 09:13:47 +0000
Date: Fri, 22 Apr 2016 11:13:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH 4/4] mtd: nandsim: add __init attribute
Message-ID: <20160422111324.3fa42372@bbrezillon>
In-Reply-To: <1461069215-22795-5-git-send-email-Julia.Lawall@lip6.fr>
References: <1461069215-22795-1-git-send-email-Julia.Lawall@lip6.fr>
 <1461069215-22795-5-git-send-email-Julia.Lawall@lip6.fr>
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

On Tue, 19 Apr 2016 14:33:35 +0200
Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Add __init attribute on functions that are only called from other __init
> functions and that are not inlined, at least with gcc version 4.8.4 on an
> x86 machine with allyesconfig.  Currently, the functions are put in the
> .text.unlikely segment.  Declaring them as __init will cause them to be
> put in the .init.text and to disappear after initialization.
> 
> The result of objdump -x on the functions before the change is as follows:
> 
> 000000000000059a l     F .text.unlikely 0000000000000239 alloc_device
> 000000000000034e l     F .text.unlikely 000000000000002e get_partition_name
> 00000000000007d3 l     F .text.unlikely 00000000000005da init_nandsim
> 
> And after the change it is as follows:
> 
> 0000000000000029 l     F .init.text	0000000000000234 alloc_device
> 0000000000000000 l     F .init.text	0000000000000029 get_partition_name
> 000000000000025d l     F .init.text	00000000000005d5 init_nandsim
> 
> Done with the help of Coccinelle.  The semantic patch checks for local
> static non-init functions that are called from an __init function and are
> not called from any other function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/mtd/nand/nandsim.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Boris
-- 
Boris Brezillon, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
