Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwYJL-0000ND-1h
 for linux-mtd@lists.infradead.org; Sun, 02 Sep 2018 19:45:28 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/25] ubifs: Add authentication nodes to journal
Date: Sun, 02 Sep 2018 21:45:04 +0200
Message-ID: <5120826.olsX7Y6fYh@blindfold>
In-Reply-To: <20180829143834.wwojzrwmpadxqiqk@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <1901352.nUraZMrBkh@blindfold>
 <20180829143834.wwojzrwmpadxqiqk@pengutronix.de>
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

Am Mittwoch, 29. August 2018, 16:38:34 CEST schrieb Sascha Hauer:
> I assumed that make_reservation would align len anyway. I can't find the
> place that led me to that assumption anymore and even if this is true
> it's probably safer to just stick to the original len for the
> non-authenticated case, so I'll change this and other places to use
> the non aligned len.
> 
> BTW could you have a look at ubifs_jnl_change_xattr()? Unlike other
> function in this file it explicitly calls make_reservation() with the
> length of the last node aligned. Do you have an idea why?

Well, this is not the only call site. Other call sites do so implicitly
since most UBIFS nodes sizes are aligned to 8.
But yes, there are some inconsistencies which need a cleanup. I've scheduled
that for the upcoming week.

Thanks,
//richard 
