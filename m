Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16CMrN-0004rl-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Dec 2001 15:24:21 +0000
Date: Fri, 7 Dec 2001 16:34:51 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Aleksander Sanochkin <asanochkin@lnxw.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: JFFS1/MTD bug-fixes
Message-ID: <20011207163450.A25252@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.33.0112070507510.12712-100000@newbast.lynuxworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.33.0112070507510.12712-100000@newbast.lynuxworks.com>; from asanochkin@Lnxw.COM on Fri, Dec 07, 2001 at 05:11:11AM -0800
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> > What are your reasons to use mtdchar ioctl()s for runtime
> > repartitioning? This should be pretty independent of the char device,
> > (caching) block device or whatever the future might still bring. Why
> > not a /proc interface?

Au contraire, at least in my case. I do use /proc, but not mtdchar,
since mtdblock is more convenient. A more important point is that
Linus generally favors /proc over ioctl()s, iirc.
Just a suggestion, though.

Jörn

-- 
A security system is only as secure as its secret. 
Beware of pseudo-secrets.
