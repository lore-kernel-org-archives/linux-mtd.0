Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640FAC6FD18
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 08:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seTyUScV2flN2bKKevDMkm0xhLTRFFHnD7LIL4O224I=; b=MKJ/8GDRUJb/th
	V5ugSEtenwEw7kWUxtC/OO0z89kNsaAegy4G4edqiiZoAgU1Cw89GEg68m/7Mz5Je9+nXf7YOQZCO
	m6XPYBkH31YH1IMZAiOT3tWEZC6vzK2/q/rPsJnfX5SUWwmwOakOgC8awdflbkhNunITfTrRxhIr3
	whGl6bOn4umrsacICy+vxNSTqowCdIMX7elJgStJSXu9495UbVdDX9Byap98DYxK5obsJE+4BU7sm
	iYUErYW12v73O0jItyoQWF17IMu/IgT5ugWnzN7Kcjdxi+EZvt/C9kYcLNBzJn6ur49FoS6pGQMO8
	kz1oTSL8G+OV7c7h2K8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRIv-00H8Ok-3C;
	Wed, 29 Mar 2023 08:37:13 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRIm-00H8KG-1B;
	Wed, 29 Mar 2023 08:37:06 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 419BC5FD06;
	Wed, 29 Mar 2023 11:37:01 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680079021;
	bh=mKsNAk5/DGfisdq4xh+Klk//35W39m5NPIJzVVuCimY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=RDDBiiKhVJfhYOypMlNNyTitm6+/iUKEn/jGOKyRarwEHZEC2iJjfS8Ah5aiDeD49
	 lJ7ILFyRr4jr2l6oOTUHNXqzrOYs/qeTP9tcgzrxpZtrodfSYyEdmCvsqV7tLz8vaE
	 /KKChUqBwHMvRf5uCrukudvSHhST/DV8evYD7eyfuwbMYsPPupBWjDKmyEwA+ne8xN
	 H5c/HXVsNpyY/j6hjaiws1JNlMsjldtStD06yIiI3/e5LaJArqqPA3bX1xD+hRbrkz
	 e8fL/uQnpu4XoZuu8STC9xGpznXXaBobHIUS/FuLfTNX9EMZl+JixrY1bVCS9XxE5k
	 1pjssiu+j2MHw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 29 Mar 2023 11:37:00 +0300 (MSK)
Message-ID: <c110bd0f-f25a-a74a-07cb-4c3fdb8ef306@sberdevices.ru>
Date: Wed, 29 Mar 2023 11:33:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Liang Yang
	<liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, <oxffffaa@gmail.com>
References: <3794ffbf-dfea-e96f-1f97-fe235b005e19@sberdevices.ru>
 <447abc1b-b4a3-5848-c99a-ecbff11486fe@linaro.org>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <447abc1b-b4a3-5848-c99a-ecbff11486fe@linaro.org>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/29 04:10:00 #21025776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_013704_755261_F67CAD91 
X-CRM114-Status: GOOD (  19.50  )
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



On 29.03.2023 11:09, Tudor Ambarus wrote:
> 
> 
> On 3/29/23 08:47, Arseniy Krasnov wrote:
>> Valid mask is 0x3FFF, without this patch the following problems were
>> found:
>>
>> 1) [    0.938914] Could not find a valid ONFI parameter page, trying
>>                   bit-wise majority to recover it
>>    [    0.947384] ONFI parameter recovery failed, aborting
>>
>> 2) Read with disabled ECC mode was broken.
>>
>> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
>> Cc: <Stable@vger.kernel.org>
>> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>> ---
>>  drivers/mtd/nand/raw/meson_nand.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
>> index a28574c00900..074e14225c06 100644
>> --- a/drivers/mtd/nand/raw/meson_nand.c
>> +++ b/drivers/mtd/nand/raw/meson_nand.c
>> @@ -280,7 +280,7 @@ static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool dir,
>>  
>>  	if (raw) {
>>  		len = mtd->writesize + mtd->oobsize;
>> -		cmd = (len & GENMASK(5, 0)) | scrambler | DMA_DIR(dir);
>> +		cmd = (len & GENMASK(13, 0)) | scrambler | DMA_DIR(dir);
> 
> What happens when len > GENMASK(13, 0)? Do you check this somewhere?

'len' will be trimmed. I'm not sure that this case is possible here, because GENMASK(13, 0)
is hardware limit for this NAND controller, so 'writesize' and 'oobsize' will be initialized
to fit this value. Moreover GENMASK(13, 0) is 16Kb - i think it is big enough for single
read. Also i'm not sure that it is good approach to check 'len' here - we are in the middle
of NAND read processing.

> 
> Please introduce a macro/field for GENMASK(13, 0), having such mask
> scattered along the code looks hackish and doesn't help readability.
> You'll get to use FIELD_PREP as well.

Ack, i'll do it in v3

Thanks, Arseniy

> 
>>  		writel(cmd, nfc->reg_base + NFC_REG_CMD);
>>  		return;
>>  	}
>> @@ -544,7 +544,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
>>  	if (ret)
>>  		goto out;
>>  
>> -	cmd = NFC_CMD_N2M | (len & GENMASK(5, 0));
>> +	cmd = NFC_CMD_N2M | (len & GENMASK(13, 0));
>>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>>  
>>  	meson_nfc_drain_cmd(nfc);
>> @@ -568,7 +568,7 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
>>  	if (ret)
>>  		return ret;
>>  
>> -	cmd = NFC_CMD_M2N | (len & GENMASK(5, 0));
>> +	cmd = NFC_CMD_M2N | (len & GENMASK(13, 0));
>>  	writel(cmd, nfc->reg_base + NFC_REG_CMD);
>>  
>>  	meson_nfc_drain_cmd(nfc);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
