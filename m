Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHdO8-0005Yt-M1
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 11:03:31 +0000
Date: Wed, 23 Jan 2008 11:57:13 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080123105713.GC24953@lazybastard.org>
References: <20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
	<20080123101915.GA24953@lazybastard.org>
	<Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>, Josh Boyer <jwboyer@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 January 2008 11:41:14 +0100, Ricard Wanderlof wrote:
> 
> One problem may be what to do when the system is powered down. If we don't 
> store the error counters in the flash (or some other non-volatile place), 
> then each time the system is powered up, all the error counters will be 
> reset.

Exactly.  If the information we need to detect problems is not stored in
the filesystem, it is useless.  Maybe it would work for a very
specialized system to keep that information in DRAM or NVRAM, but in
general it will get lost.

As a matter of principle logfs does not do any special things for special
systems.  If you have a nice optimization, it has to work for everyone.
If it doesn't, your systems behaves differently from everyone else's
systems.  So whatever bugs you have cannot be reproduced by anyone else.

For example, when the system crashes, some data may get written that
isn't accounted for in the journal.  On reboot/remount that gets
detected and the wasted space is skipped.  Writes continue beyond it.
On hard disks or consumer flash media, it is legal to rewrite the same
location without erase.  But logfs still skips that space and is
deliberately inefficient.

> >I do remember your mail describing the test.  One of the interesting
> >conclusions is that even awefully worn out block is still good enough to
> >store short-lived information.  It appears to be a surprisingly robust
> >strategy to have a high wear-out, as long as you keep the wear
> >constantly high and replace block contents at a high rate.
> 
> You're probably right, but I'm not sure I understand what you mean.

High wearout means short time between two writes.  Which also means few
reads between two writes.

As long as the write rate (wear rate) remains roughly constant, high
wear doesn't seem to cause any problems.  The block's ability to retain
information degrades, but that doesn't matter because it doesn't have to
retain the information for a long time.

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
