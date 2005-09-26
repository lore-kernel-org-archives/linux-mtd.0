Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoaw-0004GR-VB
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:45:09 -0400
Date: Mon, 26 Sep 2005 10:44:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050926084419.GD17756@wohnheim.fh-wedel.de>
References: <20050925103037.GA25279@wohnheim.fh-wedel.de>
	<BAY17-F17754FE85551E948E0FCBBE88B0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F17754FE85551E948E0FCBBE88B0@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Enhancement to current 1:1 mapping handling in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 September 2005 16:32:20 +0800, zhao forrest wrote:
> >
> >This could become a limit already.  Block devices going through a
> >translation usually have 4k as erase size.  Any USB key above 128KiB
> >will be a problem.
> >
> >Not sure what we want to do about this.
> 
> I agree with you that my patch is not a perfect solution to the
> problem. But at least it's a further step of current 1:1 mapping
> handling in JFFS2. I think someone can give better patch if he
> meets the limit in the future. Does it make sense to you? Or 
> do you agree to check in this patch after I finish revising it?

Maybe you can just keep the current logic from Ferenc for the pointer
array.  People can already meet the limit today, so we need some
solution today.

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
