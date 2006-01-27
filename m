Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2aVf-0006ah-Ha
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 15:48:02 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0ITR00FBBR3UU110@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 15:47:55 -0500 (EST)
Date: Fri, 27 Jan 2006 15:47:54 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <625fc13d0601271151i796ab647v629495dc80cbc940@mail.gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
Message-id: <Pine.LNX.4.64.0601271540450.16649@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
	<43DA3CDF.5050202@intel.com>
	<6934efce0601271115l5e18a03bs920237f09dfa2877@mail.gmail.com>
	<625fc13d0601271151i796ab647v629495dc80cbc940@mail.gmail.com>
Cc: "Alexey, Korolev" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH] map drivers. DCACHE option for physmap and mphysmap
 drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Jan 2006, Josh Boyer wrote:

> On 1/27/06, Jared Hulbert <jaredeh@gmail.com> wrote:
> > When I first did a patch like this I used a very platform dependent
> > embedded assembly loop to _invalidate_ NOT _flush_ the specific
> > cachelines possibly affected by the flash program or erase.
> 
> Yep, that would be better.

No it wouldn't.  It would quickly become crufty and unreadable as more 
architectures add their stuff.

Also note that some architectures might have issues having two virtual 
areas mapped to the same physical area (like i386 if I remember 
correctly).  In that case the only way to have a cached mapping is to 
rely on the fact that the flash chip is likely to have aliases in the 
memory map and use one of them for the cached mapping.  Those tricks are 
really platform dependent and better expressed in a platform specific 
map driver.


Nicolas
