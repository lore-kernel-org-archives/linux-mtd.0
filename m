Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D065C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyHY/zhOkUoffIEoPBdNBcwlMS/hjLwDdnqIpw2EikQ=; b=Vzd30SJ57/3Iit
	4NCuFOlhz0YfP4qbS3GEFAMkqUnyJVRdJ2n2l2L8SKXBNLsDk0tiaAwc92MgRA5WtNJ4aj0DhpQrG
	74NN7jeUA5JFwnOLkfoHvVsjlQY6Eie0IV0SdTSYA5o3DLtgbhR/4/jIblMGiWEHEE55CM/J+ZfpO
	pKJ6VnIGO4E5MCKwTU+xbAEUW23t3Ept+dxfPMsDO0nktd5wpugcObD/Fd7sKxsYWmi2bRxmkA/Qo
	txL/+1OSZHKKFl/o/FZOc27l/OXNy5D+pwAA+YSEkrGlDiweF41AUf/WqJ+8T2UlBlt5EFdgXSla7
	stad/W1qU2FTj+5DZ4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q70d4-007Hsl-1g;
	Wed, 07 Jun 2023 21:23:42 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q70cx-007HqZ-2o;
	Wed, 07 Jun 2023 21:23:39 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id B87C75FD05;
	Thu,  8 Jun 2023 00:23:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686173013;
	bh=K0aBaIg4zf2P0UykGVbyuQblC6R5Fsbn4jzYeUZ5cVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=RJPwrIG+MQIcHsO9Nhu/gQ58DIm+894yvtHrU+Q92KU82XOp8UpwOW82+Gqp1XEua
	 Z8KtPzwPfPnmtxBi9nGAwp+Th6kTbHl6mLYEJZuM114XwwEztLHnupn20lJuQJFQca
	 x8154u7ZjXbRKLeuNfpGhLL6yvGT5U09qhsL65WW1y4pMPw9TEzs/T79r7uuyJFTaj
	 EgrEsECVXw2dhLQoJZfEg7ANHLzzBuitbrb7QPTHO5FN/FRZ07nCZhWSOvwG6Iwsbr
	 E5lo5yCk5KFo2uHP4y3zMZXlFQTzLw9gTQcpaKaqqFSukPG+Vy2hy2NcGaT/T3J02T
	 s60QzUGD8A9QA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  8 Jun 2023 00:23:33 +0300 (MSK)
Message-ID: <9319a8f6-3774-0dc8-2262-8033f8016a50@sberdevices.ru>
Date: Thu, 8 Jun 2023 00:18:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: remove unneeded bitwise OR with
 zeroes
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230605191508.1826853-1-AVKrasnov@sberdevices.ru>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230605191508.1826853-1-AVKrasnov@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 16:55:00 #21454472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_142336_089113_44B0F151 
X-CRM114-Status: GOOD (  14.53  )
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

Hi again Miquel, Liang!

What do You think about this patch?

Thanks, Arseniy

On 05.06.2023 22:15, Arseniy Krasnov wrote:
> Both operations have no effect.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 074e14225c06..50d3110ad321 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -595,12 +595,12 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
>  	cmd0 = in ? NAND_CMD_READ0 : NAND_CMD_SEQIN;
>  	nfc->cmdfifo.rw.cmd0 = cs | NFC_CMD_CLE | cmd0;
>  
> -	addrs[0] = cs | NFC_CMD_ALE | 0;
> +	addrs[0] = cs | NFC_CMD_ALE;
>  	if (mtd->writesize <= 512) {
>  		cmd_num--;
>  		row_start = 1;
>  	} else {
> -		addrs[1] = cs | NFC_CMD_ALE | 0;
> +		addrs[1] = cs | NFC_CMD_ALE;
>  		row_start = 2;
>  	}
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
