Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CA0C3526F
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:46:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4671522A9E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4671522A9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PX0rnSdiBgCYJgPcex1KZNDRnd0QLcM+f39j50W56co=; b=ydRHKe5PkNHActlEWHJBzyG0Y
	xUMvBWmF7jWoWLl0YZ7tPXxAFZswhmlZS23zZ8ZHiv4KPYvobmtlDaEVaJyKYbd2OVwfe6J/mv2dS
	diQeEJ/P6wZ9KV3J6vpaaIPqRplEEKpofP2iUASTGRTgvyZbS+FqVLxUBo1IPVrEwROTtu2PR1jMq
	OEwuH+VvJssgtAMuHnevurRRpBGDA6qaLBGd6Xd2TjYAogWTKzKOxP7Q9++40MpnG+BUjeOxagV5B
	QjNWX0yNhzz70hbWsz7g7b4wtTEb4vcUaNpQaWsNJpDYmCamkmF2CtLw1HiE6KwqJ+KdSIcngIT33
	4jAzdT4mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpm0-0001hf-As; Thu, 03 Dec 2020 14:39:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkplw-0001gw-Ud
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 14:39:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C9CAC22EE3;
 Thu,  3 Dec 2020 15:39:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607006381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u13M+Fi/wa3Z0rVt0fxqI18Wvs+Sch7UcGcItdEZP2Q=;
 b=T4y41W5r0OE+EslRkxis9lWHQAdUDT0/bB31ZdeQErgYi4gjV/1HTtu5LvMroMmwFelpVq
 BzHsScTJO20FLxN5xNcdnXZM5DBFsntFTfsRnD+j+jfRrLV8v7R60j/AqwHdJtM5u7yEor
 FgCOw7UBvVsUvT/OU6FB89EN2Sn5yy8=
MIME-Version: 1.0
Date: Thu, 03 Dec 2020 15:39:40 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
In-Reply-To: <44be8e3c-86ca-501e-e575-55f17747bda6@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-2-michael@walle.cc>
 <44be8e3c-86ca-501e-e575-55f17747bda6@microchip.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <bf31d41ca489b5d1b7976bfb8ede88e9@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_093953_487001_5BD7122C 
X-CRM114-Status: GOOD (  13.35  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-12-03 15:34, schrieb Tudor.Ambarus@microchip.com:
> On 12/3/20 1:00 AM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> This flash part actually has 4 block protection bits.
>> 
>> Reported-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Cc: stable@vger.kernel.org # v5.7+
> 
> While the patch is correct according to the datasheet, it was
> not tested, so it's not a candidate for stable. I would update
> the commit message to indicate that the the patch was made
> solely on datasheet info and not tested, I would add the fixes
> tag, and strip cc-ing to stable.

What is the difference? Any commit with a Fixes tag will also land
in the stable trees. Just that it will cause compile errors for
kernel older than 5.7.

So if you don't want to have it in stable then you must not add
a Fixes: tag either.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
