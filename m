Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DFFC2D0EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 17:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C70E207FC
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 17:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sAVcSHWz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNvwnFmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C70E207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gpp9bu+Q0Qrou1OtTm5H0nkzBKt9ZeNP2ptUr9ClJDU=; b=sAVcSHWzgDR05jK6EWGqWLynV
	9WYiPHSlX1ntYJn7fJBXmEUxZEhiqH3ue+GLt/NN2VPQqDl23HungjUMmbUvSJe3oOAE/ky8jpf86
	2tdZxzxFlPIoTf+2GxhF1AKwxW2lTpCT5oic1PvIZUqklkEU1esLSMCClj8dtzBfboI65+tw0ySpd
	LTMoG2HCAgiWKJCAmKvvR5/tYcF63BUQK98bHpI+lkMaRvdnhyz1yZ7iur0vfyYI8nGBw9HOyQvmh
	TE6C8GDvvSQAS9j0ttlQtNsMZ6ZJUlBkQl0/MBehijPlR8BSjwhjvJXcoYg8qVCOa71wKY4851H9+
	DizdAF4Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPUsL-0007y5-4d; Fri, 17 Apr 2020 17:34:01 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPUsG-0007uC-PO
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 17:33:58 +0000
Received: by mail-pf1-x444.google.com with SMTP id r14so1392068pfg.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 Apr 2020 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uiZHWPBN/CjTn5hUSx0nb3GnNPB5jmfJyKfRvMXal2c=;
 b=YNvwnFmYkjqkWoEvUY0+m8s0f/DOwb1an7aZSbuoMNGexc3FmOkCdwgv3XkqLgemt3
 pZpIoSmAVJqwq2tqcwBEkbUiczJyZ48QZYtHCeDgkkht6E1qHyPYJGvCJJ37t9tSwgNE
 vTqRLWolKu2lm46gev8eS6SL44VTev9Iyu52tzKP8UCycti368nJubGWt8xUdqWikqz7
 eVTC4LGDRINBIChKfcbrJUdY11q/K+TkJ2freB3L1gdIaoArAz65OiEin/u9zP8GJgcm
 8f607IHeXpxVcOOzGCWIgcO9QC0ZJiKpb9et/kanNYNEH0FHl5ozwF0PHgqR6eS8wls2
 nAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uiZHWPBN/CjTn5hUSx0nb3GnNPB5jmfJyKfRvMXal2c=;
 b=sOBUTjDoxCc8kDpeqgQcJQIe2MX7WFaUoWxyXfSIQnV+PpCwk4iP1Qr4MuIvvxj4a6
 4pGMiH0AyLOPlJLiNg+dATImWTYWXosV2EkuAAVqLbZynL0DsFsc4v+1vyZmcDpM22+D
 t9u2cqqn0sFjq/5BY06h0K3PAUmDCtDTwj4E7w4ez4bfT7Dhw0ZM13bguRR/i3WN8Fpq
 UuWf5RWNCY1RPUb5MBTntsPU7LHvPqPc9s5ERPNgZ287BI/viy3G8WCE0jtPhN3TuZAN
 j839y9eNNkoBYW/Nb4CYpH5kzZkF1QGMn1PZ54aak0Et11nfNoElQfz9zuxlXB7UzfCL
 VYQg==
X-Gm-Message-State: AGi0PuaS/z9nYB9wQQSEXgpCTH6IMwWKxg5wm+7XR7pg9P9WAmGr4WDL
 3NY8Qji7c89D3yzDUqqwsOA=
X-Google-Smtp-Source: APiQypKtO7qZnVIFYzkJmOqGprc5/EshtyIvVGak8GMq4bL539i2dQ95cAHJmJxhmDliCyOEF1gN/A==
X-Received: by 2002:a63:6c83:: with SMTP id h125mr4322228pgc.168.1587144834731; 
 Fri, 17 Apr 2020 10:33:54 -0700 (PDT)
Received: from [10.230.188.26] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id i187sm19920599pfc.112.2020.04.17.10.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 10:33:54 -0700 (PDT)
Subject: Re: [PATCH -next] mtd: rawnand: brcmnand: Remove unused including
 <linux/version.h>
To: YueHaibing <yuehaibing@huawei.com>, computersforpeace@gmail.com,
 kdasu.kdev@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
References: <20200417101129.35556-1-yuehaibing@huawei.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <890fd0ce-eda3-4de7-e79e-5276e69a25e2@gmail.com>
Date: Fri, 17 Apr 2020 10:33:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417101129.35556-1-yuehaibing@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_103356_855172_D153087C 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 4/17/2020 3:11 AM, YueHaibing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
