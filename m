Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0010CC77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bs8qsZFpnzjOH2aIWjviqYSRuTYC5vvR+aCmnR5VJp4=; b=eyUfbbGjF0vHDD
	wNYwHSGVcOL+Cc7xxFUh0BgXimj9+iFRnDQ5vPPeuuIeiW1wGIrY+HS2wnVrAWalOfYTlJW+aMqZW
	jlshLT2id5ps5SKOnL7m/DNQ1va/y6VLoSHC/wArkehm8XJbrRcDpLaAVlrALukmm4cn5sNWs62M1
	9gsFlZpDgzs0TPF9V1CUUu31URHyX2FKYHcbnUK5fmWTcV6zDLFDoqzdbSBxfTw1VZcRBsO7Q7ITE
	dWqxVFOYCWJvcJvmzLK4KfcKv7+lnR/krqIB4CUaSb7R7mOWTwY6XBV0J6yDkgcbWJheLD9hnxGX3
	AmtmxHUXW+PX3HG/XqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXVE-002aiZ-2F;
	Wed, 12 Apr 2023 10:15:00 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXV9-002ae7-2x;
	Wed, 12 Apr 2023 10:14:57 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6548A5FD61;
	Wed, 12 Apr 2023 13:14:53 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681294493;
	bh=syojLji4UO4OZzZa1DKzyOBdJQxEr9LBga4/LUwWp54=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=AsqjhC+ZuNZF9s+691wOoLc2Ms9TdXBrCtbe1z3r4DU9424pHzoR9EJ2vyD5qeyFx
	 RoQtdP+XZlG/xPwgS3vDuneYvqbm+oFCjJ3aY6UNR2PWIPOcU9Z1qdAkNIonADo4GF
	 xi7bBozi1jcO7BN7A/40SZWL5JAWYhFHEKxuecS9RGlEnzBDPZHpx3/bEffxxntC+3
	 g0oqkt35UShx9ksK7X6MPA8a7e+9OfYn0W5F384QzCjQl6w4jCbh5MW8iicWtvNCf2
	 mFnVp9gVquC6FHYDIqXDc2puNdX5zy2cgWTwsdLl9NLvdXi6FR6aueXFsDBLcuqYUh
	 o4RjCPQ87yiUQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 13:14:52 +0300 (MSK)
Message-ID: <8f8d4a22-11ea-3b30-9b95-f27c5209fe5f@sberdevices.ru>
Date: Wed, 12 Apr 2023 13:11:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 2/5] mtd: rawnand: meson: replace GENMASK() macro with
 define
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>, Liang Yang
	<liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>
CC: "oxffffaa@gmail.com" <oxffffaa@gmail.com>, "kernel@sberdevices.ru"
	<kernel@sberdevices.ru>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-3-AVKrasnov@sberdevices.ru>
 <2f89000bdbbb4e2bb7f1dd96c1b498f9@AcuMS.aculab.com>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <2f89000bdbbb4e2bb7f1dd96c1b498f9@AcuMS.aculab.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 04:12:00 #21090163
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_031456_133124_103D77C1 
X-CRM114-Status: GOOD (  11.05  )
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



On 12.04.2023 13:06, David Laight wrote:
> From: Arseniy Krasnov
>> Sent: 12 April 2023 07:17
>> Subject: [PATCH v1 2/5] mtd: rawnand: meson: replace GENMASK() macro with define
>>
> ...
>>  		len = mtd->writesize + mtd->oobsize;
>> -		cmd = (len & GENMASK(13, 0)) | scrambler | DMA_DIR(dir);
>> +		cmd = (len & NFC_CMD_RAW_LEN) | scrambler | DMA_DIR(dir);
>>  		writel(cmd, nfc->reg_base + NFC_REG_CMD);
> 
> What is the point of the mask?
> If the length is too big it just generates a different
> 'hard to debug' error.
> If the length can't be too bit there is no point masking it.

Exactly, thanks for pointing!

Thanks, Arseniy

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
