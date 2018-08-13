Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpB3L-0008LC-JO
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2018 11:30:29 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 05/25] ubifs: implement ubifs_lpt_lookup using
 ubifs_pnode_lookup
Date: Mon, 13 Aug 2018 13:30:13 +0200
Message-ID: <3522568.rp1UpMI3Wl@blindfold>
In-Reply-To: <20180813081238.crujoer2qprhn27y@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <8387142.nbJ7LYRgBX@blindfold>
 <20180813081238.crujoer2qprhn27y@pengutronix.de>
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

Am Montag, 13. August 2018, 10:12:38 CEST schrieb Sascha Hauer:
> > Can you please add a helper function for that? These shift games are
> > always confusing and not easy to spot.
> 
> Do you have a suggestion for a helper function? lpt.c is full of rather
> non obvious arithmetic operations and I couldn't find a helper function
> that could be reused at least once in the code.
> 
> I tried with:
> 
> static int lnum_to_pnode_num(struct ubifs_info *c, int lnum)
> {
> 	return (lnum - c->main_first) >> UBIFS_LPT_FANOUT_SHIFT;
> }
> 
> But I am not sure this really improves things

I had exactly such helpers in mind.
The lpt code translates often LEB numbers in both direction.
So, the helpers should have more than one user.

Long story short, I don't force you to add such helper and such.
Just thought while you are here you can try to make the code more
readable.

I think we both agree that lpt.c is not really review friendly. ;)

Thanks,
//richard
