Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6bAe-0004fF-Lf
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 20:37:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Cam Mayor <cmayor@iders.ca>
In-Reply-To: <03100614331605.30787@kilauea.iders.ca>
References: <03100614331605.30787@kilauea.iders.ca>
Message-Id: <1065468987.30987.26.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 06 Oct 2003 20:36:27 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Mon, 2003-10-06 at 14:33 -0500, Cam Mayor wrote:
> After doing a flash storage map for one of our devices and based on reading a 
> recent question to this list, i thought of another question.
> 
> In my flash part (intel 28f320c3) there are 8 x 8kB blocks and 63 x 64 kB 
> blocks.  I believe that [1] MTD can span the two block sizes effectively for 
> it to be recognized as a single MTD device.  JFFS2, IIRC, uses 5 flash blocks 
> for flash filesystem overhead.  Do those blocks have to be any specific size 
> relative to the rest of the filesystem blocks?  Will it use the first five 
> blocks, or does it move around for wear levelling?  Will JFFS2 get confused 
> by different block sizes, or is that already handled in the MTD layer?  

JFFS2 will use the 'major' erase size, and treat your 8 * 8KiB blocks as
a single 64KiB block.

-- 
dwmw2
