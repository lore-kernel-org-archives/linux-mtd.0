Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CCCC19F2D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+uCsj+lfqedmifdj0KhcBa/d27MOEsdycZ252HtoDI=; b=ffcxc70U+Mal0PlMt0aRmUF8XX
	OcuKBDwVb9c+MM+V5kNvo5E84ALbcntFuIR0LhgJGp2uQT315c1vua0a71gojanR25zO1FrO0+1HY
	UewgRSUT/gi3n3i1SlHi/oCZSF+c4YDNNo7FdqthGgjrdzfEWihLznN45c0PxpScQ4ygw1qwEcVGG
	DY0/HsLJV4XFULeEiRGtO8H9l4zu9Fn1vbw+a39oBLtu9M0W2wZIxZSGcsaOi9gaupBAYxMcGXuSE
	wi5ifwGkav9qLU2zybrMA1gEdUE7GxpaXk8KFn4ZeD2KHAhBoTsELDxPrMeTNceK8q7BZT57jZEti
	PqoWOV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM33C-00A2lq-Qr; Thu, 11 Aug 2022 07:56:18 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM338-00A2Wc-CV
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 07:56:16 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 5B35022238;
	Thu, 11 Aug 2022 09:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660204566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66M5DGweEjBu2bnHGy7zRZ/xuk4GgSk7QG5/yz9P6LM=;
	b=DPNwAlwSQWcZtsFg2pFN0N2JbFaxzVJiI+IgsLkzElXl/GP5PoiXIcTW/6GoeKJufVPfpr
	Uq8EKkja5fCzeVtWbeX9hgPAh+5hwC2+VX6/bc7wZ2ZEqNNvzTEDPdeqC7vihgXIe52ya6
	1rYQpS85V+BYnoT8RSldC1GTjzhUDi4=
MIME-Version: 1.0
Date: Thu, 11 Aug 2022 09:56:05 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: sudip.mukherjee@sifive.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Update documentation for
 info->fixup_flags
In-Reply-To: <20220810155924.1366072-1-tudor.ambarus@microchip.com>
References: <20220810155924.1366072-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <3ddf27b7cbac34590f86ada9093f5cf7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_005614_630880_223CFC29 
X-CRM114-Status: UNSURE (   7.38  )
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

Am 2022-08-10 17:59, schrieb Tudor Ambarus:
> From: Tudor Ambarus <tudor.ambarus@gmail.com>
> 
> fixup_flags should be used when the flash defines the mandatory BFPT
> table, but doesn't define an optional SFDP table from which a
> particular flash parameters is discovered.
> 
> Reported-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@gmail.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
