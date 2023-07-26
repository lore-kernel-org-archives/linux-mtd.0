Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275C6C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+uyDZCJkEGMFvWp2E8RrGBIwDHFe57pVtO5kl45Pog=; b=i1UHodv3VW1mL1
	/bIOw09vp30Bh86hgbbt/vjtAAOFgxd52iXcrpT+4oq5nGtWUq7+6Mli+r1XoXHpqv/Km9+HsU+aR
	OVRX9NfvS0swMwSO1e7pbL4I1A+q2mtTXSiJnFCPII3G6AhRwiUMUSUPTac0ilujFfuKOVzeZNQUV
	y5QwIsK7ip6lDlEdFv0yHiK37Ygr59of54czgxCBgyGiQ1WggShCOKv58JPtwCXoHccz4hpsgXJH+
	LLzQ4ALQ1Lmq8aV+Q1m++29AYQIFeXca1y/dfnxwmsveq+3bx5jmnY+mqSdicP1lA0YfyNfug8t2z
	aHRQvtA22flu/YGGu47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOap8-009jN4-2z;
	Wed, 26 Jul 2023 09:28:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOap6-009jKz-2S
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:28:50 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6862d4a1376so1660734b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363725; x=1690968525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ET5z1iXVl3TCzfyIPhSPq9r+sES1n7GH6hJTCnF+vYo=;
        b=RgneqgkXKODRrFr78EJ2DiU2LP1auMSsEluGXDNHK2/ImK1m1wgxIc9rc0KyChzerd
         9pp9E0d70JkoKPUeaRftr+jglcQl9qJ1NHO80UjvVHwRcDm/HyYkv/adcdLVyb0tT2RZ
         DBfPuhO0Xzb3EkxZ8Lnv+NpBNxlgzINPxdWjI2p4gXmhxr9F42wMDqq5WIk8CWvg0ei0
         04D2fNryYi6h/fKlwXKsAJNXxbdFzcjkeSQHK+ZzWAzpfHtAdyeZZlzM27TnNlh1u/69
         UWlC2QlusG6aR16W+ARLMoeEnjaKWlhVg7tepMtvkY5m/QLzYLh0WRDX9uQBe16cx9gs
         O9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363725; x=1690968525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ET5z1iXVl3TCzfyIPhSPq9r+sES1n7GH6hJTCnF+vYo=;
        b=DHeCdOouw93AbPMHwtUfjNqfCWRCg57xlMc1XaAJwLIA86F3iukjOyQGbrl/ydAM+Z
         NFZR1Yxyhr4CqEMB3H2o5desPAO5yv5oYaWZZnWDtM3CsTtUXDmM3AtM5ITLeFiCCEEV
         w2UTpkstPb/aK1u/niUv1075S3VQVRJ3FuZOBm/8hERsTCgPHlaSS1ZW7EwUWnT5heiH
         VB99wNjHZU9jJ/kMNYAqiQlWT+SkHX7ltGjJCYqKfQPlXGyUuBmGRTwNntddSETebdsV
         6/NzSe1bGJEEHigBBUNDJ8wqZORosskxmDA9ERIcteeSUzt6ouUi4f/ymFUmCcLqmgT1
         DTRw==
X-Gm-Message-State: ABy/qLbtNPbgKmldXGUpGEAsUzb5KQjyKCkmPYZQDVsgxIRETN0y/U/A
	hTNrE+w1f5zoO1LTuuE23nVWKQ==
X-Google-Smtp-Source: APBJJlFvSUUJYrPzKxRMgKGWHa7iMtrF7iaocGD/XAPkPO20BZ2/Wf52mLvF02dnCC8LpFHDclZgZw==
X-Received: by 2002:a17:903:41c8:b0:1bb:83ec:832 with SMTP id u8-20020a17090341c800b001bb83ec0832mr2040388ple.2.1690363724990;
        Wed, 26 Jul 2023 02:28:44 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001a95f632340sm12591323plb.46.2023.07.26.02.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:28:44 -0700 (PDT)
Message-ID: <acb14ed0-b9ca-e7c9-e81b-a2db290a1b94@bytedance.com>
Date: Wed, 26 Jul 2023 17:28:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 21/47] mm: workingset: dynamically allocate the
 mm-shadow shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@fromorbit.com,
 tkhai@ya.ru, Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>, djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-22-zhengqi.arch@bytedance.com>
 <08F2140B-0684-4FB0-8FB9-CEB88882F884@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <08F2140B-0684-4FB0-8FB9-CEB88882F884@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_022848_798926_74ACD78E 
X-CRM114-Status: GOOD (  13.56  )
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



On 2023/7/26 15:13, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> Use new APIs to dynamically allocate the mm-shadow shrinker.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> mm/workingset.c | 26 ++++++++++++++------------
>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/workingset.c b/mm/workingset.c
>> index 4686ae363000..4bc85f739b13 100644
>> --- a/mm/workingset.c
>> +++ b/mm/workingset.c
>> @@ -762,12 +762,7 @@ static unsigned long scan_shadow_nodes(struct shrinker *shrinker,
>> NULL);
>> }
>>
>> -static struct shrinker workingset_shadow_shrinker = {
>> -	.count_objects = count_shadow_nodes,
>> -	.scan_objects = scan_shadow_nodes,
>> -	.seeks = 0, /* ->count reports only fully expendable nodes */
>> -	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
>> -};
>> +static struct shrinker *workingset_shadow_shrinker;
> 
> 
> Same as patch #17.

OK, will do.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
