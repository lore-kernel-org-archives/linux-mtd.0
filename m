Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D53DC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUdWb9XIJ/xPhtfPJsaEfTIMTLSpSqLZc97tAZAYAis=; b=QJBIvKbyukohNu
	UIC05ppDoEzWz5ify5w9rSPO8Wiwtqmjsu89w3k1SeKXa5JnE4y4+l7eEFjnQdh2iTH4kyhUNw7Gw
	oYhU2z8PIyFG4ANOboZIlB9ndczIlQQ2ohgiFR7RdArGl10d6Lj9jLptaDBrthUHpg/9rIoqTmWgu
	nbQD5WDninxaKOZQLEVznodmYoQTHZHdS+1T5efjQm3BbdqOX1ChF+2xkY0jzW+Y11IkvpSlD99oA
	jBwxC8vuL0nSYctiL+egR6bpv5o3BmwRv+mWtA6nU+AmhlApn+l4IAspgmn76wVW31NX38WuWaooT
	FYBdkrmFlvX6vwygAUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r104G-005ZWq-2Z;
	Thu, 09 Nov 2023 08:07:12 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r104C-005ZUw-1F;
	Thu, 09 Nov 2023 08:07:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2331150353;
	Thu,  9 Nov 2023 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1699517222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R+Cskg0Zlf2z6oSgOHmCw4RtbIi3Vlboh4OLjWOc198=;
	b=BCCljUJq/AJBA5kbkykFWado6JzsjJtD6qn7ZxFQCTvcTJqYwODjBGzZnSi/jrFW0pVbS8
	Q+cCZz09QrZtTbvcPgAtyWvY34kbu+a55iEQS7c50++aKNwnViBYw1krzaeZVnU+Od/RZZ
	jTT0u/+8k8lor6m1Q/a17LCXSHG9uHcJR/d/NKwAJF8sK/ZBvpBp3KeJ2QDfluUIYDQz5v
	ine+4f1DCG19wklwz37nhnkJ35RKdQN9qlnS2NZ0IKXeepK22gLQyTTjXVWZjlhT1QmGFz
	0IMdLTHuLMC/+M4pMf8mN9Cb+lU49x4nzNHh8mV+Hu+vFwbDF4OtOPfdu9X20w==
Message-ID: <5a82e3b96c94b45821707eb5d392384e1a026c2e.camel@lexina.in>
Subject: Re: [PATCH v1] mtd: rawnand: meson: handle OOB buffer according OOB
 layout
From: Viacheslav Bocharov <adeep@lexina.in>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>, Liang Yang
 <liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru,
 linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Thu, 09 Nov 2023 11:06:58 +0300
In-Reply-To: <20231109053953.3863664-1-avkrasnov@salutedevices.com>
References: <20231109053953.3863664-1-avkrasnov@salutedevices.com>
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_000708_965939_3D83C7F7 
X-CRM114-Status: GOOD (  15.53  )
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

On Thu, 2023-11-09 at 08:39 +0300, Arseniy Krasnov wrote:
> In case of MTD_OPS_AUTO_OOB mode, MTD/NAND layer fills/reads OOB buffer
> according current OOB layout so we need to follow it in the driver.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  drivers/mtd/nand/raw/meson_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 561d46d860b7..0d4d358152d7 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -510,7 +510,7 @@ static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
>  	__le64 *info;
>  	int i, count;
>  
> -	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += 2) {
> +	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += (2 + nand->ecc.bytes)) {
>  		info = &meson_chip->info_buf[i];
>  		*info |= oob_buf[count];
>  		*info |= oob_buf[count + 1] << 8;
Seems something wrong with your logic here.
I think this code should most likely look like this:

for (i = 0, count = 0; i < nand->ecc.steps; i++, count += nand->ecc.bytes) {
    info = &meson_chip->info_buf[i];
    *info |= oob_buf[count];
    if (nand->ecc.bytes > 1)
      *info |= oob_buf[count + 1] << 8;
}


> @@ -523,7 +523,7 @@ static void meson_nfc_get_user_byte(struct nand_chip *nand, u8 *oob_buf)
>  	__le64 *info;
>  	int i, count;
>  
> -	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += 2) {
> +	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += (2 + nand->ecc.bytes)) {
>  		info = &meson_chip->info_buf[i];
>  		oob_buf[count] = *info;
>  		oob_buf[count + 1] = *info >> 8;
And there:

for (i = 0, count = 0; i < nand->ecc.steps; i++, count += nand->ecc.bytes) {
    info = &meson_chip->info_buf[i];
    oob_buf[count] = *info;
    if (nand->ecc.bytes > 1)
        oob_buf[count + 1] = *info >> 8;
}


This is more similar to the behavior of similar functions in the proprietary U-Boot.

--
Viacheslav Bocharov


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
