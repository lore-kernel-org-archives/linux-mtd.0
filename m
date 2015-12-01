Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3aBL-0007IK-SK
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 01:56:40 +0000
Received: by pacej9 with SMTP id ej9so203697915pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 17:56:17 -0800 (PST)
Date: Mon, 30 Nov 2015 17:56:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Cooper <jason@lakedaemon.net>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 1/4 v2] mtd: brcmnand: improve memory management
Message-ID: <20151201015615.GV64635@google.com>
References: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447884254-26336-2-git-send-email-Julia.Lawall@lip6.fr>
 <20151118224440.GC64635@google.com>
 <alpine.DEB.2.02.1511190713140.2008@localhost6.localdomain6>
 <20151119192632.GH64635@google.com>
 <alpine.DEB.2.02.1511192231330.2106@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1511192231330.2106@localhost6.localdomain6>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2015 at 10:32:15PM +0100, Julia Lawall wrote:
> This patch addresses two related memory management issues in the probe
> function:
> 
> 1. for_each_available_child_of_node performs an of_node_get on each
> iteration, so a break out of the loop requires an of_node_put.
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
>  for_each_available_child_of_node(root, child) {
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
> 2. The devm_kzalloc'd data is not used if brcmnand_init_cs fails.  Free it
> immediately, using devm_kfree in this case, instead of waiting for the
> remove function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> 
> v2: Drop of_node_get addition, as another patch will get rid of the need
> for it completely.

Pushed to l2-mtd.git
