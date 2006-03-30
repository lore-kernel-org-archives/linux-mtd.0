Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOyIK-0003KH-NB
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 09:38:49 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWY005753CBSS50@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 09:38:36 -0500 (EST)
Date: Thu, 30 Mar 2006 09:38:35 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <442BDCCA.6000408@intel.com>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0603300927540.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
	<44200D27.2060404@intel.com>
	<Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
	<442943A3.6060807@intel.com>
	<Pine.LNX.4.64.0603291125480.14923@localhost.localdomain>
	<Pine.LNX.4.64.0603291745000.14923@localhost.localdomain>
	<442BDCCA.6000408@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Mar 2006, Alexey, Korolev wrote:

> > Please find attached a patch for what I mean.
> > 
> > Could you test it and confirm the problem is actually gone?
> >  
> This code definetely will not cause the write error issue on XIP.
> For just a case I made tests. No write errors were faced after 3 hours of
> testing.

Good.  It also constitute a nice cleanup, as shown by diffstat:

 1 files changed, 156 insertions(+), 264 deletions(-)

> I have one comment to the patch:
> 
> > +
> > +	if (!z) {
> > +		if (!--(*chip_op_time))
> > +			*chip_op_time = 1;
> > +	} else if (z > 1)
> > +		*chip_op_time += z/2;
> > 
> This change may negativelly affect on write performance in case of SND kernel
> configuration.
> The process of write timeout increasing if faster than process of write
> timeout decreasing.
> If we consider write time as a random value with mean =
> chip->buffer_write_time and unknown variance.
> It means that average buffer write timeout will be greater than necessary
> timeout.

True.  I wanted for the delay to converge faster, especially in the 
erase case which is much larger.  I'll commit the patch with the 
original increment and think of a solution for better convergence in a 
separate patch.

Thanks for testing.


Nicolas
