Received: from belize.chezphil.org ([80.68.91.122])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HqBOR-0005e5-Q2
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 13:10:02 -0400
Received: from localhost ([127.0.0.1] helo=chezphil.org)
	by belize.chezphil.org with esmtp (Exim 4.50) id 1HqFwg-0003Sr-Uo
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 23:01:39 +0100
To: <linux-mtd@lists.infradead.org>
Date: Mon, 21 May 2007 18:09:46 +0100
Subject: Re: [PATCH] Fix kfree usage in various mtd map remove functions
Message-ID: <1179767386547@dmwebmail.belize.chezphil.org>
In-Reply-To: <loom.20070521T174147-996@post.gmane.org>
References: <loom.20070521T174147-996@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; format="flowed"
From: "Phil Endecott" <spam_from_linux_mtd@chezphil.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The other issue that I noticed was the use of release_resource() 
instead of release_mem_region().  I'm not at all sure what should be 
going on here, but as far as I can see from kernel/resource.c these 
functions are not equivalent, and the "Linux Device Drivers" book shows 
release_mem_region() used to reverse the effect of 
request_mem_region().  I think that release_resource() should be called 
when (for example) a hotpluggable device is unplugged and the resource 
goes away, whereas release_mem_region() should be called when a driver 
no longer needs use of that area of memory.  It's complex to understand 
the source because the same 'struct resource' is used to describe a 
physical resource and also a reservation/allocation of a portion of a 
physical resource to a driver.

I could submit a patch that replaces the release_resource() calls with 
release_mem_region(), but I would not be happy doing so unless someone 
with a bit more of a clue than me said it was the right thing to do.

Does anyone know of any documentation for any of these 'resource' functions?

See for example:
   drivers/mtd/maps/ixp4xx.c function int ixp4xx_flash_remove


Phil.
