Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F70DC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e66RJU05FZZjBBNQkOB9+D+yf7M89guH32erPc5bGU0=; b=oASysF51WhsKKiXC7Aw5U4rQIH
	8z/UwLnSEVH3VnTxp5vkiMqUAkHMqKXDxD1JFO9Lmat71Gq9utFNzW+8fk1zpJHiVvwkODIDAjCLt
	twlOBT3mrOk697iAvQgHKK+Xg9ym15EeZ3DGIG8SyeoIc9NhYBrxjBleWS9mTMHhMBb0P6lsuv8wK
	IEHHE9YvEJRcdiXLH8CzI+W+p7QQocVY4DQ1INkiKO9QFkiKU3r9aObhtxrH/mDq7TGGps/pEUeB+
	JOftPkULOT3Xg0g3plfWs1D6qZXYuo5ltWR9FbFQQRzakQZvxz+kU/4i1LCjDGvWor7ZN53eIfDmB
	y8Jnua8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6mr-00H9no-4B; Mon, 07 Nov 2022 18:23:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6lt-00H9LG-Qm
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 18:22:59 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 72805341;
	Mon,  7 Nov 2022 19:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1667845371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i66Bm0EZDr45BT3ymGVEXCMJcddpq0EAsVqoE2IhkH0=;
	b=bF9wy7/3AMbvbZ/I/qwQgwklcwO/HJZ6Y2p0Srmc2Rcdncz/0ZWSETGs1INfRJDU0YCurR
	NlyktDRNPvRmduTi9RuOuQXgJfjmrYjB+a6ThiUrkpD4s6z4EM4ssKWfVspyZRQTPZI+ch
	ixDKhVAQRY72zvKWpgujsvuU5sHUi9OMF1cbjS+ONYBZU1Mo7A7yO5eZy9WT1jAn6PplyZ
	Gq35WzUoDJtNiTx3FHRej/na77owZvcTBL4oijAcKoqdiNge7lRapuCA/YonmHa9gVgytM
	v1UNq/Jvm/LmCwW/Pv0S6pYoCN4M3EofdRX7stOJCDOfWWMTapTQXYm+UY8+Bw==
MIME-Version: 1.0
Date: Mon, 07 Nov 2022 19:22:51 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Takahiro.Kuwano@infineon.com
Subject: Re: [PATCH v2 6/7] mtd: spi-nor: add generic flash driver
In-Reply-To: <848f22da-7f1b-ae93-99d3-65a5f31cb122@microchip.com>
References: <20220810220654.1297699-1-michael@walle.cc>
 <20220810220654.1297699-7-michael@walle.cc>
 <848f22da-7f1b-ae93-99d3-65a5f31cb122@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2b56d38b76660692117103c9de213cdc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_102258_121228_AFBC9517 
X-CRM114-Status: GOOD (  10.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-11-01 09:46, schrieb Tudor.Ambarus@microchip.com:
> On 8/11/22 01:06, Michael Walle wrote:
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1632,6 +1632,16 @@ static const struct spi_nor_manufacturer 
>> *manufacturers[] = {
>>         &spi_nor_xmc,
>>  };
>> 
>> +static const struct flash_info spi_nor_generic_flash = {
>> +       .name = "spi-nor-generic",
> 
> How about "jedec,spi-nor" instead? The series looks good, I intend to 
> test it
> and apply it soon.

I had that string before actually but decided against it because it
looks like "jedec" is the vendor, which is (a) not true for any flash
and (b) if it would be a vendor, it should go into the manufacturer
property, which isn't supported at the moment.

That being said, I don't care too much. After all, it's just a name.

(and yes, I'm on vacation till next week ;)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
