Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344FAC001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ik2CIfTGA0W/ljNqirMTBYpBy0ymMgCdUIogRksDLc=; b=V8aqeXoeoef8qf
	IReYTzQwHIYdloiAtFvl68KM6au9g+A3dFdSCGZbfKrfOct378bg+KsqqlrC4oYCvNWJ+M0ILZwry
	wXxKniPY/Hik/qKSvidPEREMSMgbnBsbeFzCD5GItNQHMExAuAv8nSeh49vsaK8+sNqALI9JXj7cT
	H2INgxhL1ee1GbGknFu6fa7VR7+pnbjLOguWrqu1V4miZX26FfifmqBSKPjM4dIVGH3Yd83N5jut1
	g25EFgiCAikNhENEJ4FfZOwx2IHbYE0cfPcDbhAwP9Oe+/XOPUx18OWfxOulDssSWSUISE6yLz8/c
	7y1GfmDk6Hw8kjkxiSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDN-002JgY-2a;
	Thu, 13 Jul 2023 07:58:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDE-002JYs-2F;
	Thu, 13 Jul 2023 07:58:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 575F3E0010;
	Thu, 13 Jul 2023 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/dQ3rIV5hFuFca0hdzW7g9ibvFRuog2dZ3pQ/WJm3s=;
	b=MdoSbR4uJM3s+Qqs6Z21XNSXlMxPWYKIprbQystEpa2Vw1dLDrn6KixrjJhtlyNQmBLA5V
	4H2oaQkkcREd8N8TVcxhBG+1QtgJ4qT5UjpsOK9+sjwoF8iPLLVIUkXZy/Dst859/1jxXw
	mdCdOF4C145onofGqFdrie+BuwJVQw8Hpbjn/40wOt8SKvuQjrbkUoOrx2gLgHRmKmOnX+
	sc4kRiuGbHPWXRIPoYY5fO7chssA/jeR+n0kUtGKG2YUfxLhgVbS0jiXOEVsB53FPlIBk0
	zz3Vhy58h9F01ir7CQ/d9EHPrLvmzPrEuWr9goP5M0sxa+1FEDglyWdckJEoDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] mtd: rawnand: lpc32xx_mlc: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:05 +0200
Message-Id: <20230713075806.486221-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-7-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9cd9dda8f06c9100997e981f11e8ef9cec042a95'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005808_866218_BA57DD8F 
X-CRM114-Status: UNSURE (   5.36  )
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

On Fri, 2023-07-07 at 04:06:11 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
