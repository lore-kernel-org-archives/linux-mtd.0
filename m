Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC89BC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 12:08:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CAF2078D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 12:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Xrjw69B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CAF2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siemens.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hetiVEikUMkKjP2W/kh1w39UG+exJh9Uz43grzEfgnw=; b=2Xrjw69B+0I6ssYjiYUCUQCW1
	gdRC7jYoGUTNpl8NKeDlmbKh4FruxsrTt6jnatgKR/1TL9L1E3A+ft9Fw1978ed9SuBpx712k8BwB
	gCTj1hFAk7apo8kXKhAN+5w5UH/C/MKBJxBBEDDONuZZOb0Wdw9jKKjHO/PvcClojvZbfdnBhRLOC
	+8vOCa8KnR9e63AQD1cGvuH9g5jVkBMRr72ZexYAvjdyYlWBR+C0I+hkRNGTfA1qbHfeEKVQpS0Bt
	+HlRmiutMQl8Qqoz6qSBxgm4l3T7qzcxpbgTJAB8Xf0rahAriqjm4+lMs0O/G5Q5OwyKIpL7zwsg6
	fFZGx01vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kABFg-0006tj-DG; Mon, 24 Aug 2020 12:07:04 +0000
Received: from gecko.sbs.de ([194.138.37.40])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kABFd-0006sT-9L
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 12:07:02 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07OC6lco007007
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 14:06:47 +0200
Received: from [167.87.131.75] ([167.87.131.75])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07OC6g9s024384;
 Mon, 24 Aug 2020 14:06:43 +0200
Subject: Re: [RESEND PATCH v3 7/8] mtd: spi-nor: Convert cadence-quadspi to
 use spi-mem framework
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-8-vigneshr@ti.com>
 <a86aebbc-943d-6cb3-191c-797709692f80@siemens.com>
 <00394d38-20d9-60a5-0068-5f9f023520c2@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <26caa2e5-6c6e-09a3-902e-843cfee40158@siemens.com>
Date: Mon, 24 Aug 2020 14:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <00394d38-20d9-60a5-0068-5f9f023520c2@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_080701_612809_B6561C57 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: marex@denx.de, Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24.08.20 13:44, Vignesh Raghavendra wrote:
> Hi Jan,
> 
> On 8/24/20 11:25 AM, Jan Kiszka wrote:
> [...]
> 
>>> +MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
>>>
>> On the AM65x, this changes mtd->name (thus mtd-id for
>> parser/cmdlinepart) from 47040000.spi.0 to spi7.0. The besides having to
>> deal with both names now, "spi7" sounds like it could easily change
>> again if someone plugs or unplugs some other SPI device. Is this intended?
>>
> 
> You could use DT aliases to make sure OSPI0 is always at given bus num
> (say spi7):
> 
>         aliases {
>                 spi7 = &ospi0;
>         };

Ah, looks like this is a common pattern... Thanks, will try that.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
