Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0010EC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 16:32:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729772076D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 16:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SsTRM9Rf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2KaFbHc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729772076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aKD4sSHYLVEO+S6mFi/Ox7/LhSPqQhqlvA9qLpCWeek=; b=SsTRM9Rfth345H4Yu5bvAYN4k
	02sidfR+a6YkJMAhKaZGtBT5b4nE7MG1Lf8rdScWJVzYwYuQBWRHPlHThUMhYSgqMo7INzdeUrqvB
	qtoH7u6567S8v9IVDDGwT8iAMWpRcr/Kq4PfCf1ZLyA9AL/k8KiKKm7f8/BUrF+lEZP4tfcYpVbxY
	CxD0N12vPySuF6W9EJ7HloR+KBxWuh+24Za5f+Y/pyu9x39OoaJgDlIG/mXyeGCFGnwv6fBY+8XG6
	aCjT/43lw7i8Lc2xWDfLSl1QYvzaG9OkBoqaWakCPtp/DMIQbwfCFKLfHLxBLbCIQXLLk6Cxvb3yC
	lK2gQg5eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNIX9-0002Yx-Ef; Tue, 29 Sep 2020 16:31:19 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNIX6-0002Y9-9T
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 16:31:17 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 77so6295747lfj.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LByz5iyAl+WEN08k7tJ412n701p+/y7ax6b+O0WjtXg=;
 b=U2KaFbHcBfV1zOUIOr0dKLOYFZYprEjpG6wJ2g6ymDX3af81ZDTLbm15l4c2VAEJe9
 WG2K7S78P2pug6AlYPuK9z7AfaGm8fdIx10WAfuh376jBnYvSsu37Hjc1jIPO7rTcmVD
 2mLcFpDrYpSC/a8JGaq/mFJXKPuNiT1hOfKVxNo4ABr7xFSvn2kGgz1Jcj1Vbwq0Wxdg
 XdJJYf9gqDaQInG8Y9sWzW+IiPXin7HFmV46x5GVkbNN8Uv6xENoNuRJGgjjpF+uF10z
 qQ50TQGYoEzjapevHODQAJpymHp3rCTk9SF11lvYmpVM2Jm9vcYzxC1TtRz3p1KVHRlm
 tEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LByz5iyAl+WEN08k7tJ412n701p+/y7ax6b+O0WjtXg=;
 b=hbhwG96hrV46OcY5CKyDzBLMEMiSUHhytjb8YxYgrp4DScUycC4Lp25rkO91aIn7LW
 rotgoRXCz50s5GgYUKk3O1Ynub/9H63apEzv5hqR0qLJ/QUbie0qFVfTbwgZjFcsXTn1
 RB1vJYTfleLnrVHzswQmOs4qrbIDvzsLgxNYrEHrZ5ZJPDDzI3czQcigeV6dYobCZ5wB
 BNT5k/Bcc/r+urTbZKfklrIXTJXmnQrXrBVeZ19MOZvqfE2d+flcu8cE06sKOXf4Ybzu
 dBASMxJrInsOzPBzc5fPFk7UEXWkTFWjhbi4Hd+1RfOJGN1nl7LKBuCjY6n9CNv3EIqq
 yItA==
X-Gm-Message-State: AOAM531rSgOR+pcBZ1QjftGwHLYosXD6zTCZld2FNwnsFLst0mYn4WS5
 3LyDmnJSN57kUmDXZ+KkRPEOrar2hl3VdVq01Q7ySW9E6C3sNw==
X-Google-Smtp-Source: ABdhPJzJhlmycQjDO2UxhKCZ7+wLhjwHraitE9Gg8dY/ctyiKBpCu8smKB0aamRAManxWpoPCw4rV9hVMlvem9u2PEo=
X-Received: by 2002:a19:8a0a:: with SMTP id m10mr1432447lfd.244.1601397074746; 
 Tue, 29 Sep 2020 09:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de> <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
In-Reply-To: <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Sep 2020 13:31:03 -0300
Message-ID: <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_123116_359342_5BB8BC16 
X-CRM114-Status: GOOD (  12.81  )
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
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tue, Sep 29, 2020 at 8:39 AM Fabio Estevam <festevam@gmail.com> wrote:

> linux-next from 20200928 still reports the same error:
>
> https://storage.kernelci.org/next/master/next-20200928/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html
>
> I checked that the fix pointed out by Sascha is not present in this tree though.
>
> I do see it fixed in linux-next from today (20200929), but the report
> from 20200929 is not yet available.
>
> I will let you know after kernelci publishes the boot results from today's next.

linux-next 20200929 has an even worse log with a new division by zero:

https://storage.kernelci.org/next/master/next-20200929/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
