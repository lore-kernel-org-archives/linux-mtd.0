Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KDQW-0004Ww-UR
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 09:33:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: David Wuertele <dave-gnus@bfnet.com>
In-Reply-To: <m34r3izfvn.fsf@bfnet.com>
References: <m34r3izfvn.fsf@bfnet.com>
Message-Id: <1053938076.17182.39.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 26 May 2003 09:34:36 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/utils automake attic?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-26 at 01:54, David Wuertele wrote:
> I'm trying to compile the utils directory following the automake
> instructions, but there seem to be files missing in my version of
> CVS:  
> 
>   automake: `configure.ac' or `configure.in' is required
>   automake: configure.in: required file `./install-sh' not found
>   automake: configure.in: required file `./missing' not found
>   configure.in: 4: required file `./config.h.in' not found
> 
> When I look at the web CVS, I can see those files:
> 
> http://www.infradead.org/cgi-bin/cvsweb.cgi/mtd/util/?hideattic=0&sortby=date
> 
> They appear to be "in the attic".  What does that mean?  Is there a
> way to download these files using cvs?

It means they've been deleted from CVS. They're there only as part of
the history -- you can obtain them by asking for a specific (i.e. the
penultimate) version, or by date.

But don't bother -- I removed the auto* crap in favour of the proper
makefiles. If you need to cross-compile, you can do so with a command
such as 'make CROSS=arm-linux-gnu- mkfs.jffs2'.

You'll need to make sure that zlib is in your toolchain's sys-root or
otherwise available.

-- 
dwmw2
