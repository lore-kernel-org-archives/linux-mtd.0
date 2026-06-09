Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80AECD8CA4
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8gN7cjYtQseM9lR3UBnzXSjgiNpl8HIwyC3LkEg76U=; b=RVfZHJ2QlLWFuH
	y66RX3DKh7IAE2TcMy14meFOOHl3hD3hovW8ziWt6Ag3T1/MiVJBStLvgn36AxuA/wcSMnu1aRpKU
	dTz2HYxmqfkVkjkiw9ljrG4TFqIruAfW/JXY+7LYetECyfQMmXFuXJ0mrRSOy+4S8BQLj1V2jnqu/
	eS3uvLPtP45H9ZO0luMVgzW1nzOn2p3ZCzxXFEqRW/xm02bzWkTa7xZFqJAQaPV04kejLywjyd0lF
	9Xl2+A5Al3PF9qd7Isjbbe2eCtOBP0GzPkdt/xnj8NOB8OAa/XuadmSjLaz8eJOURZ/cCK2ZLjbYn
	CxRop36aULBxgMtZ7cRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsRQ-000000059T1-3MMA;
	Tue, 09 Jun 2026 09:08:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsRO-000000059Sg-1IDX
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 09:08:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45eeba68948so3742460f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780996089; x=1781600889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcWe6FBXHKu/SjAvczkdQWOlNf7E5opqauX17gbFy9w=;
        b=OgOfMK2sO0M2FeIuDEm5jckRYOjRaVWdSVKNivjdT7Ypr0Xw4BPKto0tF5zvXcAe0s
         ZNqGayKoe1QhIKU1NvBj6V5ZMn787cz442KO9PNr38P2UrHYCys7JRcVrCuFEd8jSLSI
         +NkxhgZcAYt4piaGtXb0IdHxrJEQIFucePSIYLp/Q0v0zYCSmyZJJctzvqIADP47fMsc
         jgCk6TJ2P0Ci/G6sJyxqX14uvt5/dKKFP6hRdUu/acsbTNxgls0bFOByMLSh+0F3WSNj
         VYnMh+guQcyMGlXsKg+PRLWRhGj5Mnz9HNHZ7FEZV03F8TlBwnQN30Q2ZiCdf1dmExaN
         1vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996089; x=1781600889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcWe6FBXHKu/SjAvczkdQWOlNf7E5opqauX17gbFy9w=;
        b=TmQKRt8MgJrZbVzM1IH+huduB8x1e3kSfOeYG3upbTeymhicngxXXE1EGSc9giqkqL
         h5/3B0Yn5IjQ5PZTUMrYTK0MYU/wKQooBzzKPWU36wWnXaSlkJRe7dZ7Nhs/nR14CXHq
         9zia+NMXeRpTB5844RTuAZQQrHorP6Ktq/lGVKY7i5Q/QhbQ1Zg0g6w/wGJzAgBg1ntc
         SkfP8T+l71AY+//guVyHsLwFZWMHbP5lAdUmTVCg/cBvHFtNpg+L2Bs8JFkm0Mn8aHs1
         nLSn8hJvAVsL9fS+RoVmgctDR1zBqq1yh8bw1/G/nNB4Q8S7isLoSipmIM364qQzLBBF
         ouSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8etoZ3aoENtyh9hcz61TluTqYjWGLnu4JWL4mFGKhqy68fVHIecROqb+rVytSdUclXNBIGtWJ/y2I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzypPx+1A+QjqO2D/Q+JmOy0xkgmuLikovkgPcjjDkpi46lFS
	TWeWpBq3HFrAg83ohI8VOv7a1oa0nbZpU7Hyh+0x2srVpB/wEseqaoV2cZQcwsGHSqo=
X-Gm-Gg: Acq92OF1VKVTw3nCbNobnYN5Zx3YQW5xZ+QxY4Y0clfffAxh1ElO/e9JZRC0GVL/T7R
	1P1V7JZ322Peyl1SNFSFs7QfHYrvl270Y8hGwvuPWJ+NwFrb+Mhl5O5OJboCNcXpZ1rhCv77QJT
	xo4Ke0ywfWrSqkAnoNWUm+qj1exB/I0W6WuPjGQ4vT7GWXl3NcuKSULBvYIwy1+smcXHnMEasLM
	8OpDJfayechQ73uaCgyiLu1BJVXx5GHwZyqlcyY8BX6azUv3tuj1fKTaLunuSxusmzZ5QNSN1Ag
	tV2PrlVnYBVWYk6VuMOa1WrsRdToWrjUTGzpucRvXLKaSt6l9PXLS0jCkG43v01o/PU//aMMRoR
	n3HH2wKNhCsi4ycxGqEQ0t7+ZokdlTUolWJYaaCznt0b3uiQA/Si54uEtlaifsZ6q6JKfZJrqTv
	SKGO4kkGJgDcF2VN/Y/XLp/HQcU9f3ribpVJdgZb/7HHQ3NQ==
X-Received: by 2002:adf:e30e:0:b0:460:1233:ecf2 with SMTP id ffacd0b85a97d-46030609798mr22478117f8f.30.1780996088589;
        Tue, 09 Jun 2026 02:08:08 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dce6sm53232795f8f.30.2026.06.09.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:08:08 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:08:03 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <aifX80IHM8TLQiV7@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_020810_364988_33FBE938 
X-CRM114-Status: GOOD (  28.59  )
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

On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >>>>> On MDM9607, there is only a single controllable clock for the NAND
> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >>>>> clock ("aon") that is required by the dt-bindings. This is not really
> >>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
> >>>>> clock entry in the dt-bindings.
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>
> >>> What is the problem in giving twice the same clock? If this is what is
> >>> done in the hardware routing, I do not see the reason for more
> >>> complexity in the binding?
> >>>
> >>
> >> I had that in my first draft for this series, but this would be wrong
> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
> >> someone from Qualcomm can confirm), but a similar platform I was looking
> >> into at some point actually had *3* separate clocks for QPIC in the
> >> hardware and none of them were called "aon" ...
> > 
> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> > from GPLLs)
> > gcc_qpic_system_clk (32 KHz)
> > 
> > No clock containing the substring 'aon' in its name on this platform
> 
> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
> The NAND documentation says
> 
> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
> 

Thanks for looking this up.

IMO, if we want to describe the actual hardware routing, we should
describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
MDM9607).

The resulting diff would be basically the same as this patch just
inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
The complexity of the binding would be the same, so is it worth
reworking this patch? At the end, there is just one clock we can toggle
through the firmware here and I doubt anyone uses this SoC without the
RPM firmware.

Thanks,
Stephan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
