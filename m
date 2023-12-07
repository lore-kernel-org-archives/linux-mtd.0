Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F39C4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYl4tmeDanncBYbbsNCtVNLAT3duycJPG3uW8dkeyA4=; b=HIICBsapcz08Xi
	4eS+TF+lFbLu7QEiZ3fUjfh2PKafbL+I7M7JdCH/0CXOWgq37ZH16hqBqzF+Wj1aaJZfNwfdHRo7r
	1Lx95gfxMQsoGWMEFO5Z+JJzg+D3PahOd8Mcf0KFS9fbUcLWp0yYNzRjNiyh7MrV0Q3Cz4yAB6/r8
	oi315RT/frdcsPXdTQp78MzXvhEYL9EOPLGuaM+iT0QbUB5DNzLkvSxoIGZmkcN5rzTGOl8wvynJw
	MMihTL9EXegayshafORBCCavwtZISzx5w/qIxkfwzafv3dPVt4n9Mc/qolNO6GJJ40D0rRvTD5fHY
	hPEIr1aLNi1RgS+DuahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBI7S-00DX6b-2e;
	Thu, 07 Dec 2023 17:25:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBI7P-00DX4g-2b
	for linux-mtd@lists.infradead.org;
	Thu, 07 Dec 2023 17:25:01 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a1db6816177so161740766b.0
        for <linux-mtd@lists.infradead.org>; Thu, 07 Dec 2023 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701969892; x=1702574692; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSaCKj49TdBQE/wW0nBbIlYjNisy5X/gJJF/8cHix4E=;
        b=cH+E0QjH3y+M9u3/QHAcHmcJOOk+vxi8S3+LmhCc2HPraBwiBQ2Ph3HHhnZZS7f3dY
         V66kY9i8Bmns/tNCNpnYFVomxL5vfNSK7HOfBOwh+GVqH3DHBxevOYgKQPvZdbBIq/qw
         5bXNOnN3imDLZWNIL+SI52WtMngyH70GRHX/RHrjfgeZVkYX18cpbI5rCXJ21PV5Ag1W
         llkpf1o/RNgnLpXBja5oLclnHePUowCv+jOQ07ztRSQMshWZvPCBzWM3j+jRWDF9HkT/
         htJ4DB3zcl/Que9zYgSkpbWjxWRRS9RkfehJHWOzdEaYJ/uDGIedlXLGlctswC8VRRwN
         wolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701969892; x=1702574692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSaCKj49TdBQE/wW0nBbIlYjNisy5X/gJJF/8cHix4E=;
        b=E7ldl0bP/er0Nta2XNQluKyntUUQg7JMIc8ZHHSkEQgWT1wRJc9umHNdeIOiwM4qdF
         dIzbHcZizjJIieP+iEcL4Ac4rVQSwRmUTTV0QTXspyS5G7ZCVfq+NwDs7fCF4pUa5mrl
         A0j2IzNZCq8QC+eHVm09EB7RtCSvvr2JrV7a1lSw722M+GtY7zhi0vxXiBSvG4ZiZogr
         vTYDZyBh83BjVhFE0CjOyle6JgYGZLKRVgcBm9U71vuOI6IR3btmVviTyv1cuGMcML8R
         3jHJMyxC7Vg61TwysOEWUDIQql7WtCrr7hX3JaoRF1p/OuspIxUkhBjAPAKAZPIOH4pR
         mRjg==
X-Gm-Message-State: AOJu0Ywsf591La7non78oJrbd+fjzkanWDQo3I/fVaTDRctaHplM/XuR
	ugNU2nU37b7i/2SwUeMl7Ulw3Q==
X-Google-Smtp-Source: AGHT+IEtTd+pA4mJobxUqdqM7SglT4EunogmAQ8lpbogM+tHlUMEk4Qwu5mWYwLQ9J+s2P4F/4V7+g==
X-Received: by 2002:a17:907:5020:b0:a19:9b79:8b5d with SMTP id fw32-20020a170907502000b00a199b798b5dmr1010958ejc.110.1701969892432;
        Thu, 07 Dec 2023 09:24:52 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id a14-20020a170906684e00b009fd0102f71asm1078898ejs.176.2023.12.07.09.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 09:24:50 -0800 (PST)
Message-ID: <797b9023-e56b-404b-bb4e-6e178b7ada88@linaro.org>
Date: Thu, 7 Dec 2023 17:24:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sbinding@opensource.cirrus.com, lee@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com,
 amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_092459_846702_D27ACB7A 
X-CRM114-Status: UNSURE (   7.12  )
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



On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> The current implementation assumes that a maximum of two flashes are
> connected in stacked mode and both the flashes are of same make but can
> differ in sizes. So, except the sizes all other flash parameters of both
> the flashes are identical.

Too much restrictions, isn't it? Have you thought about adding a layer
on top of SPI NOR managing the stacked/parallel flashes?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
