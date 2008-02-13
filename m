Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPI4a-0008So-1A
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 13:54:59 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JW600AXUJZ3VQ00@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 08:54:41 -0500 (EST)
Date: Wed, 13 Feb 2008 08:54:39 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Subject: Re: What part of the code puts CFI Flash into write-mode and
	read-mode?
In-reply-to: <c384c5ea0802130541i160a3888pac00f2cdc37222ed@mail.gmail.com>
Message-id: <alpine.LFD.1.00.0802130853200.2732@xanadu.home>
References: <c384c5ea0802130541i160a3888pac00f2cdc37222ed@mail.gmail.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 Feb 2008, Leon Woestenberg wrote:

> Hello,
> 
> I'ld like to make a trace of whether a CFI FlashROM is in read- or
> write mode, but have difficulty understanding where this transition
> occurs in the MTD source code.
> 
> Can someone give me a pointer?

Searrch for lines that look like:

	chip->state = FL_WRITING;

or

	chip->state = FL_WRITING_TO_BUFFER;

Etc.


Nicolas
