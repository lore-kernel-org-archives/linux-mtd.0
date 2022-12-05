Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD43C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsWkq7uMiDwsEU1kEkZUpgTXC+yVAObKzHa/e+tKd40=; b=1yZ5pZW0c/cmAp
	I9N+Eq/wW3xpBa8WXoRJfxHR908Y10kfgLCCzykYyf4euD4E/4nrALY8kbd+s/4GgpQtuM6e4oNOr
	ASUoNKk2DM8EjIa/DU6rBbIZ45xSczQeAkDwdD/xizwG5DEmfhhAhsV5BT+YyAP/0kGLsCkfwabo5
	Lj4k6RwH9xeytLu8MhTo/WzuEpuuj16TIdbwRQmhIg/rNLrFrl8CKWVBQo7E0+vhysnxkp2q9qCNy
	WYQtW2ECxKV89bsxvu3j+rPPjaAqHx5m5TqY+vDF5joZO3U9e55SEencY0Bwon6PUukHGcMZjOM0T
	818MUKK/ro8NM8f0tI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27RD-00GnpP-Pi; Mon, 05 Dec 2022 09:06:59 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27Qr-00GndW-LG
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 09:06:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id h10so12755080ljk.11
        for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2022 01:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5ZTncPZSmmM8YtV3eOV41TWmby1NfBlelF9byY72Kg=;
        b=FmQg61AYiojSXcPEVg2/VcRA64ZyruSZKCoC8eQjQAszR39C32EmyyE2UMnY2+JKrr
         /+YJm4qduR5MqPaRFPOInuqZRtsCX+o//SjummVVvTG5PSnA7mWhjRfnGcZ5sX+RO0Rw
         9brAMt46fQjdDgokS3QsGPh51/SIcvwFe1qLji8P7vleSGlgxmqQgvjJxgVTqGxo/iaM
         SkdrA3fA6MqHKUVYjLJg2T+Bckj8JUhspL9poqyf4q8lABjkj7sJJB9xethmES8kzIs2
         Dy3ZpSa9wxj2P2Oymp1Pq9oELhS5JQz8bIJ85VoNEhpkQGaLnymh6NnqZrP02boVg/9p
         puXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5ZTncPZSmmM8YtV3eOV41TWmby1NfBlelF9byY72Kg=;
        b=n1++vr2VLvF6VbpkiZ+EuJqcbF4kAnAddoB3+jss0pA+1caHgqvyHRXRFAgU5hyyTW
         K8b1kgWrmTIJXrhymJcpBBMNwUWm3+6vKfSNfaklvaCyL1fDrglRV5b8oz3xwngGV1Pa
         D1pJD50LjcKiXjbc0z7vInXRz/rSMwT5hWTh08HClpIx9GXe8i7nTUjd1Szkej+chMLA
         BFusae37aY9bEu0XPnO1f1m9hDYPqnozfCPGO6ug5dkm2szppZSUSSeEKAnROshT1YB9
         oc7oXykxWcjBesEqebfajuVzwlgXvdrgqnz77ojz1I8X3gOoDR4sJO9cTO674do3RnGK
         Lb8w==
X-Gm-Message-State: ANoB5pkumwiJjzwcymyyAAgLRJLbdX1sopZgkg+4HyaUqz52wtTz0cFw
	jRwLiLCiKj47TUXVP3Es6egc3g==
X-Google-Smtp-Source: AA0mqf5S6gXj5coEIP8nqbgaKkxlyuQq8uWDpyo0HJ5TZT9TjGF08Asdm4bnWFPa0NFzDd9kn9gA9A==
X-Received: by 2002:a2e:a9a0:0:b0:278:f1a5:a365 with SMTP id x32-20020a2ea9a0000000b00278f1a5a365mr24403347ljq.29.1670231193792;
        Mon, 05 Dec 2022 01:06:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu4-20020a056512168400b004b51ab265f8sm2041942lfb.193.2022.12.05.01.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:06:33 -0800 (PST)
Message-ID: <d320f49f-b304-4ef7-1d50-5c909c6fd108@linaro.org>
Date: Mon, 5 Dec 2022 10:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_010637_728216_402B1727 
X-CRM114-Status: UNSURE (   8.03  )
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

On 05/12/2022 07:57, Xiangsheng Hou wrote:
> Add mediatek,rx-latch-latency property which adjust read delay in the
> unit of clock cycle.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
