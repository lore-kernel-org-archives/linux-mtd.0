Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32918C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 16:56:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3EFE208DB
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 16:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rnTPE4Nz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H82+wAJg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3EFE208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BhiZP4MB5ALsbnpxKUn24fT/ZT12IwMCXzJ2j/6JQ00=; b=rnTPE4NzpsBLr8vDKzcJ3DGjV
	uJcT3xGsFE/dvWeiu3aPVgpTA9KzSCpN4pdVHkVPT2P8mUMufkYx6LmM5ZB7VKKUGYIbMnWMDKt4h
	9WYa/rbzJitZLxAkGTWq2bqCTPGV8FNCOtzT1rjoN5PxlUMvwybJbJPNsq2989yqtDRVBvXs7nPFG
	8U33tsDASWKnQuWiDqX5EMno1HLpqEqCHzVUOnEB9aPBRmdTh9Zwx7C1e5eKs0BzyAjHhvw4eu40C
	yq3e6saTqODyoQXEfM/Naj9iousegOJWxzyQGrkQ/zu5yBFVBeACBUiVrchPQX02SJm+Jig/Srxrc
	jSzB7qkaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJJfB-0002Iq-Jm; Fri, 18 Sep 2020 16:55:09 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJJdm-0001bB-MD; Fri, 18 Sep 2020 16:53:45 +0000
Received: by mail-ej1-x642.google.com with SMTP id j11so9109471ejk.0;
 Fri, 18 Sep 2020 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t4UNWRw3XtjaYPT1Tohvguum4En79LX5R37iA+oLJ0A=;
 b=H82+wAJgm2/HJXACILHMrIK39S3n8alrwnjBXhCk+vwg9VSlNsBRp4ICEKf2XNxCSe
 ut3AV73svZ9T/d97O8LXGNT30NI9iTsFA99zY70cIRgujDlHMve/IBLq2713Oae6OINK
 WM9z+Qlm9a8/tpfORt9A43LPVER6ejaUv+A/uZbcHZDra0urMSvHjcYNZrVJIMyPKgdR
 SKuS9lP+45ISXCbrI1ngJoBY72aLQu+m2N9kcw1S/NzXFWX5GFpMSmdvG7bnjV849085
 82lR9OCUElD4XF3mG+F5xa6haTQZskautC3hFikdWAzw/uNmYEvofVqvYbt11YVYIeVs
 Uzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t4UNWRw3XtjaYPT1Tohvguum4En79LX5R37iA+oLJ0A=;
 b=g9PDNfAKV+TegKQ+A4YswOtxZaJdBhNwWa8gqTXKCdQj+sQgbrrCrNmatgAz6Kd+LQ
 CVsRv3vbuKBu7ErQubBGZ7eNzKMlinZPcrILVysOibbHQCOjp8oXWsiaaxVL7chpFDdU
 jsYKAfUjiQAbxiNr2nMRkLlgH1Bhd5Jmlkjzd+JR3/ozrtr/0ubwsvCSbxrAldj77Aje
 HJDKMFnbMKnhE+qO+TaFX7/CdivWBkN8e9A0RQ3F8tlGc3JM8jgIjhQwlM2ngfCJR3C8
 p0roullfGzDb2Qo6PG+eHR6WsuBs9xlQWvOp5efeA/A7DyrYcqDN+m99l5SNmRP7zMQ8
 upOA==
X-Gm-Message-State: AOAM5316pYVacWXkmNXIBnLsueoX2C3JSRlg7gb3W4c/WCzz45dYWT0B
 FqTuNTHpNtf7ZK2qNDPu9NPkcp+l/4xiQA==
X-Google-Smtp-Source: ABdhPJw/qQ1CFM15zpGleITT62o8jtVWAf0d3CugqJMzbgDFfTt7Xf33FX+TUfrq/i/jLiahu8ig6g==
X-Received: by 2002:a17:907:2506:: with SMTP id
 y6mr35175644ejl.265.1600448016964; 
 Fri, 18 Sep 2020 09:53:36 -0700 (PDT)
Received: from debian64.daheim (p5b0d776c.dip0.t-ipconnect.de. [91.13.119.108])
 by smtp.gmail.com with ESMTPSA id ce14sm2678057edb.25.2020.09.18.09.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 09:53:36 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kJJdb-002nB9-9i; Fri, 18 Sep 2020 18:53:35 +0200
Subject: Re: [PATCH 2/2] dt: bindings: ath10k: Document qcom,
 ath10k-pre-calibration-data-mtd
To: Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
References: <20200918162928.14335-1-ansuelsmth@gmail.com>
 <20200918162928.14335-2-ansuelsmth@gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
Date: Fri, 18 Sep 2020 18:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918162928.14335-2-ansuelsmth@gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_125342_983276_1F1D44CF 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020-09-18 18:29, Ansuel Smith wrote:
> Document use of qcom,ath10k-pre-calibration-data-mtd bindings used to
> define from where the driver will load the pre-cal data in the defined
> mtd partition.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Q: Doesn't mtd now come with nvmem support from the get go? So
the MAC-Addresses and pre-caldata could be specified as a
nvmem-node in the devicetree? I remember seeing that this was
worked on or was this mtd->nvmem dropped?

Cheers,
Christian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
