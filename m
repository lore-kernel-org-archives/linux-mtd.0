Received: from host-84-9-200-189.bulldogdsl.com ([84.9.200.189]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FX3KE-0007pk-0Q
	for linux-mtd@lists.infradead.org; Fri, 21 Apr 2006 17:38:10 -0400
Date: Fri, 21 Apr 2006 22:13:24 +0100
From: Ben Dooks <ben@fluff.org.uk>
To: kanhu <kanhu@innomedia.soft.net>
Message-ID: <20060421211324.GA20463@home.fluff.org>
References: <444627EA.3@innomedia.soft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <444627EA.3@innomedia.soft.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd device on RAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 19, 2006 at 05:37:06PM +0530, kanhu wrote:
> Hi list,
> 
> I am using uclinux on my gateway(Having 32mb sdram with armnommu acrh).
> I was successfull using the mtd device on a flash chip of 8mb. I want to 
> use it on the RAM chip.
> Can anybody help me on how can i use the mtd device on the ram chip and 
> how to define the partition table.

There is a plat-ram driver which binds to a platform device
registered by the board support, which provides an MTD
interface.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
