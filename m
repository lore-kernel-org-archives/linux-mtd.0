Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF0BC433E7
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 12:24:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5BF20848
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 12:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taFgpdIY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtnwZtoD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA5BF20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=75G20xLZaqipV/meUprx77dTPmrAdBbNg6mtAyu2H6g=; b=taFgpdIYk9tEeDS0IrDaEknh5
	JhnKduFF26GzpfGwHXn9Fkuq4CI/9PQpAvz7mBf83pdHUKVl5DdhwmzOZofgaVU0cbbrHJWSxN9Nn
	1bxUFxZQ92vf19keQ47SmLB680irdQtVCbhoQYszAnH9CgX49ICrnHEppaltFbog2qJBOm0ub5QgY
	uFhTAUHgRL3R6joX2qhK9YHo3LDd1ShiQtoEatETNohf1NvAidtoBl0guQhIikwxox316d+J+BxGA
	12ex33FiRtstPzoCe7axkCeteOI78hfNcUfCcttJTlZwG2PKhKIV3eAkHfjKaBGSVU/FZQrmNxpvX
	9W5bG81Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSfoS-0004C8-2n; Wed, 14 Oct 2020 12:23:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSfoP-0004B9-3g
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2020 12:23:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id h6so3476622lfj.3
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2020 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOUYk0Utarjnefkuu7QIVZe14q1Jyzd3yr96FUuT3SM=;
 b=DtnwZtoDn27uj7p8Y7kMnw3knRV86K3r5weqihEwvDj42j7G9EOCLXvIfgIJtapYNm
 e58cQwC4jUnoTnAc5eCMPbW/yewjHFo6VLDpLFIZpMNFc26YN20iitQ8JgsxzrqjOirS
 r2Ux3ktSNgnohJ8d05RLqfDl0RMMIkyp2S+/ehFdQCr+MRWwlEUbWUC/FSY4hORTH3m2
 hJk3kZMWqW2YGuqXBTLykvBj+tPCuQnH6U79xmrguue6OVCkXgOjMGcey20yUQ5MTYC0
 OATE+xTh6v242z6x9FOT4ECI/dQmcfuyPSE/leomLDEEP3vzTKWymmwU4F/XLZG6JVc4
 nRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOUYk0Utarjnefkuu7QIVZe14q1Jyzd3yr96FUuT3SM=;
 b=RzHTUDlIek/Mk7nYYfwYY++wgb152tpX3k8djafXH7hgM+2uEa3xMPXsMVTXi4NfGy
 K7yj9uIIOdI52ZTNxkhBgHyJ05TeQiLMejyt8o1D8+LlCD1mrrLU8tPR75ZIg+R7IbKM
 74HS/F65kpcDF+ocR4iZrRID9+3ClxaBZYSjSEfG7A15wDhxRORQVH+s4cbL/ldMjyIO
 qT5mfsei8QlEEq+BWdHZn0ifrgReijSJcwXcvKaI4Kq0LjZlQ3BIKVgvJe8yqw0EqA5/
 ZhVsX6Qw4mMIiSTfxFvc8Ox8q3AzLHsn1Z+ChB7smqcTFbbH7zqf6w1UvqJantrTkUgP
 xLrQ==
X-Gm-Message-State: AOAM53257ADo64MFPmafIq1dVId6kkes/oX80zWdMJgBq/3/NiWEgbXl
 unqEeu5UvsRNsD8HB1XUImXH3xsFMFnlQDTTUxAW7lQueqIQOw==
X-Google-Smtp-Source: ABdhPJw01UrB3cMqxiq7TlIB2ZaDmFp7YMdLsjKzTtI6+xe2vw2WMqJObeGDXOBP66lGu5L3LqWFalB207fAiqddCK8=
X-Received: by 2002:a19:4289:: with SMTP id p131mr1240683lfa.244.1602678197664; 
 Wed, 14 Oct 2020 05:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de> <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
 <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
In-Reply-To: <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Oct 2020 09:23:06 -0300
Message-ID: <CAOMZO5Cq6v0OvpLSYwqqpHQFDjviM3mwozHcH35qoOTFvdnJ-w@mail.gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
To: Lucas Stach <l.stach@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_082321_178873_1E574C82 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Lucas,

On Tue, Oct 13, 2020 at 2:14 PM Lucas Stach <l.stach@pengutronix.de> wrote:

> Just a heads up: our lab was broken for some time due to a local issue.
> It's now back to working and the backlog of jobs is being executed on
> the boards right now, so results should show up in the near furture.

Thanks. kernelci results are showing up again.

Hi Miquel,

The ECC issues are still present on imx27-phytec-phycard-s-rdk:
https://storage.kernelci.org/next/master/next-20201013/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

BTW, ECC errors are also reported on a Freescale Layerscape 2088A RDB Board:
https://www.spinics.net/lists/iommu/msg49772.html

Regards,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
