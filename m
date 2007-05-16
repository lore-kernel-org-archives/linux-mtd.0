Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoECN-0003yb-KW
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 08:45:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HoECE-0006Fi-Js
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 09:45:18 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 09:45:18 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 09:45:18 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
Date: Wed, 16 May 2007 07:45:03 +0000 (UTC)
Message-ID: <loom.20070516T093928-915@post.gmane.org>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
	<1179189724.3482.24.camel@shinybook.infradead.org>
	<1179215126.21753.40.camel@localhost.localdomain>
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

Hans-Christian Egtvedt <hcegtvedt <at> norway.atmel.com> writes:

> 
> Ah, thanks for this hint.
> 
> > The reason it's not a runtime option is because that would be quite
> > slow, and it's a very esoteric feature.
> 
> For development systems it would be a great feature, hence my original
> email. But for an embedded system this should not be present at all.
> 
> > I'm sorry. I should have just made it either big- or little-endian right
> > from the very beginning and never made the mistake of letting it be
> > host-endian.
> 
> What I would have liked was a possibility to choose which read/write
> operations should be used when using my developing machine, but for the
> kernel I boot my embedded target with I would like an optimized jffs2
> driver.
> 
> Use native endianess by default, but have a possibility to override at
> runtime.
> 
> </thoughts>
> 

(I guess you could have both be- and le- drivers present in your dev system
as long as they had different naming, so you could  mount -t jffs2.be / .le
as required.)

Since this is a development-only requirement, there is no need to make
a generic read-everything upgrade for JFFS2 which would then slug the
performance of the standard build. Keep this option as a nonstandard
recompile option, and let the native versions use their native byte ordering.

Regards,
MikeW
