Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELH7Z-0006ww-FP
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 05:24:23 -0400
Date: Fri, 30 Sep 2005 11:24:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Daniel Ann <ktdann@gmail.com>
Message-ID: <20050930092409.GA19495@wohnheim.fh-wedel.de>
References: <9b7ca6570509300036r47c410a4la8f8598794a17041@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b7ca6570509300036r47c410a4la8f8598794a17041@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem partitioning discontinuous physical start address
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 September 2005 16:36:06 +0900, Daniel Ann wrote:
> 
> Im trying to partion my flash using partioning support (ie. parse
> partition from the kernel argument) but for board with 2x intel flash
> linearly connected, I can partition it no problem.
> 
> Problem exist with board with 2x intel flash (16MB each) non-linearly connected.
> One is located at 0x7C00_0000 and another at 0xFF00_0000. If I give
> 0x7C00_0000 as a physical start address with length as 0x84000000 (ie.
> (0xFFFF_FFFF - 7C00_0000) + 1)and select support for non-linear
> mappings of flash chips, I get an error saying that its too large.
> 
> What options do I have without having to write my own physmap.c. I've
> had one before when I was using 2.4 kernel, but having moved to 2.6,
> I'm trying not to make any custom changes and trying to stick with the
> main stream.
> 
> Any advice would be welcome. thanks.

You could try concat.  iirc, it was created for this purpose.

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
