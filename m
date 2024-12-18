Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43707E77183
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvvtRTlfwbzoNEbaG/faPD9WL7rlYyEjfRO5MpxO8dY=; b=L36SPdLeGYMZze
	Cnum7PzqNaSSG6czLb+OxePB73e+BuB0JNIkn9RTY3cacyMvoFey3rthjpLYuRHecA5MndeEL/EIk
	3eBZItjjinJi2WCdCtFl8sipA3IcE8gedYK/ckc5vGjQhrM2qYUXpCMcHKUcGZIcYn3iUbTknG+M/
	x6Cev1sG6LrNQ0/70LDxw9R7GPcaVEy3wpOpmiAgc180/BvrjvAUH1ON/e701p94UAyv4r696dPjd
	9rQ8SN6GPWuSsKpnNnLnrNF7WmdIO0KyGGf0Odw2zz4chmjV++MPQreo4e2S4W6/RVuN17Xob7v5Q
	pQXFaJ95ehymWiF+6NRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpEd-0000000FucA-2B3j;
	Wed, 18 Dec 2024 08:16:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpEa-0000000Fubn-2jcf
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 08:16:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so2956655f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 00:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734509803; x=1735114603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wUDp16EoqRsfsIHMezVJP6nqUApE9GquXzhoyupwRlY=;
        b=lLklmKkFBv9DfxOC5XU1MOsN+8SCVllI/hNaLKRBkbLkg60X+v14TDgNQ5zzPNmkSf
         qbgwdvravnGp+On4lm5nA/4q6W4PmcJpp52aVekXC7hJ2k9WGydc+J5HSLBjMlpOSE4O
         nsDKw8E3ayKYdQGGhB/gwJIKBChDW72EVJ90JuHddmrxKfqQcOXrvTrZpNg5DxkuyfQ/
         IDA/YM8WW/Wx0uVcW2gq39pOToC+sYxuI1KwkSYhnHhnyvLTLsHtCIl1t9Oeps/z0FdC
         6xYCZt2yjpXdd9roDRM/FyPKCuag3jFHzxZfeasDawESI3XZ/td0PiVKOBiv4I5Lmamo
         nMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734509803; x=1735114603;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUDp16EoqRsfsIHMezVJP6nqUApE9GquXzhoyupwRlY=;
        b=pdcqGNeRSk/gswalZjllWTOIl3Xv0vcTSwpl0xS4/pOCTwRgtPY7HUZ9kF+cuH9LPz
         Dc7mFQmygFIvvBm4kxUVs4ywJ6VmV0FyUcIbHdYUIDW8IK+Ab5ZXb07NmacVwKvpyssP
         NuKtj9WeC4jcN0fsi81hobyuPYfCjOdSQo4Z58xHkiqkbYkgdAO/ghsbhJ9KiPikpB6Z
         dSeJg65MtPBY389GTmUul+p2GuMDOVJ1GAL/bpnjSrpDht9pnDfGcSgQWR5WAkg66PUX
         9p1OD63xUt6vByMCxKok94/X2g+9JwJv6XKhg5PlsnG93Vi7WcAwsRMd2hbwD+TpQjmf
         I2mw==
X-Forwarded-Encrypted: i=1; AJvYcCWL1UVXnB0f/x8AgIANnme7wcIfddmG7nudnUou5C6H53i0m9eNZZB4TFzmhQ6n69M0BKb+iD5IEbQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHZnmFzs+OzNnME5ixVfxeFRCQTwzC28ajJk+dF1HtnyrkU1dN
	108qTuA1QjPQ0VbMEONP91R8ETbliuFQwfVhC+La8s3D5HzqTlugW4H6wvicOhM=
X-Gm-Gg: ASbGncv0B1P2sLwy6wjdCWnHc0r7JlO8iRm09qYsonltDv8SXlg0+MNfHpgHhNsIYOZ
	17oBGzFYs2L0HmGFXFj5R4PzlGYfGF1eZWCrslsijQaHyp+cUmaFUGtlzDEbdyit397PLIunJHb
	m1cY1Q84T8HFjn5uAbnTgS4dlPp3/jt6dbCF7DjPPW7iaNXnT4r8kzOizFMNSQHqL2zhyY+fI7Z
	dZkpqN3XccIszK2hYp7FLZb0PKy24Ca6Dud6/E5QRCVkPYBrEVny9VXahCxGKVm
X-Google-Smtp-Source: AGHT+IFZoNEFr8+5BPLPh/Vm0J4B2pIJzFWkSIhCJGFE4SnpTk6l6WiOeJftw1zVlj7IXYgeu5TeTg==
X-Received: by 2002:a05:6000:4b12:b0:385:fab3:c56d with SMTP id ffacd0b85a97d-388e4c97f56mr1823422f8f.0.1734509802912;
        Wed, 18 Dec 2024 00:16:42 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8060862sm13155133f8f.100.2024.12.18.00.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 00:16:42 -0800 (PST)
Message-ID: <4f523ed6-f896-4c0d-8ccb-66083cd2a3bf@linaro.org>
Date: Wed, 18 Dec 2024 08:16:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] mtd: spinand: winbond: Fix the *JW chip definitions
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-20-miquel.raynal@bootlin.com>
 <bad3572e-34b4-492f-8e60-96b14e3424bd@linaro.org>
Content-Language: en-US
In-Reply-To: <bad3572e-34b4-492f-8e60-96b14e3424bd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_001644_703184_4FC16D55 
X-CRM114-Status: UNSURE (   8.89  )
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



On 11/11/24 2:27 PM, Tudor Ambarus wrote:
> do you want the linux stable teams scripts to queue this patch to stable?
> 
> if not, maybe update the commit subject with s/Fix/update? Or use
> Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

If this is a fix, would be good to separate it from the series and send
it as an individual patch with stable tag.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
