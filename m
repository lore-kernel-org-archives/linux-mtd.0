Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKy2t-0002ZA-CQ
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 16:47:47 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KD5001DDVZKYVN0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 11:47:44 -0500 (EST)
Date: Thu, 08 Jan 2009 11:47:44 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH] CFI: remove major/minor version check for command set
	0x0002
In-reply-to: <496624A4.3050808@grandegger.com>
Message-id: <alpine.LFD.2.00.0901081134110.6007@xanadu.home>
References: <496624A4.3050808@grandegger.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Jan 2009, Wolfgang Grandegger wrote:

> The NOR Flash memory K8P2815UQB from Samsung uses the major version
> number '0', which seems to be unusual but not illegal, IIUC. This
> patch removes the major-minor version check to get this Flash memory
> supported as well.

Instead of removing the test entirely, I'd suggest you augment it with 
the manufacturer ID (cfi->mfr and cfi->id).  Or better yet, just use 
that information to fix up the version number to something sensible.


Nicolas
