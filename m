Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjYZw-0004AV-Nj
	for linux-mtd@lists.infradead.org; Sun, 21 Oct 2007 12:02:46 +0100
Date: Sun, 21 Oct 2007 10:48:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] BUG() when passing illegal parameters to decode_rs8() or
	decode_rs16()
Message-ID: <20071021084838.GB5052@lazybastard.org>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
	<20071020111126.GE32465@lazybastard.org>
	<alpine.LFD.0.9999.0710211005110.22770@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.0.9999.0710211005110.22770@localhost.localdomain>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Matt Reimer <mreimer@vpop.net>, linux-mtd@lists.infradead.org,
	mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 21 October 2007 10:06:53 +0200, Thomas Gleixner wrote:
> 
> No. It should never happen, but escalating an error which the kernel
> can survive under a lot of circumstances to a fatal death error is
> wrong.

I am unimpressed.  This error is not some rare hardware error, it is a
programming error, a bug in the kernel.  And until now it was handled by
hiding it as a _corrected_ crc error.  If you want to handle it in a
non-fatal way, you can do it.  But that requires more than just
reverting this patch - you should also properly document why an
"impossible" error is indeed possible and how calling code should deal
with it.  And of course make sure current code follows documentation and
does the right thing.

Is all that worth it?  I have serious doubts.

Jörn

-- 
Never argue with idiots - first they drag you down to their level,
then they beat you with experience.
-- unknown
