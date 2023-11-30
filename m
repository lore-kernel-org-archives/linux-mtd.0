Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2F1C07CA9
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I9EEY3LI5wrtjqXMM/VCShoUKNAsFSxzz9vqamW+2E=; b=gv8DNi3wAwMwlo
	I87xeibNsfU5l/xHwmcgSuU2X5qqGENBebwb+VDzpcjRlQ5TE7QR/ZXleJEtbub/AoUsWYE0f1FET
	kf+sI4f56Gf/2dAZLLiEvqVlSgFDUNCmNm7XBxFEU4CZvJUdiOa8CDt5XHQQljvoW9n7jWYxQk/Gh
	CTF/BI3z4HbRF9bLDIk/4HPIkHGVRymU02gHFyRfqSwuBPGsaCtXKMTtwolxN7Hy3MHUyDOD1UtEH
	w7VkMmpBjkJhEHZ2Wphl8yw+t/7So8NzrQyKl3qGfnAYx9isE2HTNAa6gOSIpRU/r8LVUBhLDyalH
	840GjwQHTDS4v5mo1AUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eVM-00AUP5-17;
	Thu, 30 Nov 2023 10:42:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eVJ-00AUOo-3A
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 10:42:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so434611f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701340963; x=1701945763; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aU/rktlkm6RWOcfoD7EiPA2vcO/vrNvaDSdJjsM6zYg=;
        b=aSkHR5OSk1mrlCr/U93CbIemt3oKub8LsWIBsJ2G43LTX9ES4G2lQsljtZ9nPu8vyz
         yG9HCEsnSRQJPnZQ40FLBqTjsVx3TWf+ReugQo3L8R2UScz7/aUTLm+iARiJFhK1gWGx
         92cHLto2zq8oYAEn/ZmXcp2VvWH50WdR+DNbTfMZQCTbWPc2yYQdK5jExAKEaWMyrzLb
         YYUcAGvk5vOeEG2VGxU1GhrZuwHYcMv64luYoXG4iBOwGhTmpuExlrsW7GAt6HH93dwe
         s/Csi6Sd8XWy6XRAGHCKXvjI14/yiC/UtW0mc5eYdkFgUxy51Kka8LNoEIU2dwyVNsNs
         qnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701340963; x=1701945763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aU/rktlkm6RWOcfoD7EiPA2vcO/vrNvaDSdJjsM6zYg=;
        b=Z6dbleCs3jnyrcmBB2KFu0MLfKZO+TZP7MQoF2ApQRsF1kXMrMzoHvezYDhsXRTb0M
         4KLy/ZGWFl3zBj/2J5U/7lj6RBdR9YsMLE2iTsqIf1vPtjZNUE3QFBCmIuVwu3Z3pcwV
         mmaZd0jqSkJMSeeuDj+BzM3/QgXkn2UKaXV+bvXrYhdE5KDEj2KXuXNfKzrmi1i1ExYr
         cqjsvsE9FpbYeSe8W5eZQo+Rjd/qy0XG1GptlOnMImbTzg6N/TWv1LdTNOx9s2H6eW5d
         mbEztUI+uSpgbUOzYaQpivHHSK5rWJO31D6rDWJ+ZW9e3DA5esUpA25chStsYUt/NCfe
         Ving==
X-Gm-Message-State: AOJu0YysoAC7mMdbZwTc/DX5ArzgmL5rkgmEnrl+BkDNkxYuaFNtTL4Z
	a2eBQ2K6/NMRaY87HB4Wdem9uQ==
X-Google-Smtp-Source: AGHT+IH3uS/zkBftytejy0izJqy3XbZIIkpcp0FaQHJQseDClLrO0au/imISZpjSMEfjzELnXXSvzQ==
X-Received: by 2002:adf:e602:0:b0:333:b9d:ccaf with SMTP id p2-20020adfe602000000b003330b9dccafmr7521340wrm.11.1701340963649;
        Thu, 30 Nov 2023 02:42:43 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600002a700b00332eb16d215sm1201711wry.23.2023.11.30.02.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 02:42:43 -0800 (PST)
Message-ID: <f9dc82f3-070a-42cd-a92d-83d031647867@linaro.org>
Date: Thu, 30 Nov 2023 10:42:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] mtd: spi-nor: introduce die erase
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: pratyush@kernel.org, michael@walle.cc, linux-mtd@lists.infradead.org,
 takahiro.kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-kernel@vger.kernel.org
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
 <d7ce98eb-c920-413f-bbe9-059077a9dda7@linaro.org>
 <6156a51f7eadc9594404bb0eacabe1a6@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6156a51f7eadc9594404bb0eacabe1a6@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_024246_039629_9EC6B27E 
X-CRM114-Status: UNSURE (   9.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/25/23 17:29, Fabio Estevam wrote:
> Hi Tudor,

Hi!

> 
> On 25/11/2023 09:37, Tudor Ambarus wrote:
>> I made a typo on Fabio's email address. Now added correctly.
> 
> It looks like the Subject of patch 3/5 is not complete:
> 
> [PATCH v3 3/5] mtd: spi-nor: micron-st: "
> 
> Feel free to add to this series:
> 
> Tested-by: Fabio Estevam <festevam@denx.de>


Thanks, will do. Would you please replicate the tests that I did in
patch 3/5 for mt25qu01q? You'll have to modify a bit the offsets for the
die and cross die tests.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
