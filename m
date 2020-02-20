Return-Path: <SRS0=Ic5j=4I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D06C11D0C
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 18:31:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83572467A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 18:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZuQDNzTU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="fojdWpH+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83572467A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hvknf9nkGMj2sXEorudx7vwwyLaZHR3aFlPuHj3V/T8=; b=ZuQDNzTUCcYheA1qh8q3bxkOT6
	nbt6Qrj3Pyfzi9xDKM4fDZ/zZOJJ3PNKIEhH/ePK4lNwtP88QyHuLSW60gAKdBXAB465Vd6E2+0d8
	3OP0UKayuUGZ5b9xy9H4guKzAXwOeqG3susRQ0IvDqEnDfMNmY8KOZPNU5/ATMv+0qjE4/2pYzAZu
	DCi5/hHNTfbSxeU4DYLuZVUrHbzKH9Iq4OG4hfxLnnW7tk4ohbXzek3bn+drt9pT5gI96o/WZohfp
	WjJbGN2CEXoHQliD+PxNp9GEFCcTt3LNM1pVEp5UtMKBLCUfkAQuLzx8qfBs+JbVlT1VlX/27aBAc
	JR2Eoh7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4qbL-0001St-D6; Thu, 20 Feb 2020 18:31:07 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4qbF-0001Rn-E3
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2020 18:31:03 +0000
Received: by mail-lf1-x143.google.com with SMTP id b15so3920530lfc.4
 for <linux-mtd@lists.infradead.org>; Thu, 20 Feb 2020 10:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uyn75Rz4NGM5uriz0rX1icdPwMMd9aiwfOHnEDXXvzY=;
 b=fojdWpH+xGLzJRlSiXhqYjgrBG3NSX3xhFm2TuiWgZP40UdRhcAzMad28sTcC0o9he
 gug9pgCoBG/dPAObx5YL1h16SGq5B8MnHGcBlJArrWDL3xsaFpaFTzPgPGPGv/gZ6Qzn
 qqVp56yqXp0sV6GW2ZVF6HHxXAonW1RPMlShgOWIP0eKaXwh41R/egZO388n5h+RQJFv
 6Gnqr/Y1aI1iOS6Z4TmywHIBVOu1FWYhfwlov8jOjGtu3YBeaQrJkt6DP9wE4Z2MrRKA
 vzOZ2PsWcLb2dYGfI7RiHxZMbmWNKPP5kcehssesbh7Kps6bprFalMqhzfuY0801Bkxi
 6x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uyn75Rz4NGM5uriz0rX1icdPwMMd9aiwfOHnEDXXvzY=;
 b=YPXkeTXn0qiEmAT28Vr7uycP09RrexhKbyuFR0qsKktFHcUs+lyi6x/Z5SHqKh+GCp
 xq9rbZ8UB6WkkvtNArkWUIvi2C1M4n/7sjb5g0Sf9R2OJnt+v/HYj5QvTPK8AGWV+hDK
 7zkjlQYkERGRm5o+jRWdQMqTR4DBpkPa/z/f3Vna2cxUUGDXqc/hu4c6Ou3QZieyltBF
 cVcD6iyFZcems4qr6iFFfoX8nULvX0Vh0Ga1GtFasNI8Lx9a+aOtamr8KWhTB8/AlGVl
 ZkIgavnNKFPohDnHgvhim4WtG1f6+bV1soSfkvnxRUCZ86GU8smXH4UO2+ARNVI2jou4
 ojOQ==
X-Gm-Message-State: APjAAAW0iJu85YGBhtMCs6w1KWQKahQiPJqgBBIwZgUDv7tRcqyzHL0j
 hLBQ/IjvsMHNv3GfsRCXfZFkXA==
X-Google-Smtp-Source: APXvYqyL9xkBU2N77QUipxvBm6l9liS6W79d/NV4FB7eIGyktxrXmTQUOfNJ6Y5ig5FTf883uUSzQQ==
X-Received: by 2002:a19:6742:: with SMTP id e2mr17569039lfj.1.1582223457899;
 Thu, 20 Feb 2020 10:30:57 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4461:24e3:a71c:cf5f:1f2b:49f3])
 by smtp.gmail.com with ESMTPSA id h5sm152952lja.16.2020.02.20.10.30.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2020 10:30:57 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Vignesh Raghavendra <vigneshr@ti.com>,
 "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
 <eed17a25-e21c-b493-98e8-e25150216731@de.bosch.com>
 <aef44eb7-78df-8505-ad37-d67fd499532e@ti.com>
Organization: Cogent Embedded
Message-ID: <d6fd2da7-d1c4-0148-258c-826d8a7da469@cogentembedded.com>
Date: Thu, 20 Feb 2020 21:30:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <aef44eb7-78df-8505-ad37-d67fd499532e@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_103101_895836_9FFA4585 
X-CRM114-Status: GOOD (  20.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/18/2020 02:11 PM, Vignesh Raghavendra wrote:

[...]
>>> Looking around, there seems to be more than one SPI controllers, apart
>>> from Renesas, which also support SPI NOR and HyperFlash protocol within
>>> a single IP block. E.g.: Cadence xSPI controller [1]. Therefore, we need
>>> a generic framework to support these kind of controllers.
>>>
>>> One way would be to extend spi_mem_op to support above template along
>>> with a new field to distinguish SPI NOR vs HyperFlash protocol. HyperBus
>>> core can then register a spi_device and use spi-mem ops to talk to
>>> controller driver.
>>> So, I suggest making Renesas RPC-IF backend a full fledged spi-mem
>>> driver (instead of driver/memory) and use extended spi_mem_op to support
>>> HyperFlash.
>>
>>
>> From Renesas Hyperflash user point of view, I wonder if a two step
>> approach would be possible and acceptable, here?
>>
>> Being a user of the Renesas Hyperflash, I want a driver for that. And,
>> of course, I want it "now" ;)
>>
>> So I wonder if it would be a valid option to have a functioning Renesas
>> Hypeflash driver, first. And in a second step abstract that in a more
>> generic way to support additional controllers. While in parallel having
>> a functional driver for the Renesas people, already.
> 
> AFAICS, the backend driver is not merged and is still in RFC phase.

   It was still marked RFC back in December and I haven't received any
feedback since, other than Dirk's request. Where have you been? Well,
I should have CCed linux-mtd back then... :-/

> Therefore I don't see any benefit of two step approach here. Besides
> you'll have to throw away this new driver (hyperbus/rpc-if.c) entirely
> later on.

   Why did you create this directory for, anyway? :-/

> How difficult is it to rewrite backend to be spi-mem driver? There is
> already has a spi_mem_ops frontend implementation, so I don't see much
> of an issue.

   Really? This may be not much of an issue with coding this but it's
certainly time consuming (I'm sure there's s/th to think about yet in
this case)? My management (and also me, so far) believes I'm in the
final stage with these drivers... what should I say to my boss now?

> Extending hyperbus core to use spi-mem should also straight forward
> Would involve moving this patch into core file.

   Seriously, only "moving"?

>> Is the support for [1] a more or less theoretical one, at the moment? Or
>> are there users of that which need support "now", too?
> 
> Its not theoretical, I do see patches for xSPI controller here:
> https://patchwork.kernel.org/cover/11354193/

   Which (surprise!) only adds support for the SPI part...

> So, its best to sort this out now so as to avoid possible backward
> compatibility issues (especially with DT bindings)

   What DT issues do you mean exactly? I think that other than changing
the "home" dir for the bindings, there'd little to change. The "front ends"
don't deal with the DT probing...

> Regards
> Vignesh

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
