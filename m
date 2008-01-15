Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEd7E-0003bz-Te
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 04:09:33 +0000
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_0UIMmFtxt09qxw+aDM5piw)"
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JUO00MJD3EDWAJ0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 23:06:13 -0500 (EST)
Date: Mon, 14 Jan 2008 23:06:13 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [MTD] potential division by 0 in cfi_build_cmd() and
	cfi_merge_status()?
In-reply-to: <20080115030103.GA19407@lazybastard.org>
Message-id: <alpine.LFD.1.00.0801142302410.3054@xanadu.home>
References: <478BFE1C.1090608@tiscali.nl>
	<20080115030103.GA19407@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Roel Kluin <12o3l@tiscali.nl>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_0UIMmFtxt09qxw+aDM5piw)
Content-type: TEXT/PLAIN; charset=utf-8
Content-transfer-encoding: 8BIT

On Tue, 15 Jan 2008, Jörn Engel wrote:

> I don't think cfi_interleave(cfi) will ever be 0.  But the functions
> definitely look a bit large for inlines.  Anyone having both cfi_probe
> and jedec_probe will enjoy twice the kernel footprint from them.
> Patches to move that code out-of-line are welcome.

Beware.

The typical use case is for your embedded system to be configured with 
your flash arrangement and not all possible combinations available under 
the sun.

In that case it is most likely that cfi_interleave(cfi) will simplify to 
a constant, and making this out of line _will_ enlarge your kernel, as 
well as possibly breaking interaction with a XIP kernel on ARM.

So please don't push this out of line.


Nicolas

--Boundary_(ID_0UIMmFtxt09qxw+aDM5piw)--
