Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DED4C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:11:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A53FF613CF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A53FF613CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Wf60LcMa3sbDV2Gm+8ypLgHLum6hhk7cEWHxF/kDo8=; b=ZrlvQFYGRFZ8HACH2Gg1jqPMz
	j3O1nflxvvbNqPTCxx0vMWGWmMeVhnZ6BhHCH2/OVYig+ThMyFvG6HpPCvAiLwdcbCC+WxZrzXcAx
	F5n+CwiC4JsMBCFJebIpLbE7RrOoMOBy8UVB4aRaohrVGhzDDnV25iKkF9g66SZvBNXNJBTpDDUWb
	njGAkuJkrrlbk/3JnLcFxesxkFNUoE4gTxGil6he3FIDIux5S9HoXH4VrHPg+Fz4qGWGqHV1I86XD
	1mQibhMejFV3FslgHf1/pNk3yN+PFMm3pJmt+Npk7gTM8Cu/iGBpgCLJy+MXa/SKt5m99zHgwIstx
	X9NiWrWGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2rZ-00Dsqf-Ss; Mon, 10 May 2021 10:10:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2kJ-00DrIU-0o
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=I5GosJWPzHsoZ6u3AUhI7Eb/OhIsOK+VMbFkHd9bLxw=; b=oHChzT/EorgOpXH2FuJn1sz+sy
 q0HJxgOabwYDfKmkp+IkI9DGG4qhSaFNZOPIqBOnwv6Muo0ViAHRX6LZI0ejwru9608XgQrMFYXX7
 IK4aCZG7IsUdof2vvCSeNNk0W0MyIglqFQgGifAnvPTEUMSp5Ko9+apbY3FmurpqEjOPrMzgtRnl7
 SlL8tPPvrL1hydN15ibGqu1uX6qtWPYzJIHDr3ZBk6s414eaBd+xaMzC6kp/UOlX1uZeKsbjvAxxA
 EUJezILQSjte3h5hrzIEgVVjVUTNDposwyWpkFX9JyZwzSij74/aH4BdMlvb3z9mJFLFxzCv5A+sL
 rpnucQ7A==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2kG-008VQ5-2u
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:02:37 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 68B8024000D;
 Mon, 10 May 2021 10:02:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: silence static checker warning in
 nand_setup_interface()
Date: Mon, 10 May 2021 12:02:32 +0200
Message-Id: <20210510100233.6865-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <YH6Ugwz3gcga+q8X@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4d888eceb725216305eee595ff5d068112cf7c15'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_030236_279845_AD7896A7 
X-CRM114-Status: GOOD (  10.03  )
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

On Tue, 2021-04-20 at 08:44:51 UTC, Dan Carpenter wrote:
> Smatch complains that the error code is not set on this error path:
> 
>     drivers/mtd/nand/raw/nand_base.c:842 nand_setup_interface()
>     warn: missing error code 'ret'
> 
> But actually returning success is intentional because the NAND chip will
> still work in mode 0.  This patch adds a "ret = 0;" assignment to make
> the intent more clear and to silence the static checker warning.  It
> doesn't affect the compiled code because GCC optimises the assignment
> away.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
