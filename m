Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095E6C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 13:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C68206B5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 13:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igCiIcbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C68206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siemens.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3BeVCt4OJ2hEOoBjVPn99UHdIVMlItxDc+PPFwweaLo=; b=igCiIcbt9PcRaaz6C/bNgRnVO
	mQ49GOjDablWmk2NpwFrfaXwW/hHhNE7JKw/MujSFqB+a1VcQrhc7eznMeuoVRe7sZUccanrsdeYv
	EpWDFLAJOLz7L+prYCs7iilIA8xim0f0YGOWZPf39qUtf/ZykROqmG8Ks0KWaqSSVMLffSD/v6THt
	9ZUcVMWHmq15vCUrxBsFU6I6GJyJeYIMhdCzGaVst+gBpGs5tiqOhVAdCBLJIqNpxDd/GJdFCb99T
	pflW8JbIggtroMxYtV6tDoKNF8AFR6VE5lBQ0C8jh6jv3PATO4liSbUbv4X52FW/Fzbmpoa/5cTk2
	JIBjgvfPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kACuE-0006DM-Pt; Mon, 24 Aug 2020 13:53:02 +0000
Received: from lizzard.sbs.de ([194.138.37.39])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kACuC-0006Cp-Nv
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 13:53:02 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07ODqlC5020592
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 15:52:47 +0200
Received: from [167.87.131.75] ([167.87.131.75])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07ODqgJ2007613;
 Mon, 24 Aug 2020 15:52:44 +0200
Subject: Re: [RESEND PATCH v3 7/8] mtd: spi-nor: Convert cadence-quadspi to
 use spi-mem framework
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-8-vigneshr@ti.com>
 <a86aebbc-943d-6cb3-191c-797709692f80@siemens.com>
 <00394d38-20d9-60a5-0068-5f9f023520c2@ti.com>
 <20200824140438.14e72ca6@collabora.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b24b667b-a71d-d937-bd13-fdb37a1a30d0@siemens.com>
Date: Mon, 24 Aug 2020 15:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824140438.14e72ca6@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_095301_034556_3DB3FDFA 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: marex@denx.de, simon.k.r.goldschmidt@gmail.com,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24.08.20 14:04, Boris Brezillon wrote:
> On Mon, 24 Aug 2020 17:14:56 +0530
> Vignesh Raghavendra <vigneshr@ti.com> wrote:
> 
>> Hi Jan,
>>
>> On 8/24/20 11:25 AM, Jan Kiszka wrote:
>> [...]
>>
>>>> +MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
>>>>  
>>> On the AM65x, this changes mtd->name (thus mtd-id for
>>> parser/cmdlinepart) from 47040000.spi.0 to spi7.0. The besides having to
>>> deal with both names now, "spi7" sounds like it could easily change
>>> again if someone plugs or unplugs some other SPI device. Is this intended?
>>>   
>>
>> You could use DT aliases to make sure OSPI0 is always at given bus num
>> (say spi7):
>>
>>         aliases {
>>                 spi7 = &ospi0;
>>         };
> 
> FWIW, we've added the ->get_name() method [1][2] to avoid such
> regressions.
> 
> [1]https://elixir.bootlin.com/linux/latest/source/include/linux/spi/spi-mem.h#L218
> [2]https://elixir.bootlin.com/linux/latest/source/drivers/spi/spi-fsl-qspi.c#L810
> 

OK, that reads like I was not the first to run into this.

Vignesh, please use it so that I can drop the local workaround.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
