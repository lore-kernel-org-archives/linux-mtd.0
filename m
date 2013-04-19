Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTG23-0004Hz-QZ
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 18:27:36 +0000
Message-ID: <1366396053.3901.40.camel@joe-AO722>
Subject: Re: [PATCH] mtd: Convert logging messages
From: Joe Perches <joe@perches.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Date: Fri, 19 Apr 2013 11:27:33 -0700
In-Reply-To: <20130419165516.GA19480@logfs.org>
References: <1366394375.3901.36.camel@joe-AO722>
 <20130419165516.GA19480@logfs.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@lazybastard.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-04-19 at 12:55 -0400, Jörn Engel wrote:
> On Fri, 19 April 2013 10:59:35 -0700, Joe Perches wrote:
> >  	}
> >  	list_add(&dev->list, &blkmtd_device_list);
> > -	INFO("mtd%d: [%s] erase_size = %dKiB [%d]", dev->mtd.index,
> > -			dev->mtd.name + strlen("block2mtd: "),
> > -			dev->mtd.erasesize >> 10, dev->mtd.erasesize);
> > +	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
> > +		dev->mtd.index,
> > +		dev->mtd.name + strlen("block2mtd: "),
> > +		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
> 
> I personally dislike the indent-to-braces style because it causes
> unnecessary churn in patches like this.

It comes from an automated emacs conversion.

> The reindenting improves nothing at all.

Debatable.

> It will waste time when people care about revision history because
> they encounter a bug, want a fix quick and are pressed for time.

Not really if you use existing tools with options.

Try:
	git diff -w
	git blame -w

> If you care about my ack, please remove random churn.  This is not a
> competition about who gets the most lines in git blame.

I care not at all about commit counts,
nor things like lines added or removed.
