Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erQyV-0001Vm-Fi
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 16:23:03 +0000
From: Richard Weinberger <richard@nod.at>
To: Jiang Biao <jiang.biao2@zte.com.cn>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zhong.weidong@zte.com.cn
Subject: Re: [PATCH] fs/ubifs: remove useless parameter of lpt_heap_replace
Date: Thu, 01 Mar 2018 17:23:41 +0100
Message-ID: <3489822.spB4g6dZPN@blindfold>
In-Reply-To: <1519784557-105528-1-git-send-email-jiang.biao2@zte.com.cn>
References: <1519784557-105528-1-git-send-email-jiang.biao2@zte.com.cn>
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

Am Mittwoch, 28. Februar 2018, 03:22:37 CET schrieb Jiang Biao:
> The parameter *old_lprops* is never used in lpt_heap_replace(),
> remove it to avoid compile warning.

Makes sense. But what compiler warning do you get?

Thanks,
//richard
