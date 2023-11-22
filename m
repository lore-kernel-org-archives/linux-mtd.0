Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E3C61D9C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Nov 2023 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdQ12jEYBLLeF7tK7PXsvdZhI6A87Ra7E3W0YDRezSI=; b=H+6nUF2HfrM9R0Z9bPNtzKRgrr
	kBs9f+ffqM3NowQqWJDGlMIObsekPgvKJ+U/CzWzeE0V+2I7C6BJ2XVGSQlvPRboq9VZJt9fmkX+G
	Ik5qjbwW9hY9Wx6ceurDPdK+38HNdx8o+9LG+m9fi6GmVX2wr88CDZADG32XC8tQR9oXLR/qM1kex
	JqQBlOTkzh44EbJ9R3H0M4jWi/Eqlfp+EL+jlsQIKbQV+MMQxcmw7FJdxTM+/dJAdSpQl/VAECwaZ
	7T78fjAqMp/mZAsucDY6gU4NrPMkqIg/vCW1DZSgD2PlH6FKdkm6ugHDce9P/6oKAqgEwXVfyLjV+
	/jiNYxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kHa-001PKS-2s;
	Wed, 22 Nov 2023 10:16:34 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kHW-001PGy-0W
	for linux-mtd@lists.infradead.org;
	Wed, 22 Nov 2023 10:16:33 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 30A62A52;
	Wed, 22 Nov 2023 11:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700648181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9LoPouXhGJdNXpu6rtht7dwoCca7P8qVla5ahHm/CIc=;
	b=jsaJPPaeP3hYng/PQ1NgB2nEFmeAS/lJR09SG1C7UsbzD1aUNta8zBSddNU++inVKhh2WM
	hB3MRYvfBs5LGcqpGFj7TZwzm9gapTmewFHVoF+ooT2uQjRCnL74pkJ7lAXczL8LP7tCZ1
	isAXnJjnAecF2jElfZBMYagV93U6Ew9FXR7GkkK5hLmVFCFXwRzjxnRqKwG3ZIWHCZA5Au
	JcqEaiHP53KBgZS/f8YRJ0lRLrJb26Z6AHs4I0XjZa/PNIXcGlosjqL5Or+MBvaXuhb0wW
	vOmfX9d+9koBgB2gabnVXdji4jTLLWU3uj9Kls2GXy+DHerh0EC7U5Z7XBd0Lw==
MIME-Version: 1.0
Date: Wed, 22 Nov 2023 11:16:20 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <CAAQoYRnYVsyQD6iSP7nugxa9F7xUGZ49FNExf_SyyxjVdq3AvQ@mail.gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-7-jaimeliao.tw@gmail.com>
 <8eba400c77127b0df74d2a336561a49d@walle.cc>
 <CAAQoYRkw5hUONJ32sGKxgv5XtO24Vc6=KojankTG73u5E7jPBw@mail.gmail.com>
 <844becc9c6fde66c4d60a621b5462998@walle.cc>
 <fb66cdb7-e89e-47a0-96ef-022a512ceebb@linaro.org>
 <CAAQoYRnYVsyQD6iSP7nugxa9F7xUGZ49FNExf_SyyxjVdq3AvQ@mail.gmail.com>
Message-ID: <2f03527627a638bc8c295810926693b2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_021630_453175_C7E05992 
X-CRM114-Status: GOOD (  15.27  )
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

Hi,

>> >>> and sometimes incorrect. Therefore, at least drop it and just list the
>> >>> IDs.
>> >> Could I know patch 6/6 only or patch 5/6 should remove name as well?
>> >
>> > I'd say yes. Tudor? Pratyush? New flash additions without names?
>> 
>> Why do you need a flash addition in the first place? Haven't we agreed
>> that we'll apply the vendor fixup based on the manufacturer ID?
>> 
>> Anyway, flash additions without names is fine by me.
>> 
>> Cheers,
>> ta
>> >
>> > As, mentioned last time, for OF we might introduce an of_compatible
>> > (thats then ABI) - or - we can use the numeric ID in the device tree,
>> > as it's already used for PHY IDs or PCI IDs.
>> >
>> > Jaime, could you try to use
>> >
>> > /* Apply vendor fixups */
>> > { .id = SNOR_ID(0xc2) }
> I have validate some flash without "name" and looks good.

Great :)

> But I got some log with (null) like below:
> 
> SPI-NOR SPI0.0: (null) (32768 Kbytes)

dev_info(dev, "%s (%lld Kbytes)\n", info->name ?: "",
          (long long)mtd->size >> 10);

Maybe we should print the vendor and the name and
both are optional? I don't have a strong opinion here
as long as it's not "(null)" because that looks like
a bug.

> and
> 
> zynq> cat jedec_id
> c2943c
> zynq> cat manufacturer
> macronix
> zynq> cat partname
> (null)

There is spi_nor_sysfs_is_visible() you can hide this property the
same was as the manufacturer property is hidden.

Also, please update
Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor in this case:

  The attribute is optional. User space shouldn't rely on it to
  be present or even correct. Instead, user space should read the
  jedec_id attribute.


-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
