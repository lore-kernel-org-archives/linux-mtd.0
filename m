Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmPGB-0001TO-SZ
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2018 20:04:17 +0000
Date: Sun, 5 Aug 2018 22:04:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 2/2] Documentation: mtd: remove stale pxa3xx NAND
 controller documentation
Message-ID: <20180805220403.0eaafc8f@bbrezillon>
In-Reply-To: <87in4o1vlj.fsf@belgarion.home>
References: <20180805145257.15256-1-miquel.raynal@bootlin.com>
 <20180805145257.15256-2-miquel.raynal@bootlin.com>
 <87in4o1vlj.fsf@belgarion.home>
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

Hi Robert,

On Sun, 05 Aug 2018 21:06:48 +0200
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Miquel Raynal <miquel.raynal@bootlin.com> writes:
> 
> > It is preferred to have the documentation about the drivers directly
> > embedded in the driver itself.  
> Could you tell me where this statement comes from ?
> 
> Because so far I've always been told the opposite.

I complained about that when I inadvertently discovered there was a doc
explaining how the marvell IP works in Documentation/mtd/nand/
(which happened after someone posted a patch series adding a new file
there). That's really something I'd expect to be described inside the
driver directly. I'm perfectly fine having framework documentation or
even SoC documentation placed in Documentation, but when it comes to
driver/IP documentation it's IMO better placed directly in the driver
source code, just because people usually don't look for driver-specific
doc in Documentation/.

A compromise would be to have everything documented in the driver
using overview doc comments [1], and then let sphynx parse this doc
header and generate the proper doc entry, but that's IMHO less important
to have such IP-specific information embedded in the kernel doc.

Regards,

Boris

[1]https://www.kernel.org/doc/html/v4.11/doc-guide/kernel-doc.html#overview-documentation-comments
