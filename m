Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C1C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqkT9xWNrW2HxLy3Odk77LrBZoY9tUa3I5V61YNIuOo=; b=yP9f9+e5xifa+E
	mtS64TBnPy6NRKDmxTEh6sViej6CBHZGGsXVjuZzRe27wLHIqCFMrBTpvqgP0mJajou1bG0fTw+wc
	/nHBHUM/bs+h2umz5FzuKx36VRwCvU+jh/K6Hxu9Aky4pcHFKYVKhMvlh/wde3HBHSVQCyP3NIiNv
	y3JkNFY+7cHUk5uCgq+ZWxrtHYdgptba0gegLcaySlQqTCJwpWPgneVnFEDC8hD8WZxYB5ffLzMg2
	Y25o1yQqx2rRkxZu9dvSiKu9g4TlXrLWAFwji6Hn3v2cInKBKqW9GYdt8GZs8e3moEpe2Ljxxx216
	jXywseaeykysAGYBsWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYuf-009Q2K-0h;
	Wed, 26 Jul 2023 07:26:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYub-009PxS-2I
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:26:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-686bea20652so595513b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1690356367; x=1690961167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=;
        b=tq09HWgUpDUq6byqrA2ODCQvkmm9az77yWJFeqeVMy0FdFbQydZS+cUOs64uJ2SB3t
         JVe6zLPb5fssr5t5MVQUOU3aAgE6xxOU2jteEAzPtsSb8VWd+wB8OkrdKfGE1jZhlj5w
         TjyyAjaB4CZbrKROQT36TogKeOKjWN45v44UiK/0cxwlhI07RMRGs/cyjwVDCOvRwded
         lUKql7WZYCe6f5lQSR03cISDY6tgj5wgcwRkwmI723xyLURdjFU3QXYzRwiEbnZzpb+Y
         l5EpmyZiiiT3lVpIPopVTNPz1HtZxyTgaW+3XYB75cUNHtZ/C6Tv2cVXxlw6MGh6VRdH
         zVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690356367; x=1690961167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=;
        b=aSPxum+8gy8XJW710Vm+JC1iGXK7aCuZnUG3hZeGZ0VnGPnI3mVI2fI1frC0hZ4Ijp
         6F0R08CFu3zVTE4+EcWkJb3DXI78pr6tf3sveGSBw1R7tdXuUAWsBqAb+EnghXjW2aqZ
         +aKG2yq+7Ps5Kow+WIgQSVvdu3I/u+O12PXOtfeIecd/fU2F17fzs9HXlW9MHnNzBdkE
         6/ek8mxoEYwGU1w4N1HhuR0lD1Na+4p8w9glS68GEMIh61ZYSy8IZvSaLzc1VDWG+Ojj
         nOhKYNu1sZDB03X4JKy3ACjpbB/d7HnsjO4sNlfyWTs0aUn4/0NAzGGp4ew2UKB2EoE3
         NKng==
X-Gm-Message-State: ABy/qLaJpDAjxWuEselp4dJgXttBZSVskCjAVvL+cWiI9h+VUCCK1OP8
	PCtPmEmPmP1YIF5S8m4lMelP2Q==
X-Google-Smtp-Source: APBJJlH5b0OufxURLtAQUAf05ozn4hmRBD/Qn/v7OHyNHGefhP7kmXIN/eqXKV4z4NaYW1ZZNRUFVA==
X-Received: by 2002:a05:6a00:a0d:b0:67a:a906:9edb with SMTP id p13-20020a056a000a0d00b0067aa9069edbmr1921084pfh.30.1690356367307;
        Wed, 26 Jul 2023 00:26:07 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au. [49.186.119.116])
        by smtp.gmail.com with ESMTPSA id r5-20020a62e405000000b00666e649ca46sm10751809pfh.101.2023.07.26.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:26:06 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qOYuK-00AfFC-0I;
	Wed, 26 Jul 2023 17:26:04 +1000
Date: Wed, 26 Jul 2023 17:26:04 +1000
From: Dave Chinner <david@fromorbit.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, tkhai@ya.ru, vbabka@suse.cz,
	roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
	paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
	cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
	gregkh@linuxfoundation.org, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	rcu@vger.kernel.org, netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	dm-devel@redhat.com, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v2 03/47] mm: shrinker: add infrastructure for
 dynamically allocating shrinker
Message-ID: <ZMDKjBCZH6+OP5gW@dread.disaster.area>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724094354.90817-4-zhengqi.arch@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_002621_747270_C1690D4A 
X-CRM114-Status: GOOD (  22.35  )
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

On Mon, Jul 24, 2023 at 05:43:10PM +0800, Qi Zheng wrote:
> Currently, the shrinker instances can be divided into the following three
> types:
> 
> a) global shrinker instance statically defined in the kernel, such as
>    workingset_shadow_shrinker.
> 
> b) global shrinker instance statically defined in the kernel modules, such
>    as mmu_shrinker in x86.
> 
> c) shrinker instance embedded in other structures.
> 
> For case a, the memory of shrinker instance is never freed. For case b,
> the memory of shrinker instance will be freed after synchronize_rcu() when
> the module is unloaded. For case c, the memory of shrinker instance will
> be freed along with the structure it is embedded in.
> 
> In preparation for implementing lockless slab shrink, we need to
> dynamically allocate those shrinker instances in case c, then the memory
> can be dynamically freed alone by calling kfree_rcu().
> 
> So this commit adds the following new APIs for dynamically allocating
> shrinker, and add a private_data field to struct shrinker to record and
> get the original embedded structure.
> 
> 1. shrinker_alloc()
> 
> Used to allocate shrinker instance itself and related memory, it will
> return a pointer to the shrinker instance on success and NULL on failure.
> 
> 2. shrinker_free_non_registered()
> 
> Used to destroy the non-registered shrinker instance.

This is a bit nasty

> 
> 3. shrinker_register()
> 
> Used to register the shrinker instance, which is same as the current
> register_shrinker_prepared().
> 
> 4. shrinker_unregister()

rename this "shrinker_free()" and key the two different freeing
cases on the SHRINKER_REGISTERED bit rather than mostly duplicating
the two.

void shrinker_free(struct shrinker *shrinker)
{
	struct dentry *debugfs_entry = NULL;
	int debugfs_id;

	if (!shrinker)
		return;

	down_write(&shrinker_rwsem);
	if (shrinker->flags & SHRINKER_REGISTERED) {
		list_del(&shrinker->list);
		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
	} else if (IS_ENABLED(CONFIG_SHRINKER_DEBUG)) {
		kfree_const(shrinker->name);
	}

	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
		unregister_memcg_shrinker(shrinker);
	up_write(&shrinker_rwsem);

	if (debugfs_entry)
		shrinker_debugfs_remove(debugfs_entry, debugfs_id);

	kfree(shrinker->nr_deferred);
	kfree(shrinker);
}
EXPORT_SYMBOL_GPL(shrinker_free);

-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
