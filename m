Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DDFD2E9F0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8furqguAg9miHNAp2KRf8SZsHjG3uW0z59ioIuKJ6gU=; b=3XIO6YRziMqcal
	vGFGKfmIGn7YY3wGPzkNXiRCAOeGAz8cifinGAMd8/vJy+EIxqOQ6gMfDjvYlXLpUVFfNLOkZ96O8
	tMC3atxF8/nEnID+v8pqE5WnAK/s3Xd3THbPGIi6/Uu2Uh19KTm9aiAZBM8ZkuNYhKQWR1t5j81md
	LcTCwhZikvX0PUnBkSokGEj50k4/I7I5WQs+/Ppv0BDm9nQ38WJeSZlzSlO00MK0IrDNk2Pnjp8ot
	v7J42XACCPRmRjuQppO68Bc6W4vSRKzJnANSwXYwfHjkvDPxaap2d+pvLtQr2lhXL85aL7gLnnZ2z
	yqCxwFh7Df0nv3cotvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVPw-00000000KBn-1MBn;
	Mon, 11 Nov 2024 14:29:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVO5-00000000Jv6-0PcR
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:27:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so40152835e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731335247; x=1731940047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnb/R/lZh81r5fO95qcrMXPQmjrkikZTx+EMey6q9f8=;
        b=qPalpRzHhmi942LbOERa8yJZCpd81jwy01o9/AqpmwgsVS0wzkdZgXsla7KzJmauDe
         fQy63MGoWc6uQFgaeWHZzXPBpBetdIVJYNbPYGH3VjpNGnFQpXmq0rY5p4OmbJWz8R0+
         jfOpjTZZhQQxTMd0pcZ3x6dZ1p1xXfI397Jz76b9vGJrjvugj6eChbf9v9toDnqbirb/
         iEdCHCaGapgXw03l/9qxaGCIU5R/eYq1TW4VnuMSfFKEgQXRI1XFxADH/VjUiKWmg64f
         B89ksaqBD2/V6+Eih7qVUyGUmVzSOxu9hIEBEDw75JnxETzJZKlrQhsyiqIGQdtzfP6A
         ImOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731335247; x=1731940047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnb/R/lZh81r5fO95qcrMXPQmjrkikZTx+EMey6q9f8=;
        b=K/C7qKXNGgUjzYNrA+NrhjqJD2VCrDP8WUhC0DEAG25i1Js0lMChCx3+TVpk/a5yjO
         a58GJQhXD7l5dS8K1muJ88AjSKCQKWTxktgu/j3ZHNEXbdgrPVoxmAEDMVz+TvSQrbGY
         XV0ZxQsuK18RxGGGk/5Yg62nAwMMlcgS3w3AeehmXWcM+abhJ4GFx9JATNFDmXuu3azj
         egQn8xJc0bIExvuV28jwm1/RHE0M5INvJ72Ydv/hxD+aUP8qN+BXtujzoqXg4lslGz+U
         Uz/YIWdFQm2SmIKAx/Uu1vb+mPG6Vo04mtpjB5nNW1eCK07LJYHQRzN+sZDCNl+TVSdm
         vhVg==
X-Forwarded-Encrypted: i=1; AJvYcCWMD45AGtdMLsAVBfMvsXUdU1VQ8nbCo6HuuMtYsLywMhVTMXY4dqgrCeIfbDEL2uquwkYY9FOEnjc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8F9GNcE/1LZMOydhxmqQgvA5F7zFvC+fKe0GrFIstHhgtEIlw
	CnwL7ilV8JWtds0o7fmFtYMbPUyHRn2jUt2fSKLCLNVJ65K56fes734TG+YjDZI=
X-Google-Smtp-Source: AGHT+IGeLWpTjcE4QT9BgWiTbU7KWgVXfhLATKShyxA02C2WRhlBQmi65o2QaKNYOSYB9di0NKh4IA==
X-Received: by 2002:a05:600c:5104:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-432b751b650mr97501695e9.20.1731335247630;
        Mon, 11 Nov 2024 06:27:27 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054bab8sm174979475e9.16.2024.11.11.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:27:27 -0800 (PST)
Message-ID: <bad3572e-34b4-492f-8e60-96b14e3424bd@linaro.org>
Date: Mon, 11 Nov 2024 14:27:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] mtd: spinand: winbond: Fix the *JW chip definitions
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-20-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_062729_168540_EF63900F 
X-CRM114-Status: UNSURE (   6.03  )
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

do you want the linux stable teams scripts to queue this patch to stable?

if not, maybe update the commit subject with s/Fix/update? Or use
Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
