Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61FDC001B0
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 02:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iP3crTzSMWDBmq07IWGt1GeyPdNk1cChKnrBGJRcH2s=; b=GGPfWUFrufFBbC
	MZCWib/rObCKgZXk9kJQkRc8cWGkh5VaCfHcm6eB4Ujyifa731JNjK07vYa2MAmKqBcAh7wCCmbOE
	caVsEKdfuigWACFJ9A70TRkZNJ6rKZThJ02WxSf472tqjdFs781ADhQ8skXg589OAX6YCWu7n6Itx
	1VPVgY4DgGTMVqDKlyU7BXGbp4wDLJ+xtFGXjdgB6nHNMiiN56odCTxylQ0Ple90MrX8sipeDFDa8
	p8nxAeU4Uh/pi7DUSrlb5NiDIMKlo/7eNphzJHptAz4dgikwOpMSiIP1xY/ai2UBxLmvtRxGiX/9J
	wI4DNdt0OkknnkxfQVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7uO-005wFd-0a;
	Tue, 25 Jul 2023 02:36:20 +0000
Received: from out-39.mta1.migadu.com ([2001:41d0:203:375::27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7u7-005vxj-00
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 02:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690252555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+VnVPZa4UeOCG7Yrfiew8gKr6k3ViuPV5Oe7aKEwA0=;
	b=OouSnERnVUq8t87+qMJi+ElF1O+pkB5HJ/XjlEV4XPIdaL5qKz/r9JLMMUeUfOnb3ZMOdj
	khOpzTQ2idnb6S4y6b+9cHD3wy9I4UTOUPXGpsseW4bB+Gm8jsDjdu3ImL8BlNp++kk+K8
	DDellGRauVWKhKhaf7FrGB51gwHD7wU=
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-2-zhengqi.arch@bytedance.com>
Date: Tue, 25 Jul 2023 10:35:01 +0800
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
Message-Id: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_193603_199092_C26869E7 
X-CRM114-Status: GOOD (  13.27  )
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
> The mm/vmscan.c file is too large, so separate the shrinker-related
> code from it into a separate file. No functional changes.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> include/linux/shrinker.h |   3 +
> mm/Makefile              |   4 +-
> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
> mm/vmscan.c              | 701 --------------------------------------
> 4 files changed, 712 insertions(+), 703 deletions(-)
> create mode 100644 mm/shrinker.c
> 
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index 224293b2dd06..961cb84e51f5 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -96,6 +96,9 @@ struct shrinker {
>  */
> #define SHRINKER_NONSLAB (1 << 3)
> 
> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
> +			   int priority);

A good cleanup, vmscan.c is so huge.

I'd like to introduce a new header in mm/ directory and contains those
declarations of functions (like this and other debug function in
shrinker_debug.c) since they are used internally across mm.

Thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
