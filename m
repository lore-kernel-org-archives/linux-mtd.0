Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DAAC3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DxUUsVA3G9YS7+IKFTGGMeAyeURRPKyCZUrCoxjje0=; b=tywagE/ZCAoDx7
	e3BXY602ZNdrisb/uHsvP0qifCH9wxCchfrAYXAVBJiE/hFNHFlvLdxHwM3GkYXmmI9T7El9CUyjv
	VrsD3G2EPIAicYWwhHHs5aKqfOuPN4y3W1TVaBYsZqwSPhY9wToX2eGrhdjlLllaqLgKXm7KhenlY
	HneUmbNEKkK8M4v1mN7gXFRPEVGVSj7aVZFkCXoZ14jGdVz62WHhU55ytpT9/QHl56K8rB/vHI61X
	LLCdNY/lz6SpJB4CquSuPKU69jRMzKfW9U8s8Fmmd4JpymeV1jjb73VPR6ZBFOVPH6jirlKvmeiIH
	cQKsXPcOYGQacVhpch9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRcs-0000000HVXl-1buH;
	Mon, 12 Aug 2024 09:46:06 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRcp-0000000HVWu-1jOe
	for linux-mtd@lists.infradead.org;
	Mon, 12 Aug 2024 09:46:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5ba43b433beso4264215a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2024 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723455961; x=1724060761; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JttXyWvNBrLovswX1EnPaJPxm1PSVZ+ohR3t2TiKVsQ=;
        b=pZF1JRbd7dkxw5M+kcoMbS1QlO/zFO3vEWEaDTNNCWFms7I6Fvs4j55yhGzBkSogrP
         MEAoUIHVHBvqkIFC+UemHTt7iwhwiba40bUToZQVwHXUR4NoNfPx33DCWOFrwfydaJps
         0/UJmmkOCkHr/fJl7sHS3uSKLtK7GQficYgfljJZrWJxPvbLa8gArctOVTS6+fQgwaOk
         JvtoQ4zN10tVuy4vB+cQzIaCEmvOX+hjy/MibGQi/2yyLPPmV6JeRjCMdc502KTSuNO9
         PTbWbLE1IZSHAxwTe1jDChLBz66Qrw1ybgkPwHDOQH8BjF+kPVKWp9JzJnxuqpLUD+DB
         ocLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723455961; x=1724060761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JttXyWvNBrLovswX1EnPaJPxm1PSVZ+ohR3t2TiKVsQ=;
        b=MeGrCjA5jwWcADH0krdPq+kpXrMXy07s1bohePFfBt6L3XJxsx7FsF8CFnBXjSosw0
         hZjCOgo0JovefD3X6/zRYZbSZmyBQT2pkD+Z98h39uen+MjZCIk0D/42jw7JZed4tTHi
         tYpJuS5f/L1xJc63n4ILw9BTlOi4oBcelzm0sTv7UKPaqha2DocbJGBXCxobpXe7SvA3
         PwhkKVdfsIcv0+qaXU6Sna852unN/deLtwrEMYuUmxMNtekkKzxsGUePpyOoiGmmYS+Y
         Cx8oRXsk5oVVrmGLFZ0tpGk4x4u21R6vJcbmGOcrX+Wv4htpubv3uS8CtFN1TSTT5q8n
         3TkA==
X-Forwarded-Encrypted: i=1; AJvYcCVArPRefzFm2dWNexg0QZcs4DbrGcT1DkgC+Gr5Uj+teKIgIb8x7xE+3GrMxV/YMvsoZwQD+LrNhOw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcIlD1qMcVLM3idShMcNbHJYJPsgZ+atliGCHbZrn8XwgsuOAX
	ZLqUhgLwtEdcAsSLfKhgC3uls9mb7fhCiGKe3eH8ZEeNNsYEYbsawwC3jyOf3bI=
X-Google-Smtp-Source: AGHT+IGaHEWZkOKxfoZJQYtrgry1CYeTIzGR/wr2t1cep4NpltsL9e4x6ljRA9qjxohlOrRIpWZzRw==
X-Received: by 2002:a05:6402:2346:b0:5a1:40d9:6a46 with SMTP id 4fb4d7f45d1cf-5bd0a6b4bf9mr6210531a12.36.1723455961053;
        Mon, 12 Aug 2024 02:46:01 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a5e04e1sm1967189a12.77.2024.08.12.02.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:46:00 -0700 (PDT)
Message-ID: <b96f483e-314e-4e47-af58-ddb078dd6df3@linaro.org>
Date: Mon, 12 Aug 2024 10:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
 <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
 <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
 <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
 <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
 <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
 <20240812103812.72763f69@xps-13>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240812103812.72763f69@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_024603_502408_101A2156 
X-CRM114-Status: UNSURE (   8.89  )
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

Hiya,

Amit, the thread becomes unreadable, better start a new one describing
what you plan to do.

On 8/12/24 9:38 AM, Miquel Raynal wrote:
> For now I don't think you need a totally generic implementation. As
> long as there is only one controller supporting these modes, I'd say
> this is not super relevant.


Miquel,

Microchip supports a twin quad mode too, and micron has some flashes
with similar architecture, see:

https://lore.kernel.org/linux-mtd/20231125092137.2948-1-amit.kumar-mahapatra@amd.com/T/#mbe999dde1d29371183aa53089ef6f0087d6902a7

We shall consider them from the beginning. I guess we need to read
everything all over again.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
