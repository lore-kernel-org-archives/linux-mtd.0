Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15x78g-0007lE-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2001 14:35:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BD95D89.4090701@technicaltoys.net> 
References: <3BD95D89.4090701@technicaltoys.net> 
To: Derek Mulcahy <derek@technicaltoys.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD driver for Atmel serial flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Oct 2001 14:37:54 +0100
Message-ID: <397.1004103474@redhat.com>
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

derek@technicaltoys.net said:
>  As you can see, I am hiding the extra 8 bytes per page from the MTD
> system, this makes the read/writes simpler.

> An advice/pointers on the right way to do this would be much
> appreciated. 

Hmmm. Very little code is prepared to deal with erase blocks with a size 
that isn't a power of two. The best way forward is probably to pretend to 
be normal NOR flash with a larger erase size. 

--
dwmw2
