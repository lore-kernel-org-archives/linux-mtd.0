Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzMIi-0003Kh-Vy
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2018 13:32:27 +0000
Date: Mon, 10 Sep 2018 15:32:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: partitions: fix of_node_get/put balance in parser
Message-ID: <20180910153203.008398c1@bbrezillon>
In-Reply-To: <20180910152551.23ffa474@bbrezillon>
References: <20180907143554.13496-1-miquel.raynal@bootlin.com>
 <20180907163824.6cec1a43@xps13>
 <20180910145312.3b9ae4ad@bbrezillon>
 <20180910151423.2944aca6@xps13>
 <20180910152551.23ffa474@bbrezillon>
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

On Mon, 10 Sep 2018 15:25:51 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> 
> > I think if the helper was
> > named "mtd_to_of_node()" that would be much clearer for everyone and
> > of_node_get(mtd_to_of_node(mtd)) would be the way to retain a reference
> > on the OF node.
> > 
> > I don't think creating a helper for that would be better because I
> > really prefer seeing the of_node_get() in the code, meaning an
> > of_node_put() will be needed at some point.  
> 
> Again, it's mainly a matter of consistency. If people are used to call
> of_node_put() when a function returns a device_node object, then it's
> better to do the same in the MTD framework.

Just to be clear. I still want to queue this patch for 4.19-rc4. All
I'm saying is that we should consider changing the behavior of
mtd_get_of_node() (and friends) at some point, otherwise we might see
other bugs like this one in the future.

On a side note, we should probably also call of_node_get/put() when
someone updates mtd->dev.of_node through the mtd_set_of_node() helper,
and call of_node_put() when an mtd device is unregistered.
