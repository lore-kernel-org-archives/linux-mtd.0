Return-Path: <SRS0=kP7/=XR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D1BC3A5A2
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2019 17:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85295206C2
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2019 17:46:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Liw4DgL8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgXhAV9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85295206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7UWmbow3KEcDTDSKHfuPbGY1hE5NjqlpsRm6O4b/28=; b=Liw4DgL8nG9/zH
	Hou2AZDUDpcCF6wpfrLFkPB/XKC2g5VkwG3fjiRGwbgc5OQcphsSNq+miAn14bFfsTNvXnWMam0/9
	V3b7jETSlSmZe/axFesWEj6qSRbFZOMejQMeLp7UNzwQOrNCLy5XJJcrcsb3GXcqrWie5ZV8RcShn
	Uk16a6GWpGr5DCFy1w8rPfaxFBNGcRbqPautpEMOR6ZjEwYsr6bUL42S4vANMEzx41ywFXCCuNVDn
	1xZoWeCKa+Ys4TptPijVXg4CmZQI1sEOc+4xF/O0v9ED8C4Ih56g4hF0xG8mzNCRjLi+1ObmSYGHu
	bLExcnJ3HIm/WvZre0TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iC5wA-00054y-11; Sun, 22 Sep 2019 17:46:18 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iC5w4-00054Y-Ed
 for linux-mtd@lists.infradead.org; Sun, 22 Sep 2019 17:46:15 +0000
Received: by mail-pg1-x542.google.com with SMTP id h17so4009728pgb.3
 for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2019 10:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=07+/lsU5shTbLXUJT+jvge6hK7dTv7P1ba/c5nqdIuQ=;
 b=pgXhAV9QoP4faK+xhbcX5ThbXLLuoe8NgHCh+qzSigOrp2dWTS3JmQdMmH9UDY+h0y
 J9bFa+z+UEx8ijH6zsiRG2R+HhAmhzAtRcV+RTRzgRljT+m5eoQWEv9d58k8r560tzep
 dgM317vV1p0v/q2NvPD9q4IdzadFbRxNbZy02E12zMKFVNCEXgxa6xwXe2GoZ0bp7p+V
 8Y+OkaoWcngL6sCeNwZ8qiXYnyHaV6nPeKsQ4KglFqyAL3L6JHFsKEbfiT2MsPwqXqrk
 I8ABZorA0MlMk2H/kWTCwAhFXc0I4ZsUu6Zs9C4ujYjUpCOIcxCnGVjbrfbS1QJDsE+T
 D73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=07+/lsU5shTbLXUJT+jvge6hK7dTv7P1ba/c5nqdIuQ=;
 b=KwVjk+yH7t00iOzeJcHaXEppkgiH5vyWabv31hGZuq19o4OFEMxhSSDyqeG2QHLxie
 dObAOJqeE7JuChVShzxmbUjV3Y8TVDdR+DnT0JxSKr4Tuf6EJcpxoYAX3IN6+NMqCLBP
 NB5zniCn7jrnFEk77KwRY2J8VVhckqczJOc6UkAPqMPom1a5aRiuF5T6GgIpm18LwQP+
 CSXai4DvL8mABafa/DYv+PhmagsGGTp8Z03ANY3gjR8id/LlNtx1Id6xm/HY46Tw5JFZ
 G6xAr4Fomg4fUrq7xlmbcQfQTHC34ysOqclP/z7FHrF8znK5Qp3ECQJuM86xoGJee0gq
 IbcA==
X-Gm-Message-State: APjAAAU4mCN0YihWQuiacoTmP6ti1w+jn5tRyCWW9Gvw+7Lr0LBvEhW5
 39LyCNjA6p0s+ADOTdi63Ok=
X-Google-Smtp-Source: APXvYqypxjHGMnMfN3/avcYgd1klfopl3iD8YbEsKAkfdy2UC7fjmelWxfxwTAX8croYRq05W8miZg==
X-Received: by 2002:a17:90a:8990:: with SMTP id
 v16mr16919467pjn.131.1569174368237; 
 Sun, 22 Sep 2019 10:46:08 -0700 (PDT)
Received: from [10.230.28.130] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id w10sm8665638pfi.137.2019.09.22.10.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Sep 2019 10:46:06 -0700 (PDT)
Subject: Re: [PATCH] mtd: fix oops when writing to phram device on arm64
To: Huaijie Yi <yihuaijie@huawei.com>, richard.weinberger@gmail.com
References: <CAFLxGvx_adbxyfA5iUZaHHw4aM1gbdOTMQdirx0FH1LamihdKg@mail.gmail.com>
 <1569132194-22076-1-git-send-email-yihuaijie@huawei.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3b1e2913-fd88-4c60-3889-313512e365c5@gmail.com>
Date: Sun, 22 Sep 2019 10:46:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <1569132194-22076-1-git-send-email-yihuaijie@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_104612_523218_28CA16C6 
X-CRM114-Status: GOOD (  11.68  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com, joern@lazybastard.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/21/2019 11:03 PM, Huaijie Yi wrote:
>> On Mon, Aug 19, 2019 at 3:39 PM Huaijie Yi <yihuaijie@huawei.com> wrote:
>>>
>>> From: yihuaijie <yihuaijie@huawei.com>
>>>
>>> memcpy() to memory remaped by ioremap() at an address not aligned to 
>>> 8-bytes will cause oops on arm64 platform, fixing this by using 
>>> ioremap_wc().
>>
>> This might be the right thing on arm64, but I fear not for all other archs and configurations.
>>
>> We had a similar chain of problems already with our sram driver.
>> See:
>> eb43e023130b ("misc: sram: add optional ioremap without write combining")
>> 0ab163ad1ea0 ("misc: sram: switch to ioremap_wc from ioremap")
>>
>> --
>> Thanks,
>> //richard
> 
> Hi, richard
> 
> I verified this on x86_64, and there isn't the problem.
> 
> I will resend a V2 to fix this only on ARM64.

The SRAM driver also takes care of using memcpy_{to,from}io() which the
PHRAM does not make use, that sounds like a possible issue too. There is
the alignment that is important, but also how you access the underlying
memory (e.g.: beats that you generate on the bus connecting you to that
memory area). ARM64 may be forgiving and allow memcpy() to work against
a WC mapping, other architectures, maybe not so much.

It sounds like adopting the solution that the SRAM driver did, whereby
adding an optional boolean Device Tree property to indicate whether
ioremap_wc() or ioremap() is to be used seems like the most flexible
solution.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
