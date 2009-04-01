Received: from n20.bullet.mail.mud.yahoo.com ([68.142.206.147])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LovS5-00047V-FY
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 08:05:43 +0000
From: David Brownell <david-b@pacbell.net>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
Date: Wed, 1 Apr 2009 01:05:33 -0700
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
	<Pine.LNX.4.64.0904010920570.9213@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0904010920570.9213@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200904010105.33674.david-b@pacbell.net>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 01 April 2009, Ricard Wanderlof wrote:
> 
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

Yeah, design inertia.  Folk understand ioctls (more or less),
and not so much with sysfs.  Having to re-think anything is
a kind of obstacle.  (Part of why I made it especially easy
to add more attributes!)

Plus, if you dive into it ... you'll start noticing glitches
in the MTD framework models.  Object lifetime and all that;
arguably there should be new MTD calls and an altered object
lifecycle.  Such issues come up a lot with legacy interfaces,
and MTD counts as one.


> Could it be that the relevant interfaces would only be used, basically, 
> for mtdtools, which are quite simple in nature and an ioctl interface 
> works well. There isn't that much performance tuning to be done and not 
> very much information which humans are interested in. Most people want to 
> mount their device and go.

True.  Unless I need JFFS2 I don't enable mtd block devices;
and I don't use mtd-utils most of the time either...


> Indeed, from a user application perspective, sysfs seems a bit clumsy to 
> me, you have to open a file and read and write text strings (although 
> binary files are possible but, I suspect, frowned upon), rather than just 
> fire off an ioctl after filling in a struct.
> 
> While there are up- and downwards compatibility issues, careful design of 
> the ioctls can minimize the impact.

As they say, "your mileage may vary" ... but ability to just
browse sysfs with "cat" and such is a big win.  No need to
operate any ioctls.

Erasing an MTD partition may require an ioctl forever.  :)


> I'm not suggesting we go one way or the other, just an observation that 
> few mtd _users_ seem to be eager to go with sysfs. I invite anyone to 
> prove me wrong...

Users just want to mount-and-go.
Sysadmins may use mtd-utils for repair/install.
Most system developers are just users with bloodier hardware.

MTD developers themselves probably have strong opinions and
needs, but that's not a large community... adaptable, though!

- Dave

 
> /Ricard
> --
> Ricard Wolf Wanderlöf                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
> 
> 
