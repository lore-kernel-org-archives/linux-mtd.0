Received: from smtp105.sbc.mail.mud.yahoo.com ([68.142.198.204])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FuyaP-0004Jl-Ic
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 17:25:44 -0400
From: David Brownell <david-b@pacbell.net>
To: dedekind@infradead.org
Subject: Re: DataFlash & writesize
Date: Mon, 26 Jun 2006 13:33:11 -0700
References: <4497A89F.4010202@yandex.ru>
	<1151058432.27505.60.camel@fuzzie.sanpeople.com>
	<1151059415.16043.45.camel@sauron.oktetlabs.ru>
In-Reply-To: <1151059415.16043.45.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606261333.11632.david-b@pacbell.net>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 23 June 2006 3:43 am, Artem B. Bityutskiy wrote:
> On Fri, 2006-06-23 at 12:27 +0200, Andrew Victor wrote:
> > Since the writesize change is now in mainline git, here is a trivial
> > patch to set mtd->writesize for DataFlash.
> > [writesize = erasesize = pagesize]
> > 
> 
> Andrew,
> 
> I made the same yesterday and it is in GIT, but thank you anyway!

What are the intended semantics for "writesize" by the way?

I noticed I was getting that first BUG_ON in mtdcore:add_mtd_device
since, with NOR CFI cmdset 1 flash, with current GIT.  Seems like
writesie should have been set up already.

- Dave
