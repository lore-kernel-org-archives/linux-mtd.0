Received: from modemcable096.213-200-24.mc.videotron.ca ([24.200.213.96]
	helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CyZcA-0000UW-V7
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 12:57:31 -0500
Date: Tue, 8 Feb 2005 12:57:13 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1107885259.19262.495.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.61.0502081255500.20042@localhost.localdomain>
References: <E1CyZQx-0005qR-9M@phoenix.infradead.org>
	<1107885259.19262.495.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Nicolas Pitre <nico@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: mtd/include/mtd mtd-abi.h,1.8,1.9
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Feb 2005, David Woodhouse wrote:

> On Tue, 2005-02-08 at 17:45 +0000, Nicolas Pitre wrote:
> > +#define OTPSELECT		_IOR('M', 13, int)
> > +#define OTPGETREGIONCOUNT	_IOW('M', 14, int)
> 
> No ints in ioctls please. Choose something with a fixed size.

Aren't ints fixed size?  I carefully avoided using a long for that 
reason.


Nicolas
