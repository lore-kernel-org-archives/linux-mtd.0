Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdp9H-0000qb-VB
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 09:54:49 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060510133510.GD31935@wohnheim.fh-wedel.de>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
	<20060510133510.GD31935@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Wed, 10 May 2006 17:54:11 +0400
Message-Id: <1147269251.16853.50.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] reserved pool
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-10 at 15:35 +0200, Jörn Engel wrote:

> > +	while ((p = strsep(&opts, ",")) != NULL) {
> " != NULL" is superfluous.
Fixed.

> > +		switch (token) {
> > +			case JFFS2_OPT_RP_SIZE:
> 
> One level of indentation can be save here.  Unlike dwmw2, I don't
> participate in the terminal size arms race and still care about 80
> columns. ;)
Fixed.

Thanks.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
