Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96E7C433FF
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 14:30:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7572089E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 14:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YKP1eMlm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQHR+2FO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B7572089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qqj2FoXlxGBl5S7Q3yspo+WmQkxlYU5G1lbWfPkcGf4=; b=YKP1eMlmXxGD2/mjhO/VcJJEc
	NOyTAWVhXSJQwgLpHiY1aQTwMX/57vMg3LrsL4w79VldBf6pKuVQWfW+ZxpPld/YtnCIULrfKqB4y
	fjPEILTwyoi/tfAOKA1L6G7Mv88MxfxButbo8x55UoiVpAonc0p76M61034+49r+GrN9jd+T/3SO8
	sMUyk996qiGdc4g/wiLesyW7/9bgpJOqHyHkLOP6TwzUi3TUoBmGc7ziCTHqm2J6mcxtYYjHhqLs9
	E1BOd+oOw1CR1rhj+YaBA3Uvffz2Jl9jyRddGxQwoPzaX2Oy5YPa7+kscfWs4Gy5fIzQNecb91QT5
	Qj7k17P+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv0Tp-0005VA-EM; Tue, 06 Aug 2019 14:30:25 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv0Tl-0005UJ-UF
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 14:30:23 +0000
Received: by mail-pf1-x444.google.com with SMTP id 19so41600272pfa.4
 for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2019 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8aURNyM9/Ye1wwG53oOlkzXvtkizQeODSJiH9nVgXG0=;
 b=HQHR+2FOKymXOLPHb71ljdUtw7d6SR8sttCC6WREABI84NsKWaKC2x+OS2MZaSzefW
 I1PJ7C+eOTj3jeP1eO1XC1a01U/sGTHqNPWINdq76wCxHScWgzlBF3mpbEPEpLUEMtw+
 1I5H3oFpljqdfCkF+IOj7hHShmIJ/oT+K2bGlJTrAHiQ4DfRhQTngzgJuc8C6L7SnSdr
 ePbwYe5bY0tfoX/hrm2B3NP3gZVahK65S9MoRkM9MjPXZSlnfMfy9d0ya1+dkvhIOC6k
 ieEw72Rk0tOmbwG2yFvG2Ex0s1VJylpgaQdkywZ1ZcDcEgfk9fwSDxJLUWJ/56F3MrA6
 TDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8aURNyM9/Ye1wwG53oOlkzXvtkizQeODSJiH9nVgXG0=;
 b=ZadJlPi4dnRujb3eQsLh6lktrg04hz7CvXBl6f8AOiRFdbTyB3QaMGCjuOnQK77APn
 ZSHRpuDTL45dzk0ITv4t2sGR9+leGjFiSiS/dZwbGY/Q0eO+nHou8JgGunDTRzNBMJQm
 tWjVUD0Ni5RRwa0MzBBfdopacJGx59EuX6kS3oSnUj2EgHipIXMbYA5HyB47KLEuLpfo
 KBQHYXgZSdRa3kvY7DRJaG9Sy90LyGakLIcEVY2tKfnZHZwpRigDO/e7dSlVsrR8YkLi
 fhZ9IfggZtDQiP6VJfXnDUfVD241m9e4OcfF8SfMVVNex70UrnRW9X4+nm/9ohg8sElq
 n0Xg==
X-Gm-Message-State: APjAAAU6RgdtECnoexRErmTLKdCPJG6ESoYzTsJQxLIC6mU5AHOISVWf
 ln/lbAqoByN89jOhqL9sGW8=
X-Google-Smtp-Source: APXvYqyNdiA+wjhQca2uOA0zVHrUw1zh3P5/ttIIjx98GImGfTr6+ex0O0OtkB3fm/cjwPxIhoW1Dg==
X-Received: by 2002:a63:1f03:: with SMTP id f3mr3237884pgf.249.1565101821165; 
 Tue, 06 Aug 2019 07:30:21 -0700 (PDT)
Received: from ?IPv6:240b:10:2720:5510:e0e6:163b:d8bf:4871?
 ([240b:10:2720:5510:e0e6:163b:d8bf:4871])
 by smtp.gmail.com with ESMTPSA id i123sm120412452pfe.147.2019.08.06.07.30.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 07:30:20 -0700 (PDT)
Subject: Re: [PATCH v8 1/9] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
To: Sasha Levin <sashal@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20190805190326.28772-2-ikegami.t@gmail.com>
 <20190806004303.EBEF82147A@mail.kernel.org>
From: Tokunori Ikegami <ikegami.t@gmail.com>
Message-ID: <9fd8b17b-abb4-114e-d6fb-252430d98432@gmail.com>
Date: Tue, 6 Aug 2019 23:30:15 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806004303.EBEF82147A@mail.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_073022_002866_FB85EA79 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Thanks for the mail.

On 2019/08/06 9:43, Sasha Levin wrote:
> Hi,
>
> [This is an automated email]
>
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
>
> The bot has tested the following trees: v5.2.6, v4.19.64, v4.14.136, v4.9.187, v4.4.187.
>
> v5.2.6: Failed to apply! Possible dependencies:
>      4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
>
> v4.19.64: Failed to apply! Possible dependencies:
>      4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
>      d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
>
> v4.14.136: Failed to apply! Possible dependencies:
>      4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
>      c64d4419a17c ("mtd: cfi_cmdset_0002: Change erase one block to enable XIP once")
>      d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
>      ea092fb3ce66 ("mtd: cfi_cmdset_0002: Fix coding style issues")
>
> v4.9.187: Failed to apply! Possible dependencies:
>      4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
>      c64d4419a17c ("mtd: cfi_cmdset_0002: Change erase one block to enable XIP once")
>      d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
>      ea092fb3ce66 ("mtd: cfi_cmdset_0002: Fix coding style issues")
>
> v4.4.187: Failed to apply! Possible dependencies:
>      4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
>      c64d4419a17c ("mtd: cfi_cmdset_0002: Change erase one block to enable XIP once")
>      d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
>      ea092fb3ce66 ("mtd: cfi_cmdset_0002: Fix coding style issues")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?

Yes I will do fix the patch for the trees failed to apply if it was 
upstream.

Regards,
Ikegami

>
> --
> Thanks,
> Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
