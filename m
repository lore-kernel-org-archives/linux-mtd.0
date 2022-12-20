Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B458DC10F1E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 05:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zegxsgRhroF9dkzYj9s17203EFH9LAAt/neD+K+r4IM=; b=0Tmu7OwvMKHCzt
	9DF0eJY8mgp6g05aFes4Qt8OEnbbFfN0lufjLvKbkEPjsJqepmiOxTpqLuWkDvsveR/F2uLjMoAfS
	twD7H1B0uqqS0pr6RkEobpDeLozNaUk6j3JIymchSW/cH/OLOJbDUWl9VXWahOWHoDVTTHMsxuDjH
	kzqDzrMycPVx2JSBJwBSJU++WC9lUpt0Hjk7f1ErxZ4tZ3rz/MwfNz1hRZMnafmQtxpwngtFBMKKS
	xfw7YOq4Sl3tvz+s5XnmCD0lbXSjh3hM8JUQ7JSPTGx45Tk4ltfyOoWuLZ4DQowmocj4yzwk3f+od
	ypUFPMX5/1IBB5wxBGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7VXY-009rNI-SK; Tue, 20 Dec 2022 05:51:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7VXT-009rHW-Iz
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2022 05:51:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 131-20020a1c0289000000b003d35acb0f9fso227870wmc.2
        for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2022 21:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhGgoNnE9xElRONQ65yjh+766v5b8X1JMiql8M2/aVg=;
        b=faakIOkmU1PtUHPKTSuNBCAS4ncH/Tw2DEksrkDv28pLUM/7iBV/xEuS0dqd94jtkh
         DyGDFKY6oV3/fs+XpTD9xMhfzr5tk43XuJ+G3Hq38o1BoE2czu16N2g49VlJqtOv9W6t
         e1gxpNlO+mWonAm+rNC1tsKml79rIoNuGYo5GnyJza7ttb7EOP3zHnsRDxs1/ZMc4rDY
         D7hF9LA/zf+/9E55Rl5XWDsTJ+W4+ERIBCja2YS7rWhnAAwALHI340q1vMPVCZ+Gbgfw
         wJebRFFqBkMGsri+Hd6UxjUZRwKrNmNi05jjZ3TRrrJR5XG1+3orS6FGf/DAqJ/ICOEz
         RxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhGgoNnE9xElRONQ65yjh+766v5b8X1JMiql8M2/aVg=;
        b=OJZGQcDmwdgJuy7250S4QO30d8D/IAjaV/yVe/5h3/igxyJntIJZxQDpK95ZZWDUq4
         cVbYFBUodj2Q8j5D7uJ34goOqbm7f7yVXIlbDoz3crKozaq/JOJdnftkys0ZmmD4Yf2Z
         TahPvICk2v4usk1fBqcB7CxVG43upqBTOjgHx5M/sYWSCVivqOFVIGlxLaVCtuQq2hfb
         72WbTc63gaRCbbMbCAq4XC/Lx1nl2xl8ZBrkUQ1dSCiYyZnU0deWvRajga9WL0Q7sG6U
         Eho8qFhm+aAlHt6hm384fRQXFnk+DcXGugh85bAujuhTjnpbbdWiLKc0lC6lDRMDSP1r
         tIVg==
X-Gm-Message-State: ANoB5pm6qAVHPhMOBKSzCt+47vRL4TDChlSBnfORENKDtV2KZjOTmOX/
	bKe2C/4Z1lpztFtJLQTLCjTJYA==
X-Google-Smtp-Source: AA0mqf54UTZMz6Y+tNgphTwnCQEOorpxqUD69GvNroUBSslNiSlD7aGprNfJ9hk3fKt39NbI36FqvQ==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id k1-20020a05600c1c8100b003d1e90717cbmr33550079wms.1.1671515500863;
        Mon, 19 Dec 2022 21:51:40 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id c6-20020a05600c0a4600b003d1e3b1624dsm23892246wmq.2.2022.12.19.21.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 21:51:40 -0800 (PST)
Message-ID: <4a378429-9a23-13a2-5837-512823e182c3@linaro.org>
Date: Tue, 20 Dec 2022 07:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: cfi: allow building spi-intel standalone
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>, Arnd Bergmann <arnd@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>,
 Mauro Lima <mauro.lima@eclypsium.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221215163950.649791-1-arnd@kernel.org>
 <d68c9137-f485-e0a0-dfc3-c72c26d0433a@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <d68c9137-f485-e0a0-dfc3-c72c26d0433a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_215143_731115_4946B439 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 19.12.2022 17:12, Tokunori Ikegami wrote:
> 
> On 2022/12/16 1:39, Arnd Bergmann wrote:
>> From: Arnd Bergmann<arnd@arndb.de>
>>
>> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
>> fails to build, as it includes the shared CFI header:
> The header file linux/mtd/cfi.h is included by the head file 
> linux/mtd/spi-nor.h so seems the warning caused.
> Is it really necessary to inculude linux/mtd/cfi.h from 
> linux/mtd/spi-nor.h?
> (It seems that it can be resolved the issue by removing the including 
> cfi.h from spi-nor.h if unnecessary.)

SPI NOR does not depend on CFI. cfi.h shouldn't be included by
spi-nor.h, indeed.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
