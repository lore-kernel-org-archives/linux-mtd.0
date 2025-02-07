Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F446C02192
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iulSGfu1fh6+jskLTvXoiOHo6c22EV4/BFDTJ7BVCI=; b=dRNYohNQwobeTA
	YzI00+84Sx5n2YjapVdG1jREXgWlTe666ZD+TkvuyCI8cew5eZhQCoSgUDbGmkwwUoSClIaRFJm+V
	bcIMX7p6t9jNcBtySH7mq1xpZuHbIFsk0lkGH5Ox11dGj2irDkcLxOgiPPEMb8fhtv7U0TbgqB8BZ
	peND1Ao/U/Mln/F46mr9gnngchUbhuI2oNYSvZB6bNxiUEXFCAyB4dzgpJ8jcR4LcKGTEULOZ+iRf
	hdj82bornyyaoOoi1vYoQUpkg3R02oAvB4/Di6YgCv0y56ufuUrSIDhA1rn1brzeuc9NR0iNdvhly
	Oul6JsPFJH0iFobdP1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK7H-00000008tGr-3XWM;
	Fri, 07 Feb 2025 08:53:39 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJxc-00000008re1-2dZH
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 08:43:41 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab78bcb4b19so85005766b.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2025 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738917819; x=1739522619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipzi2jibs7foQeLu4B8qNjjz2VAtT5g93gnFmfdZ7qw=;
        b=e7w3THRuHQ2Sr12ogom2kFOeusC/lCOTqT1O4OJlLxBP5vlpegl3gF93adc+J/HKn7
         fkcXpvV2QwdbFMEDDwVrNfytYyqR+SjrY1Y6aC2viq3w/ytMnP85VyzJeYsemTQVq/H8
         ugsBl3RduVQeT7uRN57MqPvbeOVSg801AphbwJK7H57HSYdttzA4Yp389DO+sjADVTG4
         A8Aty1XXR3xY7WY6zDUY+B+Up5PjbFso3tt/sdG3YPEsua774I2RKLBvhvxk4OSRgF6V
         y+tkG06BOqKeuJ09HAE7zpL/FoIesEomz4sb2I6gZpaeS1bgL+JYPjbSNy/hsVqhPzsE
         wGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917819; x=1739522619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipzi2jibs7foQeLu4B8qNjjz2VAtT5g93gnFmfdZ7qw=;
        b=P28y9xj98AB3pTkgaWxuTaO2OWkcsIaGU/aMrweYFcryT0IjQgTvs0L9gXEJiY7D3T
         ZPCT47xAu+xk1FE92TijIuZWDVZcb2Nvctm4xBjkYw9l/6yQLG7cAcLFjhLsIhOMmh6z
         OXdBBw6j2y+xp2oDXP8kpsUKotpm/Php41eroCxm/yYW2YQE47VlW4wkONeNYNubqpL3
         4k5Pgy+pmgvSzjsiyQXw7o9FHRcpW5KL8X783gr/IupXmVo4TBGPLhneMImC9LOuo/cb
         yIC6KbRKNJmxtD7Ia5+GGmjcLH1hiDeibsozF3DsCvKENXrVbVxAhuvevKaHHJYcKRFp
         g3ng==
X-Forwarded-Encrypted: i=1; AJvYcCVk7VjcIfOPPPQ4X1afGNCSnCsWFRc3GMlGvQpT5SjYXr5770tw34HZO8kqodbAjTcx3HojeESd8Ns=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkcw/XP2wh0ABxvL8V35Eauyw6zGsMQsRCcGxeNeQaYADa0g/H
	ZeBBs7SnU86wJHrjHT+KvC/iT30M9j1imC0B0hIaM6ESoIbEIlnTSLgs/P/iPM0=
X-Gm-Gg: ASbGncvkSmSYfaSnQ5pYkr+HzdYkGGUvbAy/tPUu7h2J8aKo71yj6eVhcPTk6UK6+cn
	mFS/fjgwwj4aN7htZ2+jmSiQAmfnY7iQMsCVBi0cGrFapGfLnSSHVwoSlXY6U33p3FXlbjThj8q
	/0BPVGvQoWtaFUOuSCzycdX2QpPiK2xePE3bpZV21kcW8PFty3a1a5f+KllIatNPJUrXt2JFsbe
	WWcaGBHWM5ctQrpRf3m6BdaM3hy2fsX7Y8dO/tFMenYkkbXSuTvf8voefISX/an1BZXK1+dv+nU
	IDxUIHZnWubI0BIGokNWBrDA
X-Google-Smtp-Source: AGHT+IHv3cra1E8iRWLEr2rfyznvTIzUFVPqQMOPw/+8Fybs+K5tsjgq8x8NGSqaDxiiGMRBPVYUGw==
X-Received: by 2002:a17:907:96a9:b0:aa6:873b:ed8a with SMTP id a640c23a62f3a-ab789c739c4mr276480566b.47.1738917818657;
        Fri, 07 Feb 2025 00:43:38 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f842a5sm229093066b.43.2025.02.07.00.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:43:37 -0800 (PST)
Message-ID: <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
Date: Fri, 7 Feb 2025 08:43:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250207081846.362919-3-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_004340_673161_F4CA74D4 
X-CRM114-Status: UNSURE (   6.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Due to incorrect values in the 4-BAIT table for these two flash IDs,
> it is necessary to add these two flash IDs with fixups.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
