Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F81C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1JGzbQC70qyGSwzjqUR93nAlXRQqOJr+Ia5Y+6tRGM=; b=r83y5PxrjN5rnG
	Fy4Dm4MvT8uOFOjWgBLZ7LAamMRuTFTTMwbKgT+VarfM6oLN9hFbW2DzP38VGMNlmkvs5+Ht+nbrr
	C4BUei6BfzMBbSDM/hpWJCoWhTh32o099yVPYBFcb1dp6UJTgpU3GOFll1gWMAzC8MfK7sha0PRu8
	9syyzEs++wXD9Rq7hkwpH5zNRVIyS42UqgIkJZogFeLSjzs1IzAAQc2STPhPfn2TamslgT3xSDp1e
	Otsjdc5pcoRRtnaBx0KjcB459Stl5gfrkjKIZltbelbTFgdPD5U7gHrDY8+drN7JTz4F6nWvV7/zz
	T0y255BxKRzQstaUxKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYa9-009MQM-2X;
	Wed, 26 Jul 2023 07:05:13 +0000
Received: from out-53.mta1.migadu.com ([2001:41d0:203:375::35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYa7-009MOP-0O
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690355108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXYamYs9irq65yhoLRu1td82YuFMeMDqOuwaU+oDyHM=;
	b=USoqEnOQU6eM3+N9zIAHCDwhNC+8+UNIWLHIgerhexBlGJCaVmSRSO1wU4o3mjHNGYO9Rs
	DYRZMApHrS1Pjvb6NJH1mJ50Vk6voJ6kQPH4oorM80xUHt6/RAFEITooiN15iQlceLlIh+
	2SDmjYt2iC3yWxkOb7vPU57vNB82awk=
MIME-Version: 1.0
Subject: Re: [PATCH v2 17/47] rcu: dynamically allocate the rcu-lazy shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-18-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:04:30 +0800
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
 senozhatsky@chromium.org,
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
Message-Id: <3A164818-56E1-4EB4-A927-1B2D23B81659@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-18-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_000511_310758_AD17D91A 
X-CRM114-Status: GOOD (  11.92  )
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
> Use new APIs to dynamically allocate the rcu-lazy shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> kernel/rcu/tree_nocb.h | 19 +++++++++++--------
> 1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
> index 43229d2b0c44..919f17561733 100644
> --- a/kernel/rcu/tree_nocb.h
> +++ b/kernel/rcu/tree_nocb.h
> @@ -1397,12 +1397,7 @@ lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> return count ? count : SHRINK_STOP;
> }
> 
> -static struct shrinker lazy_rcu_shrinker = {
> -	.count_objects = lazy_rcu_shrink_count,
> -	.scan_objects = lazy_rcu_shrink_scan,
> -	.batch = 0,
> -	.seeks = DEFAULT_SEEKS,
> -};
> +static struct shrinker *lazy_rcu_shrinker;

Seems there is no users of this variable, maybe we could drop
this.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
