Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
From: David Woodhouse <dwmw2@infradead.org>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain
Date: Sat, 06 Jun 2009 09:14:08 +0100
Message-Id: <1244276049.3751.1176.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: devicetree-discuss@ozlabs.org, albrecht.dress@arcor.de,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-05 at 14:05 +0200, Wolfram Sang wrote:
> Create an of-aware driver using the now exported generic functions from
> plat-ram.c. Also add the documentation for the binding. Partitions are
> not yet supported. Tested on a phyCORE-MPC5200B-IO.

Do we have an ack for the device-tree bindings? 

It _would_ be possible to hook up RAM through the existing of_physmap
driver, I think -- although it would be slightly less efficient that
way.

Maybe cleaner from the device-tree POV though. And if we want to put a
special case in the _code_ to make it more efficient, we can do that.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
