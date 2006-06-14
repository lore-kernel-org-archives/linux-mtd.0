Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqUpn-0002Jx-Fv
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 08:51:10 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0U001SJP0V6R70@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 08:50:55 -0400 (EDT)
Date: Wed, 14 Jun 2006 08:50:55 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] Fixes for several performance issues
In-reply-to: <1150284889.3176.80.camel@pmac.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <Pine.LNX.4.64.0606140850050.2703@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01EF2E9D@NNSMSX401>
	<1150284889.3176.80.camel@pmac.infradead.org>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>,
	Davide CASCONE <davide.cascone@st.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Jun 2006, David Woodhouse wrote:

> On Wed, 2006-06-14 at 15:12 +0400, Korolev, Alexey wrote:
> > The current implementation has some performance and stability issues
> > in CFI drivers. 
> 
> Thanks for the patch -- but it needs a Signed-off-by: and it needs to be
> sent without getting mangled by your mailer.

... and preferably split into 4 individual patches for the 4 issues it 
is addressing.


Nicolas
