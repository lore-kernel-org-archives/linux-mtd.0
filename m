Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs06r-0008AJ-1x
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 06:25:46 +0000
From: Richard Weinberger <richard@nod.at>
To: Liu Song <liu.song11@zte.com.cn>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: Re: [PATCH] ubifs: remove unnecessary check in ubifs_log_start_commit
Date: Tue, 21 Aug 2018 08:25:30 +0200
Message-ID: <6703427.thn4Ct9gCO@blindfold>
In-Reply-To: <1534821442-178518-1-git-send-email-liu.song11@zte.com.cn>
References: <1534821442-178518-1-git-send-email-liu.song11@zte.com.cn>
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

Liu Song,

Am Dienstag, 21. August 2018, 05:17:22 CEST schrieb Liu Song:
> The value of c->lhead_offs cannot exceed max_len which much
> smaller than c->leb_size. So the check will never be true.
> Just remove it.

Please explain in more detail why this case is never ever possible.
Removing such code needs a good justification. 

In general I don't much like such changes for two reasons:
1. They don't fix a problem
2. They are likely to introduce very hard to debug new issues if they are wrong

Thanks,
//richard
