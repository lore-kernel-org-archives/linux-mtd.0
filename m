Received: from kynes.gatewest.net ([198.163.227.7]
	helo=10-10-1-6.gatewest.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6cEj-0006jR-Gz
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 21:45:45 +0100
From: Cam Mayor <cmayor@iders.ca>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 6 Oct 2003 15:45:45 -0500
References: <03100614331605.30787@kilauea.iders.ca>
	<1065468987.30987.26.camel@imladris.demon.co.uk>
In-Reply-To: <1065468987.30987.26.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Message-Id: <03100615454506.30787@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: a-linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd filesystem across different sector sizes in the same part
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 06 October 2003 14:36, David Woodhouse wrote:
> On Mon, 2003-10-06 at 14:33 -0500, Cam Mayor wrote:
> > In my flash part (intel 28f320c3) there are 8 x 8kB blocks and 63 x 64 kB
> > blocks.  I believe that [1] MTD can span the two block sizes effectively
> > for it to be recognized as a single MTD device.  JFFS2, IIRC, uses 5
> > flash blocks for flash filesystem overhead.  Do those blocks have to be
> > any specific size relative to the rest of the filesystem blocks?  Will it
> > use the first five blocks, or does it move around for wear levelling? 
> > Will JFFS2 get confused by different block sizes, or is that already
> > handled in the MTD layer?
>
> JFFS2 will use the 'major' erase size, and treat your 8 * 8KiB blocks as
> a single 64KiB block.

In my particular usage, the first two (of eight) "small" blocks are used by 
the bootloader, leaving a free area of 6 x 8kiB blocks + 6 x 64 kiB blocks.   
Just now i tried specifying this oddly shaped area on the kernel command 
line, with the result:
	mtd: partition "free" doesn't start on an erase block boundary -- force 
read-only

So, it sounds like JFFS2 won't handle this specific situation, as mtd itself 
is unwilling to deal with it.  (the partition "free" does start on an erase 
block boundary - but it is one of the smaller block boundaries, not the major 
erase size)

I don't have a multi-flash system, so i can't test this, but i wonder how 
this would work for a system concatenated across two flash chips with 
different erase block sizes where the numbers don't allow them to align 
nicely.

Here's another thing i just thought of but haven't noticed in my mtd research 
in the past (and couldn't see anything relevant in Configure.help): is there 
a way to get two non-continuous mtd partitions to host a jffs2 filesystem?  
eg. 
mtd5: 00400000 00020000 "userarea1"
mtd6: 00400000 00020000 "something_else"
mtd7: 00400000 00020000 "userarea2"
is there a way to use the disjoint mtd5+mtd7 together to host a continuous 
filesystem?

thanks for the info.

-- 
Cameron Mayor
Iders Incorporated
