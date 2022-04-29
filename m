Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EFBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdVFjowCgKqBvsgItCp34eW/THwoW6UFEf/SDwJNxZE=; b=H35WxYhlh2+odAfIHt4VZZAj+b
	Y+/IEb1HWn+JBiEwnInp2rA2LQkwWlOVmSRJ6BRvbSOVdj91rKQAqbS7KKhZDIiCcA1ZL/PG9VZ6K
	AC+SvQ70m8oTU4c4ySBObIdQ1iuKZ/pp8cV9IbFVGdkgvkRfZyGCKdqB8jLlSVfsKK/s3PXX0eF+s
	qm/CTOlzYzwHI9026khLVeeZZVWOZSRYnpgTxNvfRQrYVq23N40dPNmb9fGBAyIixsKEVsBEFhtlG
	BV0zyYMZL7s85iflEWRphbTAcQ2x6T0MbPZF75oHpTeYivcdxkzq3kHOsIg4zQvay+rJkg9kJABZY
	AJVfL4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkNBH-00ATCW-Fk; Fri, 29 Apr 2022 09:44:55 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkNBF-00ATBp-4K
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 09:44:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8763D22238;
 Fri, 29 Apr 2022 11:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651225490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=es0PSQekIsrCkXSWsT/g4+RRJjGr5RMyR8HYTLziDzY=;
 b=LR5P7lh+xBnddAHSoSStD2hEY1vfyhYmKhAv64wrj2P6xLwX5aUF2Pj1ceewHPg/B5p/nd
 JvSfUdQWjGxWwbTc52mhKjIsMTX9nspMJDhGNhxGH7Pkm2fSNDB6MSWAeMZtarkA5NYGFy
 YOqEA0OJvZsuJDtcsRoGuycQ5vMa2RE=
MIME-Version: 1.0
Date: Fri, 29 Apr 2022 11:44:49 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: expose internal parameters via
 debugfs
In-Reply-To: <20220429045731.sjhlkyxfxw4zvfxt@ti.com>
References: <20220428122840.1496876-1-michael@walle.cc>
 <20220428122840.1496876-2-michael@walle.cc>
 <20220429045731.sjhlkyxfxw4zvfxt@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f303280eea2e7a4bc2d14a5cd22727b1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_024453_397838_06CBFE25 
X-CRM114-Status: GOOD (  15.10  )
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

>> +#define SNOR_F_NAME(name) [ilog2(SNOR_F_##name)] = #name
>> +static const char *const snor_f_names[] = {
>> +	SNOR_F_NAME(HAS_SR_TB),
>> +	SNOR_F_NAME(NO_OP_CHIP_ERASE),
>> +	SNOR_F_NAME(BROKEN_RESET),
>> +	SNOR_F_NAME(4B_OPCODES),
>> +	SNOR_F_NAME(HAS_4BAIT),
>> +	SNOR_F_NAME(HAS_LOCK),
>> +	SNOR_F_NAME(HAS_16BIT_SR),
>> +	SNOR_F_NAME(NO_READ_CR),
>> +	SNOR_F_NAME(HAS_SR_TB_BIT6),
>> +	SNOR_F_NAME(HAS_4BIT_BP),
>> +	SNOR_F_NAME(HAS_SR_BP3_BIT6),
>> +	SNOR_F_NAME(IO_MODE_EN_VOLATILE),
>> +	SNOR_F_NAME(SOFT_RESET),
>> +	SNOR_F_NAME(SWP_IS_VOLATILE),
>> +};
>> +#undef SNOR_F_NAME
> 
> You said you would add a comment here. Changed your mind?

No, it just slipped through.

>> +void spi_nor_debugfs_register(struct spi_nor *nor)
>> +{
>> +	struct dentry *d;
>> +	int ret;
>> +
>> +	/* Create rootdir once. Will never be deleted again. */
>> +	if (!rootdir)
>> +		rootdir = debugfs_create_dir("spi-nor", NULL);
> 
> If I compile SPI NOR as module, I insmod it, rmmod it, and then insmod
> it again, I get:
> 
> 	[  360.623465] spi-nor spi0.0: mt35xu512aba (65536 Kbytes)
> 	[  360.623478] debugfs: Directory 'spi-nor' with parent '/' already 
> present!
> 	[  360.632237] spi-nor spi1.0: mt25qu512a (65536 Kbytes)
> 
> I guess when you remove the module, rootdir also gets destroyed, and
> then gets re-initialized on probing again. I am not familiar enough 
> with
> the debugfs APIs to suggest a fix though.

Thanks for testing. And yes, you are right. I've changed that code
quite a few times for this damn subdirectory. But it seems I didn't
get it right. Usually, it's created in the module_init() but since
we just have an implicit one (and I don't really want to change that),
that's not an option. Some subsystems don't create a subdirectory at
all, which doesn't appeal to me.

I'll first lookup if the directory is already there, if it is, use it,
if not, create it. That should work. FWIW, the mvpp2 network card driver
does it too.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
