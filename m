Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 152Veu-0005wX-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2001 11:14:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BD619B2A58D41197990050DA2C08E40258E4@SLINK12> 
References: <F1BD619B2A58D41197990050DA2C08E40258E4@SLINK12> 
To: Jan Rovins <Jan.Rovins@radisys.com>
Cc: linux-mtd@lists.infradead.org, Steve Ferri <steve.ferri@radisys.com>
Subject: Re: MTD on a Motorola MPCN765 ? (32 bit linux and 64 bit flash) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 23 May 2001 11:18:31 +0100
Message-ID: <32329.990613111@redhat.com>
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


Jan.Rovins@radisys.com said:
>  I was using partitions before, mostly to isolate & protect the boot
> image. Can I have a setup that uses separately mapped devices and
> multiple partitions at the same time? (I am having trouble visualizing
> this) 

Yeah, that's fine. You just call add_mtd_partitions() twice.


>  Separate chip mappings also would imply that I would have to alter
> the read(), write() copy_to/from() functions to skip over the bytes
> that would show up in the other mapping, since my address lines are
> wired up to treat the four chips as one range.

Yep.


--
dwmw2
