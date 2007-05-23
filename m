Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hqlmi-0006CF-1b
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 04:01:30 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HqlmS-0001Sn-3e
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 10:01:12 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2007 10:01:12 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2007 10:01:12 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: [PATCH] Fix kfree usage in various mtd map remove functions
Date: Wed, 23 May 2007 08:01:02 +0000 (UTC)
Message-ID: <loom.20070523T095246-298@post.gmane.org>
References: <loom.20070521T174147-996@post.gmane.org>
	<1179767386547@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Phil Endecott <spam_from_linux_mtd <at> chezphil.org> writes:

> 
> The other issue that I noticed was the use of release_resource() 
> instead of release_mem_region().  I'm not at all sure what should be 
> going on here, but as far as I can see from kernel/resource.c these 
> functions are not equivalent, and the "Linux Device Drivers" book shows 
> release_mem_region() used to reverse the effect of 
> request_mem_region().  I think that release_resource() should be called 
> when (for example) a hotpluggable device is unplugged and the resource 
> goes away, whereas release_mem_region() should be called when a driver 
> no longer needs use of that area of memory.  It's complex to understand 
> the source because the same 'struct resource' is used to describe a 
> physical resource and also a reservation/allocation of a portion of a 
> physical resource to a driver.
> 
> I could submit a patch that replaces the release_resource() calls with 
> release_mem_region(), but I would not be happy doing so unless someone 
> with a bit more of a clue than me said it was the right thing to do.
> 
> Does anyone know of any documentation for any of these 'resource' functions?
> 
> See for example:
>    drivers/mtd/maps/ixp4xx.c function int ixp4xx_flash_remove
> 
> Phil.

The API manages device registers in I/O space or I/O memory space.
The driver allocations show up in e.g. /proc/iomem and prevent
drivers from trying to control the same physical device hardware.
If your 'resource' request fails then the driver load fails -
or your driver has to try an alternative address.

The pairings are:
 request_region/request_mem_region,
 release_region/release_mem_region
but release_resource is generic so can be used as release.. or release_mem..

The existing calls you describe above sound OK but perhaps the author
should have commented more clearly.

Best regards,
MikeW
