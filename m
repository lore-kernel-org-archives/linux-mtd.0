Received: from fed1mtao04.cox.net ([68.6.19.241])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17u7gC-0002zi-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 09:37:56 +0100
Subject: RE: Interest in DOC and YAFFS? --> YAFFS bootloading
From: Russ Dill <Russ.Dill@asu.edu>
To: Srinivasan.Ramasubramaniam@nokia.com
Cc: elf@buici.com, kenneth.johansson@etx.ericsson.se,
	linux-mtd@lists.infradead.org
In-Reply-To: 
	<F252EE46074AB645B4F44947EEAD57272E4EEC@mvebe001.americas.nokia.com>
References: 
	<F252EE46074AB645B4F44947EEAD57272E4EEC@mvebe001.americas.nokia.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 25 Sep 2002 01:38:31 -0700
Message-Id: <1032943112.23565.15.camel@russ>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2002-09-25 at 00:09, Srinivasan.Ramasubramaniam@nokia.com wrote:
> Hi all !
> 
> I request your help to clarify a doubt with regard to initrd-filesystem and cramfs. 
> 
> If we use cramfs in place initrd-filesystem, will the entire filesystem will be uncompressed and loaded onto the RAM ?  
> 
> But in initrd-filesystem, the entire filesystem is uncompressed and loaded. 

the compressed cramfs image will be loaded into ram, and then, from
there, as pages are needed, they will be decompressed again and put into
ram (but again, if memory is in a pinch, these pages can be dropped). I
don't know if an ext2 initrd will do XIP (execute in place), but I
somehow doubt that anyone has worked on that, meaning that the pages
would need to be copied again, in which case, a cramfs would use less
ram.
