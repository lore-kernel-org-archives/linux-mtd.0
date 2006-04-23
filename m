Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXeSW-0004A6-FW
	for linux-mtd@lists.infradead.org; Sun, 23 Apr 2006 09:18:29 -0400
Date: Sun, 23 Apr 2006 15:16:43 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060423131643.GD19326@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
	<20060423122721.GC19326@wohnheim.fh-wedel.de>
	<625fc13d0604230605s4ef156aev67d498eed9be629b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0604230605s4ef156aev67d498eed9be629b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [HOWTO] Using git for mtd (v3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 23 April 2006 08:05:57 -0500, Josh Boyer wrote:
>
> > 4. Fetch mtd tree
> >
> >   $ git fetch mtd
> 
> Does that really do what you want though?  It will fetch the objects
> from the mtd-2.6 tree, but it doesn't merge them into your local tree
> from what I remember.  So to actually get the changes into the source,
> you'd have to do 'git fetch mtd'; 'git merge', no?

That doesn't do a merge, correct.  I was told that a merge is to be
avoided at all costs.  What it does is create a branch that i switch
to in step 5.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
