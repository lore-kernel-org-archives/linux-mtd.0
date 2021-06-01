Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B714C47080
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 13:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC10613B4
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 13:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC10613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3EairLKBohvVI0fdBefTkCDTLApH9wdES0VuJxV3mA=; b=mUwUNaxD4kn8tQ9o9LAEd7lTTv
	YJjk+/X364NFBRgfnO/NAzZUx6zAVTGeVP7rQfmsHtitonYkr/FrtJGFubARR5RUQFCxzGewxv6BU
	rN40On0Kgl9LSCjuR+zxjq9Erg7OiLCl+O4NeLewbneIdlSn8Yob7yQo+9mhEnm4no5AeUn52nvsv
	K85EwVCc1N6cXl6zVB44NIdrXjPhx1EoJHHXEjBSjLYXQZc2YWNHPMk3R6ggaBpmYmfF7ZKExR5W5
	iSB2JoMjDBLiwvWNU3uDw5vMaTFygwcQ4hHMdg1BlefzhCKZ7MACDeQzdFL4QBMQJ3QL8hyr7OCji
	v1ugaJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo4TS-00Gmjk-0P; Tue, 01 Jun 2021 13:30:26 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo4TO-00GmiA-It
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 13:30:24 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7860E22236;
 Tue,  1 Jun 2021 15:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622554220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lmn070DewzzRb9NZbmshsQ4m/50BlJ3QSmY3EOYGQWk=;
 b=psJSsva3QJ4sIsKgOoB8FDggNkXR1q3AGkzseOJybJUwHuj9GoTLKSX2DmpOmXGtYdVzUw
 57pbUPYNhL6ksfubzyHN7ieBIk7V/KEIyedfbYDXHEEcXiB+b2tKQ9q+RkbQrBNBSjz4W3
 q3iJQevnxpoiYZVvqm+UDlojTVMcNkU=
MIME-Version: 1.0
Date: Tue, 01 Jun 2021 15:30:20 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v4 4/4] mtd: spi-nor: otp: implement erase for Winbond and
 similar flashes
In-Reply-To: <2d04a7f5-c99e-3177-5a1f-debe49f51ef5@microchip.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-5-michael@walle.cc>
 <2d04a7f5-c99e-3177-5a1f-debe49f51ef5@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6c8539c4fcfa1e58446826c24fd4e539@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_063022_822825_F048C3D7 
X-CRM114-Status: GOOD (  20.82  )
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

Am 2021-05-31 10:56, schrieb Tudor.Ambarus@microchip.com:
> On 5/21/21 10:40 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Winbond flashes with OTP support provide a command to erase the OTP
>> data. This might come in handy during development.
>> 
>> This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
>> NXP FSPI controller.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/core.c    |  2 +-
>>  drivers/mtd/spi-nor/core.h    |  4 ++
>>  drivers/mtd/spi-nor/otp.c     | 83 
>> +++++++++++++++++++++++++++++++++++
>>  drivers/mtd/spi-nor/winbond.c |  1 +
>>  4 files changed, 89 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index bd2c7717eb10..9551effb6a44 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1318,7 +1318,7 @@ static u32 spi_nor_convert_addr(struct spi_nor 
>> *nor, loff_t addr)
>>  /*
>>   * Initiate the erasure of a single sector
>>   */
>> -static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>> +int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>>  {
>>         int i;
>> 
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 28a2e0be97a3..9398a8738857 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -207,6 +207,7 @@ struct spi_nor_otp_organization {
>>   * @read:      read from the SPI NOR OTP area.
>>   * @write:     write to the SPI NOR OTP area.
>>   * @lock:      lock an OTP region.
>> + * @erase:     erase an OTP region.
>>   * @is_locked: check if an OTP region of the SPI NOR is locked.
>>   */
>>  struct spi_nor_otp_ops {
>> @@ -214,6 +215,7 @@ struct spi_nor_otp_ops {
>>         int (*write)(struct spi_nor *nor, loff_t addr, size_t len,
>>                      const u8 *buf);
>>         int (*lock)(struct spi_nor *nor, unsigned int region);
>> +       int (*erase)(struct spi_nor *nor, loff_t addr);
> 
> maybe better:
> int (*erase)(struct spi_nor *nor, loff_t addr, size_t len);

Right now these ops represent what is sent to the hardware. The address
is what is really sent over the wire. The read and write has the same
semantics (and limitations, like you can't cross region boundaries etc).

As there is only one kind of method to access OTP right now, I wouldn't
want to prematurely optimize it for future ones. It is easy to change
afterwards if there is need to. And supplying a length right now would
mean to have a loop and some checks in the erase() op; where it should
really be "erase one region" and not "erase multiple ones". Mapping
from multiple to one should be the duty of the otp core code.

So, one could argue about the parameter "unsigned in region" vs.
"loff_t addr" because both represent the same thing. But
spi_nor_otp_erase_secr() should really take the address, because
that is what the opcode takes as an argument. Thus, changing the
argument of the .erase to "unsigned int region" you couldn't just
assign spi_nor_otp_erase_secr to .erase but you'd need to have a
small wrapper which converts the argument.

So IMHO future will tell if we have to change this to somewhat
more generic.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
