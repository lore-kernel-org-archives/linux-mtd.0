Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43ABC48297
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Feb 2024 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3D7WCnTZaKcKCFlWhTljFmLuJrw/6au34VUZhXDyoE=; b=NJwqrW2T0Kk6Dl
	zY2Bu9a6dNg/tkYIG5pXhMc6VL49qbecljV2DFPYM4429ztK5LuRTZhKUwJBShdNR9xF7rtfqaV4a
	ko6n8LPBUYwyk0O5FQ+yxLZ8yCztMGRrt8k3l9COA6rR3rjo4UpzpW+K90fiRNJKzZ6eiaYmsKdn+
	uTbPbOtdxK3DSCRTgzGOWG0uKbHQxJsDbSMQ22LQhJklyNWwhgycEIJRiY7puktV0+gp0ek6Oih9a
	jpv/Z6c3xd2hc8r3H05VCcm/Xo4cOUWPNVvYOfTIEoTSMEVcZtpDhwhuKbeLdRWUT0URtU38ON4WH
	IQnXRqTWo96qJ86l0nvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYOiD-0000000GnoU-3LfF;
	Fri, 09 Feb 2024 11:06:29 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYOi9-0000000Gnmb-0U5A
	for linux-mtd@lists.infradead.org;
	Fri, 09 Feb 2024 11:06:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-51171c9f4c0so944825e87.3
        for <linux-mtd@lists.infradead.org>; Fri, 09 Feb 2024 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707476783; x=1708081583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNIMeDELEsgEmpHqgGVZK/F6ni2JqtV13kYmgPwfag4=;
        b=NCW3poz3bJIxyinmKfLlAJDfV3+tUjZv1S+pwFCKz23UtbtcSaSKfVoiSKcDgVEx3m
         S9dP+AuaB2zbmC0XPEdkgNjCyKloLrV4yHbSKj7UjYqtRGHhl1idIjgzlGsu4D65gP4Z
         iHculdkeppUQEsdoLHVL1WwuguC4/590R2qtxG+yq59rn7hMYHmq1zx/dWN7rtQfO6uT
         Iyck8fWSWwAmyOCTmMkhsG6KIaaWoLxfEb7sH0+ucTsnwL77M7uTSj/m6JP3cOargKXX
         b5JFWblrRVP0DB+0TwODNfg4Fkjke/ETNh9bletMlsBFvPXDgOkG9pBEZuTIcu8L/c/1
         6R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707476783; x=1708081583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNIMeDELEsgEmpHqgGVZK/F6ni2JqtV13kYmgPwfag4=;
        b=II0GOFebTlRXRKGH/YqkpjpQoOpLEu/OMAxE2sRh7+PBjS1dSH/OtURpu/Ua7QR2GH
         ARjeTzjd8GrbAglAwQU7uqmjZFV+raxLTvc7oS/a6N2iqyhLJI8g90i11Enrsj2nLSZx
         m/EzVhrJbqFHipfcepwXaLaZxpCoeja8YWEPuFQs1+8dpbzYNZIWy1G9CVybEsRpEpz9
         yV+5VlElDfP8LqkYQ7CynsGYUwBtVTqrUbO4UPsfqzWoEzn7QGrAQaGl+QSdSitYC7cy
         HML48Ui5+UDzsdgFxy7z+5tGyK+bB03kvIIS9Gq0415Li1Bzs/jijuGnze3m/H0wkMWr
         imkQ==
X-Gm-Message-State: AOJu0YwEOLlwCJMDoA3JnXEZzjXATpeVuYjBAfDv255ex5/qepKowkNk
	1kOdK+OiSVZIBd6ts7MJusP0c/jJhvN95zDtN78b4VN1g01Lg4GE0Mdwv/GvnM0=
X-Google-Smtp-Source: AGHT+IGZ4YeLwzzx9v2KEXYku9ce24n0sGchhrnQap39oaCPrLkoUAU1Sl/NMvrZ3PlAMCjfJ+TRmA==
X-Received: by 2002:a05:6512:1381:b0:511:5afc:f186 with SMTP id fc1-20020a056512138100b005115afcf186mr1088963lfb.26.1707476783128;
        Fri, 09 Feb 2024 03:06:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNKk5u18t/ut/bsH1vOixwQcHhTy21s9IglMiX84N0gidC2hfcol35fdyB7F9vbD9O/XHeL8U9dHFzqTVbF74/jtEF0J67IVcVVzN6A/xBrNHbHyseqF5qrHIM+nk4P17gMax9XNcKsn7oQX5ECeEEx09GIHmTiplTmEQ8O9v2OR6xHA1Gt2cRqxJ0D4g4UaAbLt8MBB6tNA5/zLpg+9lqjO7VhJBROSXOdecuwgn7IV7M9YNXmc7z5OXM0S8os4PtV/3v5VO8sNUKC6Sm6vUw/TUN/rZrJITgzvplSJpoTCUwRSOv3PRT1ecLmHOfEUGWNRIIGEyLmGjm+M9wvwwOO676IrPctx/o1f9XOFd0VBCLvQNKIuReFh5XAFBqV6ukRXHMpdOca11H5oodx+Sa7CDi8ZaZAjA2ShcbLuVwMtf8wBr8XGuJQiguif4aoG3KEJ7ET+i6cFJXmqbJh7aPWnz0zFDy/epMJkve68hf+UB10h6NVSOYrOmLup25V1nOFBCyFiHQ/xp5oayvNuhB0UgDB8kovb2scqg9Q9ibijpgEvpA5veRYNib5JEvl7dWPW4R0WtaMHIYD6w/MJb2ikEL4/k4pDHPuJ4dVd6X8EW6q3UN3BLrYITa4fKDJfJ+RU1p0GxWsFlc8QGMS6GrKlQ36mVYy13e9Bd8EIAXMKWGQrTNDBpfX9sJM6Ax4nurkJot2JSc8f/rThLpO1iIQenMbiHg3V9ILKX4KtJy4+ADbNWVL/2nvd5WXDuuPR7/Nacb/IM3HuDPDZC15nx2/WZZqmEud4CbV2kDl0K0lgnT6zs5fWloKAwmBf5wlhfHppCJZtLN+0iZaRJEUiFxkFH9SgunzlMFTTZj26GPnnqAcuwIbcShmSx3Orzxn9QMUWe/lK0j23HuP/cacgY2OHKW8RVucqw0hNOHUDKWowf5
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id l9-20020a1c7909000000b0040e527602c8sm285252wme.9.2024.02.09.03.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 03:06:22 -0800 (PST)
Message-ID: <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
Date: Fri, 9 Feb 2024 11:06:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
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
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
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
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_030625_215879_E4EE827F 
X-CRM114-Status: GOOD (  15.48  )
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



On 12/21/23 06:54, Mahapatra, Amit Kumar wrote:
>> Something else to consider: I see that Micron has a twin quad mode:
>> https://media-www.micron.com/-
>> /media/client/global/documents/products/data-sheet/nor-flash/serial-
>> nor/mt25t/generation-
>> b/mt25t_qljs_l_512_xba_0.pdf?rev=de70b770c5dc4da8b8ead06b57c03500
>>
>> The micron's "Separate Chip-Select and Clock Signals" resembles the AMD's
>> dual parallel 8-bit.
> Yes, I agree.
> 
>> Micron's "Shared Chip-Select and Clock Signals" differs from the AMD's
>> stacked mode, as Micron uses DQ[3:0] and DQ[7:4], whereas AMD considers
>> both as DQ[3:0].
> Yes, correct.

Amit, please help me to assess this. I assume Micron and Microchip is
using the same concepts as AMD uses for the "Dual Parallel 8-bit IO
mode", but they call it "Twin Quad Mode".

I was wrong, the AMD datasheet [1] was misleading [2], it described the
IOs for both flashes as IO[3:0], but later on in the "Table QSPI
Interface Signals" the second flash is described with IO[7:4].

The AMD's 8-bit Dual Flash Parallel Interface is using dedicated CS# and
CLK# lines for each flash. As Micron does, isn't it?

Micron says [3] that:
"The device contains two quad I/O die, each able to operate
independently for a total of eight I/Os. The memory map applies to each
die. Each die has internal registers for status, configuration, and
device protection that can be set and read independently from one other.
Micron recommends that internal configuration settings for the two die
be set identically."

it also says that:
"When using quad commands in XIO-SPI or when using QIO-SPI,
DQ[3:0]/DQ[7:4] are I/O."

So I guess the upper layers just ask for a chunk of memory to be written
and the controller handles the cs# lines automatically. How is the AMD
controller working, do you have to drive the cs# lines manually, or you
just set the parallel mode and the controller takes care of everything?

I assume this is how mchp is handling things, they seem to just set a
bit the protocol into the QSPI_IFR.PROTTYP register field and that's all
[4]. They even seem to write the registers of both flashes at the same time.

In what regards the AMD's "dual stack interface", AMD is sharing the
clock and IO lines and uses dedicated CS# lines for the flashes, whereas
Micron shares the CS# and CLK# lines with different IO lines.

Amit, please study the architectures used by mchp, micron and amd and
let us know if they are the same or they differ, and if they differ what
are the differences.

I added Conor from mchp in cc, I see Nicolas is already there, and Bean
from micron.

Thanks,
ta

[1]
https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Interface-Signals
[2]
https://docs.xilinx.com/viewer/attachment/dwmjhDJGICdJqD4swyVzcQ/fD8nv4ry78xM0_EF5kv4mA
[3]
https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25t/generation-b/mt25t_qljs_l_512_xba_0.pdf?rev=de70b770c5dc4da8b8ead06b57c03500
[4]
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7G5-Series-Data-Sheet-DS60001765.pdf

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
