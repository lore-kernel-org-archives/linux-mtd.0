Received: from py-out-1112.google.com ([64.233.166.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JsiZh-0005zv-67
	for linux-mtd@lists.infradead.org; Sun, 04 May 2008 18:04:37 +0000
Received: by py-out-1112.google.com with SMTP id a73so556084pye.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 04 May 2008 11:04:35 -0700 (PDT)
Date: Sun, 4 May 2008 13:04:27 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: =?ISO-8859-1?B?SvZybg==?= Engel <joern@logfs.org>
Subject: Re: LogFS merge
Message-ID: <20080504130427.583d563c@vader.jdub.homelinux.org>
In-Reply-To: <alpine.LFD.1.10.0805041809370.3318@apollo.tec.linutronix.de>
References: <481C3087.8020501@free.fr> <20080503120005.GA32608@logfs.org>
	<alpine.LFD.1.10.0805041809370.3318@apollo.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Linus Torvalds <torvalds@osdl.org>, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	matthieu castet <castet.matthieu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 4 May 2008 18:20:23 +0200 (CEST)
Thomas Gleixner <tglx@linutronix.de> wrote:

> > Logfs ignores ubi and does wear leveling, bad block handling, etc.
> > itself.  Bad block handling in particular is not too robust yet.  If you
> > expect blocks to rot away after mkfs time, logfs is a bad choice.
> 
> It's a matter of fact that especially on NAND flash blocks become bad
> over time, i.e. after mkfs. So that's a pretty crucial feature which
> needs to be complete and robust before it's declared to be usable on
> such devices.

I agree.  LogFS seems quite impressive in its performance, however I'm
wondering how much redesign and rewrite would be needed in the code to
fix the bad block handling.  Maybe it's not so much and I'm overly
paranoid, but having at least some idea of what it would take might
help.  You could add it to Documentation/filesystems/LogFS.txt as a
TODO.

josh
