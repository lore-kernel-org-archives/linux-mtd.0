Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877CCC4707C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JC+cwbc3+0HeaTYKgpd0aodtIGBpkJ4LMORbQEdyL9U=; b=Xu5lYpxIm+e7oo
	+eo7SvGyTAbtDGENyTjLZrZ7LQgvWyX4SXB+ouE8eFOmB0UqZBZ05vkJITW5VV0JD/7O4sgq0ZhLv
	TULjPxnpgyyNMUsmcGnVUayrzxJWxHXPw174s3d4WW0Lf1/9EHUOA2vM60ZVH+uAs9f1sd10zvH8t
	SIHoFrQwm1x/g3kBcisjqGpCjasbYGsAjLGktpNe/ugbhIZI2XHoUQ6Ys8EQO9vYNTm4n2Z18eDHU
	q90Tq1LUfR4FX/9SNDXcpYOtK6FcVZ3fByZcIJ9PU9pqXyhXgydtOzY+QlYcioi2AjNileMTtZYdt
	dbgn6F3m5Um+vLNGE2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCd8-002AiX-27;
	Fri, 12 Jan 2024 08:11:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCd5-002Ahb-34
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 08:11:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-336755f1688so5148774f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 00:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705047060; x=1705651860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehkrvT2+uxAGaq2pihOAabLA/i4m3XVdKCzhiH1IrSA=;
        b=Bjcy7JpXSJiQiJEmvwIpJ6bjAF+VG+nKy6cjJBUkKdXv18DcFDbq9S4CD34/Fk4grd
         WMedWLG7ZmzO5HEv3phoFTRzbFrurtmS4ONtTbi2cWyg8LMyDuDfM5L09cuWYR/BDzCO
         wb/9i6AVcVrmbmbGbPxaUf0693/x+plCgyCw8mEgK75ENd7AtfZku+Yfl9SCvcQOQkXd
         hDvd2qPn3+UlVmqAdPDoJHbxcypVWrMnM25vjAkCsyI7ejhwpBCvw1euIW+HAR+aCHZk
         zt2B52Kq+V7D87ieCAQMd9CTfknPmigHEs6b7bNWhuMAjqaGLRS3e5dOzA71BgFM6nGo
         8dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705047060; x=1705651860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehkrvT2+uxAGaq2pihOAabLA/i4m3XVdKCzhiH1IrSA=;
        b=Pt5P0S8NVYFyzPLB9tYZ1uwW8rII6Tk3IR3GP4FlqU5JPDksG6nLJADrDA0mzuimv9
         ZtJdjHv6OsCAQ1NrjTdnIa5WhKFqts+D9iC45iCzMQ6BM0nlcmr3gp0DAI56t5QKJjjd
         P1wpV7egO9EWaYIWKju+E3cqT78+dbzdycFLdhTqNWO1N2Qj/iJ0SzJiy+snGfc7bVxS
         8FGpBtKuMAktD3jJYd3+LWwr6035qjKSffvI5eOMCsgJmvHaKd42c3SUJuajmfSoUmgc
         lHZLUytAV7lYDCl2Ku320ONtRGiIN5iWvodZCknGunoQFHoYzZOuQJKoilAHFneX/eDz
         0U9A==
X-Gm-Message-State: AOJu0YxKbKbrrrZMY8niNz52z1vf2DiLWSKAO8+LjAeKN4/gmZJlAm1H
	EJqY5jHiVCHF8EgqduRJ166Qh1QiWreC7fVL0m8R4ew5cRg=
X-Google-Smtp-Source: AGHT+IHth4xGOPY8JZsctAeK7BLvVMM8ywzSogNnxgKiWk9XyI7DDaf6onEDT/u6gXudgPjUutUOgw==
X-Received: by 2002:a5d:6391:0:b0:337:5562:a748 with SMTP id p17-20020a5d6391000000b003375562a748mr507561wru.42.1705047060382;
        Fri, 12 Jan 2024 00:11:00 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id r12-20020a5d4e4c000000b003375083ff8esm3152248wrt.32.2024.01.12.00.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:10:59 -0800 (PST)
Message-ID: <c4921aef-a274-4c9b-bd85-048bf6699f3c@linaro.org>
Date: Fri, 12 Jan 2024 08:10:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: add Octal DTR support for Macronix
 flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-2-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231221090702.103027-2-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_001103_988602_B0E69CB0 
X-CRM114-Status: UNSURE (   9.93  )
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



On 12/21/23 09:06, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Create Macronix specify method for enable Octal DTR mode and
> set 20 dummy cycles to allow running at the maximum supported
> frequency for Macronix Octal flash.
> 
> Use number of dummy cycles which is parse by SFDP then convert
> it to bit pattern and set in CR2 register.
> Set CR2 register for enable octal DTR mode.
> 
> Use Read ID to confirm that enabling/diabling octal DTR mode
> was successful.
> 
> Macronix ID format is A-A-B-B-C-C in octal DTR mode.
> To ensure the successful enablement of octal DTR mode, confirm
> that the 6-byte data is entirely correct.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I'm fine to be added here as co-developer, but you missed to add my
Signed-of-by tag. Please read
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
before re-submitting.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
