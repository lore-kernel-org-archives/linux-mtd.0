Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3510CC00528
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 03:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sa9jIbxcfHWjx6VnvQxt6lL24sZB9PLQ6i2UVKWVFDA=; b=f9FEKUg8Qz9N6M
	M/bwoliVryCiYEdKLLMMRiMWo2QHmop2nJa4p7kibOe1OGFZQHKhlviHLoIqi/sqUAMdtDCj8l6CK
	xOPAWfkyKhnr4WfSp1GgtXf2DeE1BRXrAccgYEMYZWSoACIl99VJGwCgiTuQ18O7SFhuzI8MEz0Gp
	BVcitmA6TnwelffnPU6z99pszxArnZQ2LO94kn6oxhw1TMbia3xcgJkU3gMekkQhEF12pjs/huTJp
	rQvt1cW6xceRa6OQiM/8z7chbWICMlc5yZ4yIwhzFnJu6i+i9Cg885q50rIiKjqV/XvaSzp4NjGRw
	Kf10vimRU1+/QlRgYmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO8QS-00606j-1z;
	Tue, 25 Jul 2023 03:09:28 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO8QP-006057-0x
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 03:09:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-267711d2b43so714279a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690254562; x=1690859362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
        b=T37460khNMPot0VVWdDz4lB6VWzVdicUBxVfz7CttLqrgD8g0MkXpwdKxm81+5qM3E
         yM+KFmnDFeQa0ZY5ZeNvvyumpxFJqPDg3oixgT5YKKGKOt9qmtbXs6vK0nUKy4kqsaDS
         iJ3utK1jXEfJapBrHYjK+SRbiAPBWHkzR4mO0jKk+qC4Stl39POzbhCCP4MwAtpmSso5
         ynGZ9erR4hLoA8pCdH+sRZpUbw1kMvKh2ycfFI2IzmOqd8Zq8Q0hlgUcK6mejCeashGS
         UzcYSPHM74qvjYTTAriMRhyDbW62IR+NfEc7uD2qj/U2RIYLpDl8fGFG28yoLGatJrqh
         GkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690254562; x=1690859362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
        b=lUqsNNA9hGGgJstC2rUlDWIlAKvtTpJPeBFwTRd/4W9+EGuTyjWRg3XVHez0N+WRHs
         JfhfeqXbvU3BrXvmVsc7fwDzCHia4+6swMGYCcHIEQJDGo4d1SdlppcSFhwXMCJ3ychj
         rkza0lxdpVmJtd3iwHZdfKEtHYV+6C+Hnq8uX2JyPWsYj40w+Dm3O8OY81ZIm031m0kY
         atZlS4EJg2dlRv1OGqBhhKUwk8EIY5hy+Vqwy6cspCvrfqmvw+31lv+sR8ntNAID+TbV
         WgLR0JFfFgLmaaNTl1xHzzTGrt5IbNxpgBx5OizLPKJYppFB4i4bB0ZGNePWAswkJWmm
         LzCA==
X-Gm-Message-State: ABy/qLZ+To89UZGqPtAzo7VUGPjCNrE79KvI0FDg8YCrk0W9IDMmb4k8
	347LI0qoWOkZgq4ZVRzHKegu0A==
X-Google-Smtp-Source: APBJJlEruF0WFFXXZAOwcLJKfTF/P8Yek4Wx/bwgxp4VRr2IRHJr9OEk7izXq54CPTEEiNehAqKYyg==
X-Received: by 2002:a17:90a:50f:b0:263:730b:f568 with SMTP id h15-20020a17090a050f00b00263730bf568mr10246975pjh.3.1690254562043;
        Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id 21-20020a17090a199500b002633fa95ac2sm9540001pji.13.2023.07.24.20.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 20:09:21 -0700 (PDT)
Message-ID: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@fromorbit.com,
 tkhai@ya.ru, Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>, djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, yujie.liu@intel.com,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_200925_339108_7B8DE597 
X-CRM114-Status: GOOD (  16.60  )
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



On 2023/7/25 10:35, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The mm/vmscan.c file is too large, so separate the shrinker-related
>> code from it into a separate file. No functional changes.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> include/linux/shrinker.h |   3 +
>> mm/Makefile              |   4 +-
>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>> mm/vmscan.c              | 701 --------------------------------------
>> 4 files changed, 712 insertions(+), 703 deletions(-)
>> create mode 100644 mm/shrinker.c
>>
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index 224293b2dd06..961cb84e51f5 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -96,6 +96,9 @@ struct shrinker {
>>   */
>> #define SHRINKER_NONSLAB (1 << 3)
>>
>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>> +			   int priority);
> 
> A good cleanup, vmscan.c is so huge.
> 
> I'd like to introduce a new header in mm/ directory and contains those
> declarations of functions (like this and other debug function in
> shrinker_debug.c) since they are used internally across mm.

How about putting them in the mm/internal.h file?

> 
> Thanks.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
