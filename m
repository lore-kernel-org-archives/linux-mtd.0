Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D3C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2X1KavMNs0W/KW0m4FDeRRAZwJDJrrRr4R5PFDnfdI=; b=s8NdnJJk5G5gPj
	IminQQjaVaf6RwDTg2U6mmVdun2bRGVLoeV8RO9VNyzwlHeGs1XGURTig+cYOmeFcsVP1RTKV8VB4
	lj75tEc4sfFaWlLwzbQOFIMTE9j04P9gMdFFjYkfh78w5+yZo0liqyLzj27Y6Dn2E6PdBYmga2mvG
	4otSCiv9xymKh8tFE0Ybs5K1zGElRI9NQe5c3FqH9doU3axlbD9D3Bqf7o6GW1CRnvSsoeeByz9P5
	iW3f9Vvs1vYneR3mQkX0PEU5PkfjID7gM244ZYSZCn/q2YiDjjoaZCDkJ6mskTFLteS6/YHUxXDFa
	NLfQElk4C/vN6ccmDJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZ4Z-009Rcc-0q;
	Wed, 26 Jul 2023 07:36:39 +0000
Received: from out-59.mta0.migadu.com ([2001:41d0:1004:224b::3b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZ4X-009RbH-0L
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690356994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yrw1e5tQhbkMga7eJrUip2ycPtsuLn9P74mG8ros/F0=;
	b=XkkSjxLZhEs+WTu6Lxce6yw56JkcjLLE3W9mi8l7oiUYes2Mt2Kx9x4+hwiBhDOxzRpaVC
	pfsRiMgi/wQngx46uSL66saqLbu8FkMymz5gIEi/n4cwHkh93N7+NRLIrXwMgbBpn3V0mr
	W8L4NvyZa4l7hBRrr+6H7xx0fZlpIGk=
MIME-Version: 1.0
Subject: Re: [PATCH v2 29/47] vmw_balloon: dynamically allocate the
 vmw-balloon shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-30-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:35:42 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 david@fromorbit.com,
 tkhai@ya.ru,
 Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 tytso@mit.edu,
 steven.price@arm.com,
 cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 yujie.liu@intel.com,
 gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 x86@kernel.org,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org,
 netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com,
 linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Message-Id: <1D40C9FD-84F6-40BA-8D2C-0DF05882C933@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-30-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_003637_285331_9D713CC8 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the vmw-balloon shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct vmballoon.
> 
> And we can simply exit vmballoon_init() when registering the shrinker
> fails. So the shrinker_registered indication is redundant, just remove it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Nice cleanup.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
