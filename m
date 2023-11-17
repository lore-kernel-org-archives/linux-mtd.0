Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C5FC072A2
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUJzTPZxj/tA/glQuLnjeSJM0bN/jDPvwg6G239yMeY=; b=qkZpzk2bghOVXB
	OKfunqtgh/WFSGEylDS/WfdHblUWLgTH2hNgkpXhJ1/ivDO79qxvCzOFhiBboc3om9ZtLuxjiPz5s
	4kG03M5NP1vIRvyEIyP1kLuR50tZPZCz7c+bbE+zRswoA8Ei9IW1GljzXQ+mTdaIYqoeMRX8c3LwV
	PK5y2NO0HcyD57RDWDdDxVbFQIXZi7zRDDvchSQH6gZih9j/A3WNyUwjZnt+OGR8E56mrR6vTUlu3
	2LdwIuKm85KwyNJ1SDsW/FTL6gp2e3U4ONFum2NNWRXA15XCV4zzhM8GvAm7kN6xDuYtG2BzOGhE6
	oLX2PP0pb4dTmosRY6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vD8-0065dS-1n;
	Fri, 17 Nov 2023 09:32:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vD5-0065aE-1G
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 09:32:24 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so2604549a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 01:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700213540; x=1700818340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fK3T7eD2t8L/Xy9XBzTKHmjBPpvXZhYpiMTcL8KJC2Q=;
        b=Y1fcIEjX9klhxavJzvuy+s5NWR7zKkl1z0CDBzSMOuVY6YIee4Yrn2suq03afLJG5y
         imqF2XDVR41dRKAccrhbnOfLz2qsyzoyJOfghJKE1GPKj95INc14Fj/aIQI0YJXJcmsT
         bYKh5sGernZO9jKsqzBG9nc/oPq7r91bwEody4adSKbN3AvaODgVCeroBkdHEQ3kKcG2
         poo4v57BuEIqoeG+xwYSGd2wO9MgtL6YQnkrsFP/kwl8KFsyD6cE96q1tyd9cj8Bqpd1
         VmLE9UAkFpVW+WB+gKZikiAxwHbqDAFv3R7oRZEOLq3efGtLDJ+Z0pJIXMrUoAFbP6Jy
         XiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700213540; x=1700818340;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fK3T7eD2t8L/Xy9XBzTKHmjBPpvXZhYpiMTcL8KJC2Q=;
        b=r/ohZoWnRhD7amRkMm+bgJDTndXxlMJ/JKp4n/DCx6KEHGeAWRg4NnZemr6y8uVrpZ
         BJ1dUgkg5MYKY0iU3O59FGqpOguWayfO/9aFiMektB/CX/BmVJEZCbzh1faU/dfdd/Rh
         eRCGhzhxp0iKIono5e22wooNcaF1PzoOkBQyq6LxDGEwY8pkV4mgPV4DWA6mpH57L+40
         57tXK9uqR804ubEWvFIlVfLZ++SBAp9rovj+IrJsyP47mfmy7Bit6OEf6isOATfaSJCu
         SITzjt8OTgI9uTttVNxa370wuLKofMzOEGe68F5vdSIknvBaGMi3bLhgyq/ekfwvUyEP
         20KQ==
X-Gm-Message-State: AOJu0Yx+1PJWNlKTWzt9mFCRIUXp0QRdT3D+0W9Ml+R3KyKNuLq6BAjj
	QwT+dImWvc438UvTQzdziy+niw==
X-Google-Smtp-Source: AGHT+IE0GOjwhP8Lawu9hYoojUPq9njj37wDH95KaBc3EI7tCnfwvxV09sRI3ejqqlKO0oxqX5ge9w==
X-Received: by 2002:aa7:d944:0:b0:543:56d8:eb26 with SMTP id l4-20020aa7d944000000b0054356d8eb26mr13577516eds.35.1700213540507;
        Fri, 17 Nov 2023 01:32:20 -0800 (PST)
Received: from [192.168.1.111] ([37.251.220.47])
        by smtp.gmail.com with ESMTPSA id z6-20020a509e06000000b0053f10da1105sm551573ede.87.2023.11.17.01.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 01:32:20 -0800 (PST)
Message-ID: <054c1d8f-fb23-4793-b6d1-5d8814209992@linaro.org>
Date: Fri, 17 Nov 2023 09:32:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op
 checking
Content-Language: en-US
To: AceLan Kao <acelan.kao@canonical.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mario Kicherer <dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>,
 linux-kernel@vger.kernel.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
References: <20231116024338.337304-1-acelan.kao@canonical.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231116024338.337304-1-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_013223_445184_109D2820 
X-CRM114-Status: UNSURE (   9.85  )
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


I included linux-spi@vger.kernel.org. Please do the same if you're going
to send a new version.

On 11/16/23 02:43, AceLan Kao wrote:
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -323,7 +323,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  		return ret;
>  
>  	if (!spi_mem_internal_supports_op(mem, op))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;

this will break user-space if someone uses the return code of
unsupported operations, but I'm not against taking the risk and changing
the return code, as I doubt it's used. Anyway, if we're taking this
path, please specify the risk in the commit message and why we're taking
this risk.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
