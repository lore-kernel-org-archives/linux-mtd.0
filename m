Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM73R-0007AZ-Lr
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 12:23:38 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWJ00NHXHN42W80@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 12:23:28 -0500 (EST)
Date: Wed, 22 Mar 2006 12:23:28 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1143047296.29683.44.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0603221222270.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1143047296.29683.44.camel@sauron.oktetlabs.ru>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Mar 2006, Artem B. Bityutskiy wrote:

>  15 files changed, 4144 insertions(+), 33 deletions(-), 2
> modifications(!)
> 
> You definitely have to split your patch on several parts. Your patch has
> to only affect drivers/mtd/mtdstripe.c and include/linux/mtd/stripe.h.
> If you have to modify other subsystem, send the modification separately,
> motivate them and let the corresponding janitor to review them.

I'm definitely with you on this.


Nicolas
