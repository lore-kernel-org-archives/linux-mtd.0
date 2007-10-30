Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1ImxdT-0005OW-H6
	for linux-mtd@lists.infradead.org; Tue, 30 Oct 2007 16:24:33 -0400
Date: Tue, 30 Oct 2007 21:19:45 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Duke <ezbonites@gmail.com>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071030201945.GA16322@lazybastard.org>
References: <79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
	<20071029143818.GA29885@lazybastard.org>
	<20071029205125.GA27773@mail.shareable.org>
	<20071029215457.GB1027@lazybastard.org>
	<20071029224638.GA7122@mail.shareable.org>
	<20071030160948.GD13455@lazybastard.org>
	<79ac09b60710301308m294ae82m79e6ee982208ca35@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79ac09b60710301308m294ae82m79e6ee982208ca35@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Josh Boyer <jwboyer@gmail.com>, Jamie Lokier <jamie@shareable.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 October 2007 15:08:11 -0500, Duke wrote:
> 
> After all is said and done, can the minimum number of jffs2 blocks be
> determined? Or it varies from system to system? Or flash system type
> (NOR flash in my case).

It can.  Please read jffs2_calc_trigger_levels() in fs/jffs2/build.c.
Maybe those numbers can even be lowered a little.  But you get to do the
math, if that is your wish.

Jörn

-- 
Joern's library part 15:
http://www.knosof.co.uk/cbook/accu06a.pdf
