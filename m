Return-Path: <SRS0=HTXT=IS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C28C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Mar 2021 19:18:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71A5661941
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Mar 2021 19:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71A5661941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VmcmMc8Q8se0Ioq8Ig/iTd97ey6jnn1VZruAmySX1j4=; b=X6uwb3IG3cUFEcKnhBUOZrVYq
	UCxP3abQmeR8TNJHiR4T8VUmjYn913fYwEwRnQ100/z7nwXFcb3AmLhX1PQZzI9tL4GGo3XQVcPKB
	ypT3OJ4IDvYPX9d81fbHc7l5QwXYl9LVaoGDOdbm5p5F0evFNlJjyd3+otfAieSVIgD6uDQErz7Z5
	q+BvsQKA2iZFjIM6lAmO6eGITC2YS/3YitxkEOeTo52W0FwxSx8gvdXENTBaYPdAY8CgG2XDW2vEY
	o/vDhQEqPfLKi6NBCW0nQ2NoWk8XK6WhsFhTvn0L2Q0kUgXExtYXY9MYdxAw3lgJrk1SSWmVg5zq6
	YXkDjspUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNh6J-009By6-7l; Sat, 20 Mar 2021 19:17:31 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNh6D-009Bxa-F4
 for linux-mtd@lists.infradead.org; Sat, 20 Mar 2021 19:17:28 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DA6E922238;
 Sat, 20 Mar 2021 20:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616267844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btr13Yp+4POSyeTxRd5R5ehu+2XAC6Qyi7g35AeUOa4=;
 b=TgwNGqO6gPJf0+cIgj6ExhDbg+IgTiQKZy2Z/SXP8utb6hFdLYuB/1Fp/5uX1txXnV9cZH
 QtjtsY0uX0fepunadRdKwA6bTlOp3Qlwj1Q8+RgN66Ubis4vOx+r4aO2VvfenJXvZnYnKJ
 JYgPtelBQ1tplzK2ErqWBC43SN3Yxtk=
MIME-Version: 1.0
Date: Sat, 20 Mar 2021 20:17:23 +0100
From: Michael Walle <michael@walle.cc>
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: add initial sysfs support
In-Reply-To: <925fb92b-39da-ebc5-c0ac-6dba02628956@hisilicon.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-3-michael@walle.cc>
 <925fb92b-39da-ebc5-c0ac-6dba02628956@hisilicon.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <94797376448f4a276dea8489b2ac9e44@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_191725_670406_69EBAA6D 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Yicong,

Am 2021-03-20 05:16, schrieb Yicong Yang:
> On 2021/3/18 17:24, Michael Walle wrote:
>> Add support to show the name and JEDEC identifier as well as to dump 
>> the
>> SFDP table. Not all flashes list their SFDP table contents in their
>> datasheet. So having that is useful. It might also be helpful in bug
>> reports from users.
>> 
>> The idea behind the sysfs module is also to have raw access to the SPI
>> NOR flash device registers, which can also be useful for debugging.
> 
> I like the idea to dump the sfdp data,it will make debug easier.
> should it go in debugfs?
> we already have debugfs files for partname and partid of the flash.

I've seen that, but thats for the MTD subsystem and is per MTD. Well,
one could add an own debugfs for spi-nor, but I still fear it might
not be available just when its needed. Of course a developer can
easily enable it for its debugging kernel. But I'm not sure if thats
the only use case.

I'd guess it boils down to, whether there could also be tooling
around this. Eg. think of something like "lssfdp".

I'd prefer sysfs, but lets hear what the maintainers think.

[..]

>> +static ssize_t name_show(struct device *dev,
>> +			 struct device_attribute *attr, char *buf)
>> +{
>> +	struct spi_device *spi = to_spi_device(dev);
>> +	struct spi_mem *spimem = spi_get_drvdata(spi);
>> +	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
>> +
>> +	return sprintf(buf, "%s\n", nor->info->name);
> 
> perhaps sysfs_emit() instead if we go sysfs? as suggested by [1].

Thanks, didn't know about that new helper.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
