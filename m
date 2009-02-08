Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LW745-0000JV-Nu
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 10:39:08 +0000
Date: Sun, 8 Feb 2009 10:39:04 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] [MTD] NAND: add ts7xxx driver
Message-ID: <20090208103904.GE11872@woodchuck>
References: <20090208085919.GD11872@woodchuck>
	<20090208102147.GL13433@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090208102147.GL13433@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Lennert Buytenhek <buytenh@wantstofly.org> [2009-02-08 11:21:47+0100]:
> 
> On Sun, Feb 08, 2009 at 08:59:19AM +0000, Alexander Clouter wrote:
> >
> > This patch adds support for the NAND found in Technologic Systems ARM
> > boards[1].  The platform specific parts (IO address and parititoning
> > schemes) have been moved into platform specific files whilst the driver
> > it's self can be used as a complete replacement for the ts7250 NAND
> > driver.
> 
> Why don't you morph the ts7250 into the form you want instead of adding
> a parallel driver for the same thing?
>
...because when I sent this to you last year for some offlist comment 
action you did not grumble that it was a separate driver.  Then after a 
year of reposting twice to this list with no comment or feedback what so 
ever I guess I made the mistake of assuming it was not 'displeasing' to 
the community.

Sorry to sound grumpy, but after trying to post cpufreq, timeriomem, 
nand and arm patches over the past two years with a 90% resulting in the 
silent treatment it feels like a brick has hit me in the face with "hey 
instead just morph the current driver".

Bah.

</rant>

The driver I threw together makes a rather radical change to put all the 
partitioning and iomem resources ranges back into the platform specific 
code where they belong.  It was just easier to start clean, plus I 
learnt a good deal about the MTD subsystem in the process, although 
that's not a good reason for submission I know.

As the feedback from ts72[056]0 users has been pretty...well...dire and 
I have no access to the platform I cannot be certain this patch safely 
works for those users.  I had the view that once I can get a solid 
confirmation that the ts72[056]0 users are happy I was hoping that the 
7250.c driver would just become obsolete?

So, is it back to square one for me?

Cheers

-- 
Alexander Clouter
.sigmonster says: You will never know hunger.
