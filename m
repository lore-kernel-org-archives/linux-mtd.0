Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6cc3-0007T2-Hd
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 22:09:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Cam Mayor <cmayor@iders.ca>
In-Reply-To: <03100615454506.30787@kilauea.iders.ca>
References: <03100614331605.30787@kilauea.iders.ca>
	 <1065468987.30987.26.camel@imladris.demon.co.uk>
	 <03100615454506.30787@kilauea.iders.ca>
Message-Id: <1065474534.30987.31.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 06 Oct 2003 22:08:54 +0100
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

On Mon, 2003-10-06 at 15:45 -0500, Cam Mayor wrote:
> In my particular usage, the first two (of eight) "small" blocks are used by 
> the bootloader, leaving a free area of 6 x 8kiB blocks + 6 x 64 kiB blocks.   
> Just now i tried specifying this oddly shaped area on the kernel command 
> line, with the result:
> 	mtd: partition "free" doesn't start on an erase block boundary -- force 
> read-only

Yep. There exists no 'major' erasesize. All real hardware devices have
one, we don't try to work around it.

> is there a way to use the disjoint mtd5+mtd7 together to host a continuous 
> filesystem?

See mtdconcat.

-- 
dwmw2
