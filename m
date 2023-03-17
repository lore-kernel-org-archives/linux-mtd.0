Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1341C74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKeMH0VNQDYhVyDH5gXSHkJhbtK5kVmSCI8jaG3A5YY=; b=Lbul6SVE33Vpcn
	TZktvJtYaq7Gn3nxC5pAmolBtNK4HPEToNNC1qeFN/h/siFdJbbdwluqG5wnc8DFqfpyRVUmKwNQr
	68QNk+exQNTBLqYwf3wEtiDo2AUvuBH/g97nchOQIF2Nd3ZUM4KsdDrqLvtuQPW417LhWih+gnlWi
	31dVL9niOTHQfrkCNXDju8HdT6TZx7Cl3lfuDlio+vw/kiL5ock+KnARcXO268mCT6zFnw8a1WhFT
	VD8c1koDcaI2TiOFcx/+cHFbl0IXaDRaDsmv6wYN2Kn4IYSCY8a4nItsXLrggwo9TtBzop72AkpRj
	On3NMX9MbMet8qXCdoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6BR-001gTe-15;
	Fri, 17 Mar 2023 09:15:33 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6BN-001gSs-2j
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 09:15:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id x3so17677014edb.10
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679044527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQojUQ1+osHyQhyWKtUsKQb283x3aBEgM9AZ+zCYjYo=;
        b=A0SyuecpeRIAwfGF8sxqg5jIr4dsblUik6RHUxUxjUwrPixRVxT+CUOiyqUW/HUKpT
         S0lre76Kn0ZR91ykTfP5Bpkbp6v/mTZep4w+L+1NjeFXVqOjmSSpRLqVwrGIWLvv9Z1Q
         LDhN37h55aecsPrs29NS4eb/zwhDXTLA766s7hj3W14lUNA1cdDJOwNaEaNbUnockqya
         M1oc27+QsPtHV7GRItHP4/zTf6MYnx2bV2x1QPRcUJX30uvtpYK4hhwkiomyeJ71IOiO
         4U9TNqoHWWl5SSL9sAiDUuzRRLp/f2WbUPCYyWx50PKCKkk8u8eiZtO+ETpNrPob24lt
         Ng1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679044527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQojUQ1+osHyQhyWKtUsKQb283x3aBEgM9AZ+zCYjYo=;
        b=rqZBdaC+nv693LiftKdt8sQsX9oJfAFquDqXk3PujE4mcLP5Obq6RnLEoudCXvRFcm
         g0WvOt6y/h/6gUR9JpV2rcW1dVQAv5BaacmXVpATRU6DzgZilYhkj7p1et4/dyzZLhxT
         vNjEZrsgGmH22vIpEft42MKm4IHk5ZLain97g50hTod+eZCrJYJ3E4arHVann4didunh
         WGmOjA6GfZEsvbQ722JieQKal2YG0nADUJJFdVF0jxt+COXa2Tl4zyuu1pLs4ODmTVxg
         pEZ1WkVSS4NNwY0UC9cTQedia1u0FJHs19fZuMv9VIyvdpLdYrIoDO6M8mn6273j/ois
         RTJA==
X-Gm-Message-State: AO0yUKU5ET8Anj08jiVZTy+EDyaz4IUfCQbuCV87LtRg7YxFXNYfeOeV
	y1VIcHm+T3RJspJee3X6MQMemlWzPv4ROeKXcIWG+oRv
X-Google-Smtp-Source: AK7set+MINcXU/3nmA98iUTrVSEIzwSMHipq6ariFSKUY/ZcxNnZtTzdtjlfBZcTw1yDjagM+SJC2Q==
X-Received: by 2002:a17:907:60cd:b0:928:d4f6:6f7b with SMTP id hv13-20020a17090760cd00b00928d4f66f7bmr15404993ejc.66.1679044527736;
        Fri, 17 Mar 2023 02:15:27 -0700 (PDT)
Received: from 1.. ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id gl13-20020a170906e0cd00b00925d50190a3sm730635ejb.80.2023.03.17.02.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 02:15:27 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: spansion: Add support for Infineon S25FS256T
Date: Fri, 17 Mar 2023 11:15:24 +0200
Message-Id: <167904442209.32859.856237187092157111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
References: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=633; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=+Xrgke8jgsEPD1rzJawgAZFQUV7p/g74CLtOMIBHpaY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkFC+ondsPhPfJwk6AVgJ6qIK3yd+2wH/Ojom1h gQXLWS0laOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZBQvqAAKCRBLVU9HpY0U 6finCACiBEseRV0Y7nzWriqf22/WYEuTlmXLPSpBukW0Q1pNPgVCNa9rxCh2j88aT8ZN0RtknRQ 4oOLlO3mMpp3oGU/+ceVIJUcNwQTJUqP0YInA4goxItSsTXoN7HuGbU6WluTU50bf9DX7B32zqQ PxgEv9+YP1f7aZpUkNcQ0x3gF8fp1KkFTP37pjwQj4buJUUGyPRodzV3/N9Bq8cDP45iPAG6k8/ fi9X5FB0CxofPA0jVvykUy5G/FOHxzeLKEjkN8TGwY/ktcG6USven/gna5SibvY7n2lR75tsW1y lG8qnF97CfbNCXhl3qKT0mZdTOJ/3lnrSH6cYSkSoVqoFeOO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_021529_942633_A56B689F 
X-CRM114-Status: UNSURE (   6.40  )
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

On Thu, 02 Mar 2023 16:35:05 +0900, tkuw584924@gmail.com wrote:
> Infineon S25FS256T is 256Mbit Quad SPI NOR flash. This series updates
> RD_ANY_REG_OP macro to support dummy cycles and then adds ID and fixups
> for S25FS256T.
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git, spi-nor/next.

Thanks!

[1/2] mtd: spi-nor: spansion: Make RD_ANY_REG_OP macro take number of dummy bytes
      https://git.kernel.org/mtd/c/d628783c46d3
[2/2] mtd: spi-nor: spansion: Add support for Infineon S25FS256T
      https://git.kernel.org/mtd/c/6afcc84080c4

-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
