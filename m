Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189FBC48297
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Feb 2024 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHWo0eTQKgA7nH/FHsh4mtR3wWjIf5ZAkIpkT/oxyhg=; b=IOQtmbtO2DfKs2
	49+A7cu734ZrmMjqHc8Z/kX297d+fLH54rlHO7SMNaUVLc76vrWLgWLNOxX0MxrPt0TbLqLeGx6kJ
	/OWma7x/ERKAzqGcecVc1zRHEw8kYDvvDo5Ew6w2NSIUfK54lBjkdrIlgNKj0eHQmq2K6mtRzhezg
	7uLmu2lq8cvLB0YP1MwjLrgq5HEgy/0jUzvW6zD4SKgQHi6eFcL5lNYrZea15fYqzB00OXE17erpX
	CZVVcrIxVtbCbZt91Bb5c9uXsFVB1MzV5ibOlw36Rzy0lffRBDYKSySg+/ztoGSRANtlMF3i6CzDe
	VroxDk1uYfEFcRFe2IIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYTVo-0000000HV1M-2Ho7;
	Fri, 09 Feb 2024 16:14:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYTVm-0000000HV07-08dC
	for linux-mtd@lists.infradead.org;
	Fri, 09 Feb 2024 16:13:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4102f273c46so10394705e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 09 Feb 2024 08:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707495235; x=1708100035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISVQjlDhuxktgdvlQkAYJcUhQrr8fLt/EuWGjCe2nWo=;
        b=rC8w4KQaIY+Tu1UR7Tm8/XQqJEBdum4IrmoY4qouZbWia8Wt6918TgwE1WlIlLBpKW
         dPzptO4kyG/m3A6TQDX6jeN8mArxV5vy0FxjdPs0snVK7pwOLo4tvZPNM66Eeun0495m
         /vaT3wLCcKZ64dG55tlGTvMe577y2HISH9QNdHDuIQxl9yo7tukVO84sZ3o/N2YTYXQF
         I09aNWWyFIMbWS0Vn6ROenkiDE9QLrOc0hauUSVjMOMXVTTw93hSR2A1XRjM/eS0uU17
         5/vkvM28yCYcvp0F//IKz/5xS5gZFXoJTsiy0FeDQ3fxDVTBhvrUlsrj/4VXx5IdMRlM
         3mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707495235; x=1708100035;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISVQjlDhuxktgdvlQkAYJcUhQrr8fLt/EuWGjCe2nWo=;
        b=tNTSRXHg/qsmSbZXMnjgC4sP5oL5olXgkcEd1gCe+UcBrQQ2k9/CnLF+10LSjXHm1e
         MgZDF95DPpCl2CNfR/x5h8M0Oz1cFHCOgZTBzEhklzHTle4DmsLbDd8FqeUfi9m6XdOO
         tTGrBYi86SZiYYIrszF5QnPgW8ykNkSdWDzYy7n1RORFTTCNgoiMeJg+zfSOFEDIH23i
         OtZ9vIVbc/brb6NlWc+DjuE24cFlnJN6maHWQz9U9wAzPf04+R6PclRn/P/ZB+YurwDa
         R5tHiM9jqKdi648wEGLTIHsk4Be2M94f7b9Q2wJDcIZTSbcxxFiEUf9bOaCgSQBBhlUe
         3Lpg==
X-Gm-Message-State: AOJu0Yw/cI2Q2pBPJecIdQmo3UMn5bv+Xc/QuW1UfFneh5E4arq+rnx4
	UI4HwZOMM8zge9t+HR4wAOsZR0ZVLcdL1DzljBeveaBV8kEmmm9Deiv88VPSSjA=
X-Google-Smtp-Source: AGHT+IHNXgGcu2a4xAMztcYxQsvAn119baDjUiN1sOdu4laW5FMqfT1Xd+U4nI4trQf9VcVjOxKC1g==
X-Received: by 2002:a05:600c:4e8f:b0:410:7980:72a3 with SMTP id f15-20020a05600c4e8f00b00410798072a3mr1044002wmq.35.1707495235379;
        Fri, 09 Feb 2024 08:13:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWF9ZWG8EjCTnWx0jkyeDG0Qr8YdWFzC+ONvCzW3TxFZu/8e0GoKxPRmAmFosVMJx9f3ENvvTYzE8VGh/wMu3BuJm6x7/39QGv3S34hBE/WYGN+PZNwxgy7jJs5Dh6nxkk24wi/5EbfE8/K3us2WG/MATNRtkqe/sep40BlUeeQsM6fzYclywF9xHIR1t5BpDhUQLqkF3FDPbxgC41KgbPWBm+bbI9Ls0om4YQ7hN8FRSyYEBKXPxRzwGHU0kEojdBrqdumf6SBbDF29dQRp0mNc/SoD/gOD8AKd8KS22DECkyg2mF5iGaP5PWfY3VwuTNxOvNwAIW344cS0LIo1T8ZixGinvUbTFSSpwuTyFuXlIdonsOCAJVLWC3lwJWu1q4WXV846RajN2IgL2FxauGK+JH/+66f2yvlP6qRFiqb4/7V+lNjdruQwzNyyHocvGGVFZSxnJQVw0virYE+H5aWtFELSMFlZzrHziZJ6ejtQd9QmN3iqOMY6mMjjllS8wiQWdHuBznQOLnCBtUUbYZp5UEJ0S1UpgSZ1+cAzfrXjJ/j6+jWK7vNyar4tq7ZzSUVTADY+XpQQJhs3c7Rx835/3zi72jHBTvTcvnTQP4fx615KX2wOx2sH7bHpr/lOO6rQrBHKZcMEjrXEoiku5RBe/z4mlu68TKe4z1i2gUH2m+q+RXEJEoIi3vXzXE8tpCNZi/ICBr6XGilXUtas9XBev0xDTwzeUoyGhWsWtj6w7vgwx+azT9bWTKbRugRGUFqs7Jrg2A1WT1g4zbgZUz03EER7uDjLrYAOVjIBKY5LLxd9khEtvZFnLQleX18EzrKYbYoQvTqKce7xU2M1liC9/nkkRfgXOp75CGb82w8RBBehQy1BzF5IF8jxWPC5AiXcqfO2opl4uno1zFjMvkxjk5WBvghsCZoUsp9kbn7gTNr
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id 25-20020a05600c021900b0040fbba734f3sm1041447wmi.34.2024.02.09.08.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 08:13:54 -0800 (PST)
Message-ID: <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
Date: Fri, 9 Feb 2024 16:13:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
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
 Conor Dooley <conor.dooley@microchip.com>, beanhuo@micron.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
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
In-Reply-To: <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_081358_084687_506D68E7 
X-CRM114-Status: GOOD (  27.94  )
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



On 2/9/24 11:06, Tudor Ambarus wrote:
> 
> 
> On 12/21/23 06:54, Mahapatra, Amit Kumar wrote:
>>> Something else to consider: I see that Micron has a twin quad mode:
>>> https://media-www.micron.com/-
>>> /media/client/global/documents/products/data-sheet/nor-flash/serial-
>>> nor/mt25t/generation-
>>> b/mt25t_qljs_l_512_xba_0.pdf?rev=de70b770c5dc4da8b8ead06b57c03500
>>>
>>> The micron's "Separate Chip-Select and Clock Signals" resembles the AMD's
>>> dual parallel 8-bit.
>> Yes, I agree.
>>
>>> Micron's "Shared Chip-Select and Clock Signals" differs from the AMD's
>>> stacked mode, as Micron uses DQ[3:0] and DQ[7:4], whereas AMD considers
>>> both as DQ[3:0].
>> Yes, correct.
> 
> Amit, please help me to assess this. I assume Micron and Microchip is
> using the same concepts as AMD uses for the "Dual Parallel 8-bit IO
> mode", but they call it "Twin Quad Mode".
> 
> I was wrong, the AMD datasheet [1] was misleading [2], it described the
> IOs for both flashes as IO[3:0], but later on in the "Table QSPI
> Interface Signals" the second flash is described with IO[7:4].
> 
> The AMD's 8-bit Dual Flash Parallel Interface is using dedicated CS# and
> CLK# lines for each flash. As Micron does, isn't it?
> 
> Micron says [3] that:
> "The device contains two quad I/O die, each able to operate
> independently for a total of eight I/Os. The memory map applies to each
> die. Each die has internal registers for status, configuration, and
> device protection that can be set and read independently from one other.
> Micron recommends that internal configuration settings for the two die
> be set identically."

Amit,

I forgot to say my first conclusion about the quote from above. Even if
the dies are in the same physical package, micron asks users to
configure each die as it is a self-standing entity, IOW to configure
each die as it is a flash on its own. To me it looks like 2 concatenated
flashes at first look. Thus identical to how AMD controller works.
Please clarify this.

> 
> it also says that:
> "When using quad commands in XIO-SPI or when using QIO-SPI,
> DQ[3:0]/DQ[7:4] are I/O."

and this would be a parallel concatenation of two flashes.

Then it would be good if you let us now the similarities and differences
between how amd and mchp controller work, I scrawled few ideas below.

thanks,
ta
> 
> So I guess the upper layers just ask for a chunk of memory to be written
> and the controller handles the cs# lines automatically. How is the AMD
> controller working, do you have to drive the cs# lines manually, or you
> just set the parallel mode and the controller takes care of everything?
> 
> I assume this is how mchp is handling things, they seem to just set a
> bit the protocol into the QSPI_IFR.PROTTYP register field and that's all
> [4]. They even seem to write the registers of both flashes at the same time.
> 
> In what regards the AMD's "dual stack interface", AMD is sharing the
> clock and IO lines and uses dedicated CS# lines for the flashes, whereas
> Micron shares the CS# and CLK# lines with different IO lines.
> 
> Amit, please study the architectures used by mchp, micron and amd and
> let us know if they are the same or they differ, and if they differ what
> are the differences.
> 
> I added Conor from mchp in cc, I see Nicolas is already there, and Bean
> from micron.
> 
> Thanks,
> ta
> 
> [1]
> https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Interface-Signals
> [2]
> https://docs.xilinx.com/viewer/attachment/dwmjhDJGICdJqD4swyVzcQ/fD8nv4ry78xM0_EF5kv4mA
> [3]
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25t/generation-b/mt25t_qljs_l_512_xba_0.pdf?rev=de70b770c5dc4da8b8ead06b57c03500
> [4]
> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7G5-Series-Data-Sheet-DS60001765.pdf

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
