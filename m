Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F752C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 11:36:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6EC6206B5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 11:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wmHCC9VM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CSvnqGSK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6EC6206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aIuJGDx08LEbVPY24mxW9z7J8ulXDAwqj1L+URGUPvw=; b=wmHCC9VMMLb/HpFTcChki1sWH
	wx7RPRXS0/PUnjTGzmbQutHd/C7a92C4cZFofyMB8br1Vgq9HEN33wn5XNI9knHa03XzkULFNZXjV
	404kmr+UEvy0RfkX+JHDXg4EHLWcGVIdaCm9h0rvGvKeKh1uKjJ4bh7M1sQX/IsKtD9eOou1q9xpY
	JDpKOKvHzMhXME/JBWtHHiphYhbPgCn69g13TFrc8tPIBEf2Y3VvuY97E46/diw5a6hVigWOLTJI8
	OmIhUzEGVr1hv0xORemdI8NMM+VwxAwRvSrbjNAxJF6HSwjuN8Nz4oPk/b4i5d7VQsSVrw8k9wXpy
	8qiXdbE9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZuan-0001lf-Kl; Tue, 03 Nov 2020 11:35:13 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZuak-0001kB-TZ
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 11:35:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3BZ4a9061252;
 Tue, 3 Nov 2020 05:35:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604403304;
 bh=i5qmm6XtD0qOEO+O0ff0XQHneo6s1jIS3e5zUTXHF24=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CSvnqGSKoA1NACbmhJse9FBkl3F1Y7uDVJLiuesvGE24K33uGlRicBzE3ns8OEI1Y
 /gL3QG8ggOMd6LINvr4Ck7F+UKKpF7k1pIzGsF0y4xthVaOXeUXoc0KmYtwKI26RlJ
 WJirwK0fmduoEvuzfs4soLngvRB7eWbnkhjZTlDo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3BZ4IF049563
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 05:35:04 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 05:35:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 05:35:04 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3BZ1m3084217;
 Tue, 3 Nov 2020 05:35:02 -0600
Subject: Re: [PATCH 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
To: Richard Weinberger <richard.weinberger@gmail.com>, Pratyush Yadav
 <p.yadav@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201027111804.e27pyvf62eksngmp@ti.com>
 <CAFLxGvxc=EqBStzLz3ApwYDomKMe=WeK22ohfPQs1WrMCsaVQg@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <fa578bda-132a-320a-264c-d973bae194dd@ti.com>
Date: Tue, 3 Nov 2020 17:05:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxc=EqBStzLz3ApwYDomKMe=WeK22ohfPQs1WrMCsaVQg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_063511_161672_8729A94A 
X-CRM114-Status: GOOD (  18.50  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/1/20 3:14 AM, Richard Weinberger wrote:
> On Tue, Oct 27, 2020 at 12:24 PM Pratyush Yadav <p.yadav@ti.com> wrote:
>>> [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/
>>
>> Ping. Any comments on the series?
> 
> From the UBIFS point of view I'd like to avoid as many device specific
> settings as possible.
> We check already for NOR flash, checking for NOR *and* SPI_NOR_NO_MULTI_PASS_PP
> feels a bit clumsy.
> 
> Tudor, what do you think about SPI_NOR_NO_MULTI_PASS_PP?
> This kind of NOR seems to be a little NAND'ish. Maybe we can hide this detail
> in the mtd framework?
> 

Agree with Richard. I don't see need for SPI_NOR_NO_MULTI_PASS_PP. From
MTD point of view setting mtd->writesize to be equal to pagesize should
be enough. Its upto clients of MTD devices to ensure there is no multi
pass programming within a "writesize" block.

If this is not clear in the current documentation of struct mtd, then
that can be updated.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
