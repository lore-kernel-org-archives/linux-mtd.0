Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2H2a-0006Oq-K7
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 14:31:50 +0000
From: Richard Weinberger <richard@nod.at>
To: Andrew Worsley <amworsley@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "open list:UNSORTED BLOCK IMAGES (UBI)" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Round UBI average erase count up to next integer
Date: Tue, 18 Sep 2018 16:31:33 +0200
Message-ID: <90432329.iuebBMo885@blindfold>
In-Reply-To: <20180918130521.22880-2-amworsley@gmail.com>
References: <20180918130521.22880-1-amworsley@gmail.com>
 <20180918130521.22880-2-amworsley@gmail.com>
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

Andrew,

Am Dienstag, 18. September 2018, 15:05:21 CEST schrieb Andrew Worsley:
> Use a slightly larger than average EC so these PEBs will be
> reinitialised with erase counts that make them less likely to
> be reused than other (perhaps less worn or error-prone) PEBs
> 
> We have more frequent ECC failures on reads of page 0 of some PEBs
> which manifest itself commonly during ubiattach. We believe this is due to
> "program disturb" and want those PEB to be re-used later than average.

So the general idea behind the patch is that we want to hold back PEBs
that lost the EC header since they must be less healthy than others?
More precisely such that this PEB will be less likely picked by find_mean_wl_entry().

Did you check, doesn't this make it more likely that such a "bad" PEB is more often
picked by wear leveling? It does not use find_mean_wl_entry().

Thanks,
//richard
