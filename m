Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB0EE14D6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Sep 2023 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sBGGIM79pNFQWSDjRMGt8Q+Sj5mRukYprDv3KxNJ+U=; b=zEWz2M+rMr1Ful
	yh5S19yzKjsQZbCwmnmFkfdEqsJBOW9tmud33bfpq358S3aRqeTJZaXOhE6ZagoyynDwQyvLzAFJr
	fhFsUUN286s21lmaBVZ7UHZI0L+LFmXkiWSjS2eode+hrNXs69/GWO6H9N5MjCtylDt+m6THwSJ6U
	evjBHXt+rrT1MFhaQlvmZGZS1ZQ7nPXLiMQJDWYd19PnvGj/6zl8Tw/Gguhbw3Z/gXIqNgjXUvf4T
	xgW06zoWd1thn1ZHL1De6A7FVTV+MoBnImQvGv8npXPjW/9s35kYYitpL5CFXCApvTHdcK4cQtMn8
	nKa4t81h2IEdQYlmeyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBX0-00Bhgr-19;
	Thu, 07 Sep 2023 09:42:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBWx-00Bhfl-0r
	for linux-mtd@lists.infradead.org;
	Thu, 07 Sep 2023 09:42:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5298e43bb67so1487441a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 02:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694079748; x=1694684548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YfkJbCdeOUfHZ70y4Xael3OQcTcqcvMqx0FyDVsxA4Y=;
        b=El9/56R92CyWu/wDITmY2GfiqZfnneFh6AGnDWbocmX9O/eUlB2Au0XSX14mmv5aFJ
         j+c8vZvKIfbNufPu6tlxvDC2aNoRLL5JZvK7EhnYCsXpTG7Xh6EDMblrhY9vtiV8yI0X
         VjM+8HNSvlcp3g1NPWDFHl9DgmTvxeRpHawpQ4QAtsd42G8svaw4d8ACnGaZhqzFbT+s
         WPGllN9sd3vCaeIT2jroOpmmUjNpDD/eF5ncG/0Jvc0QYQ5sHWZqrIDWva23nlV1yZLy
         cPuxLiNbs+jDuWwkczZffZAq0ORiU89DvJUxZQGnSnk+o1BlWegK351vO7iPb7svcPRU
         VBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079748; x=1694684548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YfkJbCdeOUfHZ70y4Xael3OQcTcqcvMqx0FyDVsxA4Y=;
        b=HtXEhb9oX3Pz+JLvzIm4b64wWylmLTcytqOJgdmxzy1iJpRFPUF6xh4MV9Qq5Zlq6x
         36uGTAjY1R4wvz6mG64hzw2uzHOKi1mumNxKkRZZvoj4adppcAuvNUP8AhY9sHsxS/DJ
         rtG1aV10U4LNTRoQhqW9KyVv8mkkBe/LNQKGKHirlkfVg2nJm1B/1Si2pNcDtzClrrBJ
         nc02jkx4Y+IuFjmswAJxygIoChCavuYj2zShDElfK1+KrTf8BjLxUd8FcLUbRthnrH5N
         8+iXA+7LAU+n2pql83kstJ7IbaIgl+SlssDAdp9ARocN+fM+ffK9/Es2Uuzq4nORzTD7
         dEAw==
X-Gm-Message-State: AOJu0YzdWaQ8/v7WowUw43kKHlfHcNE/cnuLGMTnopVjp1DX2/CNEgAa
	VbPBOIVy4KtUNQ/L2MOd4EiRS2EzuSzuZU04xvw=
X-Google-Smtp-Source: AGHT+IF3/YOkQHh6iMB40RPRVRL0HRRZ4Y+jDkR5ITBBzwgK62VXBvIb91GwhZZs1hsBJmkqPk78aA==
X-Received: by 2002:a05:6402:51cb:b0:525:4696:336d with SMTP id r11-20020a05640251cb00b005254696336dmr2818621edd.8.1694079748067;
        Thu, 07 Sep 2023 02:42:28 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id w26-20020a056402071a00b0051e0be09297sm9465226edx.53.2023.09.07.02.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 02:42:27 -0700 (PDT)
Message-ID: <747e5633-e3b7-48a9-8a1b-1c1985451314@linaro.org>
Date: Thu, 7 Sep 2023 10:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/41] mtd: spi-nor: winbond: sort flash_info entries
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-39-291a0f39f8d8@kernel.org>
 <eec52fd8-663d-7e56-3627-2b33259027b6@linaro.org>
 <c55604322b8b5bb74ce293885599810c@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c55604322b8b5bb74ce293885599810c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_024231_329009_B6D8907D 
X-CRM114-Status: UNSURE (   7.81  )
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



On 9/7/23 09:14, Michael Walle wrote:
>> I'm fine with the sorting by ID.
>>
>>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Also here, should I convert this to an Acked-by: for all the
> sorting patches?
> 
no, I'll add/drop my tags when applying. Haven't skimmed over the
others, I'll take a second look.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
