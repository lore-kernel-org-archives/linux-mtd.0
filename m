Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjYDj-0003q5-3Q
	for linux-mtd@lists.infradead.org; Sun, 21 Oct 2007 11:39:49 +0100
Date: Sun, 21 Oct 2007 10:42:02 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] Replace -1 with -EBADMSG in nand error correction code
Message-ID: <20071021084201.GA5052@lazybastard.org>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
	<20071020111126.GE32465@lazybastard.org>
	<20071020111344.GF32465@lazybastard.org>
	<alpine.LFD.0.9999.0710211007080.22770@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.0.9999.0710211007080.22770@localhost.localdomain>
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

On Sun, 21 October 2007 10:08:40 +0200, Thomas Gleixner wrote:
> On Sat, 20 Oct 2007, Jörn Engel wrote:
> 
> > Magic numerical values are just bad style.  Particularly so when
> > undocumented.
> 
> Please resend with a proper Signed-off-by.
> Please add my Acked-by as well.

Already resent privately to dwmw2 (just added a Signed-Off-By: didn't
seem to justify a huge Cc: list).  He merged it.

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
