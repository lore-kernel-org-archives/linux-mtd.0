Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD107C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sShPLDJ7AcTiuDArVktmCJfgiBoNSjKWqg5n6oKgjI=; b=leJvU5J7l4nGh0
	fttb/BlveV+7px3RSzt8Hi/woNBkk5Fddap19NKoK/jQEAH3mNXLxvpaW4G1095WoFhySDGsxDPQa
	E/lRpgk4yGQ8NcReX3PnsU31Rgx5KoXt9xIO4i5kQpzxbIavP7jxKpJC7OjymgtcRjqEPijNOodSz
	wMjDonfibmgCR2lw3UH1jS/UN547rZYVzuhptA4kVGp8RgAyOiPxBNgaaJT0iz1jinUP1neIjA4qa
	a9Xe9GBzzzGH0GyKYXh/QWjfZnJqny3lxVYjiAoSIu7LpKQGEhh1BM3ch9DWaWaZtomVNtVyXz0rs
	1+iLA/XwE6hDYhuWIE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOas4-009jzz-0N;
	Wed, 26 Jul 2023 09:31:52 +0000
Received: from out-25.mta0.migadu.com ([91.218.175.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOas0-009jxY-1r
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690363901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9JATXkXZaN7f0jrXVOoaEMLIPnzZ4EB9BwhBVu88/k=;
	b=BJaw31GHkPVMB5J3bFLk7nCWUXBih3Evut0vs64rGABml16vhPPP+VTCvSpnvcgPtpNdnt
	lUE24RniQLpCmG5kFgpHNW+1PDmB/qhB9l9vhPT5YKqpl2p08nrVkD19PS1VqQI3/KFSOu
	LvMc1Yox7zbU5EqPQ+5oAKbHUZVLA0E=
MIME-Version: 1.0
Subject: Re: [PATCH v2 43/47] mm: shrinker: add a secondary array for
 shrinker_info::{map, nr_deferred}
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-44-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 17:30:53 +0800
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
 Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 x86@kernel.org,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org,
 netdev <netdev@vger.kernel.org>,
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
Message-Id: <B421DD89-09B5-4488-BEC1-D6F88C6DE75A@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-44-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_023148_761970_6612BA1D 
X-CRM114-Status: GOOD (  21.43  )
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
> Currently, we maintain two linear arrays per node per memcg, which are
> shrinker_info::map and shrinker_info::nr_deferred. And we need to resize
> them when the shrinker_nr_max is exceeded, that is, allocate a new array,
> and then copy the old array to the new array, and finally free the old
> array by RCU.
> 
> For shrinker_info::map, we do set_bit() under the RCU lock, so we may set
> the value into the old map which is about to be freed. This may cause the
> value set to be lost. The current solution is not to copy the old map when
> resizing, but to set all the corresponding bits in the new map to 1. This
> solves the data loss problem, but bring the overhead of more pointless
> loops while doing memcg slab shrink.
> 
> For shrinker_info::nr_deferred, we will only modify it under the read lock
> of shrinker_rwsem, so it will not run concurrently with the resizing. But
> after we make memcg slab shrink lockless, there will be the same data loss
> problem as shrinker_info::map, and we can't work around it like the map.
> 
> For such resizable arrays, the most straightforward idea is to change it
> to xarray, like we did for list_lru [1]. We need to do xa_store() in the
> list_lru_add()-->set_shrinker_bit(), but this will cause memory
> allocation, and the list_lru_add() doesn't accept failure. A possible
> solution is to pre-allocate, but the location of pre-allocation is not
> well determined.
> 
> Therefore, this commit chooses to introduce a secondary array for
> shrinker_info::{map, nr_deferred}, so that we only need to copy this
> secondary array every time the size is resized. Then even if we get the
> old secondary array under the RCU lock, the found map and nr_deferred are
> also true, so no data is lost.
> 
> [1]. https://lore.kernel.org/all/20220228122126.37293-13-songmuchun@bytedance.com/
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
