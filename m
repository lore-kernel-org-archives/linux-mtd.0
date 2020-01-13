Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E602C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:20:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA72D2080D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jf1/zvcD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="XLCfZDbC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA72D2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cCYp3XSH5RBBZcsGDZv8eViG7l2boK0XnEW/hYnJLHw=; b=jf1/zvcD4ufc5PJfjf7i3f7zE
	1GU+bOrbJLDsyzIJ4Y7LU82wWMbsKvFkBpDVJaK2eVCvgeV+r1hTBrrwJwF41XR26EEf9ZYtQD+fl
	vnGHQkh5duHqsoAAIcY5wKm3OX2Z/4k2WvhxCzoGgVYcn9Bx3IjZRena0fFDYYyggtUhAyBAtDdQL
	oVybtE4FRTmbg5Pp7XSRhd82HG9PGVIMVIOiB1WWBgQv8VF6Lsf2IPgOaghwbql2y51JFHtg39kb5
	4ihMOSkAB//BW/OoZQAClB7BLuxKr9GzRfz4h4HQ1h+oq0iIoucJMJVhNdcID/NTqp5A4xFyRHYAm
	ri6N7a1Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqwp6-0004ol-MO; Mon, 13 Jan 2020 10:19:52 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwp3-0004o5-NZ
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 10:19:51 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A719922FA7;
 Mon, 13 Jan 2020 11:19:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1578910787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXzWX/yf1JizFlzgmJ9EVv2s99micrilFg1iwXYcgKk=;
 b=XLCfZDbCOW2OQZJSnG9GWM8MrWPozPMhdvJdQ03TRf+hP86+S7mbaUgk6CiUBbr6mmQvUs
 PANDk3tWOO052qZ8bTRIGijgjTGbFOUNNcd/6iU/eZENrWKTl+C79b5ggabgKI68O0HNW0
 e/PinULGPDuITznrZ8XAWlSA4bjSHDo=
MIME-Version: 1.0
Date: Mon, 13 Jan 2020 11:19:47 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH 2/2] mtd: spi-nor: fix locking argument in
 spi_nor_is_locked()
In-Reply-To: <1617765.HVoytVeEL0@localhost.localdomain>
References: <20200107222317.3527-1-michael@walle.cc>
 <20200107222317.3527-2-michael@walle.cc>
 <1617765.HVoytVeEL0@localhost.localdomain>
Message-ID: <7344bb68b2714755a736e8d27e06aa8e@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: A719922FA7
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 NEURAL_HAM(-0.00)[-0.780]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,bootlin.com,nod.at,ti.com,gmail.com];
 MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_021949_921235_EF5EDB3A 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
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
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-01-13 11:10, schrieb Tudor.Ambarus@microchip.com:
> Hi, Michael,
> 
> On Wednesday, January 8, 2020 12:23:17 AM EET Michael Walle wrote:
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index b661fd948a25..a8fcb1d70510 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -235,6 +235,7 @@ enum spi_nor_ops {
>>         SPI_NOR_OPS_ERASE,
>>         SPI_NOR_OPS_LOCK,
>>         SPI_NOR_OPS_UNLOCK,
>> +       SPI_NOR_OPS_IS_LOCKED,
>>  };
> 
> There is no NOR controller that uses this enum, can we get rid of it?

you mean the second argument of the spi_nor_lock_and_prep() and
spi_nor_unlock_and_unprep()? sure. But it removes information from the
prepare() callback. like in "prepare what?". From what I see its only
used for locking. Maybe then rename it to prepare_lock and 
prepare_unlock.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
