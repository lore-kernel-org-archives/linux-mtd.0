Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cqKm-0000TB-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 16:35:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <71B37AB6576DD211AB7E008048CD4D319FA652@exchange.ten.logware.de> 
References: <71B37AB6576DD211AB7E008048CD4D319FA652@exchange.ten.logware.de> 
To: Veikko Werner <veikko.werner@logware.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 Boot de-ja-vue - add... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 31 Aug 2001 16:41:47 +0100
Message-ID: <16653.999272507@redhat.com>
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

veikko.werner@logware.de said:
> conclusion:  MTD and NFTL load successfully kernels says "root
> mounted" so I should must have the files I have when I mount it from
> HD but that seems to be not right maybe access to the DOC is to slow?
> Can I pass some arguments for slowing down ? 

Boot from the hard drive and check you can run /sbin/init and /bin/sh 
from the DiskOnChip:

 mount /dev/nftla1 /mnt
 chroot /mnt /bin/sh


--
dwmw2
