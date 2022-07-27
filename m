Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CEAC04A68
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFgW6lw0mt6bWBdbwI/7bRugh0rQPq6SmAC3Tvw4PsU=; b=KHr+0x/vPZo9suCkYyKSaDtJ+e
	c+gzSRHYm5V2l0V5oV0FZ8+WOb74ROBuEYxiJ8cnE4EzV83zmfffBjGDFgCEkVNfOj6BPnaS8hwQO
	8T7mNmGs+dlZAG2+AbKNyPM+RkU6nmqrpl+3sRhPVLUdtO/MkID36vs/SzDzMAOOrlrW5yxz2RECj
	hxBmIyqh4bU7RCrwDSNXBH8xfXUQpkkRuSTgnJEKbweL+n+xQz93IPd8zH6J3KVKDpiiDA0+9/JqI
	HGQyDUZLMJWgAlkfAbI6y+HsBYP3QbKIntNJJsnA5Ad6AYlxghT/hfJ8YLentdqrwOV5Yhy/i8eNg
	a+6G+pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGekF-00CfNZ-54; Wed, 27 Jul 2022 10:58:27 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGekB-00CfG4-L0
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 10:58:25 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id AB58B22239;
	Wed, 27 Jul 2022 12:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658919490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97Ne4NuQWV66rA1x188eFte/Onr5qPT1fY/gB6Rr7Lk=;
	b=gotYvz1DLrjnJwxHyCiWOJnKSTo6/AJmNttOj8+b7bNpgVvhddOq8PA8c9sSbDEIvEqMgZ
	Dx/uloVNOhATlJ+xTgC4gdXn2HXgOAySEZq0bsaVZlmdjGMRxOZFaLNx877ZJrxFT5617E
	msDiAswe9A+HxnNIixgkge2hdOXUpmk=
MIME-Version: 1.0
Date: Wed, 27 Jul 2022 12:58:06 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com
Subject: Re: [PATCH v17 4/7] mtd: spi-nor: core: Return error code from
 set_4byte_addr_mode()
In-Reply-To: <20220725092505.446315-5-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-5-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7d06bcf6c1f63d190afea1873830f5d7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_035823_947306_92443135 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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

Am 2022-07-25 11:25, schrieb Tudor Ambarus:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The prams->set_4byte_addr_mode returns error code but is not handled
> in spi_nor_init(). Handle the return code from set_4byte_addr_mode().
> 
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
