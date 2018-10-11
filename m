Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAiYZ-0007Cp-TN
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2018 21:31:45 +0000
From: Richard Weinberger <richard@nod.at>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 16/17] mtd_blkdevs: convert to blk-mq
Date: Thu, 11 Oct 2018 23:31:31 +0200
Message-ID: <3224309.SPdaaRQAfj@blindfold>
In-Reply-To: <6ac34916-e35d-d8d7-77d5-da83260714fc@kernel.dk>
References: <20181011165909.32615-1-axboe@kernel.dk>
 <19488748.6iqVKhkDGp@blindfold>
 <6ac34916-e35d-d8d7-77d5-da83260714fc@kernel.dk>
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

Am Donnerstag, 11. Oktober 2018, 23:21:56 CEST schrieb Jens Axboe:
> >>  		if (!blk_update_request(req, res, blk_rq_cur_bytes(req))) {
> >> -			req = NULL;
> >>  			__blk_mq_end_request(req, res);
> >> +			req = NULL;
> > 
> > Hehe. :-)
> > With this fix applied it works and passes my trivial test.
> 
> Great, thanks for testing! Can I add your tested-by to it?

Sure.

Thanks,
//richard
