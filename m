Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUJGN-0003kS-Jg
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 19:20:22 +0000
Received: by mail-pf0-x243.google.com with SMTP id w128so3756786pfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 11:19:59 -0800 (PST)
Date: Fri, 12 Feb 2016 11:19:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Ofer Heifetz <oferh@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx_nand: add support for partial chunks
Message-ID: <20160212191955.GC21465@google.com>
References: <1455112461-20713-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160210142242.GA1352@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160210142242.GA1352@laptop.cereza>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 10, 2016 at 11:22:42AM -0300, Ezequiel Garcia wrote:
> On 10 Feb 02:54 PM, Thomas Petazzoni wrote:
> > This commit is needed to properly support the 8-bits ECC configuration
> > with 4KB pages.
> > 

[...]

> > 
> > This commit has been tested on a Marvell Armada 398 DB board, with a
> > 4KB page NAND, tested in both 4 bits ECC and 8 bits ECC
> > configurations. Robert Jarzmik has tested on some PXA platforms.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
> 
> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Applied to l2-mtd.git
