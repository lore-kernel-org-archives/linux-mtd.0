Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F30CFD877D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnxo5ee0FHRWjUs5rr5c5ozwZUMcYq0vvLb5Mwtg/20=; b=khP/fLQ673Iigm
	Qg/R6ABkpLhvnZBj1JHpynrtAmuFN3SmEqrdY32UXVs/YTEjTTmVwc6yRBRc38d1THL9z/ptPdrS8
	2ZlKL2aCctSKaZ5tKc0jtkAxbFzIoRGJ4H8GWLBufgMKQhw+cJ+gjZDNWhabAgv7Iv5f7DNfUOnCX
	0bcpC6lnHxCDIMhgGffKVd1Nlk+nzNtvCGhDLi+bX+xl7AD0s6If4QxorP0IRlrVggRgEcy1Dx0sd
	ObxB711Ul5SVzWzPzFj0QrQdRAJ30/2dMMPSF2j+kLzxcUzNtf2WU5p0BxgGNdHbeo1RzfJb7UGGy
	BsQ8Rip8esz3rhYaoyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VJI-00000006ZOg-2FnV;
	Tue, 17 Mar 2026 14:22:16 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VJE-00000006ZO6-1K4P;
	Tue, 17 Mar 2026 14:22:12 +0000
Date: Tue, 17 Mar 2026 07:22:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	Andrew Morton <akpm@linux-foundation.org>,
	chengzhihao1 <chengzhihao1@huawei.com>, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, marscheng@google.com,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
Message-ID: <abljlKim3-hPngCG@infradead.org>
References: <20260315193900.218737-1-visitorckw@gmail.com>
 <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at>
 <abhGF65wCbI7CsTm@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abhGF65wCbI7CsTm@google.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 02:04:07AM +0800, Kuan-Wei Chiu wrote:
> I tried to dig into the history. It turns out this mechanism was
> introduced 16 years ago in commit 835cc0c8477f ("lib: more scalable
> list_sort()"). The commit message explicitly mentioned both XFS and
> UBIFS as the intended users for this long-list workaround. However,
> looking at the tree back then, XFS never actually put a cond_resched()
> in their cmp() function. It seems UBIFS has been the sole user of this
> trick ever since. Given that it has been this way for 16 years, it
> seems other subsystems haven't really encountered any practical issues
> with it.

.. or it wasn't even needed in the first place.

> For UBIFS, this patch doesn't alter the frequency, timing, or behavior
> of the cond_resched() calls at all, so I am confident that this won't
> introduce any regressions.

I'd be tempted to drop the workaround and remove the cond_resched
from ubifs given that entirely non-preemptible scheduling models are
on their way out.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
