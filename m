Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B94FCD0B8
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 05:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwNY5kfLuiVkc92u2h1zLk7Mw7sANPhvkwB3i9hPtDk=; b=R8gIazU1a2Mqcc
	UbYCFQ4O8dWwDfa7dmo9/J6IeA3b40TzIhbMkV1tel36uuX4TyS6YubJfKMlD9LA58jOF9teBC/Sb
	GsupkSnFa99Af2QXpHCmtQ+2V/BKx2l+Cjl6NItoNjmViN1f6QGnIL9Q/xz5E2AyPwNVsqzLxIZrX
	QewyQC6blsZvv4GBf9HTGUZkHImnWxDbILcLgEMH5LBwE7OEsBnnKoP7lKXMY4Xu4eV44OuhHF0oy
	o/ANxcv7/QklmnfAsBpRN1A4QMQy4//pPMs0wimllZCvFBoxfMfOgcGhVl+/NOi4ELPgvSxGW6cpX
	6PB76AEnjLwUMN8gIZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2juG-00000007osR-2Phu;
	Wed, 18 Mar 2026 05:57:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2juA-00000007os6-2QuQ;
	Wed, 18 Mar 2026 05:57:18 +0000
Date: Tue, 17 Mar 2026 22:57:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: richard@nod.at, akpm@linux-foundation.org, chengzhihao1@huawei.com,
	hch@infradead.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	marscheng@google.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/list_sort: introduce list_sort_nonatomic() and
 clean up scheduling workarounds
Message-ID: <abo-vgtDeFNRjG5G@infradead.org>
References: <20260317165905.1482256-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317165905.1482256-1-visitorckw@gmail.com>
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

On Tue, Mar 17, 2026 at 04:59:05PM +0000, Kuan-Wei Chiu wrote:
> Historically, list_sort() implemented a hack in merge_final():
>     if (unlikely(!++count))
>         cmp(priv, b, b);
> 
> This was designed specifically so that callers could periodically
> invoke cond_resched() within their comparison functions when merging
> highly unbalanced lists.
> 
> However, an audit of the kernel tree reveals that only fs/ubifs/ relies
> on this mechanism. For the vast majority of list_sort() users (such as
> block layer IO schedulers and file systems), this results in completely
> wasted function calls. In the worst-case scenario (merging an already
> sorted list where 'a' is exhausted quickly), it results in
> approximately (N/2)/256 unnecessary cmp() calls.
> 
> To clean up this API, eliminate the overhead for generic users, and
> consolidate the scheduling logic:
> 1. Introduce list_sort_nonatomic(), which explicitly calls
>    cond_resched() within its inner merge loops.
> 2. Remove the dummy cmp(priv, b, b) fallback from standard list_sort(),
>    saving unnecessary function calls and improving determinism for all
>    other subsystems.
> 3. Convert the sole user (fs/ubifs/) to the new API and completely
>    remove cond_resched() from UBIFS's comparison callbacks, unpolluting
>    its comparison logic.
> 
> This change leaves the generic list_sort() completely free of
> scheduling hacks, simplifies UBIFS's callbacks, and ensures that legacy
> long-list sorting workloads remain safe from soft lockups on
> non-preemptible kernels.

As said before we really should not add the extra nonatomic API
and just do the right thing, and drop the cond_resched in ubifs
in a prep patch.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
