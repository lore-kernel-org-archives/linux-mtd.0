Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB099C55189
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 08:49:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E2220656
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 08:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nV5dCHCo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="zqkm1Ka8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E2220656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZtXX9Rk/XJADYrnb7EGYMq3vzS6GHHIDfaJ32jDG9Zw=; b=nV5dCHCoJ/UgEMPZCP4bg1xVB
	i3roXyCAxZCiMRSkN/8UTp/Ing0N98KMsMql8YY4YTEPcLxQUvkBFkY5kOORJO+42Uativte/x+Ch
	/w3pK6Q+RFAj2rVg8CmnOYnr11+pH/9L8C76JmKFUIMSog3VOK4ty1ZlkAzuXetW7c8v4C53ruwDa
	D+7xvHr8FLvwL5hirdBfibzTKexgCgan69k8si7y3IIxMFw3hR59vUG0fvG1rSTCZTvpxhsPcAgOE
	ZQpSraUhfxp9FBQ81FWJuj6I3Fya7ZjjZggdzFlunWQwY/5wvmIwDNcjHHmyojFPBdKMnHE0Hl5JR
	REdktuRPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRB4U-0001vV-Kq; Wed, 22 Apr 2020 08:49:30 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRB4R-0001uy-B4
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 08:49:28 +0000
Received: by mail-lj1-x244.google.com with SMTP id f18so1355389lja.13
 for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2020 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IsCliJz8sm40yMs18A5AKj4SmanuqhSLMoe1DM5Bwog=;
 b=zqkm1Ka8pqDO+VP+VdZ32wiNzQFPtTDEHb7mCh97j4F0BDNcFDdNR9lF9+z3mLUT7w
 Nr9kuarv0Dr3IC0A4xEfQzhqbPULHvWCMKZQbFEkt6hPRFNRECDkz9OEEp/7zwPn1gLz
 bqcnAfCNRi++BfSGLPRbCqPbcazAEIFKhACs69Lb/z4oOL4p2xeOTPujyKbxvzkL8iVy
 IIgJ4RJOZRM9g4vNJEyQTFGC81ZPUdHTLfC27do6Xh/yflDWHboJq/4HO8CXz+o8l4uU
 vCOK5Vfvz+Of+Xc1DlyyH4yUn5tl+qc6Kc/E2t6lf3XGo/nIV3wjxI3Li5YLEybJYqCk
 Z96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IsCliJz8sm40yMs18A5AKj4SmanuqhSLMoe1DM5Bwog=;
 b=H4umt8bNjXqJbRAwIw/O8h5NLRlmO8LRT1ms9AZTfgHgiPu3D+wmNoAXNKMlPf1Vyc
 SfllDAnf1IqfQ86LXxGA956FemZqFcmGOfq1R5lDod8DqYUHAnMVJ8FXYMCnOBY7cjop
 3PfYq1zRLgCr1BAEDJYGqQG/f1ePX5QZ3obxCdE0Lg7KwlEDjR+clzzyxEZZzfcBorTq
 y7woKb5t8WVegQLyQG1oBLCAdKqwrrAr42VEAk6CZLqw9IM3ng0pBu71dfiHZOWz192x
 6+66DrgfFOAQcGvAL1VWmdu5lEqoMIrwBPUZtlNQn66F04SreWRq37+2B8gfoLNX6bXK
 dZeg==
X-Gm-Message-State: AGi0PubiyghWUKNLqQACcyWGfephr+wGW1LyEmMdwcNQ5WgNpA1k/QZ3
 USpQXzuhBLlZCrZ3c9qrqKOzVQ==
X-Google-Smtp-Source: APiQypKqAaIx0DfCVleE/ai4fatXVDVjX0mWVkv5ECbq8bSiFLwcuzlQH+IDugWOSVfX+j1/f1hVYw==
X-Received: by 2002:a2e:a367:: with SMTP id i7mr11283378ljn.289.1587545365511; 
 Wed, 22 Apr 2020 01:49:25 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48a2:4b6b:8910:f781:7484:48a4?
 ([2a00:1fa0:48a2:4b6b:8910:f781:7484:48a4])
 by smtp.gmail.com with ESMTPSA id u2sm4127231lfk.67.2020.04.22.01.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 01:49:24 -0700 (PDT)
Subject: Re: [PATCH 7/8] mtd: rawnand: jedec: Use an intermediate variable to
 decomplefixy conditions
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
 <20200421164637.8086-8-miquel.raynal@bootlin.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <48d1d11f-2271-0ece-e433-0dd2770502c7@cogentembedded.com>
Date: Wed, 22 Apr 2020 11:49:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421164637.8086-8-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_014927_529850_28375B46 
X-CRM114-Status: UNSURE (   6.84  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 21.04.2020 19:46, Miquel Raynal wrote:

> Before reworking a little bit the JEDEC detection code, let's
> decomplefixy an if statement.

    Decomplexify, maybe? :-)

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
