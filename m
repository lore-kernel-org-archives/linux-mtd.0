Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e1Ygl-0004N4-3D
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 14:05:48 +0000
From: Richard Weinberger <richard@nod.at>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
Date: Mon, 09 Oct 2017 16:06:00 +0200
Message-ID: <3091124.OyALdOhNVz@blindfold>
In-Reply-To: <897ef011-81e9-1fda-9474-6ac999ea0674@pengutronix.de>
References: <20170626111947.17092-1-richard@nod.at>
 <13583464.gMdCSCRoQZ@blindfold>
 <897ef011-81e9-1fda-9474-6ac999ea0674@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 9. Oktober 2017, 15:59:44 CEST schrieb Marc Kleine-Budde:
> >> What happended to this patch? It's not on mainline (and thus not on the
> >> stable branches). Was there a better fix?
> > 
> > Since the patch is non-trivial I hoped to get a review or tested-by.
> > Therefore I didn't merge it so far.
> 
> What do you expect from proper testing?

Well, are you using this patch in production?

Thanks,
//richard
