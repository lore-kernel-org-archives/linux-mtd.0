From: dwmw2@infradead.org (David Woodhouse)
Date: 13 Feb 2003 06:29:13 +0000
Subject: Q: MTD and NIC Roms...
In-Reply-To: <3E4B37CD.8090507@pobox.com>
References: <m3znp0zqaw.fsf@lnxi.com>  <3E4B37CD.8090507@pobox.com>
Message-ID: <1045117753.9349.22.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 2003-02-13 at 06:14, Jeff Garzik wrote:
> And I think that's the best place for it.  We _could_ bloat up the 
> kernel code by adding the ability flash -- but how many users is that 
> going to serve, that are not already served by existing programs?  So, I 
> disagree with getting this stuff into the kernel at all.

I see your point, but OTOH that it's under a separate config option and
it's actually a _tiny_ amount of code. 

And we all know that hardware drivers don't live in userspace. 

-- 
dwmw2
