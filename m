Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66502C76195
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 16:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMDeAOJE6t/IKd/MxkbVwTnNIjjE6pJyaGSsMkOPIT0=; b=dik9zZBkPVgJzF
	SS7whaLkYVkZCXK5cIZok5RtChz5jFJ+w8sKKrdlu64vGoex4cY451yF1kTLFchlxyov34PyHsQgx
	Kjqd1hsvym6g2wgYxOQSpQ8XDA5cPM9yw/19tLIYXq4SgzA4DhIKwDybAQfmT9LamkyKtjv5spSzV
	YKsigk+J0kYEuI/Dx8shKpXIXQqLmtXpeq1DnwLoMV85/r07o8mfJac6nP2QbuifFDBLguzZRQkMc
	x7D9bUDpvJAXOJfCCISVK3ddKgBtTK1JufXX7MelW22ol0YpXGwB+Y66aoobEkdm3keVNh5zF7vQL
	qSjL8LCGiaCB43NGyyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpNJ-00BfKW-1T;
	Mon, 27 Mar 2023 16:07:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpNH-00BfJI-0s
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 16:07:12 +0000
Received: by mail-ed1-x532.google.com with SMTP id r11so38349366edd.5
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679933230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LEsDycoDNNxiuweLLNkVCjBLy1OwMwyxbYDv9vom5U=;
        b=pPbTxNH0ymm/YMKamoshQU8TY9g5bLT38o6aex+MqUWlO56U2WBGW4kKRxU5toxzQW
         fLq9wljTRSgdD/SNk3umxElyHAtWjagWir3tguwLug8WDmM4FujxETm7B7kPz13YAONo
         EkOOmftrFozf8j9K+8AAqWP90HyOXkLQd2m+mUS3wZOnRi6H/dZtUkwaDcPHpfEQ62i+
         IwiXyp+3sH/vUdyazYe6+UIKeg8uR+t3o7NAFbp5+nMBRRthYMe0jMKjiQAKLcspHcNm
         RjSsDUjcDUgIjDIHq+FTspeyk6BDjYZ4BhEb8LWUlwgHp0qm69zsZxi0eOJq4fvMiqLE
         07jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679933230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LEsDycoDNNxiuweLLNkVCjBLy1OwMwyxbYDv9vom5U=;
        b=MiLiIoXCgV4zQoS68RwjVYYSh2+U4pU4Ym9gq4ktyYuMhLMZtnVe5yycHnItxi1WBa
         jBrqw1MfxcAQerFDCTnyHxZoDhDtwOJbCge7uaBPaJRcexBMLaugzR5WyOmVSfCr1/wC
         3OgGVxJymPUcl/V4q8ZtRHlgbg7lWdVviFmqUf9lzPCLTZLIctuFsh+a6PQD1udF+lUC
         guysry+RTmWazbYRWxtN8noZZ60lQpKyVl7/JoCYHUeQBO5hd5mlcKrP0ZwCoSU9IAIT
         9GvwTerx41qj7WljxzidRa+vU72fbv8Dtii68j747MZMJSVhy0+bmeySa4HInH4cDyI6
         5Urg==
X-Gm-Message-State: AAQBX9eXcb6ZujSTSoKhmkMoC8/eDioqgex2Fv9FyIxa0XnKYRR+erNT
	vJbghHmf8AzL6BQYFjd/ZjKqZA==
X-Google-Smtp-Source: AKy350bG1gjpcfly7fVco4g5TTDffVoqBAJyfj3y0NuqH7ZswKxBS8s8PhmNNfNfw9CvFBV4It9Dbg==
X-Received: by 2002:a17:906:a8d:b0:878:52cd:9006 with SMTP id y13-20020a1709060a8d00b0087852cd9006mr13713393ejf.69.1679933229936;
        Mon, 27 Mar 2023 09:07:09 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090607d100b0093a768b3dddsm8787820ejc.216.2023.03.27.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:07:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of MACH_STM32MP157
Date: Mon, 27 Mar 2023 18:07:06 +0200
Message-Id: <167993322006.178792.4595537654296937780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324155105.826063-2-christophe.kerello@foss.st.com>
References: <20230324155105.826063-1-christophe.kerello@foss.st.com> <20230324155105.826063-2-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_090711_336503_A9C5D354 
X-CRM114-Status: UNSURE (   8.07  )
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

On Fri, 24 Mar 2023 16:51:04 +0100, Christophe Kerello wrote:
> To be able to compile the driver on all STM32MP SOCs, we move the
> "depends on" on ARCH_STM32.
> 
> 

Applied, thanks!

[1/2] memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of MACH_STM32MP157
      https://git.kernel.org/krzk/linux-mem-ctrl/c/20c082a2ba25374a13505b78cdad7f6a2cf8d763

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
