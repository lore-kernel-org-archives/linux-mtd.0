Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,URIBL_RHS_DOB autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9816C10F0B
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 04:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73A8217D7
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 04:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBFPWCvz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qi0eOgLT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73A8217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZA/Cnt664DREA4Z7upu05bhapTZlAxhM1sqntE4pe4=; b=QBFPWCvzTk5MHG
	Ts6WdwCwK9pf1zn91IXU3DUJFucfSbN8VR0noQlOA9p/c13ylzV76foBMb7IsU72dJQXaheMsyYK2
	+lDscNgNRkQ37rqLPFd5S9dkQ6ol2/+7EzER6/N3TP8+qZuvlY8ymO80+eQ6Tn00dx1GwyQL3Q9Kz
	VBGPmoOJ893dW+dc5CosrPTr6aV4DL6kD2oVKjeQA5H75DcgzFjzSxNTbXJwG4B5xeFkr6KJuYE8K
	e8Elk/+H5S167SZeX0Y3MfIjU3EdTHIco6ARKnplHGDZxwJtekhhlhYM+5YmDfnJk56/cEZ1Shwo0
	PfGBfIC8hfuxTEVq84Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGypW-00084n-GJ; Thu, 18 Apr 2019 04:39:22 +0000
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGypT-0007zu-HD
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 04:39:20 +0000
Received: by mail-yw1-xc44.google.com with SMTP id c4so321091ywa.11
 for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2019 21:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4JoamRecAWd8cKazq71dy9mVtQ/gxexVKnzXwgT6aM=;
 b=Qi0eOgLT2MKpn506Su0UjcOm5T6g3y5KTRiP95G4Jtu/mJL2G80f655pFaNzp8vivN
 wdyk9B4mfZSCoaQQPEus1fYyjFCeuIgHHPH/A/2iITCmmKs2uFvI6y7Bf4BdSTwAC+9+
 2wRbBdGeJJLHn3iNufrULbAWTSvXgho+QXs0dKyzW1B8Ev0FcHoMBL+Exd+XsthdmmZU
 WSAFU4qAvjvekEx+B3ZCh2MQktK2+U7vlWMyOqdQOVL81FBTwTzN7fiSfT86oRJf1cRW
 e4hWB0/6zvBQQjwzTmOkOlWS1eDGsQcUJgmjEdA3J/Xvvn83XdLs/kTxIfIVctyT2FlZ
 vpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4JoamRecAWd8cKazq71dy9mVtQ/gxexVKnzXwgT6aM=;
 b=SCemoWgL0k1imoFP/QnPQlrJ6PSha/xAq5HkicaHZ6USslwuq4TbBpo840WfHIfOaI
 oXrVEL+9zMjdsb5jLybhN1PpkbNGyNwX5AbliutfD/fGV3fpZDmt23XeR76lLE4XTLw7
 Vt67tRg40umgCcE+N+eEdHMscjU72HkyEIC6yeov6LFiY0J2HxPUVKD9D7HB5M0O6gZD
 hUnu3ydAbL2JnGF7htTs+Bl46EeEoXDNR4261wU8+eK95SDiY8eNuWsoDw/NeSUvj1XI
 wXKIRpDrGoLPXAGBzvmkGUm6Uez6r0M861nZevshu5DQdVV7r94abmvgj0AVSI7M7Qdx
 64eg==
X-Gm-Message-State: APjAAAXOwgUOQJX2hRR5iR6chpFOHi9XM5osywpAWRoGX4ba54ySEKnH
 pmmW7p6e1aQhVaFgxfEZBY9gwmFv7/+2agrVh5QKuA==
X-Google-Smtp-Source: APXvYqwnIbb8ppm4MHQJzZhFyfp830PZHkA9kVRRVyvrR1puj63qv9jK06UNrIGfM0irnK2OSuNqMSRTej6eXirx9og=
X-Received: by 2002:a81:3c55:: with SMTP id j82mr22411ywa.56.1555562356874;
 Wed, 17 Apr 2019 21:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190410195852.4066-1-anders.roxell@linaro.org>
 <20190416235322.3b88df99@xps13>
In-Reply-To: <20190416235322.3b88df99@xps13>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 18 Apr 2019 06:39:06 +0200
Message-ID: <CADYN=9JS9vkw99+LkTVcEQYqwFd1O9_txgRUTYfqK1-9TnKGDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: Kconfig: correct the MTD_NAND_ECC_SW_BCH
 select
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_213919_581842_C115EA91 
X-CRM114-Status: GOOD (  11.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 16 Apr 2019 at 23:53, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Anders,
>
> Anders Roxell <anders.roxell@linaro.org> wrote on Wed, 10 Apr 2019
> 21:58:51 +0200:
>
> > Config fragments should not have the prefix 'CONFIG_'.
> >
> > Rework to remove the prefix 'CONFIG_' from 'CONFIG_MTD_NAND_ECC_SW_BCH'.
> >
> > Fixes: 51ef1d0b2095 ("mtd: nand: Clarify Kconfig entry for software BCH ECC algorithm")
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
>
> Thanks for both patches, do you mind if I squash these with the faulty
> commits which are still in nand/next?

That is fine by me.

Cheers,
Anders

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
