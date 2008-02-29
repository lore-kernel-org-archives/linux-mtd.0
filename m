Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JVBND-00084M-6d
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 19:58:27 +0000
Date: Fri, 29 Feb 2008 20:57:40 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Dimitrios Apostolou <jimis@gmx.net>
Subject: Re: swap file over jffs2 partition
Message-ID: <20080229195740.GA24630@lazybastard.org>
References: <47C772E9.2000000@gmx.net> <20080229084345.GA16507@lazybastard.org>
	<47C84111.6030103@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47C84111.6030103@gmx.net>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 February 2008 19:29:53 +0200, Dimitrios Apostolou wrote:
> 
> Thanks and sorry for intruding LKML. It seems that even wikipedia has 
> wrong address for the mailing list, see the last link of the article:
> 
> http://en.wikipedia.org/wiki/JFFS2

Fixed.  Not that I actually read the page and checked for other
errors...

> Interesting. I guess nobody has experimented with it yet so I'll try. 
> Unfortunately it seems I'll face another problem, that JFFS2 doesn't 
> support having a swap-file at all. Why would this happen? More info:
> 
> http://dev.laptop.org/ticket/6469

Yes, this still requires a bit of work.  Peter Zijlstra has a patch for
the memory-management side of it, someone has to fix up jffs2 as well.
I'll add support to logfs fairly soon.

> Of course! I intend to use all the 1GB of flash only for swap, the 
> system will be practically diskless. And I don't think enabling 
> compression for such a task would be wise.

It might, actually.  Assuming your average swap page compresses to 50%,
it means that you use half the bandwidth to flash and get twice the
lifetime before blocks wear out.  Whether the performance gets better or
worse depends on the relative speeds of your CPU and flash.

Jörn

-- 
Joern's library part 10:
http://blogs.msdn.com/David_Gristwood/archive/2004/06/24/164849.aspx
