Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8G25-0003o0-QE
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 06:04:18 -0500
Date: Mon, 7 Mar 2005 12:04:13 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gareth Bult <gareth@linux.co.uk>
Message-ID: <20050307110413.GD2198@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110043569.11425.63.camel@squizzey.bult.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 5 March 2005 17:26:09 +0000, Gareth Bult wrote:
> 
> A little while back I re-wrote blkmtd.c effectively to provide proper
> "write" access to jffs2 filesystems mounted on standard Linux block
> devices.
> 
> The driver seems to have worked well (for me) and after many thousands
> of downloads of FlashLinux, I've not had any reports of JFFS2 problems
> or corruption.
> 
> It appears that someone has "cleaned up" this driver and it now appears
> as an option in the standard kernel tree for 2.6.11.
> 
> Unfortunately it doesn't appear to work. As soon as you mount a JFFS2
> filesystem on it and try to write data, corruption sets in resulting is
> a fairly sharp system crash.
> 
> Copying back the source from the original driver I submitted to this
> list and recompiling the kernel (with a one line change) appears to
> yield a working system again.
> 
> So, two questions;
> a.	Did anyone actually test the code after cleaning it up?
> b.	Were there any life changing improvements that I really
> 	*need* to make to the original code?

Gareth, check your archives.

I sent the whole list of cleanup patches to you, you could have simply
tested them in order and told me which one broke.  Instead you got
pissed at dwmw2 since he didn't accept your broken mails and
explicitly told me various times, you didn't care about the driver.

The fact that you don't remember me, you don't remember being on Cc:
when I sent patches to Andrew Morton and now come running back is more
than a little disturbing to me.  Va snpg, V nz frireyl cvffrq ng lbh!

So can we pretty please both swallow our feelings and work
constructively together?  Or should I merely treat this mail as a bug
report, go fix it, remove every single line of your code from the
driver and remove your name afterwards?  Both are valid options, you
choose.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
