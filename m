Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157wLA-0007KK-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 10:44:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <23825.991907052@redhat.com> 
References: <23825.991907052@redhat.com>  <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> 
To: Abraham vd Merwe <abraham@2d3d.co.za>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: HELP 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Jun 2001 10:48:43 +0100
Message-ID: <26468.991907323@redhat.com>
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

Seriously, though - if you're doing a driver which is only going to be used
on ARM hardware you may consider using get_unaligned(). Do read the archives
from when we did this for the CFI drivers and subsequently took it out again
though.

I think that might actually have been on the ipaq list. 

--
dwmw2
