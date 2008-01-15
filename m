Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEdHE-0004RT-V2
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 04:19:53 +0000
Date: Tue, 15 Jan 2008 05:10:32 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [MTD] potential division by 0 in cfi_build_cmd() and
	cfi_merge_status()?
Message-ID: <20080115041025.GB19407@lazybastard.org>
References: <478BFE1C.1090608@tiscali.nl>
	<20080115030103.GA19407@lazybastard.org>
	<alpine.LFD.1.00.0801142302410.3054@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.00.0801142302410.3054@xanadu.home>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Roel Kluin <12o3l@tiscali.nl>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 January 2008 23:06:13 -0500, Nicolas Pitre wrote:
> On Tue, 15 Jan 2008, Jörn Engel wrote:
> 
> > I don't think cfi_interleave(cfi) will ever be 0.  But the functions
> > definitely look a bit large for inlines.  Anyone having both cfi_probe
> > and jedec_probe will enjoy twice the kernel footprint from them.
> > Patches to move that code out-of-line are welcome.
> 
> Beware.
> 
> The typical use case is for your embedded system to be configured with 
> your flash arrangement and not all possible combinations available under 
> the sun.
> 
> In that case it is most likely that cfi_interleave(cfi) will simplify to 
> a constant, and making this out of line _will_ enlarge your kernel, as 
> well as possibly breaking interaction with a XIP kernel on ARM.
> 
> So please don't push this out of line.

Fair enough.

Jörn

-- 
Joern's library part 13:
http://www.chip-architect.com/
