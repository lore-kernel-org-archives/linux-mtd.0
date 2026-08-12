Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4145C5B56A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNxPZ5/1EYO8/bO9jSKpTqia11fUqr+W9ISgaKPMPnY=; b=KJ970dZ1qNO+sX
	E1Ur/7zis+i68q6qiNfFRbhZhIZgCMNYstjeLmZHUDahWGom84L7k2N43GJN73n/U4irJqS6IW6Vz
	HnhSBw0MrGfeBcuWDSPb4ZzyCbrjO9hINCaTmXyYl7JbMsBQjJKVL8j6NoVPA9lEaSM5tS3XqaVQQ
	qXIvzR8r1pqFBqRzrylpOMnBKDGJ7l5lpN6+L7JEq7TLgzLB+v4C+u4C0bkodwgGlqEo0SQkWCNOD
	Bx/YyHWvX4OCTi58LO8lN1XgYJhVcpB8cdhIWITwWCCmkU+45FpN/pWNgntiYUhztEhdjCLv8Nbma
	yXaexcsqm1PVRiFXVTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5do-0000000FoqV-1kXH;
	Wed, 12 Aug 2026 09:52:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5dm-0000000Fopm-2BAO
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 09:52:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso3127175e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 02:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786528372; x=1787133172; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cTk/lAwXPpqDHGidQ3rLoRd93BhVrEFxxCVH5bApmU=;
        b=l+OF5ghrdq1Oi5AwdmhKTLlP7c7r1Oo83xwVXwSW8VyYf2aIAStnAAhMYT7ByMW+6m
         NZs4slWJ38wuueOzG4H6fFXCtY+feFgvSM8yzERR7me1/jcw6vFM7VUxZiNBU85nPIy0
         vv0LZzysrTQiCr2m2/PyP9Gv8oMh/yQy8F3wk4k2wgMPgVd8dHYNtsMnbZzQFnJtPNsS
         cFJJ5dWJpLn81lRaKJUCz3INUMe+mAB417ofkr/DdBATUYcuxIx2AAV4kC1HotqqfLeW
         TPxswo+w3/o+bvwLOw/LfMBQCcTJKAUYIBqdTTowk2iC4jaUrAwjQJnVs9Ob0a9jC1tV
         E7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528372; x=1787133172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cTk/lAwXPpqDHGidQ3rLoRd93BhVrEFxxCVH5bApmU=;
        b=lIXHCzHMq3xTARwehpoigPTPRDzaO1NLdR7tQQ7SoaTzjMRDjwuOeHtSYCfqci/clN
         27UDePq7e0X0gbcK4OLC4zE8EIYMn9IORu3oZwlfDE1e3lYhuglWktuT3L7lw5Y4yiT+
         SMvoxpJanpxzxkyUEUxz3/DFHmxdUObyv4Y05bj1jPxSOmWZToL2YBIG5AW4T4oYwRFp
         15xHV9VtYkuWBCX6Zph5O3NxQWPkC8OAJ6+q+dWylRRjWlGb++/afgE0BP2jQANpherY
         UoqX64o8Xz4a/2xq9J+czfralOjzFTQGsT2xS0nC//nfJei35dwhdYXs8J5IqZSKnlq8
         ENeQ==
X-Forwarded-Encrypted: i=1; AHgh+Roptko5/bdpPI6j/H8sN7zP17WG5dh0AN9QRohKQnw8Jb/HZbJZtCIKpRP59IeEaLUIx6MeeB6ZneY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKWMweMmgoxz1+c5rXYBSkZEmO7ds+/wlHHYgIAW8mtmrox3ET
	y+vHY1tnqrVGFyweEBmKd2eB23iUzWzpRBuk574AIO1e1DMO5TaA4p9RQhqnjUlraHw=
X-Gm-Gg: AR+sD13Rguo7K9e2ap5OjFJ4Mc9QoTxDN2CNjj3466RwUzrQZ0XQEp38SrGrx0cLCrp
	dTo5DrxOfiBH9ZZix0zYBrrc5pbTjmKD7LK2A08k1bofZIetszyMVLXr7AdfPKj70HNY2+1TZA3
	tGg+WF9Kyqpfovwp1kk9gMLWogDuYZealPTqETQi1/+9zY+8ftWfQ54XIRcOP4zij2tO13vM9yO
	85aCM9daI6uSmU9JWj6XRIIBmp5CwzURV0HHxVbAiY7fXd0a8HWQ1mb8YmneiIbBjKz6hSOJikc
	2RAgia893pPCa3dRoXDZMMpmkiAYtBzAZz36XQpqtVyobVR5KF9e2MZfgDjpzhure/RunHSgxxN
	XR7fO5iEzzemn1LWSKNnKAXmu6KO3b2yh0LTNZPCzdtfT+iEWyNuM9nWKM8q71KbNZdkE4T3pR3
	dRIvX40LpyBagg3RSIKRmhBo1yHmmvlGvQHwnieBRqrxm+jnW2THhKeaehVDDR77OdcIOWdg==
X-Received: by 2002:a05:6000:470b:b0:481:5657:5299 with SMTP id ffacd0b85a97d-481565752a7mr1318883f8f.0.1786528372417;
        Wed, 12 Aug 2026 02:52:52 -0700 (PDT)
Received: from [192.168.0.252] ([79.115.63.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150b78648sm6399552f8f.0.2026.08.12.02.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:52:52 -0700 (PDT)
Message-ID: <e0d2710a-2a67-40e0-aacb-5d18742cea76@linaro.org>
Date: Wed, 12 Aug 2026 12:52:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Unprepare legacy controllers upon RWW wait
 interruption
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_025254_639806_A4702F6D 
X-CRM114-Status: GOOD (  14.75  )
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



On 8/11/26 6:56 PM, Miquel Raynal wrote:
> All the parallel locking helpers (spi_nor_prep_and_lock(),
> spi_nor_prep_and_lock_pe() and spi_nor_prep_and_lock_rd()) call
> spi_nor_prep() then wait with a killable sleep. If the sleep gets
> killed, we leave the controller in its prepared state.
> 
> Call ->unprepare() in these cases.


We don't even care about SPI NOR controllers. I stopped adding/accepting
new support for them few years ago, so that we encourage people to update
the drivers to use SPI MEM.

The alternative is to drop prep unprep entirely.

Anyway, all good, regardless the path chosen:

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Fixes: 74df43b3f626 ("mtd: spi-nor: Enhance locking to support reads while writes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8bc117b46e02..250e996284f9 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1346,6 +1346,9 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
>  		ret = wait_event_killable(nor->rww.wait,
>  					  spi_nor_rww_start_exclusive(nor));
>  
> +	if (ret)
> +		spi_nor_unprep(nor);
> +
>  	return ret;
>  }
>  
> @@ -1417,6 +1420,9 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
>  		ret = wait_event_killable(nor->rww.wait,
>  					  spi_nor_rww_start_pe(nor, start, len));
>  
> +	if (ret)
> +		spi_nor_unprep(nor);
> +
>  	return ret;
>  }
>  
> @@ -1490,6 +1496,9 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
>  		ret = wait_event_killable(nor->rww.wait,
>  					  spi_nor_rww_start_rd(nor, start, len));
>  
> +	if (ret)
> +		spi_nor_unprep(nor);
> +
>  	return ret;
>  }
>  
> 
> ---
> base-commit: db5f6418501f9795a96026b764d747179a231b2b
> change-id: 20260811-perso-rww-fixes-016cdd229647
> 
> Best regards,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
