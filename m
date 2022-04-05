Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44231C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 14:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xR9UY4YmZiQ3hsgvgo7e1+8xi8Ft5D8mQKXy/O1OWl0=; b=dB6nC1OfTeLSpd
	VpvQ0vQ4nrPuBGr5t1457/gq0jHeDVqVPBzEoAVM5Ci9u3C+frMjoDdXO14k01cJhukCpuXt4A07z
	NxmJYEob9Xso/agAnt3VuPKqMElZpW5LiHIvQ4RWmqakLAoXUZHAXKHSga8PI1l1xdXQIqcq5ZOBw
	YQ+fk/srZQH+wiYSJjCZMoJQxp3PBqfiY4xa+UmWwhUqYx77i+pA2DF//5/tNIWTPidKQWym0VrKX
	OLaTP+rHobwsCtA0YbU6li6AfgDIeIxxze9WpE78+4RYq+jZ9lWwgT9fk3/IX1JZh7/zGFPugdp1x
	iMIF5dZdv70QaSMVwsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbkLb-001V8c-2j; Tue, 05 Apr 2022 14:39:55 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbkLN-001V3i-RZ; Tue, 05 Apr 2022 14:39:43 +0000
Received: by mail-il1-x136.google.com with SMTP id e9so9327284ilu.9;
 Tue, 05 Apr 2022 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u/cO9n221kA+5ADZGdYnf+fYVWdb03GaAd0bxZEtbWk=;
 b=MzQwaTornZRnR7GuZfl0GZwph6GH8tWgEbCituXvQX40VL/XmXvrRmKIQY6iKlsfSa
 0Dv9GxL9KDMnR0Tot7B+e8OibqFGRTemBt5ikaubRHbq3SG4nIFZwSiXe9i93yqv1tYS
 j8Cdxq/NQ4CM47pBPl8gxNP9vigDbtE6S9Sf3GkxlUO+7SDmtzt1dGtJPAGjs/9NyIJh
 GzD6CqSrVRfr0Hx9po1gGBbuQLtPvpAAGbH9uwGR3hMO5aIBmlwrfHtccEi60hUKZ4ak
 p82hT8o9SsUDJh+bfE6Pg08evMuzcL3YrAxRem7+SCLg5D2RPDdot+Nn3iAzkJC31ZZl
 Bhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u/cO9n221kA+5ADZGdYnf+fYVWdb03GaAd0bxZEtbWk=;
 b=4n2SOQwVv8BtiwG0H6M/lBDZKIRTnHs2gFkPzWw0i+D+2qWmDeqt2TqsAfneujvtY1
 21qFWPeBwwcs+ABlcL3d5rsPNyM8mPgrh69Kd6lW4txCZJl8VGhAgyEA+kBYO1n9yH6z
 olHdFSeNh+qJf+zngJ490qZY2/w2HQCUqhrXe2YHswuUiFVfjYJVvp83ptWdEp+QiKa7
 7ZVBMy+8mxBgA+RYyl67YpN7SkBvpbPKMiDQ5r1nrYh7E3zTBJtnxrLDu1Tkws/PddAk
 5/J81PcMUc3etZLmVWE2fNmyOVxd/J2En+efOUuZZy/rxT1n9geQutY6S7qCfXr3W5AG
 m4Xw==
X-Gm-Message-State: AOAM530LAC0FF5+xAFJEgZs5JBFLiE6MdwheY5HgUjnpmSk7p3i+Lv0m
 pyTPgnkOHBWEcioYUKV/o6Z+/u1MEbK2/AeseKl53Rx2Qmm6QNavB0ESHg==
X-Google-Smtp-Source: ABdhPJyLSwS3gzvbWUvgnsZHY5oFlCEmIY5mpJYVzgiyLEFiDb2hEM9naW3CpjZf8nK9nUhDxM162/gpsl29HLJzf30=
X-Received: by 2002:a92:3405:0:b0:2c8:70ad:fa86 with SMTP id
 b5-20020a923405000000b002c870adfa86mr1949268ila.268.1649169579699; Tue, 05
 Apr 2022 07:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
 <1649088538.050456.1436949.nullmailer@robh.at.kernel.org>
 <CAJsYDVLaXAoL=TcPun6rckcA_cdUS-zFy_7M6uCpfzX+jbQEag@mail.gmail.com>
 <20220405092024.25d97c33@xps13>
In-Reply-To: <20220405092024.25d97c33@xps13>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 5 Apr 2022 22:39:28 +0800
Message-ID: <CAJsYDVKVaZtrUr5C_BCr+oVECJ1xJwfh5TOMpo-w3xgkYCBYSQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Pratyush Yadav <p.yadav@ti.com>, 
 linux-arm-kernel@lists.infradead.org, Cai Huoqing <cai.huoqing@linux.dev>, 
 Roger Quadros <rogerq@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
 linux-mediatek@lists.infradead.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>, Florian Fainelli <f.fainelli@gmail.com>, 
 Colin Ian King <colin.king@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_073941_948441_6FF7808E 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi!

On Tue, Apr 5, 2022 at 3:20 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> You can try including spi-nand.yaml (like you do with
> spi-controller.yaml). You should no longer need to define
> nand-ecc-engine then as it is already described there?

This doesn't work. I added
- $ref: /schemas/mtd/spi-nand.yaml#
to the allOf property and dt_binding_check complains the following:

Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dtb:
spi@1100d000: compatible:0: 'spi-nand' was expected
From schema: /home/user/src/kernels/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml

BTW I still can't get dt_binding_check to complain anything about
spi-nand. Here's the command I used:

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- DT_CHECKER_FLAGS=-m
dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
