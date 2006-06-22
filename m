Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtKGi-0004iL-Cz
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 04:10:35 -0400
Date: Thu, 22 Jun 2006 10:10:20 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Subject: Re: Current mtd tree is broken
Message-ID: <20060622081020.GA23207@wohnheim.fh-wedel.de>
References: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
	<1150957222.4244.5.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1150957222.4244.5.camel@sauron.oktetlabs.ru>
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 June 2006 10:20:22 +0400, Artem B. Bityutskiy wrote:
> On Wed, 2006-06-21 at 17:35 -0500, Josh Boyer wrote:
> > 1) Remove the BUG call and allow writesize == 0 to be valid.  This is
> > what was originally done and I didn't see a problem with that.
> 
> May panto just point which chips are broken? The fix must be trivial in
> most cases.

He cares about just one.  If you want to find them all, a grep for
"erasesize.*=" will show you 100+ instances.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
