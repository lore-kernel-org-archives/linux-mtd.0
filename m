Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BC1C4708D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jan 2023 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6GUe/wgWBVIX0mcRQSKosNHj42IxuAMOQNxPaoiE6M=; b=aTVyZ2ei0g3Iry
	7nKhh2XSWvclUa57MAt3x6hRjDMWUbFctSGYsYQpYS3qecVPIDtTQ/tzyS/IdyEOhmL6RSPPrLXDq
	D9YC3oXFb4O3wUNFWuQ9iuuVE7QpQYh8bM1g7NYIxRghg3/f6h45SIDCB5WW+xtn+3rbgCMpXtipz
	mQ8L6CHc/XGlEPxRT14TJ+ACM8tYsXprgeCpCoWvUXiG86+yLC0b6tykrO21ecqOHIBtSIwW8DQfb
	Nvw+LgOMFrOjS/TYM6ej2ebJp4oVzRj5S7J9GMkIHp1bQ0FsR9/fefI/bo/x+uIA8ZbMR//ia4+XE
	ElCVEmAoTA4IkK1uycAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDp8r-009dIB-Af; Fri, 06 Jan 2023 16:00:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDp8m-009czc-9h; Fri, 06 Jan 2023 16:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673020820; x=1704556820;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Gr0ThjkBH4hqu7cX0DnaFFxx29/OpLOv7ZxaLh7iykA=;
  b=zDTVn/SqN7Bn8xYqZlLL8ioWDMskAWkUk2OpMCfLHyCwzA24znZXXFfL
   pMsHnkCWJairBAidCPyaKdVvmLAlAQehnoLPK0iqsBV2b6FwpV96xMfdN
   7ht2j7opBAW/nFNuLjn5lGicU6nRxPXYvmu3mJRMLFcfxE9yPEKHJZheA
   YvXNH25UYRVjLVQAGW6gF05zljdsqPXpPNBTk8ciQ+XATcADAkYBH92XW
   UxEH9ebv4M5vcOaqbeTDIl0SH31Ep5b6zlYFlGSrN5Iqc0L/WaobzvZ0M
   5FWPRl4vLOqhbmZo6pYVup/+bzRJwE7zzOiA6PqiINawNifOpHMyfCYfS
   A==;
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="194620230"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jan 2023 09:00:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 08:59:57 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 6 Jan 2023 08:59:54 -0700
Message-ID: <f653b23f-cf25-61ec-60d4-91dd7823edd2@microchip.com>
Date: Fri, 6 Jan 2023 16:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] MAINTAINERS: Update email of Tudor Ambarus
To: Miquel Raynal <miquel.raynal@bootlin.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>
CC: <arnd@arndb.de>, <richard@nod.at>, <krzysztof.kozlowski+dt@linaro.org>,
	<herbert@gondor.apana.org.au>, <robh+dt@kernel.org>,
	<akpm@linux-foundation.org>, <claudiu.beznea@microchip.com>,
	<broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <pratyush@kernel.org>, <michael@walle.cc>,
	Tudor Ambarus <tudor.ambarus@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221226144043.367706-1-tudor.ambarus@linaro.org>
 <feb09bac-0ea4-9154-362b-6d81cba352a8@linaro.org>
 <678ad800-7a3b-e2bf-6428-f06d696d8edb@linaro.org>
 <20230106165506.0a34fa78@xps-13>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230106165506.0a34fa78@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_080020_520336_E09436E6 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 06/01/2023 at 16:55, Miquel Raynal wrote:
> Hey Tudor, hello all,
> 
> tudor.ambarus@linaro.org wrote on Fri, 6 Jan 2023 17:45:20 +0200:
> 
>> Miquel,
>>
>> Since we don't have an answer from Arnd, would you please queue this to
>> mtd/fixes?
> 
> Are MAINTAINERS changes accepted through fixes PR? I see a number of
> experienced people in Cc:, I would like to hear from you folks, because
> I never had to do that before. If yes, then I'll do it right away,
> otherwise I'll apply to mtd/next. I'm all ears :)

I remember a conversation that stated that MAINTAINERS changes must land 
in Linus' tree the quickest, because it'll just avoid confusion and 
bouncing emails.

My $0.2...

Regards,
   Nicolas

-- 
Nicolas Ferre


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
