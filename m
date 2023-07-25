Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB75C001DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 03:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqgyvQE7w/Vx7cMIQUihSA4eGJXtqEYNVqu2+AMdjI4=; b=NahYfxOaTX+f7h
	Jl/Ok86aroVaDZNY6Uz68tSjkvcHU2CYcwqoro1DAGU845Tzikotpv93w3M2Nd0IgeKyl/MGTI2oC
	1sxmFe/XoHLqPOlmu9AVQ2xb6AnX4GzFTW72EJLMjYDvjLyzzI2MEC5fS8GQVUB9ulFL6ML4Ix/sj
	/pfIP+OPlBKcKhpzvD7L1oBd/oGWZfAa7pwBNA0OK6Yrp3eGpAaWehjnxgYCHctZgHZzRWJih6Iny
	WPZ8qj7+Gz9ZnWmKyi9TIlL83MR6QY34nFEqc+3W7SEZqn4/8tmHmae8L1XZfXgzgIo5bz0X5w7qJ
	df42AqaawujzZLQGESwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO8fK-00621w-0V;
	Tue, 25 Jul 2023 03:24:50 +0000
Received: from out-56.mta0.migadu.com ([91.218.175.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO8fH-00620D-0I
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 03:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690255481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6p0DFvIoLJzSIVM0qRIM/GXeN12xkckyA9Fji4TGEhI=;
	b=r9D+tXFVa/N1RN+BLv5WgR5iQ4rwtyebnPM62Sh3w2AQ+19WlSlFOjsJl5wosr8TEtJchn
	V877L2MD6oNieyuMlTG6JawmQ1ns/Fjh33pHsVXqhR6CCRTDc2499SUTwOS+JRsWVrdweW
	vS3GyBw0+b28Uj9NeJVk00fqQ8IPfLM=
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:23:54 +0800
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
Message-Id: <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
 <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_202447_280630_A7EE5018 
X-CRM114-Status: GOOD (  12.04  )
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



> On Jul 25, 2023, at 11:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> 
> 
> On 2023/7/25 10:35, Muchun Song wrote:
>>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>> 
>>> The mm/vmscan.c file is too large, so separate the shrinker-related
>>> code from it into a separate file. No functional changes.
>>> 
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>> include/linux/shrinker.h |   3 +
>>> mm/Makefile              |   4 +-
>>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>>> mm/vmscan.c              | 701 --------------------------------------
>>> 4 files changed, 712 insertions(+), 703 deletions(-)
>>> create mode 100644 mm/shrinker.c
>>> 
>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>> index 224293b2dd06..961cb84e51f5 100644
>>> --- a/include/linux/shrinker.h
>>> +++ b/include/linux/shrinker.h
>>> @@ -96,6 +96,9 @@ struct shrinker {
>>>  */
>>> #define SHRINKER_NONSLAB (1 << 3)
>>> 
>>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>>> +    int priority);
>> A good cleanup, vmscan.c is so huge.
>> I'd like to introduce a new header in mm/ directory and contains those
>> declarations of functions (like this and other debug function in
>> shrinker_debug.c) since they are used internally across mm.
> 
> How about putting them in the mm/internal.h file?

Either is fine to me.

> 
>> Thanks.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
