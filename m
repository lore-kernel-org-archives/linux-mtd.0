Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6630BCD6E79
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjKdNOb+bxebLmQGQw/QJ6DAmlGM3CGJqC97Ae/nADE=; b=UAXhB0W+dOcLm5
	E9b7B1BVJjsnv2Cny48M7U7TwMpckv5JoaLcJBARhWjV2EsnlMEv1HUXgn4hLIlKWwoYdsPczW1J5
	+cXCSCQyu78NrRm/m8kpiesi34uKg43ys1Pv9Z11LebS0MrpC/0VoMGAelnndULACID6ukIv/3VLM
	4vhU7Ck+lN75H4IwZoobrQn2gJjgftihTZxg11YYrXY3AnDm26dCQAPrPlGNMdSAFAACdwMhP1Qcs
	rnpW0d5rxd0XyASHe/31y47BQWZK2U61MIt8mcPHHkSphyOYMcObzRJ30lDsggq+fxX4MWZ3i3XZQ
	MOUajcQymmXNnWz+IBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtIB-00000005Hur-0Rql;
	Tue, 09 Jun 2026 10:02:43 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtI6-00000005Htl-3Jh4
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 10:02:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so6806386a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780999357; x=1781604157; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6z/t2eDlRmRAKpgcgdbz/fpbtWYE2knoiu/ZUm5WZLo=;
        b=wuyRSVykT8Kt8IiTDqkKkdPoxebLJCYnitsOvEjGH5L5xCJSdlauA84kgm3of6uQD3
         v5yefLJ9QAuU8Erpj1Jkk925BDBrOaOr6QNcx7jNFvbqSJJfjEbgVoC3M/NR/JiWQwLM
         EvpqFq/7VycBHJngbr4fyCeNbFJjKKawNKtsTBcZw+4/kx84QvDYzfQlQafOFza8Nzrr
         pnDAfePl7yPUWSpPPOAkLZ1uHxXyTa8xmma9qeoOZS6IIkgda5Jbgx5nOgclPQ7UMmXX
         jcMX0+ERA9MqxYg/Stiq7BH9OZz3QZXemTrCSe7yyn/7IK37xA45u4EvVGgwHwARH9nH
         ZZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999357; x=1781604157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6z/t2eDlRmRAKpgcgdbz/fpbtWYE2knoiu/ZUm5WZLo=;
        b=clkhWE/dmVA9JrBhXabFTPsRQOVm47foDoYhKq8GsDKqHQtCBeCRqWn74CzrlA79RZ
         GYd9C3JzhjYvXy4xVLfI5HZxMi7O1fsGDjbRT9LMymHI7lcsnaBoliolq0lc/3V3ZTxl
         DZy/4xjKA1Ax589UirEpnLpjffgV0V5lPad7GLYmmQhS6VCZLpmZ02FOrBli6RN5zx4Z
         U+C1URuTh8277ns2RrF2dYjIjKW9kKvWi8IwnvFeT1wYeZnf+IGtpe8rKOdu1phefVBe
         xYZpBY9SKNuRgAvWNaow1KxSaQbuh5pqAU5XSBBQTboHI4K15R0IMQwROZdhS0tBXyxq
         NCKw==
X-Forwarded-Encrypted: i=1; AFNElJ+SXsYK++7PwMxbKmlisBT47cCzEW5icZN0nug8O11BhFSUmRZBLilbcxiQyPc06VXoU4hvMOM677s=@lists.infradead.org
X-Gm-Message-State: AOJu0YytJePh4tayEbj6FM3RJ9YNsaodBJiQHloMjier9tB9o0HcDdMb
	8l9WZhFU1ovz1C9wfEbYiWO1TxZkM1/Owuftg6MTOK0fRU1lFaw2bAnD7U6VxnfeAuA=
X-Gm-Gg: Acq92OFtGaXYVvh1ujpN86nrxR2NVcbdHt0QkRxuTQ8BLoahhLkbeyLyjvEAeogeMAb
	zlKUNG5TuGm1qN5loRbPQg0eYPVZMj2thTp3qQ0W0X2eUObSPzeigoMCKinafdI3itwucORt2QT
	854Ma8eq63/YZwLZjKF2+KzoJ72x3tmWjMonftkGD2X3CVIuDgUjynJL6OqeRtVCtsxVUQpKzAd
	P2m0WrHuzAmhDJ/3AkyDwZOjwgbJnwGyHkG9UC4Q1sPm0OtR0w/1MScLmOnhTwrZxUYztKFs59m
	tmeoj6jKXMPBJMUjse2eDG5DB3/jXtK9buH4K7Mb/3Ri+JPGXpI0FkwNH2W/XvbIT0m8DVI8nq7
	XqVNzcMLApTrk3CbyNUSMWQzPXNFTmHWubwF/W6JZ/W6UIXhs5t9g7nDZkti9Jl5Lmu4+Kuh6Wk
	KWnd2+QQcI0K+ITb7j8yngGmNrGao1DfTEmtcI811dKR+O9w==
X-Received: by 2002:a05:6402:1914:b0:68f:c62d:b36e with SMTP id 4fb4d7f45d1cf-68fc62db44emr8021823a12.28.1780999356589;
        Tue, 09 Jun 2026 03:02:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8461678a12.27.2026.06.09.03.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:02:36 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:02:30 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Message-ID: <aifktn_s2qmg7MzI@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
 <aifX80IHM8TLQiV7@linaro.org>
 <87o6hk9i29.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o6hk9i29.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_030240_608834_75CC8CCA 
X-CRM114-Status: GOOD (  37.28  )
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

On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> 
> > On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
> >> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> >> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> >> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >> >>>>> On MDM9607, there is only a single controllable clock for the NAND
> >> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >> >>>>> clock ("aon") that is required by the dt-bindings. This is not really
> >> >>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
> >> >>>>> clock entry in the dt-bindings.
> >> >>>>
> >> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> >>>
> >> >>> What is the problem in giving twice the same clock? If this is what is
> >> >>> done in the hardware routing, I do not see the reason for more
> >> >>> complexity in the binding?
> >> >>>
> >> >>
> >> >> I had that in my first draft for this series, but this would be wrong
> >> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> >> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
> >> >> someone from Qualcomm can confirm), but a similar platform I was looking
> >> >> into at some point actually had *3* separate clocks for QPIC in the
> >> >> hardware and none of them were called "aon" ...
> >> > 
> >> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> >> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> >> > from GPLLs)
> >> > gcc_qpic_system_clk (32 KHz)
> >> > 
> >> > No clock containing the substring 'aon' in its name on this platform
> >> 
> >> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
> >> The NAND documentation says
> >> 
> >> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
> >> 
> >
> > Thanks for looking this up.
> >
> > IMO, if we want to describe the actual hardware routing, we should
> > describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
> > MDM9607).
> 
> Sounds more accurate to me.
> 
> > The resulting diff would be basically the same as this patch just
> > inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
> 
> Diff would not be simpler but more accurate. So if we go for a
> modification of the bindings, I would prefer that path.
> 

IMO the result wouldn't be much more accurate from the perspective of
the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
effectively saying "there is a single clock with a single rate that is
sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
3 separate clock domains with separate rates, as shown by Konrad above.

We could try defining dummy clocks like the &nand_clk_dummy in
qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
clock for 'ahb', then enabling that clock without also enabling the
non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.

At the end, the truth for the OS/kernel running on this hardware is that
it can only see the 'core' clock (with the option to change its rate).
All others are invisible, with no way to influence or check the status,
so pretending that we have separate resources for them doesn't really
make things more accurate in my opinion.

But yeah, let's leave the decision up to Krzysztof. I'm happy to change
this patch as needed as long it works at the end. :-)

Thanks,
Stephan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
