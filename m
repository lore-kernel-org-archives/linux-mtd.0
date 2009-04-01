Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LovF1-0000ke-QK
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 07:52:15 +0000
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0904010920570.9213@lnxricardw.se.axis.com>
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
	<Pine.LNX.4.64.0904010920570.9213@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2009 10:51:46 +0300
Message-Id: <1238572306.20906.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>, Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-01 at 09:29 +0200, Ricard Wanderlof wrote:
> On Tue, 31 Mar 2009, David Brownell wrote:
> 
> > Hmm, no comments?  I had understood there was interest over on
> > the MTD side of things in exposing more information through
> > sysfs, to help avoid the need to add Even More Ioctls as part
> > of support for things like NAND chips with 4KB pages, or which
> > handle more than 4GBytes ...
> 
> I sense some ambiguity when it comes to sysfs. dwmw2 and others seem to 
> feel this is the route to go, yet no one really seems interested and the 
> only patches that people produce are for new ioctls. Admittedly, moving to 
> sysfs requires some form of high level specification before implementation 
> can be done, but still...
> 
> Could it be that the relevant interfaces would only be used, basically, 
> for mtdtools, which are quite simple in nature and an ioctl interface 
> works well. There isn't that much performance tuning to be done and not 
> very much information which humans are interested in. Most people want to 
> mount their device and go.
> 
> Indeed, from a user application perspective, sysfs seems a bit clumsy to 
> me, you have to open a file and read and write text strings (although 
> binary files are possible but, I suspect, frowned upon), rather than just 
> fire off an ioctl after filling in a struct.

On the other hand, you can easily see everything from your shell.
And in programs, it is not a big deal to write few functions which
fetch info from the sysfs files. We do this for UBI in libubi.c

Anyway, I have practical problems.

1. UBI utilities need to know sub-page size in case of NAND. And I
   have zero possibility to extend the existing ioctls. If they were
   sysfs interfaces, I would just add one more sysfs file.

2. We want to provide various statistics like count of reads, writes,
   erases. Should we create yet another ioctl for this? And for
   statistics, sysfs is just better because I can just do
   "cat /sys/class/mtd0/stats/reads_count". And I can easilly do
   this in shell scripts.

My _practical_ problems may be nicely solved with sysfs. And they are
not nicely solved with ioctls. And I am a real, existing MTD user.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
