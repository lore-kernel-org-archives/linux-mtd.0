Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90A5C7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usNZvsO0SCboqRTnDfJuSRCKOrGlaLKXB2V6c8dZQtY=; b=o3IGfuTTde2RLs
	5CVn5t3cyMAPYgVlfWgW4Z0cqcD7CClaOEpbyRKAfA70W0gyT+CSPFRlovZhayTAsSED3NNwMF34F
	rh6i3xovoTj0iiNXpdWeUA11ms6l+sjb2UFEMJiaxQLzoguKeHMzwl1KARXetntBpsgtAUWE27RbN
	bbefx9tUqnXHGZYPsa9a2/QP05C7fMudVLtHm2cw6C+Y92QBwGe1VVooXD+aIotX0jckbZ2H0jiPl
	ZCUwjbFVr8sOqzU/ocm7TunFL4VPeAr9ynNbjuRFcOAcLs2hAyIjcHgo4pVQfP2+os90qKrlktfDZ
	0g36mTEQ1vYRPNlfLdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7EKK-009Fd8-09;
	Thu, 08 Jun 2023 12:01:16 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7EKF-009Fbl-2K
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jun 2023 12:01:14 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-97467e06511so97946266b.2
        for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2023 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686225669; x=1688817669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSfpWD4teVA0PB2ivylgMo2dut6dNPatdLRqxIkNQ+Q=;
        b=WoTNi+ai6NsW8KPLL3LglJc2enfwxbm4PzanNJzUP2kSg8rIB+8VAY8VxVGA8oHiBd
         aCpp7uniWV9tqmT9LxQoBX4diI+7/0VA1bGTXiIVMFDUryAz58F2dSqdQFRzIabkPtNF
         VNDGsZdS4ps1dVEBvYR8lsGyNwWK8Cr5ApUpLqNehriyJel3kUoJJ4shO6wHVkQ+dqCR
         5GmbTemDGR1vowPNxXZAKpRwY6gSO8OCu2T7G2gMkP5bSNHDgfEzSpfwaO2tfbHmy8p0
         xl0hr55EF2E2bIm4H1u8jMtYiKhvJtQItiOUuEnIMdZDwtYP2m7Z6v2WJRZ/sjvFcGRV
         hzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225669; x=1688817669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSfpWD4teVA0PB2ivylgMo2dut6dNPatdLRqxIkNQ+Q=;
        b=g3YSNEqavH2LBzeXVK0BsIO6c3gy/MzRenOS3gvYX8lP/kuyKBwrmYyZz11LNqNXpG
         DRAPtPxxTGZNhcVCcY+PjgI920xXlP5Zj3CddOaBlEFEAhf6eq02Wt1Bj8dqC/X6Vqlq
         a+bXDcZuAPIYo21rIrMrwahQCTcPLii4c3mDGLJdEc+5u2HSvU88DPep8Uum93Oab2/v
         wVrdz2Rg2oJH/rO6Yp6P0ch0QKzDFMaeJVfTMdtTHFqAIHnJEcIitvQN0gKLMn5GjFuV
         rlfIfqNYEJ2wwHniWk23e2uvik9lArt2gE9Y+setGz7joWswHkIX8iaXEhp5q+iArt7v
         gF+Q==
X-Gm-Message-State: AC+VfDy2NPMGzJBWDlWhTRLunjJC0Nj14g/fQmVaeT5rBl2pQUmIfJ4O
	zg/vwEylQuYpfkm1UQrZlQ3qpw==
X-Google-Smtp-Source: ACHHUZ64DPz/2YQ7ZsaUzDtgwN8iEGLtqsNJZpVuVaw6nlFGzaquFSCCNzMzj3L2VCS98bdm8s2DJA==
X-Received: by 2002:a17:907:a413:b0:978:9011:5893 with SMTP id sg19-20020a170907a41300b0097890115893mr3107734ejc.37.1686225668903;
        Thu, 08 Jun 2023 05:01:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gg24-20020a170906e29800b00974638e4a98sm610936ejb.24.2023.06.08.05.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:01:08 -0700 (PDT)
Message-ID: <07c455ff-c44d-891b-e2ef-e5cc612975e6@linaro.org>
Date: Thu, 8 Jun 2023 14:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/2] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
 <20230608044728.1328506-2-AVKrasnov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608044728.1328506-2-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_050111_787665_1512BF3F 
X-CRM114-Status: UNSURE (   8.00  )
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

On 08/06/2023 06:47, Arseniy Krasnov wrote:
> Add description of 'nand-rb' property. Use "Fixes" because this property
> must be supported since the beginning.
> 
> Fixes: fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
