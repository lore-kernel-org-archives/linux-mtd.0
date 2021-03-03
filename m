Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B90C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:10:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2183364F0A
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2183364F0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jeD3s6U70X2L88GgAT+W76J7P6n6Dsi3m23DtJv0+fs=; b=ZF1LVbDXZ4wj/gb97er+wvUwI
	ihI6Da50AIw7tPOlrHc3GazRhvzItQmhzQ3J8CVMExuU/EpofElsn+C/be8/uDDDThvd4Y+Sen49J
	ng88h3VaEMpSCBgmkBUvYiijCZW4R2sT/RPUl/4zePhv8g8vRgOVmlU83s3Hov/Y3cX8+fwBwP2P3
	lIeZ3dMCK/55VrKTS8vLgZDSTXFxZFQ2iCq/LnJesWShW0w2M6/eMSHazIjeQfrrbWeQUofNh2o9z
	bESZ6gZf6a4eY5Gw9J7woT56uHjoCI0DNYVFQ8foZR+yJos7i6KsO9O9E6YuVRTgqTpDJCjn2YAZd
	a9jhV+vXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHabq-006sVU-SC; Wed, 03 Mar 2021 23:08:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHU3b-005XTt-SW
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 16:09:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 563A264ED7;
 Wed,  3 Mar 2021 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614787739;
 bh=oLEMq+FKXQy4SVc1LwzFfB9gKXgRmMlJaTjBzUFQP+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UnikIBCXiim0R4HJziT75V1F8nppUbRj3q+OrkLYA/NTyaweTDY+8tXeQDONo+IiQ
 kLA4hbqX8DFJiApfUGeaTk2/E+FHgtc/ieEdQgRJK5FrXl3gVkMNd8pV28ZTu3RJle
 UWUyjf4ErPsURpCRh9nMmkle3Ry3Ujs9iLjAowH0=
Date: Wed, 3 Mar 2021 17:08:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: require write permissions for locking and badblock
 ioctls
Message-ID: <YD+0mAPTMN8AwNBx@kroah.com>
References: <20210303155735.25887-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303155735.25887-1-michael@walle.cc>
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

On Wed, Mar 03, 2021 at 04:57:35PM +0100, Michael Walle wrote:
> MEMLOCK, MEMUNLOCK and OTPLOCK modify protection bits. Thus require
> write permission. Depending on the hardware MEMLOCK might even be
> write-once, e.g. for SPI-NOR flashes with their WP# tied to GND. OTPLOCK
> is always write-once.
> 
> MEMSETBADBLOCK modifies the bad block table.
> 
> Fixes: f7e6b19bc764 ("mtd: properly check all write ioctls for permissions")
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/mtdchar.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks for auditing the rest of these from my original patch.  If this
is ok with userspace tools, it's fine with me, but I don't even have
this hardware to test with :)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
