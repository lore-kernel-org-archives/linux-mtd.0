Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BED5C6FD1C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Py/WYl5YNhoz+mKQc8kVPZGvhERJh12CWZK8R7+ngr0=; b=NHMsNb7P2hHUHo
	u898jcs0x2h5hJkSKxmDH67CKttVqQOJS7XbjMvfXXBWw4CHfK4Tv944GKmz7Pw7Kj/Im2RokmRYS
	2+ULFbebbPf12Ql+vnKdZbbCQEPn6m3RZ2PCUUkg9bg0R4+YQsQu2TUfx6nWydUDhBsoJDTFMSESt
	hPSYGqA7x08Gq94yu+cRbhnvohGSrWMXg1N2RS1Q5AaHiOeV93ggJqpC/iTTFCfG9ABoR+ozgTuiN
	t1Ihjd5LsQbr3KGUHSUSH+hnsAg0sV9sP9IByx00Mt52l5P2C+pHmB9Z1RhoWkeGANHVxFgY4GvER
	vobuvTrHCOpNETSPEvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKLf-001yUA-0Z;
	Thu, 23 Mar 2023 12:47:19 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKLc-001ySE-1y
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 12:47:17 +0000
Received: by mail-ed1-x530.google.com with SMTP id h8so85993612ede.8
        for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2023 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679575632;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29KLJ5szuNQ5eMZX1WqdZX59y/UdTkatkQ94dzXCqp8=;
        b=afe3Hc9Ds20Csba9b/cOyIJEZHe9DI1lVbt1uTBoE9cKi3uM1/xX54LA8GzbYmIVcg
         LCuSw8vecu/dLj8A7P+h3xFcv1sRUZmaRSy83dCGKNrh3yWhxh0ir5ccz4Wx7DB+xdTw
         KiH1qOfX92/QHO1JqobBinGrb3AEEsCFMiSPVEWVVHKnjyR2CkXl/BfFP2e/lw+TSR5h
         vg16y4NgtHJ1bLxZCDKkGnp04zVACu1urfmRXBoIPnzoNxs7sxjb4LCFoI02xcoDoS4s
         418Wly/tfLP7yM5mPvKpkpuprZ2E/CosVA+IwG/sVMvNIRrArXAaep1/2zXhFQN9UNXA
         fmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575632;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29KLJ5szuNQ5eMZX1WqdZX59y/UdTkatkQ94dzXCqp8=;
        b=X6JRTOJRMpl+tuNOCdksPv8U2VyIuPPHv491JiN3hVebnG5VcFLDJWpBE7COlgtNRA
         EnhkXWAWeAcIjlH49UQ79nvh8QsjLJT6FtFr66ir5kHzZ5fSAy6lwLMYLc+ZpsDIqgir
         Ah/FJUE1JL07bomneWEd5d2GWmEeFO+P8iW94xOcuD/fkRDxdVfrV4l7u0+mMNjUd714
         a/JRVPFQLidW7B/PBc7cSdCKTu+KbC0NxjTlDPMxNnnUIxPpNmRl6xy5OmvbsmHcR+7Y
         ZmMXZg+97tewK+guA8vG89Pvzs4jHzG7sE/cQmk44Y1IDNeynhOBT/T3SR1Lpe8fI9Dz
         V1yg==
X-Gm-Message-State: AO0yUKWYllHwpC2oTu62akrwEbtOgvKbbuOBDRXHm856FmaAwd2ybAMo
	Z+8eCb9hl0q+GQC/g4AmKO5QNg==
X-Google-Smtp-Source: AK7set+DMwMAz+xj4sHrYHg384nhJF6bDuTDEnvc5LD2YWuiTiyKOjCdND/Zj5XI9JgW6hxhqpR8Ag==
X-Received: by 2002:a17:906:cc15:b0:931:cac0:60ec with SMTP id ml21-20020a170906cc1500b00931cac060ecmr8707234ejb.48.1679575632463;
        Thu, 23 Mar 2023 05:47:12 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id ia9-20020a170907a06900b00932b3e2c015sm7737842ejc.51.2023.03.23.05.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 05:47:12 -0700 (PDT)
Message-ID: <3e0fa788-173d-a014-20d5-0b4ca4d890b4@linaro.org>
Date: Thu, 23 Mar 2023 12:47:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] mtd: nand: raw: macronix: allow disabling block
 protection
Content-Language: en-US
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 masonccyang@mxic.com.tw, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230323124510.2484808-1-noltari@gmail.com>
 <20230323124510.2484808-3-noltari@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230323124510.2484808-3-noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_054716_694663_2223BEFE 
X-CRM114-Status: UNSURE (   6.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAzLzIzLzIzIDEyOjQ1LCDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgd3JvdGU6Cj4g
U29tZSBkZXZpY2VzIGhhbmcgd2hlbiBibG9jayBwcm90ZWN0aW9uIGlzIGVuYWJsZWQsIHNvIGxl
dCdzIGFkZCBhIGJvb2xlYW4KPiBwcm9wZXJ0eSB0byBhbGxvdyBkaXNhYmxpbmcgaXQuCj4gCgpX
aHkgZG8gdGhleSBoYW5nPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
