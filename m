Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IElss-0004hz-Rq
	for linux-mtd@lists.infradead.org; Sat, 28 Jul 2007 08:59:05 -0400
Date: Sat, 28 Jul 2007 13:43:15 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070728114315.GA14558@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<20070727134825.GA9122@lazybastard.org>
	<6934efce0707271005w2d8ba5cs4aa9ff66c69e9c2a@mail.gmail.com>
	<20070727174431.GB11189@lazybastard.org>
	<6934efce0707271353t18885fc8j61a3be8a4513d7b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0707271353t18885fc8j61a3be8a4513d7b@mail.gmail.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 July 2007 13:53:42 -0700, Jared Hulbert wrote:
> 
> I thought about that.  I don't think it's worth it.  Point() does it's
> job fine.  I could add a peer to point called physaddr() that returns
> an address instead of a pointer.  That really doesn't doesn't help me.
>  I named it mtd_get_partition_physaddr() because all I need is to get
> the physical address of the mtd partition.  And if I get around to
> doing an acceptable port of XIP cramfs thats all it would need too.

Well, you always need both point() and the physical address.  But I
guess your solution is good enough for now.

Jörn

-- 
Joern's library part 2:
http://www.art.net/~hopkins/Don/unix-haters/tirix/embarrassing-memo.html
