Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5711CE79D0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETWhfvp130nAkk80Mgr2nFRzt41Kl4hbyymtNukaph8=; b=IOelSNm1ODNcBO
	+RvdGlncB+Ul8rMjAt48m7MPmzecvUtDRhV43Lqr7JYrSlg1+JtJia6yL59oZMpsDM09zZ90kexmk
	iTP1rgcnvUtSLTNeZ2lVLuaosu9QHSgeVsu5tEV2dzsbe3BDMQe3UPKrK3eNPhcr1320zf7dBqcO0
	F7n607rsDcA7MpxHzukTHTV1AaIG1/oAa9EOX79xfKnCE12bL9O5hYEJ5pnLK+q9O0NNbK48bviOV
	h6oNt0TOJ1gztcBVf/jQw+yFn/4d5q2wniIpC8sGTlN4g/iQxkc0Uag13hk6xOmdRFXgWIFn8zZrR
	CM9W4sSBarPVt3gjkdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwWP-0034Gx-1d;
	Wed, 20 Sep 2023 12:41:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwWM-0034Fh-05
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 12:41:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-532c66a105bso2077684a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2023 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695213690; x=1695818490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+luls4gPMA8yrNJXuDFSauMhw8cAS37ODbE1EzRYQc=;
        b=Ob+yYYnXk+L0ufstnGrDCSQDrGYd1bQOxf3tLyQTuGBfq1bb5Zg0tUeI6lj8tfwQxq
         wzlvRIwGLYEyWa1ssn/fLGCASnuBZwyckcp9OuCXafebFWi35ok+bhR+nGpEAaC+C0xG
         +66KDZnLdgO6372RqoN+ZPZvYPb3i5P4ny7iN/+GssVzW84BnMJfQ5rwbHhBcyFwpRdV
         aWIxeplWDYQ+utWEOHG8NoWpCO7AWL9mzkAD1qLALR5TA3tCbg8hhDly238oO7pa0f42
         msc1JkuYeJ58iQdQGTDQZP7M48dKHxEqY3w5WY9jIHRMo5Cok+F9CmHZzvw7pAib07pk
         yHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695213690; x=1695818490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+luls4gPMA8yrNJXuDFSauMhw8cAS37ODbE1EzRYQc=;
        b=dr5WANv2uxvHbgyuWGdUYd87WepGrNZJfGLde3OnLj8Hqj+SEQNwgbZ6DF+uj9jnND
         9JI8AWjzMvqKahIUyv6OnCHBssW+ejWcKs+RmmsnG+vyE57MwF5e9MH/0gd+Da7gDTqL
         fJ6p1ZUw49EwKCK4MijE6RQHPw3miXz16Qiw23D5qS0yGzeoMOJ5TnEF9wf+FtLQ6VnA
         486C36zZCGx8C3FIGCeMFKJT3iOubd/OSGhYPjWlv0J4kWI8hexGzxGdITtdbYUruT6+
         orUCNiz7/lOC0bNXYH9oUcRvt8jfvcRhWESesIE6DtB6HoJpaPh/nNmxnMDmyFrjPT/j
         uIaQ==
X-Gm-Message-State: AOJu0YwuIFZfUGbkI+n18ed7XXlgv8jOVz8UzK5RZDhsj1b43Z0wM3p+
	PbUTlCE+iF0V7H40yMR0Uwm3HNCtjJFnjW35ZuMtqg==
X-Google-Smtp-Source: AGHT+IETunGFGn+7s9l+VOv6kYVytZhLGhekxenhXSY84G0hvL0OteviWSryGkxc1C+s69g2seB64A==
X-Received: by 2002:a17:907:2c4f:b0:9a2:143e:a071 with SMTP id hf15-20020a1709072c4f00b009a2143ea071mr1765298ejc.17.1695213690538;
        Wed, 20 Sep 2023 05:41:30 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id n4-20020a170906088400b009928b4e3b9fsm9247444eje.114.2023.09.20.05.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:41:29 -0700 (PDT)
Message-ID: <f950812e-15a3-58a7-b556-a4b63ec7aecc@linaro.org>
Date: Wed, 20 Sep 2023 15:41:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: add support for Macronix Octal flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-4-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230908064304.27757-4-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_054134_067772_1E06D22D 
X-CRM114-Status: GOOD (  14.49  )
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

Hi, Jaime,

I think I already asked to split this in a patch per flash family,
it will become more readable this way.

On 08.09.2023 09:43, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Adding Macronix Octal flash for Octal DTR support.
> 
> The octaflash series can be divided into the following types:
> 
> MX25 series : Serial NOR Flash.
> MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
> LW/UW series : Support simultaneous Read-while-Write operation in multiple
>                bank architecture. Read-while-write feature which means read
>                data one bank while another bank is programing or erasing.
> 
> MX25LM : 3.0V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8729/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
> 
> MX25UM : 1.8V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf
> 
> MX66LM : 3.0V Octal I/O with stacked die
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8748/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
> 
> MX66UM : 1.8V Octal I/O with stacked die
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8711/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf
> 
> MX25LW : 3.0V Octal I/O with Read-while-Write
> MX25UW : 1.8V Octal I/O with Read-while-Write
> MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> MX66UW : 1.8V Octal I/O with Read-while-Write and stack die
> 
> About LW/UW series, please contact us freely if you have any

this is not the place for such a statement.

> questions. For adding Octal NOR Flash IDs, we have validated
> each Flash on plateform zynq-picozed.
> 
> As below are the SFDP table dump.
> 
> zynq> cat jedec_id
> c2943c
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> mx66uw2g345gx0
> zynq> xxd -p sfdp
> 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> ffffffffe5208affffffff7f00ff00ff00ff00ffeeffffffffff00ffffff
> 00ff0c2010d800ff00ff87790100841200e2cc04674630b030b0f4bdd55c
> 000000ff101000200000000000007c234800000000008888000000000000
> 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> 727103b80000000090a3188200c069960000000000000000727100987271
> 00b8727100990000000072710098727100f872710099727100f900000000
> 00000000011501d0727106d8000086500000060100000000020001030002
> 00000000060100000000000072060002000000eec0697272717100d8f7f6
> 000a00001445988043061f0021dcffff
> zynq> md5sum sfdp
> 839ad44d1e758bea30bd9917ba763ba6  sfdp

please do the mtd_debug tests as well. I shall update mtd-debug with a
sanity test in the future.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
