Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B521C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Apr 2022 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IixPu9qc6k9yUgxmc9iRSyaaZ4+NHEpYPjkck2s6c3o=; b=okaVog7kvtRhUB
	0QENKlj14aHD1JV36eKo/frzmQCfuDGabbe0kvbcSrtsT7kLnjHXUKde3TlAqg6otolQDd2BhENKi
	n+X/vpMDOFhpkLMYg/Q4ImrOqGJh6joq9A7/lYpcCZd6SyrzPQ1fT2s/gY6POITB0gDDED5x+3x+q
	VzV+IBRkkB9WSe89x3+0cCRAOgcKEyxDIcCbomTa2boUq9hjhyzJ5NfLUrW3KWb7/EcGGY3QqZ6ig
	xWqWYHApN7N1tJigdgxLfP96xrqxqZeC/o2+JWYTwGEgvjjkfXUWGHysapfCI1nfVREcemIeVbVIO
	q5ZrdfcFsok8k1kY8UDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niHsj-004Zf6-LU; Sat, 23 Apr 2022 15:41:09 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niHsW-004ZdA-4v; Sat, 23 Apr 2022 15:40:57 +0000
Received: by mail-oi1-x231.google.com with SMTP id m11so1538349oib.11;
 Sat, 23 Apr 2022 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YzCcIN29nkpvI2UER8MH1YJgdnaztNku+DeAKFhxois=;
 b=bPS7lQeO3AQ9qev+LMicfaSd2cBgPI+se275RPpaKqQnwfecEh47E4m9+HnMlB0ezP
 t6O+ZVYNxjEDkV0BNMRbjM4IEZg+d8uXP/a7Emf+4OabAtCghFGftpb1bWV1mukLZ8qV
 RmdYuBQUi3GSKaz/iM2CI3M2EvqekDDUQVCXfQEbBLiLMYE7astTlYy5L2VXmKgRzj7B
 CoF26P+LzBc+1L4r/Xt1dgQnJlw+HDue2aR6QLVbKodN2yN4GD24YRBW4ltHto2V2ytr
 5lYcNiReAge0Gp2UGylopYkGkUeXhgvRDOBrifLjOVh7PF9pQeb4wISN00XN+b7O9Vf6
 MwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YzCcIN29nkpvI2UER8MH1YJgdnaztNku+DeAKFhxois=;
 b=EQvhBwEAt7imssTscP4d8irNW9jV1MzilhFhltK9I/yYR40tm9fywPniNln9MdH6hU
 xpsg3O2X09C84vQkxAczdTadbKbdDHWUCQNUk1ynloGze6mhV+CRi3joCFwMBsmYZysF
 NH0Xd+eDFhYUkGyT/ETLmjVn/k9W+wW9dSOwVV2I9Mx5x3ZvtD98n88OYB7HSjN1I6Gu
 au9r0kDRa874II0igikgyf6LXvS5m8zxscvBto7FRQHgpZgak2WfIOxWOxG98FlE5zTE
 kUQFGPzwjfl0FOHq8fYaVa6ujUdIsu8gBJmoRhdZvfBc5DOK5Q/IMag9ZYdQlrmM4k+K
 rLeQ==
X-Gm-Message-State: AOAM53044OGcbwqFG+QBGpK3LODZRdCZ4iuMcLn+KVgjxmIMh/kk1BFR
 dAvxqC5+Tw2OffpMgHgnX67yX4HkouN91STwPx0=
X-Google-Smtp-Source: ABdhPJwlk6fRtYGJNDzgjZpgoGD57WULA7uK7+foP97nQ4fYkNdwcgA5K3hCFaH4kNK0C2c1xex2GncA6WGM8t0RhGI=
X-Received: by 2002:a05:6808:2396:b0:325:b6e:6cf0 with SMTP id
 bp22-20020a056808239600b003250b6e6cf0mr943271oib.288.1650728453616; Sat, 23
 Apr 2022 08:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220409120819.3124209-1-gch981213@gmail.com>
In-Reply-To: <20220409120819.3124209-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 23 Apr 2022 23:40:41 +0800
Message-ID: <CAJsYDVJa+UAZNKsYCDSDjjN4NYWZ987y9d_rpaKnmH-Q9i=Nxw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] spi: add support for Mediatek SPI-NAND controller
To: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, 
 Florian Fainelli <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_084056_248553_F9E48F2D 
X-CRM114-Status: GOOD (  10.06  )
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

On Sat, Apr 9, 2022 at 8:08 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> Mediatek has an extended version of their NAND Flash Interface which
> has a SPI-NAND mode. In this mode, the controller can perform 1-bit
> spi-mem ops for up-to 0xa0 bytes and typical SPI-NAND single, dual
> and quad IO page cache ops with 2-byte address. Additionally, the
> page cache ops can be performed with ECC and auto data formatting
> using the ECC engine of the controller.

There are two missing register configurations in this series.
It wasn't affecting me back then because the bootloader set them
for me. I'll send a v6 soon.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
