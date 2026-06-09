Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61BECD8C85
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 08:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saRqYal4DyHgA7O9lK2ZfbOqtG7BuisM/d/12qb6Jak=; b=lG/VQGRego6ZGg
	hn1eR2cHRVCH7X/sTjCiq3rHPCd/YZOneK8gdjYvsHup4gOW5xjPy0EZ14EQES5f/jQpnlMOM1R92
	UIHuzFrgbRaRGw7ANpgEMDgQ10+oLstaePFDMryVIJdXVTZQlQBTrL6B/y1EV0ggBbXrg4FdMVJit
	HIs4ec/3yWC7KeK3vXWXvLuGn+AngSMX16/0kqR+0+J6UQGTFhikEIOAsJQgNOU0RdbAmFAsBPr8n
	YRLaxgh4H6KBki7EbDVmyLvdzTnX8RiUjApePn1RRvtd9KtHws0rUokEfDA/CLXOZRljXJiC5/h2A
	8vu7XD0O1MLcT/sXOVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrXs-0000000524R-2Lvk;
	Tue, 09 Jun 2026 08:10:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrXq-00000005240-47ao
	for linux-mtd@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JAiuzFCgz48v7S4K+eriQebtflc2Mv697Ui08D+kSJk=; b=Gegf2aew/mcAQ+P80MKwZPNHnp
	efRj2i70FrfUxXefisGEGJ3AAY89XVSsBsQDYaHtyrFstwLzI2tGkLiz97UXgtNY+N/WT8E//vQ1q
	2THw2iWsT8dgMuHvAaT4eBvoNz0fFSQ0ni3F0neMZKMQupDjnSPnK5rIzYIrJuQv9t71MKhh/VFRe
	NErGAztnP7LVIL29rn6k+LMax/yUhl7ZtmHVWhF9Bn+XzSlCJDqbgMNuATKz7uCspgeud0B3XBOnc
	oS6VumTlJxz0LlGrLsaQmzVz88Pun79MYM95mdkpLFmHVt7n6ngQEx9OpBeD9Yi0/+6sZF1L2i5oP
	jg5qar7A==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWrXn-000000029Lm-3KAV
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 08:10:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so7476546a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780992641; x=1781597441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAiuzFCgz48v7S4K+eriQebtflc2Mv697Ui08D+kSJk=;
        b=Hawj6ovGzXY8F4VZb6bROUu3jBWdoUv9oK0o7jdoSxjAVCnRpN+XVH+1+wELhFsRHr
         vOL0Q5grU+OvmccJlsCpWGIEPIflU4nojnxkCM2v32oxdpAyMevdEVWZweaYs3/C+gwg
         /A5Xi9ca4Vr1R9gioElgB9F+voHuw2Q++/Mg53/sk5YqzJluJCRg0yvGPch205iAIaFa
         vD4z9z448YiZ0VsvE+50goegnZs2V8WBqsH4WxhjNUETwF1C6zLwP+LWAcrVdF3coPmf
         dkwDn6n1tcL/PS557FKutTGHfj4U3tdw1saYjBX+VK3DPD5K5Ooz1U3UIad528o7g2fm
         TtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992641; x=1781597441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAiuzFCgz48v7S4K+eriQebtflc2Mv697Ui08D+kSJk=;
        b=eBF+owr+pn3ZPiqXl8KZVDSGg9pEd0B2keTGz6BSKqVa1A8wetTb4CyqEsXCLpfpVk
         4wqWZzdf4aR4+hdZjRkdfnuQ0p89fwLP+aXhQ4TbWy6JtNHcfMx/Esr9lHjLT2A3cmPK
         86BNyvHu3eDFviGBpv2mOVCpzrTiVOpOnU1vg/uPB8spsk0tCcCm5tWtpIvwj1d5GWqw
         USN4ey25sJ5WRAxvSBwXOUmQaSrICHfgduAaUMmC+rlUbf9+E9kTbu5ggwnEQ1mscSd5
         CcsAuDFShV6QnsCKb6J6o3TSbAnSti0RdefpFEeNhRwTva9veVlEh2GUXS/GS7HG1ZDr
         VUqw==
X-Forwarded-Encrypted: i=1; AFNElJ8WrZHEd44fVLkTY/VFlap+GKka8s+1gJ+p2bW0jKxnvWTcSlu6GuzltGPd724PPw/gzsku9kYuVvg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHrItVblXu+36g/AtIfEmVtoM2lbHJ1KFoeQH5DCK10mKfyHnu
	Xl1fwr7gpl5wQfIIbSq3BVj83N/vDepoBe7pL4ozT6RZrGQiE7iViUPed39ajcnVxPM=
X-Gm-Gg: Acq92OEBHhKqWnlwNgT9p4T9ZsWy1w9K81J0VOazb1Ubo7ZK6bPJ4Lc3me1iHtCMcQi
	C1VCSUEJIchvNg/CyxxgBhBZz5BQxp5slJH0A5oyN8WZ0SuOZ2qmfCgVxx3nN0QROPeEdu3apWl
	YbBBRyAPscFCPx7tPEl1igdrH2B1fvo7AxEmvZYzUYxa5pHAOo9Xw3ebDzZ24Uw5cz6jkew7UtF
	Ul8A5P004zuDSjobMpTulfKB7dzMiXx25cVSDe/eqI6Vsu2eIZyBFQm29hg6vMzf/uHn6l3EpKk
	acUD87P41icQnPBJBAOMgq4rFPmVAvWNUXthqHUmvpb81rMndU6CEFUlr52qiwlWxU+GQCoFMP4
	QG96Y1QtxJfLxWHKSnHUFtw7NTs81PgPIO7YWHfa/8kAiIJn+4kj+r0euG0ADxQv9CNvkAJpBTb
	2al79bsaiw7gOxP2dA/OKcMxs/w0K3wV+dyvO+Wb0kp4m8dg==
X-Received: by 2002:a05:6402:4595:b0:67f:99d8:868 with SMTP id 4fb4d7f45d1cf-68fa5147360mr8164600a12.16.1780992641088;
        Tue, 09 Jun 2026 01:10:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm8083640a12.15.2026.06.09.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:10:40 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:10:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <aifKejyF7n6QsI9h@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mrx4b164.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_091044_079416_A8BBEA9F 
X-CRM114-Status: GOOD (  20.82  )
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

On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >> On MDM9607, there is only a single controllable clock for the NAND
> >> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >> clock ("aon") that is required by the dt-bindings. This is not really
> >> useful, so avoid doing that for new platforms by excluding the second "aon"
> >> clock entry in the dt-bindings.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> What is the problem in giving twice the same clock? If this is what is
> done in the hardware routing, I do not see the reason for more
> complexity in the binding?
> 

I had that in my first draft for this series, but this would be wrong
IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
this platform at all. I'm not sure about MDM9607 in particular (maybe
someone from Qualcomm can confirm), but a similar platform I was looking
into at some point actually had *3* separate clocks for QPIC in the
hardware and none of them were called "aon" ...

I think it's better to omit it and describe what we know for sure
instead of describing some dummy hardware resources that do not actually
exist.

Thanks,
Stephan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
