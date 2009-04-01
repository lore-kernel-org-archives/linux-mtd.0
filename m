Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lout4-0001CN-V7
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 07:29:33 +0000
Date: Wed, 1 Apr 2009 09:29:21 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
In-Reply-To: <200903311418.53772.david-b@pacbell.net>
Message-ID: <Pine.LNX.4.64.0904010920570.9213@lnxricardw.se.axis.com>
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
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


On Tue, 31 Mar 2009, David Brownell wrote:

> Hmm, no comments?  I had understood there was interest over on
> the MTD side of things in exposing more information through
> sysfs, to help avoid the need to add Even More Ioctls as part
> of support for things like NAND chips with 4KB pages, or which
> handle more than 4GBytes ...

I sense some ambiguity when it comes to sysfs. dwmw2 and others seem to=20
feel this is the route to go, yet no one really seems interested and the=20
only patches that people produce are for new ioctls. Admittedly, moving to=
=20
sysfs requires some form of high level specification before implementation=
=20
can be done, but still...

Could it be that the relevant interfaces would only be used, basically,=20
for mtdtools, which are quite simple in nature and an ioctl interface=20
works well. There isn't that much performance tuning to be done and not=20
very much information which humans are interested in. Most people want to=
=20
mount their device and go.

Indeed, from a user application perspective, sysfs seems a bit clumsy to=20
me, you have to open a file and read and write text strings (although=20
binary files are possible but, I suspect, frowned upon), rather than just=
=20
fire off an ioctl after filling in a struct.

While there are up- and downwards compatibility issues, careful design of=
=20
the ioctls can minimize the impact.

I'm not suggesting we go one way or the other, just an observation that=20
few mtd _users_ seem to be eager to go with sysfs. I invite anyone to=20
prove me wrong...

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
