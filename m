Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A625C001DE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s96QU4I/X3d+CCn64yk4e4daLN3s5WCLnzKwruITB9s=; b=SEqiArOhR4Pstu
	Y6v6X8+wehQ0IRAQT3/yQj41UQISonKwtzormtUvcA8TKM3/aXuM6SRE5tE02WvEqZZ1Lpsvi8LSq
	/7VN0ybVJZ5/Cyn2MJMswLzpCZ6S7iJR/ET2VU++P6TSqasUHQXq6zIy9fq2PqFanuwayOD2vhDfT
	gFd7UgGNLtnFTD2FYJzg5DcpCgGpzfzlyo2NSnP9h9b9QzkA0vDqGvl+AQiyXuIC3PIbcSdRwLKGD
	Fm6ZNate+ZBYrwURa/VDBnpatVGaYorIobg8jv4ywLe0hZF/GhALBvSVX9CDMvVmqEI0CtJgWFpcR
	kcsX8Bv92HlGah9yAygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVpYD-0018zZ-2N;
	Tue, 15 Aug 2023 08:37:17 +0000
Received: from out-61.mta0.migadu.com ([2001:41d0:1004:224b::3d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVpY8-0018yT-2j
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 08:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692088626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBmn5bY96EnmwKJFlv+WltFrhGvpjIbZEKIiYirKvRY=;
	b=vz0KHcPQmyiJWfmlN0KqRtShPV8OO94S7Ve+8NAyKaJzlfD3l3Gwdcs50vzwkyJwFeNk42
	wWmdUe83i5yu+zc+P73iwMyGZC6f36VMufdeZyZpMS2xcjecgpOeJWBucmjek3/RmzHbqM
	Esg+z/IvqlGN9dYsqiRnMi0+1ICkj/k=
MIME-Version: 1.0
Subject: Re: [PATCH v4 01/48] mm: move some shrinker-related function
 declarations to mm/internal.h
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230807110936.21819-2-zhengqi.arch@bytedance.com>
Date: Tue, 15 Aug 2023 16:36:31 +0800
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
 simon.horman@corigine.com,
 dlemoal@kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
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
Message-Id: <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-2-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_013713_310001_D4103F91 
X-CRM114-Status: GOOD (  11.18  )
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



> On Aug 7, 2023, at 19:08, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> The following functions are only used inside the mm subsystem, so it's
> better to move their declarations to the mm/internal.h file.
> 
> 1. shrinker_debugfs_add()
> 2. shrinker_debugfs_detach()
> 3. shrinker_debugfs_remove()
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

One nit bellow.

[...]

> +
> +/*
> + * shrinker related functions
> + */

This is a multi-comment format. "/* shrinker related functions. */" is
the right one-line format of comment.

> +
> +#ifdef CONFIG_SHRINKER_DEBUG
> +extern int shrinker_debugfs_add(struct shrinker *shrinker);
> +extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
> +      int *debugfs_id);
> +extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
> +    int debugfs_id);
> +#else /* CONFIG_SHRINKER_DEBUG */
> +static inline int shrinker_debugfs_add(struct shrinker *shrinker)
> +{
> +	return 0;
> +}
> +static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
> +     int *debugfs_id)
> +{
> +	*debugfs_id = -1;
> +	return NULL;
> +}
> +static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
> +	int debugfs_id)
> +{
> +}
> +#endif /* CONFIG_SHRINKER_DEBUG */
> +
> #endif /* __MM_INTERNAL_H */
> -- 
> 2.30.2
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
