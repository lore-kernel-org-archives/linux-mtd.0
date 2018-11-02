Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIcXv-0006bz-4j
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 16:43:44 +0000
From: Richard Weinberger <richard@nod.at>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 00/42] mtd-utils: Add fscrypt support to mkfs.ubifs
Date: Fri, 02 Nov 2018 17:43:30 +0100
Message-ID: <17926749.dDWCxxX0MU@blindfold>
In-Reply-To: <14ba6760-1d30-3814-408b-089667ccec1f@sigma-star.at>
References: <20181018143718.26298-1-richard@nod.at>
 <14ba6760-1d30-3814-408b-089667ccec1f@sigma-star.at>
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

David,

Am Freitag, 2. November 2018, 17:41:44 CET schrieb David Oberhollenzer:
> Hi!
> 
> This patch set has been sitting on the ML for more than two weeks now, with no
> one commenting/complaining/nit-picking/bike-shedding/etc, so I'll push it to
> mtd-utils.git master.
> 
> Since I authored some of those commits and already stared at the whole patch
> set for quite some time before it's been submitted, I'm not sure how helpful
> it is for me to try and review it now. Nevertheless, I've looked through the
> patch set again over the last few days, compared it against the latest version
> I have locally and did some quick tests and it still looks good to me.

one thing is to consider, Sascha's UBIFS auth patches for mkfs.ubifs.
Not that there are some subtle merge issues.

Thanks,
//richard 
