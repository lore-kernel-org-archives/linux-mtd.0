Date: Mon, 23 Nov 2015 14:59:15 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>, Jason Cooper
 <jason@lakedaemon.net>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, Maxime
 Ripard <maxime.ripard@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] mtd: nand: sunxi: add missing of_node_put
Message-ID: <20151123145915.04ed6508@bbrezillon>
In-Reply-To: <1447884254-26336-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447884254-26336-3-git-send-email-Julia.Lawall@lip6.fr>
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

On Wed, 18 Nov 2015 23:04:12 +0100
Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> for_each_child_of_node performs an of_node_get on each iteration, so
> a break out of the loop requires an of_node_put.
> 
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> @@
> 
>  for_each_child_of_node(root, child) {
>    ... when != of_node_put(child)
>        when != e = child
> (
>    return child;
> |
> +  of_node_put(child);
> ?  return ...;
> )
>    ...
>  }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
