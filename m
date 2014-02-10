Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCvv8-0008BJ-1d
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 18:49:32 +0000
Date: Mon, 10 Feb 2014 15:48:59 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210184858.GA6484@localhost>
References: <52F6BCCD.5070302@nod.at> <20140208233758.GH22376@1wt.eu>
 <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392043814.32363.49.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 10, 2014 at 04:50:14PM +0200, Artem Bityutskiy wrote:
[..]
> 
> I am concerned of a kernel option. All these little tiny compile-time
> options are so annoying. We have so many of them.
> 
> I'd say, either support write or not.
> 
> If you support it, document its limitations in mtd-www. Print a run-time
> warning that it is not power-cut-safe on module initialization, after
> all. Let others improve it later if needed.
> 
> Or mark R/W as experimental and make your module to be R/O by default.
> Force people to use 'blockdev --setro' if they want R/W. Run-time.
> 
> But do not add anther tiny little Kconfig option.
> 

Hm... well, this brings another question. The 1-LEB cache was made
optional after a suggestion from Piergiorgio; the reason for not
enabling the cache is to make the block interface even less memory
hungry.

Filesystems can have smarter caches, so it's not clear the cache is
needed.

Maybe we can keep a parameter for it? However, notice that the block
interface is no longer a separate module, but part of the UBI core.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
