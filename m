Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DE2C6377D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 08:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF1D061241
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 08:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF1D061241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q1bfCdxFa+EmbDKImegi/dL+7uhIKcvVq+Ei+2u8kJs=; b=GM58Ma9YpAmXmj+t9iCZ2wx9Vk
	OIWBkZLcJR6WkgWX2qQysnkJtVUPl/gWcCXTv9AMMfHj9wkxuBeljjuQEjvnMuFGhPPjIOSHyHABe
	vSp+N55HKkQ7slsCrEK71aFE5E4X613E9JPPXHdz/J/j1KxWSPcxY53AiZhAzFtDpO/+T8/tZPw29
	DI/nM03Ij7Ly696VDdBXPCRgSjGhNI85KYjfDfFLuRFTbj9JTYc8O4ioGjAtXc7MNavsP/JV1FFtk
	PpnfhzFXX2oG+CkQ47gBLoIhKEocPQDiJQhs4VjDSoa2cHRpFndt+K/bObkQ4pdhcXDOu2hZYEfXb
	REl3sP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6U5j-000hDX-Af; Thu, 22 Jul 2021 08:30:03 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6U5f-000hCg-UE
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 08:30:01 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 b18-20020a0568303112b02904cf73f54f4bso1588623ots.2
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jul 2021 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fYbztYoVjZgOeHTU+hwjUgQL+Xi95TvcDcwtmr8It80=;
 b=1iLSGKTozk/lPo6Q8/ym67DuarP0UWIPLn8w8u5O/Nd4M2rSwvKkQzFdU68NaADPe+
 DLHUwWPXh7gvZFJvKvOgDernTfxnVnbXOse2kdtdAIXQv8DhDxDmgsUXfkzawmjC0YVy
 UnTnyxoc5te76Z0gvMZivgHJgQZztljfOwrM0H2WhBJ6zwharnDf10lkvetDdxyq16U8
 2iM5Tm3RzXlk8z8l+5uUUQkHL9KpWwSB2iuUbrg7ur3rlytlirZ9jz2DZvP28dX6cStV
 VN7uHKfcCGz7RSIoVMQ85nKF9xKjUV2SoYnlN7BUeeY+7BGG0kiVdrNlTJkrLvX6JSVm
 wu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fYbztYoVjZgOeHTU+hwjUgQL+Xi95TvcDcwtmr8It80=;
 b=jbzy0KzyKDviD1k6w0KDAlxQfpbCnAlB7tsw+VWzV5JgExJueMdtq0orOgaPcbBqpa
 wf9GoP46dE8NTRnfj/kedOb5k3DF0JMh6ooysJ6/c7VOu/aqLgf24cyJMRS5b9SQbLCR
 0gCLQO1Z3AS5J4Tb1vTFrBhQHihOezB/ZX33Q14+lsKm5ZQGGnCMx9UNxOgRgciHW7of
 BtMxurvcG7hVLOGx7dzKwFzKKYJEz1AZ34DxtzHzOY0MZbaDjpV4EQgIcSHnjL0319DW
 dqvvfqOZtsswHP6EYZZanA4n3VVBUNhuG8Jmd+jsETKGNxTHZrUFYgQS4pv9qegsO58Q
 ZdFg==
X-Gm-Message-State: AOAM531yaU8N4etrskLgSruvxFOibqyfvMmhHd+l6v6kve51Sn7OH8Db
 FSI8mo8ZRr7jFnmAa3f5hi9rbQ==
X-Google-Smtp-Source: ABdhPJxTKST+odH6IEFwOfCHDDyjeI7hDkboff01u3SXvW385jzT+MHRQCg7xqULBGGuufOZdwWkjg==
X-Received: by 2002:a9d:404b:: with SMTP id o11mr11155386oti.41.1626942597788; 
 Thu, 22 Jul 2021 01:29:57 -0700 (PDT)
Received: from ?IPv6:2607:fb90:c28f:4e7b:6680:99ff:fe6f:cb54?
 ([2607:fb90:c28f:4e7b:6680:99ff:fe6f:cb54])
 by smtp.gmail.com with ESMTPSA id k13sm5030391otl.50.2021.07.22.01.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 01:29:56 -0700 (PDT)
Subject: Re: [PATCH] mtd: fix size in mtd_info_user to support 64-bit
From: Rob Landley <rob@landley.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Miaohe Lin <linmiaohe@huawei.com>
Cc: richard@nod.at, vigneshr@ti.com, David.Woodhouse@intel.com,
 Artem.Bityutskiy@nokia.com, ext-adrian.hunter@nokia.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linfeilong@huawei.com
References: <20210708131359.21591-1-linmiaohe@huawei.com>
 <20210716010224.44582046@xps13>
 <95e3d455-ccb1-0e22-ee83-78dc6ad8aab1@huawei.com>
 <20210716114808.246e92ba@xps13>
 <f7f55c5e-f6b2-542c-66d2-20f4d88bf669@landley.net>
Message-ID: <c1d3cda2-5beb-21be-a1bd-d30c1c035ff3@landley.net>
Date: Thu, 22 Jul 2021 03:47:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f7f55c5e-f6b2-542c-66d2-20f4d88bf669@landley.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_013000_089863_9729D91F 
X-CRM114-Status: GOOD (  11.11  )
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

On 7/16/21 8:34 AM, Rob Landley wrote:
>> The only way is to create a second UAPI.
> 
> Twelve years ago a patch was submitted to add a 64 bit MTD api:
> 
>   https://lwn.net/Articles/326418/
> 
> But for some reason they only merged 64 bit erase:
> 
>   https://github.com/torvalds/linux/commit/0dc54e9f33e2
> 
> But NOT the rest of the 64 bit mtd API in the same patch. I've never understood why.

That said, the workaround is to use the info api for erase size and use
lseek(SEEK_END) on the device to get the length.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
