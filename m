Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPS1M-0000Uf-JD
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 06:59:25 +0000
Received: from dflxv15.itg.ti.com ([128.247.5.124])
 by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8R6x3xC009465
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 01:59:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
 by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8R6x23W008345
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 01:59:03 -0500
Received: from [172.24.145.168] (ileax41-snat.itg.ti.com [10.172.224.153])	by
 dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8R6x18u030210	for
 <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 01:59:02 -0500
Message-ID: <52452CB5.5020801@ti.com>
Date: Fri, 27 Sep 2013 12:29:01 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Memory mapped read for serial flash device ?
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I wanted to know whether there is any framework or support available
in mtd which helps in doing a memory mapped read for a serial NOR flash 
driver.

Requirement is something like this..

My controller supports memory mapped read, but needs to switch to
memory mapped port to read from it and once the
read is done switch back again to normal configuration mode.

So, my idea is that spi controller need to be communicated from  the mtd 
layer
that the current read is memory mapped read, so the controller does
whatever settings need to be done and then does the memory mapped read and
switch back to configuration mode.

I see some drivers under drivers/mtd/maps/* , point and unpoint 
functions, but are they
applicable for serial NOR flashes? Or there is any other stuff available 
which I can use
for my usecase?

Thanks in advance,
Sourav
