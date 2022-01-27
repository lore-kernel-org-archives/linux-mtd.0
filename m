Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EEAC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBLmg1j0as1LvyIScJKnk+46KZMSTvJCe0Ui4n/nBLE=; b=eQmkeK4qO+shwmwm4JadqLi93W
	EzJEuhIHdGCoN8Hoq08iyv6N0mEYuVdbTsY3PVF5NvpmWj9QUCDyFJSYpClaRS8Wj385Rzp34jCQ8
	ehVg4rhEDdQsM7ui8ATSnHki4NGWqSeL6+RhiHXWD/m3YmBE+kYF3gU/Q00Oa3W3yW+ug9HQ+gdEs
	mmZjTJHWSW/qUMgaJORMDerNcrexVkSxpD9nUSrHAw/Y8L53fY4bBFty3+vKS/f5/Z1gn5YxSMdjW
	yg6xml8EOr0nmFGmNEbRi1PVB20//hsZrZYwWwskNXRiWAI3mcR49NtRrd2HZHu4lNjJj2glqf/UM
	W26WRoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD17W-00EuLq-LC; Thu, 27 Jan 2022 09:31:11 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD0vM-00Eqvi-Dt
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 09:18:39 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3907B223E9;
 Thu, 27 Jan 2022 10:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643275114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFL3RqGgxhLVfd0lm0lYMK9cSaSzp17SbNgy9wIf3yU=;
 b=gRfP+MrvWC6BwihDv6A8kHJHjzdJOgUpqTp/kzzPjHXRyiK65HxVdNs80wV5x3jI3oL6Ck
 qCSGPDpr4bH6E2pEnllxSr+qnb7P1mgQvpRnEskGVgm69XKM4jYpCvQMBSWUZ73sH09UGi
 nFSze6eZA2CO7KGcpQn+rouNujQPKJY=
MIME-Version: 1.0
Date: Thu, 27 Jan 2022 10:18:32 +0100
From: Michael Walle <michael@walle.cc>
To: Chen-Tsung Hsieh <chentsung@chromium.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
In-Reply-To: <CAMu4cy5onQ2JNKhoLVmR4Nb7Cqv2L59SoE=2Q9CK8bhfPvvHTQ@mail.gmail.com>
References: <20220126073227.3401275-1-chentsung@chromium.org>
 <8625876c695685fc5409997403130194@walle.cc>
 <CAMu4cy5onQ2JNKhoLVmR4Nb7Cqv2L59SoE=2Q9CK8bhfPvvHTQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <ea37e84c8c83350d089c6c9ed4474851@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_011836_682996_E2FA2F3D 
X-CRM114-Status: GOOD (  10.71  )
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

Am 2022-01-27 04:31, schrieb Chen-Tsung Hsieh:
> On Thu, Jan 27, 2022 at 6:38 AM Michael Walle <michael@walle.cc> wrote:
>> Out of curiosity, on what flash did you discover this?
> 
> It's Winbond W25Q64JWZPIM
> https://www.winbond.com/hq/product/code-storage-flash-memory/serial-nor-flash/?__locale=en&partNo=W25Q64JW
> 
> We are verifying the write protection on W25Q64JWZPIM and run into an
> issue that spi_nor_sr_unlock() always return success even if HW & SW
> write protection are both enabled.

Ah that ring a bell... Anyway, could you dump the SFDP data please?
See [1], you'll find the files in sysfs. I wonder why that flash is
using the 16bit write at all.

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
