Return-Path: <SRS0=yeSB=3X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA9FC33CAC
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 11:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4641020658
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 11:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nT6+sIfm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="hNS5xjPv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4641020658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x91TEVDdNW1Pm9Jhze7/OdRGyO+OXdRi905MA51SDjQ=; b=nT6+sIfmhatHN5
	XaA2DTOamSa6ITZdgRxcBCA7lJavIyv9hCAB/mOwEyDzLWcHBPITBs4L/AQVcQG1wPLAwyqXkhW/9
	TYdvoiFXtwFIWLB6NfvrvjFMsOC11LY8GIz0On9acxORRICKNxoaBulh1tOAI3jVa8RGorulXMoSh
	l/XrWWd+b1Y3+QeDOxkqNuIrfNMk0pXGgk+geR4Ter0HD3/jE/bhRVrZ2bk0zAijExhshWET0Wdmz
	IkfKkT1uVO9LMBkaqAfE2d/RVeT0GBUorAr95NWHxdtW1Ibik7PfASETQ0PpbXPWHLeNSF+ZGudwN
	yGmAJtQuwrCaEfbshCww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyaC0-0001Ic-6u; Mon, 03 Feb 2020 11:47:04 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyaBx-0001Ho-5g
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2020 11:47:02 +0000
Received: by mail-lf1-x142.google.com with SMTP id v201so9446227lfa.11
 for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2020 03:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8IOMM1WdvWaHMK/psd1d+q3Nl7tg0GF0by4l/CtxxZg=;
 b=hNS5xjPv7Sf+vCaK9ZbEVKjCZvkkWG6ymaqw0vns9PHeYtiDSZJl6NP7x9vp6yCB47
 v5kMjq0bw9aqhykkDrNapaz7pxCw8VhkGCe9tT6tC5DGwhTWYjL3uJDOXqLCZad8BSEC
 6iOEhmttzcb9I5E3gQt1q4rTaZknzMsXicyPJm2/HLMA71hWBH3sd10YXaTJPmq73X60
 8oSev8maqiT7RXKn4INbqGEsb/T8BLXWIyfOY0Y5Nrytg//BXidqR0egqXQQxTkB9+qH
 7PI5nVilMgbkNelsAtWBwt6XQsjsZt/+vuXCYCUzbuG5J1dHlf7eQEK0iaf1JigxppvB
 BkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8IOMM1WdvWaHMK/psd1d+q3Nl7tg0GF0by4l/CtxxZg=;
 b=RDxvycrCbg6zAKWmpToZIYu/1AjnELstimuMEm5g3cZDdrH9a7nP7U0S7+mrOiLM/J
 Mol0rLX+V+FjeHirK5xlL9rHH6t5oTrkFZ4RuwRZMx2KhnlgX1/h2UaKF6dPK8c3y5Om
 JQsHqlqTvfQRD+UFSUMIbKDO8uVPs6oHvjj/R1EMDmiuqGjg4vDEeWi6mHXZ7ZHWZmR5
 EjvNCHoU/8cCKshXWFhmiTGRopUesgMbjccO6EKhZXd45TA0Dra+FAsTS95hdlqMrFKW
 ZHfxJT1Ft0TFEE8cebg72niJql8/5fUSrgkRI1aeZpWfOQf4bXOOme0AgZGsajw1bmAH
 PZJQ==
X-Gm-Message-State: APjAAAXGzsVLRa3NDjfBoMD8BDW48Ev07udOAlqKFlnvuyW4ZS4Dg1SJ
 d2ppE3T7HbHkT1uHA9snFiy1Hw==
X-Google-Smtp-Source: APXvYqx2mkPycG0E7sH9zNhU0K1QM1lSt7BMn4gCTksMwgtnLguHRQVw8T7j49dkaio4xJlNYG1Yxw==
X-Received: by 2002:a19:5007:: with SMTP id e7mr11858832lfb.153.1580730416817; 
 Mon, 03 Feb 2020 03:46:56 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:42e2:1775:c969:dcb5:7c51:f912])
 by smtp.gmail.com with ESMTPSA id a9sm9021172lfk.23.2020.02.03.03.46.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Feb 2020 03:46:55 -0800 (PST)
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <26e74968-9bc6-9b83-e824-c972f159ff2c@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <76cd535a-c8cc-e4ef-f43a-07c6901ca329@cogentembedded.com>
Date: Mon, 3 Feb 2020 14:46:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <26e74968-9bc6-9b83-e824-c972f159ff2c@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_034701_625286_A3237E50 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/03/2020 07:59 AM, Vignesh Raghavendra wrote:
> Hi Sergei,
> 
> On 30/01/20 2:09 am, Sergei Shtylyov wrote:
>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>> driver using the "back end" APIs in the main driver to talk to the real
>> hardware.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
> 
> Is the backend merged? Or are the patches still in RFC stage?

   No, it's still the same RFC patch, and I'm not sure who'd merge it --
drivers/memory/ is unmaintained. Perhaps the best way would be to merge it
along with the SPI front end?

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
