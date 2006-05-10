Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdpCg-00012w-3H
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 09:58:23 -0400
Date: Wed, 10 May 2006 15:58:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20060510135814.GG31935@wohnheim.fh-wedel.de>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
	<20060510133510.GD31935@wohnheim.fh-wedel.de>
	<1147269251.16853.50.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1147269251.16853.50.camel@sauron.oktetlabs.ru>
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

On Wed, 10 May 2006 17:54:11 +0400, Artem B. Bityutskiy wrote:
> On Wed, 2006-05-10 at 15:35 +0200, Jörn Engel wrote:
> 
> > > +	while ((p = strsep(&opts, ",")) != NULL) {
> > " != NULL" is superfluous.
> Fixed.
> 
> > > +		switch (token) {
> > > +			case JFFS2_OPT_RP_SIZE:
> > 
> > One level of indentation can be save here.  Unlike dwmw2, I don't
> > participate in the terminal size arms race and still care about 80
> > columns. ;)
> Fixed.

Then go and bug dwmw2 about merging it. ;)

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
