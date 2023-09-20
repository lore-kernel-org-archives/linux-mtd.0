Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B48DCE79D0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lah6fO59oQsVmrY6wwIpjIgH9cTn+345RMtgFmLJclk=; b=AMNuUXQ0Eq6Dns
	Xphxke8nsHhe365QhwR45zzuy3tnmE4nOXJq6GoROosZEzlcqN5UETX3OGS183mUdtWybe6Szbb+n
	5q+BRqs1ab1xj2TYVrpcJ+0vq11RNniS0ShQwvJq63kLSShOqmoCct+7NCiJo3Q9Mru51khMokT7O
	yN0PYjKeVpLmWiNg+bToqsUyjWHyiSrU3tK/10tl9t/uMruZ2/j1C9pHcj50WdFaowS8Lw5M+zWP5
	ojb7DLbYCnlCey5u1AFvro1YBSkI4j3iMyebdG+N3+z9wbA91zb2A6jKVP/WA4k2bhOxbZfyZtYd0
	CeVKK6o+bPpaO8rajN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwfh-0035cI-2c;
	Wed, 20 Sep 2023 12:51:13 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwff-0035bV-2e
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 12:51:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-502fd1e1dd8so7500284e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2023 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695214268; x=1695819068; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7cf0erR3So+wl4WK1bypTDDu5X0Az91EVBHKcauPfBc=;
        b=TRf0bBoexeHK+iwuUSQVris+UScRXPzTJg/ApgV4de0lGPhsFQoyW3sog5+APIfkY9
         WLPiht345M/R+Re02Ww+IFcRntRZ+QmtYA0er0uyx+Vbg4Abl6HYB4zIlliT7n5zmaRH
         j3rX/gjNKyfw7YV7QsU8eQntFtpzix5HBN+oPCbKE3Sohjw77IfW68Q4C28zti4utU8A
         b6K1Bxsh+8TUHK+ScYlvrA1F1PApCy/UkejEqgmrwL2hk+aVmZwJJgT0o15mhfRMdw/3
         muZguVfvEvladmJQoqcOLLTxkTK/XrMVHgCqgYkFJv3YouKGT3oxNmY0sttRmbm3CChS
         JlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214268; x=1695819068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cf0erR3So+wl4WK1bypTDDu5X0Az91EVBHKcauPfBc=;
        b=Ymt/5+W8hkCJv0ic3WwqtMGL5KYGdf7kktkalopwxHUjNxkc85OHqebTFJ+Llc6H8d
         QDaAAT5m7XWNaIsLKVjNdfajqrI6LhoK9+3o/aGdYhjOUxxHSwOwyWzWwKaItdbdkLey
         aAu4ZlPkkC4bOtiz9Nr1HvCdBBeu3PNBDIR8g8+Xh0Xw4V6YSXwTJV1z5aWf0QdtwI9r
         ovUxWB/xL+oJ58G5oeQKRnTTRYowNgNdCP9xkS1mN2RrdbVNNNir4WxhVZY1VYAwsgbx
         plLdFTSCwHDxYEjgsR8IEwnNUlMmZXx0nMdzURrim1qRLIsxfwFzAoY942I5nickvMoV
         PA3Q==
X-Gm-Message-State: AOJu0Yx0fvxdytD5sPTFJ8cJHQDXYWyYelTdTWpGhIgiUh/1HqJs1qfD
	qF3ABc5Xd+5mRyT5GTUXBU2OuA==
X-Google-Smtp-Source: AGHT+IEb+YdefAHsSqt3zBn51zmfcPQTu8ilEb8fgPk1/Hn3KQUceSbuFOV9kl3eahQYD6E4qiNwjQ==
X-Received: by 2002:ac2:5976:0:b0:4fb:911b:4e19 with SMTP id h22-20020ac25976000000b004fb911b4e19mr2317459lfp.35.1695214267572;
        Wed, 20 Sep 2023 05:51:07 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id v4-20020aa7d644000000b0052567e6586bsm8936167edr.38.2023.09.20.05.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:51:07 -0700 (PDT)
Message-ID: <fc454dd0-3846-a1e2-595d-7b687fb682f0@linaro.org>
Date: Wed, 20 Sep 2023 15:51:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 5/6] mtd: spi-nor: core: Allow specifying the byte
 order in DTR mode
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-6-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230908064304.27757-6-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_055111_900536_EB14EFAF 
X-CRM114-Status: GOOD (  12.89  )
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

On 08.09.2023 09:43, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
> The byte order of 16-bit words is swapped when read or written in 8D-8D-8D
> mode compared to STR modes. Allow operations to specify the byte order in
> DTR mode, so that controllers can swap the bytes back at run-time to
> address the flash's endianness requirements, if they are capable. If the
> controllers are not capable of swapping the bytes, the protocol is
> downgrade via spi_nor_spimem_adjust_hwcaps(). When available, the swapping
> of the bytes is always done regardless if it's a data or register access,
> so that we comply with the JESD216 requirements: "Byte order of 16-bit
> words is swapped when read in 8D-8D-8D mode compared to 1-1-1".
> 

There's a bit in SFDP that specifies whether the flash swaps the bytes
or not in 8d-8d-8d mode. See BFPT DWORD[18] bit 31. Can we query the
SFDP instead of introducing a new info flag?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
