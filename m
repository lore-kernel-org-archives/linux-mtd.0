Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7yDF-0004p1-FI
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 12:34:58 -0400
Date: Wed, 24 Aug 2005 18:34:53 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ma Yun <sx_yunma@hotmail.com>
Message-ID: <20050824163453.GA12192@wohnheim.fh-wedel.de>
References: <BAY21-F191EACF7F23AC5886AC788F5A80@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY21-F191EACF7F23AC5886AC788F5A80@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] XATTR support in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 24 August 2005 19:08:38 +0800, Ma Yun wrote:
> 
> Thank joern! I am sorry for my poor kernel code experience.

Your code is rather good for someone of poor experience.

> I have modified the patch.
> 
> Below is the implemention mechanism :)

Thank you.  After thinking about this some more, I agree with dwmw2
that Kaigai-san's design makes more sense for most users.  Your
design is fine for your special case, but lacking for other potential
users.

Kaigai-san said that he wanted to pick up some of the suggestions and
implement a new patch soon, which will likely be the basis of what we
will merge.  So, if you could afford the time and work with him on a
merge candidate patch, that would be great!

The most important issue to think about would be sharing of attributes
between different files/directories.  It appears to be a frequent
usage pattern that many files have identical attributes, which would
waste quite a bit of space otherwise.

Jörn

-- 
Fancy algorithms are buggier than simple ones, and they're much harder
to implement. Use simple algorithms as well as simple data structures.
-- Rob Pike
