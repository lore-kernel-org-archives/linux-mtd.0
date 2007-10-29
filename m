Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1ImWUh-0001Bs-RP
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 11:25:43 -0400
Date: Mon, 29 Oct 2007 15:38:18 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071029143818.GA29885@lazybastard.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1193626747.2915.87.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Jamie Lokier <jamie@shareable.org>, Duke <ezbonites@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 28 October 2007 22:59:07 -0400, David Woodhouse wrote:
> 
> Yes, it does. In fact, on NOR flash you get entirely synchronous
> behaviour even _without_ explicit syncs -- effectively the same as
> MS_SYNC.

On older ones.  There appears to be a tendency for newer flashes to
require wbuf and hence sync.

Jörn

-- 
Joern's library part 4:
http://www.paulgraham.com/spam.html
