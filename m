Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6268C48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 13:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8330661351
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 13:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8330661351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IRyiytLHRNtsoN3qzgE5nLoQm7n39KSgKLVCy4rkXg8=; b=VrOaAc+1gZCB67o50dKaqyF+h7
	6KFmaRNHoKamwIWiu8zqTcCsJMR7FXIsqZcQUrbQ1SQQnb7Mo11INhEjHV35NqwUaaW5go9PW/Gq/
	86mx7CsxmaKTKiSP/Tji//IUADg3gCYYTXzEfQEqOP/6hqYFjt6DyrtmAmCTmxdDix9mDEuBqg6Eq
	kuSymnnUVSoGoN2WsttcAjOaj3MMPQrSEkuHsB0yMgim3qAMsVRDof4/LZKDhgUFHMc8iYwUt2W+w
	GG/dqRSnubzY0K8ZLjI6CPci4zgQgCOFL1VVqtBAE3YzaDF35WMeWa6+BRZDJNUYuHnHyHH+EWq7u
	YXVmpHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqyg8-00E8zQ-LS; Wed, 09 Jun 2021 13:55:32 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyAt-00Dyno-24
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 13:23:16 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqyAr-0006wb-AU
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 13:23:13 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso10761716wrf.4
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 06:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HZHcwmcBCk5lvprMQJK82JaJ9zMetfOy1nrGFdC8Lf8=;
 b=o/qKUti5s3gThQpIyYK9KaWVnc4sYJilLwh7Y2sLShZC6AtEo9ApDx6Bmn+3rc0RWi
 Y4w2qsco2Fq9GrdyZqQp1IsL4XqJJgAWSSedX9ZfmjJLKD+UoOvM3SURe8a8lv17m5Im
 4oD1cyDkEXlbpWWH5rwOcOxayj7hK2C3tC/B59Sn/U2uAFD65IF6+wUBHQOiugGYrazy
 inQWGYv0UT8OqIk9WBxKhyU984aPfj6LFrc8k07FwR/NvyVLrGJCfQiLUbPx+QkYboxM
 y72C04J2p2mL+PmEntjSEPo2RBHrj1KQ0341pM9ltwHERsNGv1SVS7ZgejbhBG43GqYT
 HiMA==
X-Gm-Message-State: AOAM531QslJszRGh2XKfqDP2APgoEiywdbafCFJ0ayLqHA7MDMuZs/ZY
 wWiWakN602ucI2Hd4vllOVsnuzd1edIG/FEHlcOlOuY0XxlqCq9TB9i4tvW3q7PQDLfbvIpHoBH
 s2nNI4GOBI2xanyKD5QgCeBld1Gc48tJ62LCfMnv4mVU=
X-Received: by 2002:a05:600c:410a:: with SMTP id
 j10mr9555987wmi.6.1623244992939; 
 Wed, 09 Jun 2021 06:23:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE07PURI2CbXH6LOfvKl/P4UxKK5oXM/IoS0mjhrCSr11j6J28ssoLODge0i12ZK8N16q/iw==
X-Received: by 2002:a05:600c:410a:: with SMTP id
 j10mr9555966wmi.6.1623244992844; 
 Wed, 09 Jun 2021 06:23:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e16sm3716389wrw.49.2021.06.09.06.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:23:12 -0700 (PDT)
Subject: Re: [PATCH v22 15/18] MAINTAINERS: Add PL353 SMC entry
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-16-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f04b06fc-72f9-8f90-343d-e4826a3bf4d7@canonical.com>
Date: Wed, 9 Jun 2021 15:23:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609080112.1753221-16-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_062315_182728_8AA61C48 
X-CRM114-Status: GOOD (  13.58  )
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

On 09/06/2021 10:01, Miquel Raynal wrote:
> Add Naga from Xilinx and myself responsible of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Memory controller bits look good to me, except few things in bindings. I
can take them up to this patch, for which I would need also Ack from
Naga Sureshkumar Relli confirming he will co-maintain this code.

I assume the NAND driver depends on this, so I can prepare a stable tag
with the memory controller part, if needed.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
