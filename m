Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A54C25B6F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52lf5Mq8au5fVjcG4wjXo44On6dvdDrmNzJpkRWJMEs=; b=KN08svUcFO6qzd
	yvdockMgVFrskFwFmaMSaVXdQ+tUqmB5ep8ZnfeJ7YESJqx/Yyl5XpxatZ//3frvlaOiuGBbgxhvT
	HVZWpR9tGM2daZQrfyzcT/qg5PTycTbAU/E+SvqodDvCHV+aQ/u22rCvfzT+lhEaKs2OS1A56nxEV
	f5eMVX+XcZD+LbUiIoGTxhT+5iix/GzqonA7DwClfDcY4d1FcsQZ4HeWU9jzsBMcQ+YI0GySjj8aO
	t2cbyCutM3dhlBSbiDSfdGCTeHpkKkV785YL3v9tNTOH5MWt44YGsDAZMBAEYxgfeTdtT83Z0Pxyf
	3kTSIEVmJjYsEpIAuvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvX-00GqzG-2G;
	Fri, 27 Oct 2023 17:47:19 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvU-00Gqxn-2M
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 17:47:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F29E920004;
	Fri, 27 Oct 2023 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzMCYtHoI7SG+hrdCFiCqKFA4nKMelQAhb2DhwTgKRQ=;
	b=ks2FCKwG+qUGKUKS+xSIydbNB4NGUY3mwlU/NgeDdlDTejLg2JambDcbwdSVHxjpDt6RUt
	SOU6wkVUqDvDPuNYREmWTw4y4l19+SkYR/efASy76gR27gfeiCCE7jeH4Z3jQUyM1WHzHy
	mPbVYC7t/7eCFUEPF2V1NPcbHqAafDEmZlQgUqUtr56luoeH2EYplww6oKLNY+/bJC3oBB
	w9FLaRfw30aAVWcE/AAfxziwv5+k6QSmrJlZZQAXHmLcr8t2gOYXO7q+ZcEt9i6JB7lV+n
	Y1868b/iAouRTioj4Z+j4Jr3mGg2R4itesLTyA8FLznzayFbfVBu98AV2TlnqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v4] mtd: cfi_cmdset_0001: Byte swap OTP info
Date: Fri, 27 Oct 2023 19:47:11 +0200
Message-Id: <20231027174711.369946-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020-mtd-otp-byteswap-v4-1-0d132c06aa9d@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'565fe150624ee77dc63a735cc1b3bff5101f38a3'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104716_903979_84D2CF81 
X-CRM114-Status: GOOD (  13.77  )
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

On Fri, 2023-10-20 at 20:30:29 UTC, Linus Walleij wrote:
> Currently the offset into the device when looking for OTP
> bits can go outside of the address of the MTD NOR devices,
> and if that memory isn't readable, bad things happen
> on the IXP4xx (added prints that illustrate the problem before
> the crash):
> 
> cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x00000100
> ixp4xx_copy_from copy from 0x00000100 to 0xc880dd78
> cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x12000000
> ixp4xx_copy_from copy from 0x12000000 to 0xc880dd78
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address db000000
> [db000000] *pgd=00000000
> (...)
> 
> This happens in this case because the IXP4xx is big endian and
> the 32- and 16-bit fields in the struct cfi_intelext_otpinfo are not
> properly byteswapped. Compare to how the code in read_pri_intelext()
> byteswaps the fields in struct cfi_pri_intelext.
> 
> Adding a small byte swapping loop for the OTP in read_pri_intelext()
> and the crash goes away.
> 
> The problem went unnoticed for many years until I enabled
> CONFIG_MTD_OTP on the IXP4xx as well, triggering the bug.
> 
> Cc: stable@vger.kernel.org
> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
