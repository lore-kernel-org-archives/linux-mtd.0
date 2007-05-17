Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HojT6-0002EO-0E
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 18:08:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HojSv-0006El-KE
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 19:08:37 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 19:08:37 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 19:08:37 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: alloc/free quesion in ixp4xx driver
Date: Thu, 17 May 2007 17:08:07 +0000 (UTC)
Message-ID: <loom.20070517T190229-463@post.gmane.org>
References: <1179417099816@dmwebmail.belize.chezphil.org>
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

Phil Endecott <spam_from_linux_mtd <at> chezphil.org> writes:

> 
> Dear MTD experts,
> 
> I have been looking at the MTD ixp4xx driver 
> (drivers/mtd/maps/ixp4xx.c), mainly as an example of something that 
> uses the ixp4xx expansion bus, and I have a couple of questions.  I 
> apologise for being a "newbie" on this subject, I have not written a 
> lot of kernel code.
> 
> - In ixp4xx_flash_probe(), a struct ixp4xx_flash_info in kalloc()ed.  
> Where is it freed?
> 
> - In ixp4xx_flash_remove() you have:
>        release_resource(info->res);
>        kfree(info->res);
>    In other places where release_resource() is called I do not see a 
> call to kfree().  Is this right?
> 
> Most likely, this is all OK and I need to learn more about how these 
> functions should be used.  But my thought on seeing this was that the 
> kfree() should have been freeing info, not info->res.
> 
> I am also uncertain about release_resource() vs. release_mem_region().  
> Are they interchangeable?
> 
> I have been looking at 2.6.21, but a quick check at
> 
>
http://git.infradead.org/?p=mtd-2.6.git;a=blob;
f=drivers/mtd/maps/ixp4xx.c;h=7a828e3e6446d7f9254f083d3b02bb2e9e02e9e0;
hb=HEAD

> suggests that it is the same in your tree (if I have
 understood gitweb properly).
> 
> Many thanks,
> 
> Phil.

Don't think it should kfree(info->res), the release_resource() sorts
out the allocated mem region.

But there should be a kfree(info) somewhere in the driver.

My guess is that you have spotted a typo, and there should be a
kfree(info) next, just outside the if (info->res) block.

The existing code would lead to a memory leak IMHO.
Want to try out the patch !!??

Regards,
MikeW
