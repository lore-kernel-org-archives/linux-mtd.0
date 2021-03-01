Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE4AC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 15:41:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A451464DF5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 15:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A451464DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XxczjisyrG2m51D/yHhAad+t3dm9m5Ktpp0olZv2nzU=; b=zUbKDVF+KsYXMawkaDOgK/p90
	sUMQd3+tIetD+W9O5SqYl+Hxw8V/BnvGfCEvS1ugPihU2Qzt3ZZ5r8FpiVPSIsIJkUjDDgwaByfix
	wfa2Kw6J46RAb+E2n2PbX2POfTim9XYfV2N333/ZU9WgEaPzoXY/P/I8SmsqeOKdu4z8G8TVkEnkG
	t1txCKoV9v8NGlLE7pzXfjGt7Q1Ih4/RBdjmGzZgQvScBbohcq0PEOYbPmI5OzSOf9GtPrW0sjuPm
	i1VHV57ZvhO2soUToKhxCvtmNfKTxEcH6cigCXIYECPoZGI7qa7Z0Wbk6Jw3TMvC+sj5GWI30xYaO
	Ql+K5agCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGken-00051i-KK; Mon, 01 Mar 2021 15:40:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGkek-00051B-M9
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 15:40:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 121FeLQK100981;
 Mon, 1 Mar 2021 09:40:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614613221;
 bh=fiwW8Y8SWke+xfw/2zQNg9/AERTnwKi0rhl2eg4pxVU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=hEY0aBg5IwrN1GbIGLx4IrHH7zSXXFRbklfc2uepWpZNbWqOneR+m6vtW1kOmozkE
 6fAd5QS+75iWD8sIv4rHQWPCxTuRJ2QW5W1YtSbUoiiIMy0DN9So3+ReS6rKMB7jVw
 B4+xm9sCiEBz1hmkIkEUH7cLlG4IUcHfx6fi2I14=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 121FeLsh058114
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Mar 2021 09:40:21 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Mar
 2021 09:40:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Mar 2021 09:40:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 121FeKuX125640;
 Mon, 1 Mar 2021 09:40:20 -0600
Date: Mon, 1 Mar 2021 21:10:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: spi-nor: maxronix MX25L12835F support
Message-ID: <20210301154017.ep7njsjg4convgaf@ti.com>
References: <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99f92851b9ee95d01564ae01c56085eb@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_104022_816013_84765E03 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: vigneshr@ti.com, Tudor.Ambarus@microchip.com, juliensu@mxic.com.tw,
 ycllin@mxic.com.tw, linux-mtd@lists.infradead.org, heiko.thiery@gmail.com,
 zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/03/21 02:50PM, Michael Walle wrote:
> Am 2021-03-01 14:36, schrieb Pratyush Yadav:
> > I think printing the correct flash name is somewhat important. Other
> > than the handful of people who are reading this thread, few would know
> > that SPI NOR calls mx25l12835f as mx25l12805d or vice versa. This can
> > cause a lot of confusion among people trying to debug any issues.
> 
> Unfortunately, this is kind of a mess. If multiple flash devices
> share the same id, it seems to be first come first serve. The kernel
> will print the name which was introduced first.

Install the same default_init() hook on both flashes [0]. In that hook 
check if SFDP is supported or not. Set nor->info to the correct entry 
based on this hook. I admit this is a bit hacky but getting the flash 
name right is worth the trouble IMO.

[0] Currently the flash that comes first in the order will be selected 
but that might change later and doing this will help guard against that.

> 
> This isn't the only flash which is affected. Have a look at
>   drivers/mtd/spi-nor/winbond.c
> There are all kind of flash names, some of them are not even existing
> as this particular string, eg. take w25q64jwm, its actually "Winbond
> W25Q64JW-IM or W25Q64JW-JM".
> 
> So yes, it would be nice to have such a thing, but for now, I will
> take the kernel output as a rough estimation what might really be
> used on the board.
> 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
