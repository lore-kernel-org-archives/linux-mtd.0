Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31ADCE7B1D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEJ5ihjZfxKFsc1WjdhMazv2zXfGKN+MJ4fuoIJ7fRo=; b=ejoX/A4EQw1l75
	YWKQevg9KGfoW0wlxxPCTXVUGbcySd6zCX/8pGv/51rFb3DbfTKbuWbPk/H36xFyeHkbxosFGOzv5
	hFIXjb1aPdy/fQRff65PInP2Tvl+1V2F6IRdSzAXo6UEUBKwCZKi4nW4hpTNtcPdPjrLksfep9iOd
	etuEl9px5p8nj4tHnzisadqtrWaZzHSAnAy6+9NbSqz7Vmb7myZKigSK6ZLk3P2UOVsupYlFdv7D1
	iHIHYaaYWC3m96Naodk3v4OF2Tfa060LVN4ZChmVDGHfg9Y+EdkD+ZOKfYWjyM3kif4Lz533aHcDc
	DVdpuats+LKntpIim7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaYG-0000000CgLU-3BOQ;
	Fri, 06 Sep 2024 15:07:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUV-0000000Cep2-2T0R
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:03:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99DD81C0004;
	Fri,  6 Sep 2024 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKmMqzRAjuck8NyXBeLZJKkXwLEFodyIO4UpPdheaZw=;
	b=O/9wRMNZD/upzTQQAicDP/pmQ1TQH6UOo+QfGXzkoTgPV6F6FS6ry9M7M2WYJYnijooRvv
	CFQscDV49I4iPyuHOl8rXHGWDSKmOMeMhFIY7dRdlBsCgpvoMipuLN9iZ9fP6Re2XZvhVY
	20o4YBR+LWOwIOvDYOVMIjm3d2JPnC4FuUrLp3zyNQ0xglcoqBQ0t1kVu3SYbnrjeeUxr9
	SL/Jq32GIDmYtEcEXDztuSt/T/K/vO3Io1oGkdvyen373nbZwBYSqSuJtM3Z5xMEl026nn
	yO5Luv3IUleUVsRn7oUP8guvmeZDp9LrxDo1g3xo79N25QE3uwdxv3GxCjh6dg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/9] mtd: nand: Introduce a block iterator
Date: Fri,  6 Sep 2024 17:03:13 +0200
Message-ID: <20240906150313.734448-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8adf1ac24ba8ee34b8fd36ebf159004ec472fca0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080315_784403_4E052379 
X-CRM114-Status: UNSURE (   8.26  )
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

On Mon, 2024-08-26 at 10:14:05 UTC, Miquel Raynal wrote:
> In order to be able to iterate easily across eraseblocks rather than
> pages, let's introduce a block iterator inspired from the page iterator.
> 
> The main usage of this iterator will be for continuous/sequential reads,
> where it is interesting to use a single request rather than split the
> requests in smaller chunks (ie. pages) that can be hardly optimized.
> 
> So a "continuous" boolean get's added for this purpose.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
