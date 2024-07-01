Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2954C30653
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWLfA0xHKqISqfJ4ws7b0AFwxmGcJ12BARFjCRbwJGs=; b=hJWj910gMhIB6g
	8BHfzZ4rIrZDmdTiJLiZGr0ZasV4xXj3Bt97RFzGAFIh/V9+79exY3d3XOyncBCQYHcy4SjVaUMBy
	ugruhRce0EFEVbUrJOJ1wpiGfloO3Dr5oMu99TIKtlspjkZ/ZfoZdYdmgvNU5IxySIWaxSmRRtCiG
	GATGRJqnd1joTKVCUVROdkvlyUPCBUlb8yBN6+BJz6qwsTtW+HptjSA5bBpHwr2kbdmyKDyVkMxUD
	wiBW8Ua2RvmD7vCXfyS3JNuP+0gh8welvxan8W2Ti7issp3OSZ3H7nU4/YjHueAL0JD6ea8oZZukG
	f5FpdQsRxPHN+hHyKwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFoo-000000032nD-3R05;
	Mon, 01 Jul 2024 12:07:38 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFhe-00000002zsi-0QVU
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:00:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 371C16000B;
	Mon,  1 Jul 2024 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aHAgr1AUMIYTiMO4TzrlpHUTP45cb4Qfb4xfsok78g=;
	b=JVny6elc1jgoGI4XXcp9685XOb/1WhzbIDIqMMVc8bmAiIXiULq08TmGFtQvJp6gRMphnh
	P6hHzN7etB6rZhYkf2U+D35pCBwZvmg7GTsmTSWciYIkcB74sCTUx83yUG03A/1vi9ExVA
	aiL2O8EQgCnssKJxeq8gpmyS5gg/Bd/7db5D4o2EmM+tc7i99XQ8UULkj1MsIpOzgGfegL
	WbM8DxJWT/KeJu8hOpnyfJeOIyHv9N3S6YEyFyuu2DKJM9wmRcY8/F8lL9i5ZThzOxEkSW
	oBTrUiA9Xdt0eVHPrcXgQ1tTAsU0+qgLkO2x1eXmEyYgdUI94jIuEC9IX27K4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: add missing MODULE_DESCRIPTION() macros
Date: Mon,  1 Jul 2024 14:00:07 +0200
Message-Id: <20240701120007.525382-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240610-md-drivers-mtd-v1-1-0f59183e4005@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f32ded4b55753131272129c58e743d175d0a3c7e'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050014_442472_D3E06942 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, 2024-06-11 at 05:07:13 UTC, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brcm_u-boot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tplink_safeloader.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
