Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ii5Sh-00049y-FQ
	for linux-mtd@lists.infradead.org; Wed, 17 Oct 2007 10:45:13 +0100
Date: Wed, 17 Oct 2007 11:37:33 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH,RFC] driver for Marvell Orion device bus NAND controller
Message-ID: <20071017093733.GC9712@lazybastard.org>
References: <20071016231040.GB21441@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071016231040.GB21441@xi.wantstofly.org>
Cc: tzachi@marvell.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 October 2007 01:10:40 +0200, Lennert Buytenhek wrote:
> 
> Attached is a driver for the device bus NAND controller in
> the Marvell Orion family of ARM SoCs.
> 
> Signed-off-by: Tzachi Perelstein <tzachi@marvell.com>
> Signed-off-by: Lennert Buytenhek <buytenh@marvell.com>
Acked-by: Joern Engle <joern@logfs.org>

The only thing that bothers me about this driver is
CONFIG_MTD_PARTITIONS and all the mess inside.  As always.

Jörn

-- 
When in doubt, use brute force.
-- Ken Thompson
