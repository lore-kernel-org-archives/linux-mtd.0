From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060510135814.GG31935@wohnheim.fh-wedel.de>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
	<20060510133510.GD31935@wohnheim.fh-wedel.de>
	<1147269251.16853.50.camel@sauron.oktetlabs.ru>
	<20060510135814.GG31935@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 May 2006 20:39:43 +0100
Message-Id: <1147635584.2551.20.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] reserved pool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-10 at 15:58 +0200, Jörn Engel wrote:
> > > One level of indentation can be save here.  Unlike dwmw2, I don't
> > > participate in the terminal size arms race and still care about 80
> > > columns. ;)

My terminals also have 80 columns, but they only have 25 lines. So while
you're fixing the 'too large reserved pool size' printk to say 'KiB',
please also make it fit on one line... if someone can't look at the
first 80 columns and work out what that printk is about, then they're
really beyond help. Don't go using up extra lines for their benefit.

> > Fixed.
> 
> Then go and bug dwmw2 about merging it. ;) 

We talked about changing the way the reserved size is actually handled
in the allocation routine.... did a new version ever show up?

-- 
dwmw2
