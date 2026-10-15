Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8111ACC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3L/BcKOp4CPspeovSIfkqO6J/48tEg3iqEgsHKTb0c=; b=tYQr58ARwus4RP
	RrAmF6WxUVfR6j7+ORRTgoqt4KXQXYaPIyO6ANrXyvzqtc5c5BZKroI4Z1MDz2k1tGrlJiDJf1yTG
	Vv+5yfw4s0ji68Ci4UKz/4tL9g7cxuBgrAPm9xv+4Xl6k12Ch74XQbaO+o0pf2Hh5St44Wb5WGPvd
	B2Brdp7Hi/67pu/ngXWcTtLxe2M2bxV4uHhZwIhbZ0w+lwce+t0vbgDiGU6Sh8JH06BJ6HPu5675W
	o+19jMx1brMMHZYODpnnjtYRSyDqJu+Qu+d0Qa7P134ctSOLKmaUjzHfjhv8VVhf4J2XgPZ8HsPy9
	4VVh7rDR9p0ZQ7TqL9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIKm-0000000HNkl-3rG2;
	Thu, 15 Oct 2026 10:05:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIKj-0000000HNkA-2HbH
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 10:05:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C3406C63455;
	Thu, 15 Oct 2026 10:06:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71B8760360;
	Thu, 15 Oct 2026 10:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2934210328BCF;
	Thu, 15 Oct 2026 12:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792058701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=N+bPWR+4JT0wOolmGTQ5lWK1vSjEtataR78WtgevHkQ=;
	b=bdYhib9nAgYakXGAbzFG3N4OE4pGn1h6KWLSZUU9zwP0QYzE8jxmMFQgeSIV2PnpdVuckp
	iSeeGlj37C+Y+XPioT5QR53AWnVmSqSBuJ1U9bT1ZwezeCMeDO+/q21wmcnbQ+6PZRzxy2
	S7e6K85LwDQaxD8yo97/97NgGGnOEgJAvF6q6EIReatWmRIAw1uhg2EIErkXUcePSGSnfl
	cEv6UqDa2L/yA0KiZ72Hks26WZ+j7O5NaE9GTPgB/4JTS8nxtlYAQ1aHpIyYcXQsrj+EIw
	TE2oS8+SG5h6kw8e5enaTWkcly28hSDpcbpDrCpBe6UkMijcNRdD5DxFA7qAtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>,
  David Laight <david.laight.linux@gmail.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: sfdp: reduce stack usage in
 spi_nor_parse_sfdp()
In-Reply-To: <20261015090516.924703-1-mwalle@kernel.org> (Michael Walle's
	message of "Thu, 15 Oct 2026 11:01:28 +0200")
References: <20261015090516.924703-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 12:04:57 +0200
Message-ID: <875wz3wa7q.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_030509_769995_0A6BEDFF 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 15/10/2026 at 11:01:28 +02, Michael Walle <mwalle@kernel.org> wrote:

> Two large spi_nor_flash_parameter structures on a function stack
> are really too much, and this can exceed an otherwise reasonable
> frame limit:
>
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>
> Allocate both rollback copies on the heap and use structure copies
> for type safety.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Sashiko is correct about the need for not mixing __free and goto's. With
this fixed,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
