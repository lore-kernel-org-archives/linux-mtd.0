Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE58C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFNPRDPU7QH1qy0RcggPJpz5w5PdEU0GaUQwc9+E3Po=; b=RQZ1xdX2uxBKp/
	qk5iP+KEb8+z9nxlBX9gFPLy6VF8wyTcx9SGt1hAoq5czA+L4yDBFYyDt1Y1V6uChx2SX8DNNQeal
	xvooNxM1JlH+6mk8xi1PQmC8kwFB4ucWURs2gwceI4FLKZbyDfHO5p6e78eT+d6+e78+1TF35/LuB
	9vUCG+WrpkVpPwpkMbW7o7cWlfpk+R7PUxIEqAPQ5DWmtqqO4djnuDOdDdNbrPnaSw3fCf7kh//l5
	IlPtUJdwAet3TkKJaWLT/ZbPB/rPbmJGUK8VlaihScioVlmr1W5e2ajK+w3ikZjwrIH+Rsx+IHfis
	YZFp+phdXuxi1UYTmqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYb5-009MdC-39;
	Wed, 26 Jul 2023 07:06:12 +0000
Received: from out-18.mta1.migadu.com ([95.215.58.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYb2-009MbM-2K
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690355165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qP6Rsnsz9/WW+azSq2vXZZSPSLEyAJb/Z8peE40gYgo=;
	b=vw9dtxapJigzblTo3NGynfsv+/mQB1bNWjl6Q4rEAUF9PXc7LtA8X1zBeOoHG+17byUEV5
	rePGXHXPmPLeGOzGrE1/eqTwEdZgvDm17pzQtihT75dgxUeL35Q3sxqIVQekgyvV9/7bXJ
	pXhSlPCuY6BK9bze6xRNH/dP9jDuXVc=
MIME-Version: 1.0
Subject: Re: [PATCH v2 18/47] rcu: dynamically allocate the rcu-kfree shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-19-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:05:26 +0800
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
Message-Id: <07191509-5186-487B-96D5-F859498CB93E@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-19-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_000608_907004_6E1C95F5 
X-CRM114-Status: GOOD (  11.40  )
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
> Use new APIs to dynamically allocate the rcu-kfree shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> kernel/rcu/tree.c | 21 +++++++++++++--------
> 1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 1449cb69a0e0..d068ce3567fc 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -3445,12 +3445,7 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> return freed == 0 ? SHRINK_STOP : freed;
> }
> 
> -static struct shrinker kfree_rcu_shrinker = {
> -	.count_objects = kfree_rcu_shrink_count,
> -	.scan_objects = kfree_rcu_shrink_scan,
> -	.batch = 0,
> -	.seeks = DEFAULT_SEEKS,
> -};
> +static struct shrinker *kfree_rcu_shrinker;

Same as patch #17.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
