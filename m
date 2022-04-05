Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D958FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGp/uQs586IC9YUxduE91UTx/9d9LnMtr2QZzG/dfVU=; b=GldOuP1fKTEIem
	TqhykQx5q0YihmcgFqMN2Tn8ZCToekhBPZrsOLPC/W4CvT2RFRwi5YJuEk7f0HO0ZWzMiOw1ftnqT
	4xiE3fzwkobzJcHAdF57KV+ol5jIRwb+ST20bqfJJdgIA2uPVEOp6PILb9mxzi2GdSS0pqAqxDbAk
	/KE91xcX7BP5ddrMyqGUiC57lW8+R2c/YHR03Ls6YafRfMrvsPw4e6FT5v6ZJxy5ANJlIOKqLiGHW
	J7PTWwtKe5tyiSBxIEI6TXagiHTS9q8/yLZuiaNR4+Tk9mUoqEudj+K1NfHvE4cVJ6H4fJF/j2F+z
	GYH5VzZG8LEY4ZZ8afxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbljY-001pmu-3n; Tue, 05 Apr 2022 16:08:44 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbljH-001ph8-BL; Tue, 05 Apr 2022 16:08:28 +0000
Received: by mail-il1-x132.google.com with SMTP id x9so9550751ilc.3;
 Tue, 05 Apr 2022 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hW77YXphKvERuG5H+iUJ9uDZUjTyhWglFK1sbd/bTfk=;
 b=fUC31B96e41c6xmeoqpvrYUa+mUJ1GYiAW7u8dnTGZSOQ7OWqfyoSDvmCBT+eQyqiM
 UNdcfy7aDYv4YEBK6yTK4m94iqB4mpunTxsY35VKeoiyjYBvjZlArvV/DuQ1TafofBsN
 B8jnMYbhZHuAtG0EsMlbVVyM5/HNlK6BRp6Hl4XkThnT78hLnj3HpF4llnx3+OYAEU5U
 x3+rpPlMUisFFcYPr6dB1CgV3FqngwVsHqBKUAIg5DreEgngpLsbr+alvkf5CRYW+Tcu
 pxzT1+QZCWMKPsEZ8VNqb0XAtv+y2b5SWNMcGsIME24NejuAZ2pboYge6GEjQcCKTQBQ
 O4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hW77YXphKvERuG5H+iUJ9uDZUjTyhWglFK1sbd/bTfk=;
 b=s/sSwTlCGW5ZW+SKUxWNwsP1ddR5c92axFVatNL3uVbIfSVzh5+EHgZswdACXgfBfS
 fVuR3xr+y7ArUmSxqxxNgA+vuNWO2/DVRYZ79n/qipr8ydUrQXJgxhfIpCp1blSBz5Q8
 aBBBRASlaXh3curNnjQoCS7RhgcYKMOA7gpx29KVu3wa67EqMSNzELVHaOE5BBgHhm67
 WXqhBvIbp5toy4PIuywa0+7mfJGSTPS+SwU7oi4vCE5O/f1XrkXWiqxsCvJADM8BUebh
 Xxp635rijkX/dP8Xro5iPNOqwj8o5ahyeJEaIqb3fr4DfCQILGXjI1EEeX1Miiv4CAIN
 oEig==
X-Gm-Message-State: AOAM5333728Gf+Jt9lRE6TwY+HKDjzRzdEHg/HQQbSuo4ioY5+GqLOxY
 taT+XhQoyGEYC7O+NFJ2jCz3zSp/fv7QEmihXqGLb8y5LtMa6prRz0E=
X-Google-Smtp-Source: ABdhPJz0ff0WGn+zTKCeGfDo2EgfINMJ8I4npVJmeR2s6MXHr0OMaXaR8zU6qWKRN7KTFA46Gm77KGlaYFiEhbvOSdU=
X-Received: by 2002:a92:7f11:0:b0:2ca:50f9:63d6 with SMTP id
 a17-20020a927f11000000b002ca50f963d6mr2222344ild.150.1649174906221; Tue, 05
 Apr 2022 09:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
 <1649088538.050456.1436949.nullmailer@robh.at.kernel.org>
 <CAJsYDVLaXAoL=TcPun6rckcA_cdUS-zFy_7M6uCpfzX+jbQEag@mail.gmail.com>
 <20220405092024.25d97c33@xps13> <YkxlsU+P33ip2oWH@robh.at.kernel.org>
In-Reply-To: <YkxlsU+P33ip2oWH@robh.at.kernel.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 6 Apr 2022 00:08:15 +0800
Message-ID: <CAJsYDVL_-dkxRsU24NmWA4KuHTVSJwjbr_9kcVcLao=LYSz+Jw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
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
X-CRM114-CacheID: sfid-20220405_090827_427705_DE2FA510 
X-CRM114-Status: GOOD (  13.50  )
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

On Tue, Apr 5, 2022 at 11:52 PM Rob Herring <robh@kernel.org> wrote:
> > You can try including spi-nand.yaml (like you do with
> > spi-controller.yaml). You should no longer need to define
> > nand-ecc-engine then as it is already described there?
>
> Including spi-nand.yaml is wrong. If that just landed, then this may
> have run before the base moved to v5.18-rc1.

spi-nand.yaml is in v5.18 only and I'm able to reproduce the
spi-nand complaint by cherry-picking the commit to v5.17 and
running the check.
This means I don't need to do anything with the spi-nand error
then.
Thanks for the hint.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
