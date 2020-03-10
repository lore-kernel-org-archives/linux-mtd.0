Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBAEC10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:47:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB7920873
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6hnD2Ko"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB7920873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fPbz7RzfhPbFIXyldTkbHp9X6AUqep7AxdZmaQU8cs=; b=S6hnD2Kop/0M4L
	Y1oyRmt844UUqmaOkjBqc6hD1i5pKCtSr7cKCUpgmmIZ7oW7hHKe6kMv/tjZQoj2S5/jHas/WZB1o
	xJz9gRD4CcIKDOxgTepvv7Whb8qn05Zzy9McaSatOaIvhwRT+EHJnTAgBWOMmZCZDnLGjuQU8wXuo
	0n+iWqA0OwB6EfoM1vapOAJ9wT7GTQR+7bQWrsPLIvuhrCUvpNRrZtNRAzlPpj242a+dkMpcRRAjr
	rxabzB1PFQmoCiUzI0jR0vGXSySEQ9Ev9vvzIs3IE/mOiHJFFHsoQv4JbzvBrwf2jLrtUSdXsI01o
	gVvaE/2hBOz4obRD431g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBju1-0005ZB-2c; Tue, 10 Mar 2020 18:46:53 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjhT-0006fo-44
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 18:33:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2DDEC20004;
 Tue, 10 Mar 2020 18:33:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: denali: deassert write protect pin
Date: Tue, 10 Mar 2020 19:33:51 +0100
Message-Id: <20200310183351.20087-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200127123934.11847-1-yamada.masahiro@socionext.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 9afbe7c0140f663586edb6e823b616bd7076c00a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_113355_329873_3BF120DD 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-01-27 at 12:39:34 UTC, Masahiro Yamada wrote:
> If the write protect signal from this IP is connected to the NAND
> device, this IP can handle the WP# pin via the WRITE_PROTECT
> register.
> 
> The Denali NAND Flash Memory Controller User's Guide describes
> this register like follows:
> 
>   When the controller is in reset, the WP# pin is always asserted
>   to the device. Once the reset is removed, the WP# is de-asserted.
>   The software will then have to come and program this bit to
>   assert/de-assert the same.
> 
>     1 - Write protect de-assert
>     0 - Write protect assert
> 
> The default value is 1, so the write protect is de-asserted after
> the reset is removed. The driver can write to the device unless
> someone has explicitly cleared register before booting the kernel.
> 
> The boot ROM of some UniPhier SoCs (LD4, Pro4, sLD8, Pro5) is the
> case; the boot ROM clears the WRITE_PROTECT register when the system
> is booting from the NAND device, so the NAND device becomes read-only.
> 
> Set it to 1 in the driver in order to allow the write access to the
> device.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
