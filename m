Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qPNV-0007dW-00
	for mtd-list@infradead.org; Fri, 20 Apr 2001 02:06:29 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qPNU-0007dQ-00
	for mtd@infradead.org; Fri, 20 Apr 2001 02:06:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010419220359.0A46.GAUTIER@email.enst.fr> 
References: <20010419220359.0A46.GAUTIER@email.enst.fr>  <20010419181031.18A9.GAUTIER@email.enst.fr> <5889.987697556@redhat.com> 
To: Fabrice Gautier <gautier@email.enst.fr>
Cc: mtd@infradead.org
Subject: Re: [PATCH] Makefiles + vmax301 (was Re: MTD CVS and Official Kernel Tree ) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Apr 2001 02:05:46 +0100
Message-ID: <26954.987728746@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


gautier@email.enst.fr said:
> The problems were:
> 1/ target for nftl.o before global Rules
> 2/ $TOPDIR instead of $(TOPDIR) in some Makefiles
> 3/ mixmem.c has disapeared from CVS. 

Thanks; applied - along with the rest of the Makefile cleanup. We should 
now have clean Makefiles for 2.4 kernels, along with hacks in the 
GNUmakefiles to fix up the out-of-kernel and 2.[02] builds. 

I hate make.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
