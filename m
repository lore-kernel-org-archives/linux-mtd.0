Received: from 1wt.eu ([62.212.114.60])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoBzq-0001dw-GS
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 01:24:25 -0400
Date: Wed, 16 May 2007 07:22:54 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516052253.GI943@1wt.eu>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<20070516000630.GD1220@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070516000630.GD1220@lazybastard.org>
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

On Wed, May 16, 2007 at 02:06:31AM +0200, Jörn Engel wrote:
> On Tue, 15 May 2007 13:37:59 -0700, Andrew Morton wrote:
> > It's strange and a bit regrettable that an fs would have dependency on MTD,
> > really.
> 
> It is and changing this wouldn't be too hard.  All device access goes
> through five functions (read, write, erase, is_bad and mark_bad).  As
> soon as someone seriously cares I will add a struct logfs_device_ops and
> have a second set of these functions for block devices.
> 
> On hard disks it shouldn't make too much sense.  The filesystem will
> fragment like a splinter bomb and be just as popular.

On hard disks, yes, but as you suggested, there are lots of other flash
devices interfaced as block devices. CompactFlash comes to mind, USB
keys too. And on these ones, the most important is to reduce the number
of writes and to support large sizes. I already see LogFS as an interesting
alternative to JFFS2 on such devices, eventhough it does not (yet?) support
compression.

Regards,
Willy
