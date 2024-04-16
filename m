Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE1AC4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2024 04:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZ+B2jkAmYh8xK/sVDES2Y0foXzqTzXo3ZGn/43Lidg=; b=MA/HdMv8cfZC38
	tGKovBPBYD1WjCuRT/HGEUWdBerlaI5ocUxogbqNXpMkV7DutyDlIU7oHmc6nWqwvS0eHbQjMhhXN
	GATOHgcQJ/9X+E0PTuohYkAvgIXlLH+GqVWlX4DwQ5yKvErGz0QiBh/pzBQt23lBQbD3f1qJDTQHF
	tenP6HU58qgHiJj7F6bDN7ivA4eDBxVM9JoBx9gf+j4BC9SHxQ+Zs/+kfP7A5+DoDxvhXAGsTXL90
	23gjCMYQwhQHcW9qwM/gaiOls5Z1S1VPJ4d5KpfBBeaR8VnoB4dOYc1xEFJzJ4D4vfVfE3rLKU8f5
	nZEKmrnjUGPm/UDkgS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwat6-0000000AsNE-2V6d;
	Tue, 16 Apr 2024 04:57:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwat3-0000000AsMb-0bbD
	for linux-mtd@lists.infradead.org;
	Tue, 16 Apr 2024 04:57:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41879f3d204so7878375e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2024 21:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713243458; x=1713848258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKf7jBhUirQYlTsd+b9tpcozNIHw30ci6LPBNVRTPuE=;
        b=AM9BVg7F12IKujHzcWZvQABfKQ7dRGg7/3QKlmK3MClj82lCuRzA0Bp+e+qJcVInQl
         1fIC7q4wgsxZ6fouvTs1CsPeU93kol42xG9gsOmiKop6GbBX/yu5XDaQnZBronh6DXG8
         2nt7+vkTqH92wtAljCHboOFn40ycDrPR/WS7G5wmDNFFOlNn3F2HI5GyEbVlDQRbSkQ7
         SctaB5nE41i0MTB9FC5wb09pIArwzqzihcjYRwDYA+zhEoNjafUIt/+bJT8nzIam3XFt
         KWechhw6rjzDNiqDNRxwUp9yBg31hCHJdBB7GT5u+RIFrW2EwxO7skRaswYjBVWnq5wY
         dQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713243458; x=1713848258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKf7jBhUirQYlTsd+b9tpcozNIHw30ci6LPBNVRTPuE=;
        b=IK7VoK6ypFPz0wtCMvoAIliRhdSoRQxi7wRQEI3MIuT5vfX6MyodjBD6tVL2zCeEqD
         BIqZRUGykK5Voxfj4gt2rdjKFHv7oN0h3P+3HFdkVneNDNKnJicfV23/9DM8BAOAsHhk
         TPF0VJInjdBEyy95mB2vPa9k04jt4ETlBm2SspbVtuCC3zmGKeEQvI1AiIXu4Nin17lu
         Viv+Ec96hRdh9pK99XVludosy12agSsVKQOwMc9IQuWzVo0N+lYWLqJxWJZ8lt2BVroj
         QiV9jmh7AW8Y6TdXcYec4fN6bxQnOFQqszMXGk16+DASEjVBj9e58AjuLzf9KfAHdszj
         lRUw==
X-Forwarded-Encrypted: i=1; AJvYcCW2qIEzVsYUvgO1RXIWQTyCC9Fqc4JApv78A0EP/7FKNHXA3RwFVJqEHCQqT5j3wF5jtw9W+ujGz8hXkUj1F8mKlSrQXzREPytn+sF07g==
X-Gm-Message-State: AOJu0YzYgn2HcxDajMlKwEXexiZNY5Dou+hgYAM/CnvHVqKymkzKgSD5
	44Dx/kNAtc5OLm31cx5PBR1iLQotJ53T59eFsEcGp6pwP0v4cBLiN07GdDcVNJI=
X-Google-Smtp-Source: AGHT+IEimEGKanlvIXAf6pC6ObVJrD2LXGIAD4NVVF1wHKiIECkDGKYQ8KGqlw77z70BQSNvGoABIA==
X-Received: by 2002:a05:600c:a44:b0:416:a8b8:a8a7 with SMTP id c4-20020a05600c0a4400b00416a8b8a8a7mr7982322wmq.40.1713243458574;
        Mon, 15 Apr 2024 21:57:38 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id bg25-20020a05600c3c9900b004162d06768bsm21961569wmb.21.2024.04.15.21.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 21:57:38 -0700 (PDT)
Message-ID: <f07afa83-1c37-49da-923f-2ea9550e7163@linaro.org>
Date: Tue, 16 Apr 2024 05:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/6] mtd: spi-nor: spring cleaning
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240412134405.381832-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_215741_225494_0DD81405 
X-CRM114-Status: GOOD (  14.09  )
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



On 4/12/24 14:43, Michael Walle wrote:
> It's time for some spring cleaning. Remove the oddball xilinx
> flashes with non-power-of-2 page sizes.
> Remove the .setup() callback, only the default callback is ever
> used and it is unlikely there is need for a custom setup.
> 
> Finally, the last patch is a proposal how to deprecate flashes,
> which are just detected by their id. We cannot really find out if
> there are boards out there which are using a particular flash. Thus,
> as a first step, we can print a warning during kernel startup. As a
> second step we might introduce a kernel config option to actually
> disable the flashes which has the deprecated flag.


How many FRAMs/MRAMs are in SPI NOR? Can you list them please? I don't
remember anyone bringing topics about everspin and the cypress thingy
was a mistake. I'd like to get an idea whether it's fine to remove the
FRAM/MRAM from SPI NOR without doing these preparation steps and waiting
for another year.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
