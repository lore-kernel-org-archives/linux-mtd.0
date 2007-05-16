Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoIJx-0005W3-Bj
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 08:10:04 -0400
Date: Wed, 16 May 2007 13:23:17 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516112317.GB5472@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<20070516000630.GD1220@lazybastard.org>
	<20070516052253.GI943@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070516052253.GI943@1wt.eu>
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 May 2007 07:22:54 +0200, Willy Tarreau wrote:
> 
> On hard disks, yes, but as you suggested, there are lots of other flash
> devices interfaced as block devices. CompactFlash comes to mind, USB
> keys too. And on these ones, the most important is to reduce the number
> of writes and to support large sizes. I already see LogFS as an interesting
> alternative to JFFS2 on such devices, eventhough it does not (yet?) support
> compression.

It does support compression now.  That part was finished, erm, about two
weeks ago.

Logfs on Smartmedia format (I assume most CompactFlash, USB, SD and MMC
media use that) will currently cause a nasty interaction.  Unlike JFFS2,
logfs will alternately write to several eraseblocks.  On real flash,
alternating between half-finished blocks is free.

Smartmedia standard requires to finish the last block before moving to
the next.  So the logfs write pattern will cause it to add an
erase/write overhead of - depending on erase size and compression - 4x
to 512x.  Pretty bad.

If Smartmedia was really stupid, there would be no overhead at all.  Any
manucaturers listening should seriously think about allowing raw flash
access to their devices. ;)

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
