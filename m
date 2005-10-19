Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESHM2-0006zd-EB
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 13:03:58 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IOM007KSA15EZ90@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 13:03:05 -0400 (EDT)
Date: Wed, 19 Oct 2005 13:03:05 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <435678BA.6080809@ru.mvista.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-id: <Pine.LNX.4.64.0510191258080.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A014CE48D@NNSMSX401>
	<Pine.LNX.4.64.0510191058000.5288@localhost.localdomain>
	<435678BA.6080809@ru.mvista.com>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: XIP & GCC optimization & halting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Oct 2005, Vitaly Wool wrote:

> Hi,
> 
> >  
> > > Now I'm not clear about solution for the problem.
> > >    
> > 
> > Select only one CFI buswidth and only one chip interleave when configuring
> > your kernel.  That will allow gcc to precompute everything a t compile time
> > and avoid the runtime divide.
> >  
> Does it make sense to lock runtime divide functions in i-cache during flash
> not being in linear mode?

No.

That _could_ be done of course.  But that is a completely non generic 
(non portable) solution adding yet more complexity and dependencies to a 
setup which is already fragile.  Better aim for more simplicity instead 
which is to make the XIP-off code paths as short, simple and verifiable 
as possible.  Going with a single buswidth and chip interval should 
achieve that.


Nicolas
