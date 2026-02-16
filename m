Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688F5E7BDA5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Feb 2026 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSWmWTi0SfZNZQaUFzM7S3AefCUJwuf/hCh+9Q2yr6c=; b=e+9bYJ70a3HiYf
	EYSMMdCjdXXQ/nUj7tVAfKks6OEXwlnWIR2yJ81r7u4q6laQJef7RtxN0bwT9xM7ZScO7FmNM4dJ/
	/dLwkzZt7/zTBiB00wFTQlZOXaRumTdN6yvvRggLfywNPb+O2qLnFd1HYC3iaw0vsPFN5GVOMji/A
	HRpsIFK4+FSURLOkxZ7snbWCyYWTOBg37zmQtrQv/FXcAYC5z+M5VwhkTKZ4HW1mcT5L/3kiEq6wi
	kFsmj/pR2zC2qaNJiTVN3P5beVOF5a32YgLtFRZN0b4kBJ6bHbgeEILUvJiYhzw7+91K4H6WDCkId
	P4tJ3mPnhDQv18Go9Wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxIA-00000006U95-2TqO;
	Mon, 16 Feb 2026 12:01:30 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxI8-00000006U8m-1P5e
	for linux-mtd@lists.infradead.org;
	Mon, 16 Feb 2026 12:01:29 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-824a9348603so1118005b3a.2
        for <linux-mtd@lists.infradead.org>; Mon, 16 Feb 2026 04:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771243287; x=1771848087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DROBbAojmxyZXEESYFC1TvAvGeSXjfntWusxeMQR77A=;
        b=OQggGcfpjyFSwPd6njKxapqqcMrcQOqSSL5igjfUGxgJMctDOjxCYimeylr5Zyg5Da
         aoHc1AfDcBos3AY9Kf6N/tdUY1h+5b0SiFzqc9FTCFRQ56l0AXMwdaCmgI15oxk/izr/
         rIxSWR8sLt4KgBmxNEqJtOCm7QymOknyy1EgnzXr5xoptZw8K4x7+acUSP9jCY02EEB1
         waRHSdx5NzH1DXBvcE0EUrTTTh0Fc3d78qQTXVfty8FqUsgDzOxXFGKqOfWrqEPAm2B8
         3g0Ik1t++Q+tafpSkHHXyoQcGzk9mZZkfLXolHAvTi0j1YEW6z5I9hAxPPLpLEuNN0w2
         b6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771243287; x=1771848087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DROBbAojmxyZXEESYFC1TvAvGeSXjfntWusxeMQR77A=;
        b=KRCTnAul+NOxYwl04vqHTl6iyh7gQ9/bnOVD5ZjevAU+kjQu+gMLmp8PtdvcKyEmnw
         AzBST8gThaV+o4jSM0h+XHb2QWhOTi5iANkRZ5sQ+J7HbHHeodqR8Nk95+a8k0+a+K9k
         FdhFAhpmq7yBz1/zVuRX7VKHRzl6oQJHVF7lrwr4/0+fTUAtEBK6veh4Xb7rP8fZtfoQ
         8TGepkzMKgb8RwxQIz+ss9wJ9UsmIDZvnH5pD5riyts20Yuib9YUeeYLw7iXkOTEruQl
         9cvvWpK98MnFIPy902acSh2wkACifHoOzbMObBfWM0WxRv+uV4aSJuhYWpUPTO+wn1VD
         UnJA==
X-Forwarded-Encrypted: i=1; AJvYcCUiCEmpX5M0K28LA1OVNzISpVYsAvrtcdpNRVvJ0qj9Nx9hwBxumXzVG733Ct4WFajV4DPQXO0Wlbo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCl2G5mD2WtTi3p32cthkqlbNjKZkZuwc5Rp+BWTctGFN/X6eT
	EWrvK33++5VnmbDfiWPW6D+4Z0o4ATX3YF1C1NRdHhb+9R6L2DAZyGiZ
X-Gm-Gg: AZuq6aI/slgzPMld4s2VVjRa6mnIt/jx1RHHshlgEpuTwO6Qqhx/liGR1ELudIjeroi
	P5C8A6LwN8X0ZOnG8cOp9wEHoJrH/zXREV4BxjaO/cz6AVLAQQOARvNIM6wI53RFFedJFmwjgDQ
	xXA6o9bNRsOzO0Ptju40Hovtm9K26jEbr/vkiZdDxUvUXVWdAHH1rMgDtlTcFDhNFeG9jfVBTux
	xUgjPj7TuRLXubw0wO9I5RoTTaGJgPE2kHGIpYjUMSdxrk6ysU/K6mBFY4lP0B+/69zcxlXWcnq
	foaaBmJ/j/u7OqdYR+CCxDv77gX/lUi6kj7uSfqhd2A1Hwe4agtxyvmA/yDIrpV+GiwaY20l1Im
	g5nlpsBEbKkfpznp14xyG4H7FSRNORnxtE19yvvLogtIe1vrdpaa/5GfNNw1LSGV478hzTTVeLb
	SlXHrr7I20hDeJz6MsQmWMqXLDvx8OyzElmKvH4gcbloSBk8Xsi5Y0/NO1VWtDpnMKCEEFIK3Q
X-Received: by 2002:a05:6a00:1c86:b0:81f:49cc:ea11 with SMTP id d2e1a72fcca58-824c96429famr7194484b3a.65.1771243286614;
        Mon, 16 Feb 2026 04:01:26 -0800 (PST)
Received: from [192.168.0.6] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b6a3edsm10289704b3a.41.2026.02.16.04.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 04:01:25 -0800 (PST)
Message-ID: <15c5b96d-768e-4c45-a1bc-710e3bae1e11@gmail.com>
Date: Mon, 16 Feb 2026 21:01:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: add Takahiro Kuwano as SPI NOR reviewer
To: Michael Walle <mwalle@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush@kernel.org
Cc: takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
 <20260213-remove-tambarus-from-spi-nor-v1-2-6caefb1a63ae@linaro.org>
 <DGEKRBYDFDF4.2T2WNPBGEYTMU@kernel.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <DGEKRBYDFDF4.2T2WNPBGEYTMU@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_040128_441226_36D9C636 
X-CRM114-Status: UNSURE (   7.73  )
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

On 2/14/2026 6:24 PM, Michael Walle wrote:
> On Fri Feb 13, 2026 at 6:02 PM CET, Tudor Ambarus wrote:
>> Takahiro has been an active contributor to the SPI NOR subsystem,
>> providing valuable patches and reviews. Add him as a designated
>> reviewer to help facilitate patch processing and maintenance.
>>
>> Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> I guess, you've asked him beforehand? In any case, Takahiro needs to
> ack this as well.
> 
Yes, I'm willing to contribute as a reviewer.

Acked-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
