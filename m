Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AC9C001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amhipYTuqMiv5+ONPT0AfCUo+aEvVtbWOn4lPPc46f8=; b=RgVu1kyJci6pyT
	kGb2yUTVSo3tJwgR7+zinR+BN8pMFsxC7WkxFa0a5uNZPjoJWEY9y0U4lvoO/AsUvNvHbfIiZq9q0
	bOyU21jOZJKTduq1H+xanhhlygdC0306a7L1ITejx4x0VAg0bPTiEk3I5YluhKrXbM+8Up8eM/Fvx
	+kjLV6MLsASAECKZHwcSmfwXW+BNwU8YUI883p+4gU04GgAvuBItYzLS+CG3Tp8U/bt2eb+RKwbZk
	6wsscTFtHik5iB5SfE7kTn1xQnrErpmhvISMdxXeuQgfwStXcc/jQ6NwKbDFVaL4roiJSiILaD0HN
	QJqhtz3oxS1c6Biaf0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOalh-009ibi-21;
	Wed, 26 Jul 2023 09:25:17 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOale-009ia1-2o
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:25:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-66d6a9851f3so1488050b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363511; x=1690968311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajWZi1kTG9ZsFll3P13XRfH/M90QTcK5ZSE2yNZ8xrc=;
        b=FbQ/cU5KkBidPkx8Y2uGYCzGutSB6xNfkWiQEKQsSST8W9zvQhHhApft87PlLY8dLU
         DGKfOcVpxkQTOOl80Aro56BnjlNO41fZWD7CmV5GDlB1LjEDjOf3Kop2mVKp+naFiQzY
         As6MgqOMDkFvMljdz6Un/7KTBl/NUqtiNwtAlVNm8YXgeUKehHDEJVTDK07iwDWpbMUs
         Auk85ACWfB5lfW+mTAMWhogzlI0RHaQpyoe7zLfXc22574NosN/xSHT+kEdNg0VX/lgH
         cTQssA2/OElC5yJBDMwL3y7p8+2qs+uUi9JaKT2yW1TXFErKU2nPA1SSCU5AFvvQq6bi
         em9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363511; x=1690968311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajWZi1kTG9ZsFll3P13XRfH/M90QTcK5ZSE2yNZ8xrc=;
        b=XahY6U/lzFPyDsaLFfLRC7eL8l7pljYpynwERSNtUOdLuWdM6E2FmycV7NAIz369GF
         v/zyH5xgcYBeLhMzSbqT4rR1uc8RlcZh10+c7nbu6HtQuWkB1Bkq0pEasC+nD1DMkdWM
         SiFtPW+9ULlLikQAjTYhW+O9xffOogaIfDqXcudDiypH91eMsEH/OjD6oxFTFukt+qHv
         H+w4hXR1Lvztz8rdC8yNtV8UU5IK0AZHySQF8KrLr/wWNSmnq4uPQXVnASWSgI2f4aPE
         8S0odAE4vHAZHhXBWgZFKm3j0aYkaY6ApZ1PR8VrqL8TMHghsbHXPYmWHp95teHGwPKh
         8jEA==
X-Gm-Message-State: ABy/qLa1/DSKwNN8intjtl6u+7pW91V+c3yVWgOE+TSc7dXsv4zjTS00
	fDBnVUo1Tqla9SR9EVYvJunPxQ==
X-Google-Smtp-Source: APBJJlH7Lt4w+KKgSvUzSkJhF0oF8+b3ljHzveqc3Noqsk7KflIEw6xDKQ/sXRTNdo5n0Hc+oIf56w==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id o26-20020a056a20729a00b00100b92be8bemr1785615pzk.2.1690363511718;
        Wed, 26 Jul 2023 02:25:11 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id h2-20020aa786c2000000b00682a99b01basm2004283pfo.0.2023.07.26.02.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:25:11 -0700 (PDT)
Message-ID: <491f5c8f-ccc6-dab8-71b3-caeedc8c4b39@bytedance.com>
Date: Wed, 26 Jul 2023 17:24:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/47] rcu: dynamically allocate the rcu-lazy shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@fromorbit.com,
 tkhai@ya.ru, Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>, djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 senozhatsky@chromium.org, yujie.liu@intel.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
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
 <20230724094354.90817-18-zhengqi.arch@bytedance.com>
 <3A164818-56E1-4EB4-A927-1B2D23B81659@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <3A164818-56E1-4EB4-A927-1B2D23B81659@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_022514_912137_818A95D8 
X-CRM114-Status: GOOD (  14.95  )
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



On 2023/7/26 15:04, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> Use new APIs to dynamically allocate the rcu-lazy shrinker.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> kernel/rcu/tree_nocb.h | 19 +++++++++++--------
>> 1 file changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
>> index 43229d2b0c44..919f17561733 100644
>> --- a/kernel/rcu/tree_nocb.h
>> +++ b/kernel/rcu/tree_nocb.h
>> @@ -1397,12 +1397,7 @@ lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>> return count ? count : SHRINK_STOP;
>> }
>>
>> -static struct shrinker lazy_rcu_shrinker = {
>> -	.count_objects = lazy_rcu_shrink_count,
>> -	.scan_objects = lazy_rcu_shrink_scan,
>> -	.batch = 0,
>> -	.seeks = DEFAULT_SEEKS,
>> -};
>> +static struct shrinker *lazy_rcu_shrinker;
> 
> Seems there is no users of this variable, maybe we could drop
> this.

Yeah, will change it to a local variable. And the patch #15 is
the same.

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
