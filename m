Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GNiL-0004gj-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 17:07:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0112181738560.2667-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0112181738560.2667-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Map driver usage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Dec 2001 17:18:21 +0000
Message-ID: <16691.1008695901@redhat.com>
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

rob@sysgo.de said:
>  OK, so if I implement the copy_from call to break the large transfer
> into smaller ones if necessary, then I should be safe ?

Depending on the flash chips you're using, maybe. Sometimes you need to 
access the chip with the correct address.


>  Yep. Only my problem here is, that I want some physically
> non-contiguous blocks to form a single MTD partition. Is that possible
> with the MTD partition API ? 

The MTD partitioning code is (currently) just a set of wrappers round the 
real MTD functions, which add an offset and call the real chip driver's 
methods. It's fairly simple to do your own such wrapper rather than using 
the ones in mtdpart.c.

--
dwmw2
