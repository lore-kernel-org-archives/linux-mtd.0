Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739D6C7EE2F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cV0ooE9+iRYkz4FraMfCMglENwXl5Ypl7S2sHSo32/s=; b=nwKEUbyr01vx7d
	0lrhPZkCcUopi7w5GtJPLkM8tm3DzkWV8iAOY26KgzYTmd0g5LIe483Z1sFaQPjokBP5VwHO+ouQ6
	InAYPKYs/8a5IyJYpn9FYSL4Z6ZtP5k/+mU/9bsBLWqDIq3mDaFWR2qNk9OiSGkP/xbrsoqWs0831
	aZ/HsnzSAQu5YhGHoy+8O2b76A7eZv+vUwtU37kihWk31jCDacp2+8l0QW22p8OoPL6NbELLSnoau
	a0USj+UyXyQEfFonKQ2lfrxDit6PjZrMRLgO4N2AZM17QB98VWlXIt3e2HgiVEZnRwtBNAxsCRmaW
	xO5lpwz0Xo2U/JGh3p5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63xG-00EPs9-2k;
	Mon, 05 Jun 2023 06:44:38 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q63xC-00EPpz-1D;
	Mon, 05 Jun 2023 06:44:36 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id F39885FD15;
	Mon,  5 Jun 2023 09:44:30 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685947471;
	bh=a3TTZqZescYVkmvQpRp/TvBnNAhNz1UEIZ0m5Ewqc2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Ag0KQMZn10/9B82BPaqBC2nMj8aP+RDgZh7DcUUb9XsCNl+0zeeSmLUgmi+aFBoPL
	 XWXOM7SMGy+3CS68dAcXnQn9e9OtBoH04sYduBARpYXcjYqbAd29yKP55OoheNyivj
	 9NpvQ08gngec9yh2Kj3U9F6gUaIsE7Y2qMEevMJW26ZR1GDvZNSRl2U980lsvC+WZx
	 dgzHFZWfJBJlrEul/7Ezu47ZwfTCryxr7qYujJ9kvlwrlDew6gVMkoW/f9lbhBw0qk
	 TRCU1BPq9gAeqjVxU3akP7IwdBXApNOywV7NyXQoavulDl0qcNsl2o4du37i4VHFBS
	 gbqVYlycdBUiw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  5 Jun 2023 09:44:30 +0300 (MSK)
Message-ID: <19f809ab-218e-8da5-6d5e-ac47902fa706@sberdevices.ru>
Date: Mon, 5 Jun 2023 09:39:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix ready/busy command
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, <stable@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Liang
 Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>
References: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/05 04:52:00 #21434197
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_234434_766264_5D50BA45 
X-CRM114-Status: GOOD (  14.32  )
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

Hello Miquel!

I exclude this patch from the recent Meson patchset, as it is fix and not related to another patches.
Also I think that I can split Meson patchset (from links below) in the following way:
1) Patch/patchset for OOB layout
2) Patchset for "nand-rb" logic (meson_nand.c + DT bindings)
These two can also go independently:
3) https://lore.kernel.org/linux-mtd/20230601061850.3907800-6-AVKrasnov@sberdevices.ru/
4) https://lore.kernel.org/linux-mtd/20230601061850.3907800-7-AVKrasnov@sberdevices.ru/

What do You think?

Thanks, Arseniy

On 05.06.2023 09:10, Arseniy Krasnov wrote:
> Fix the ready/busy command value.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Cc: stable@vger.kernel.org
> Suggested-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 074e14225c06..9dd4a676497b 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -37,7 +37,7 @@
>  #define NFC_CMD_SCRAMBLER_ENABLE	BIT(19)
>  #define NFC_CMD_SCRAMBLER_DISABLE	0
>  #define NFC_CMD_SHORTMODE_DISABLE	0
> -#define NFC_CMD_RB_INT		BIT(14)
> +#define NFC_CMD_RB_INT		((0xb << 10) | BIT(18) | BIT(16))
>  
>  #define NFC_CMD_GET_SIZE(x)	(((x) >> 22) & GENMASK(4, 0))
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
