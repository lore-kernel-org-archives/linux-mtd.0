Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC3CC001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Bb0mStJNkU8jgE3D534MuyvPAWQKZIi3q32uTb/kik=; b=TtgB86qSMMq3aG
	2C9p3wjZBwZXaNnvJDmwX0ZHOy0zpob+/kw5o80YXi7fmHpyAu7esrQhcW4iqgcWIg+kY+c+mexmv
	Rr7iLt4DVd/XmFYtoEJDiaWv2rbw0CaOCHKeaY55o27lUfzfyYRt5nFoOTfm9s3YrBUnPs0BhOt4G
	S6dh/UmFxZUcrk2QP8aDK+QvaACQWlgZRMMlVy+D1xZwue5ArKz1xD0ZOf7VynO2e4AYqM9SQ8jMK
	iuLvny4mxQujVbMJRqUp+hLJ1nCovMhZDKnCkyb0K8hdkBcPGauzzDWJQ0AFguH7ODCCEE57e9ZwH
	Tm/SYmWhx38l/ZHeQgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsJ4-003YC4-0p;
	Mon, 24 Jul 2023 09:56:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsJ1-003YA5-0F
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:56:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-682b1768a0bso1053096b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192601; x=1690797401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=;
        b=OlJHj1/yO42yQ42YyfDdqtfuDdXGGV/WQ0GpL38YIfO5RJZmkcdCx+PepLtkyGVzEN
         bTK4LhGsJI+OJKO7VuvlEDj/aPd3bZAexndKWivptO/xeLBD7J/JCOubjicjaVNWXLQ5
         H6fB+0YsEx63uc5TiCs20sSEjZ3JxRWkjZHG3LQbatv3J9k4pmh0VpqAg7R562nbzzly
         s71ebLgHH+wdbZuHYfqIuXfOS4H3wCLtxZ6Rqc556hBiF9jLddR68NJcthdMi5JsNo9F
         fUAZvFHEDsznNwsCMgykOwv5P0YMuteT/vvRsXd6nvRv9Clc/Ic3a7YeuRAtFe+vPCu7
         EZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192601; x=1690797401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=;
        b=Qb+T9KlVouBXSRbmJOI19hrU2nepvENmxTYz0o8Tz1OBigOzvy0+yT7CGzWZsmASbo
         YWZz3aWQF6ianNAdZhstlyWnLXsvatk5UG6kK7W+IlXJ92ZHk1/0LeFVfpgZ5ZISTB3V
         5QIH8nSe3SF+d6B/Hr8E0jqKi2ZWy1IieBKR+BWFB2tYEnMCclQPeBmHbKkv9Jki3sKC
         pEa1r3+d9r0J8yXwkimIK2+CRC59l8gfxIzacQ5+2jif1I1VHf7fdqsJzqSDhyc++wTQ
         ibTcYBAbuISzkH0U42L7hnjz3kkmDM19h6AHaHwkZBHeP0DAeyxl8U4RlhfduShZ7TES
         +r+A==
X-Gm-Message-State: ABy/qLbIm8XEKcQhyy3n6bacLdhJODpVLd+Ic4E5bvGd8io25relErWT
	vh/exHLcZQWvmyRRLAehhaY2GQ==
X-Google-Smtp-Source: APBJJlEtnCzvJ6I1rkWEELadVXHfZtUE/plpWIuGp/MFKpOvTS509ssN84iHDxA1POdeL3+D21rKQg==
X-Received: by 2002:a05:6a20:8e04:b0:137:3941:17b3 with SMTP id y4-20020a056a208e0400b00137394117b3mr14532126pzj.6.1690192601020;
        Mon, 24 Jul 2023 02:56:41 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id y1-20020aa78541000000b00682aac1e2b8sm7356787pfn.60.2023.07.24.02.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:56:40 -0700 (PDT)
Message-ID: <7b4eb3fa-1ebd-de07-1a16-9533b069a66e@bytedance.com>
Date: Mon, 24 Jul 2023 17:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 05/47] binder: dynamically allocate the android-binder
 shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-6-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230724094354.90817-6-zhengqi.arch@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_025643_137643_589BDE18 
X-CRM114-Status: UNSURE (   5.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


This patch depends on the patch: 
https://lore.kernel.org/lkml/20230625154937.64316-1-qi.zheng@linux.dev/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
