Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB46C02180
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2025 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYj+ilpdmK+oKwXkT2EuTgDT6pk0GbnKS52qPyu7ONE=; b=qto8uDWfgP1pgO
	UrFdwLrvGS+/QI3cGpo+bBZT6ebbyE2HFK34MTLHoS6Zcsq4i3d5SYljUyJ30/TK4VO11KguBhqOD
	DNeo7HxY4HvtOjyGferyF4xEXAi46hdMr6cJzyM/K7fdccN6VtM/xx8cRotOWLCA2u0U/pgUbQ/Cc
	+ik7iulLYN8iPOhl+AdqRmmpfiWifJi5Pidcrm4kc4fsaEUJB20mSz9ycWOT3XihSmDs5kK+iBXD5
	Px54vYkUWR+4YyEWI42RpD+6PKatKeALQ0qmRz5pyim0PYPlUhrUNUV9pkfY+cwjbqSbcMr5JGuO6
	DZakGsEzDpOx+s9ioa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMMV-0000000EOld-2KTB;
	Thu, 16 Jan 2025 09:40:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMMT-0000000EOlI-0iNz
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jan 2025 09:40:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43622267b2eso6205015e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2025 01:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737020424; x=1737625224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGWRBr4DP5nw28aFIJd0kZWYZtwIqmprpOF0JunHCiQ=;
        b=qRQ59YoyDie5UscvpNIQNpmxMG/K6JW32/UjSlZ7pzO4L7LhTUvMhaxQ4NGuvkcwj7
         dsFz7xVXs9ZO2Yt9yPoesUiXOl0xCMQfbFNd+A+3Ha+L8iwVLYx3g8OKAY7IpcaGrW07
         IaLwWsP9OE7YJRwaJX8zGk7Ip5ulbR/jd6eVTszpDxMiGpt/7gi3vV7UDoKAVGeSt5oe
         238Tg4sg2d+/mdbh95dXrOHXkYKNC7nr5iy2XT8L4MZKhnckE31FlsrqsSC6v7qX8Q+p
         HfmLn3SqISJTWTkNr/cx+TF3rtHprg33A36HL7p66EM+3jMx1QC0FGRFJbJ+fFUuPADB
         uSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020424; x=1737625224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGWRBr4DP5nw28aFIJd0kZWYZtwIqmprpOF0JunHCiQ=;
        b=uRqQqA05DQAi3hujaWJ6dYWVmb/9AQyI562/21mNyURR2dJCvK35Y+cCpMZ0VxPER5
         Jzfe46mJSr3vsJ64QMj10ogQsreFwBCvR4p0FR4PO/K0VXOdIlGpv5t+4rn6axXwIMpf
         Z6S0vJlX4VY8EoIEpFF/lUqVOqt/IPYuE21Tx6QZcQhNyJxcgPzzYeZrZ7G0xFVYZlvC
         T5NqtaMVC71SKH3G5ziX2d1mtVTmquzfM35lv55DAOYnFdqBaMpNB3Mh3DAg3U5REIGU
         TQpQdjqZNDBthfYFCP8NZ5rirjbNklbmxB26xp8uG6up6YDuVIb8E/CMJBg54WNuHclW
         H+TA==
X-Forwarded-Encrypted: i=1; AJvYcCV95FVqwVZmVmyByqp/94YKRB1tlTVPNYerUOLlezoS//6/XkobgohNwrWUR6PIl7ACGR3mH3n9sUM=@lists.infradead.org
X-Gm-Message-State: AOJu0YySZ54RDK/ank5D1G3BcPoZPKmxQRLo40YCoNorrkdZx6m1Yhpr
	doq9K9IILP4uzA1hsHFkm8W4aLzROrwQQTke/eVdV5auHM6SPeRIy/jjOHMWVtM=
X-Gm-Gg: ASbGncu1CguvwPYW6YW4D6xzkPyImojc1QVVxOLOiNobieSZjD334ax+QPxmRHikwWh
	u6RyWvnZGklttO4CzQ6bwjWiKSxUfSSxpH143PpSiS6h69XO3flENUQhH7qc/+UccTayXakMLKS
	3ScXZ4WsI1lzUpHudLul/2u+85d8biBKX75udPvENvhcktpCIJdz87FM4n5m+QELWLFWzpQGWCG
	Jrccn96eJ8ETqS2FyigRRCTDaCYUnRdV1BrEW92vhdDyQWZagP1Y5udPZZFoJd1qw==
X-Google-Smtp-Source: AGHT+IEAFDBTj9oeeVQT7Va0YWfSp7hE+jhZldsWtD+E0ChBZb9FUQBYbSzbxBFcj07PX0xlzm/TMA==
X-Received: by 2002:a05:600c:4f47:b0:431:5632:448b with SMTP id 5b1f17b1804b1-436e26e23f8mr254263435e9.25.1737020423698;
        Thu, 16 Jan 2025 01:40:23 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e59ecsm53550875e9.35.2025.01.16.01.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 01:40:23 -0800 (PST)
Message-ID: <13cf7570-f229-4024-a0d3-7fdca964f3d0@linaro.org>
Date: Thu, 16 Jan 2025 09:40:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spinand: skyhigh: Align with recent read from cache
 variant changes
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, kernel test robot <lkp@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250116093527.472648-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250116093527.472648-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_014025_215314_1D8D1272 
X-CRM114-Status: UNSURE (   8.65  )
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



On 1/16/25 9:35 AM, Miquel Raynal wrote:
> The SPINAND_PAGE_READ_FROM_CACHE_OP macro has just been changed to stop
> encoding the "fast" parameter (the macro has been duplicated and
> renamed). The Skyhigh driver is new and is still using the old style
> macro.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501161302.bQqBGjJ5-lkp@intel.com/
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-kernel/20250116132010.4948547d@canb.auug.org.au/
> Fixes: 042087247835d ("mtd: spinand: Create distinct fast and slow read from cache variants")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
