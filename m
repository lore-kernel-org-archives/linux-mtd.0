From: jgarzik@pobox.com (Jeff Garzik)
Date: Thu, 13 Feb 2003 01:47:45 -0500
Subject: Q: MTD and NIC Roms...
In-Reply-To: <1045117753.9349.22.camel@imladris.demon.co.uk>
References: <m3znp0zqaw.fsf@lnxi.com> <3E4B37CD.8090507@pobox.com> <1045117753.9349.22.camel@imladris.demon.co.uk>
Message-ID: <20030213064745.GA31364@gtf.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, Feb 13, 2003 at 06:29:13AM +0000, David Woodhouse wrote:
> On Thu, 2003-02-13 at 06:14, Jeff Garzik wrote:
> > And I think that's the best place for it.  We _could_ bloat up the 
> > kernel code by adding the ability flash -- but how many users is that 
> > going to serve, that are not already served by existing programs?  So, I 
> > disagree with getting this stuff into the kernel at all.
> 
> I see your point, but OTOH that it's under a separate config option and
> it's actually a _tiny_ amount of code. 
> 
> And we all know that hardware drivers don't live in userspace. 

ATM all users are using an existing userspace tools, so
this would be a CONFIG_EEPRO100_ERIC_BIEDERMAN option.  No thanks :)

	Jeff
