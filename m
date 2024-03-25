Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B1FC54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+o0RprUCtI6Kd+SXOLCWBMw+KfQhN5UeX6al8+OzcVA=; b=j/py+2CctMBmSD
	cFyIwT4c59jmup2M6jNeJCLvYwyMEK1A+f6DYQBO0jqxRiHScxDNS5mUJDn7ui8pfkg3edKGg3Rx2
	AFVza/0l3U4p0T1flf9aS56+UJ4c4Hfw/ZtU/SkxhLwk07mh+vIX1FqjPrsP1zf8q6Ib4t/6u4hAk
	naAMMvjXc8ekBSEwWvx3n4UHP4wldRh2I0RVeEVtDySWPob0Dxrl/gFhbdM5Xbpm1Vc5tI0NL+Nye
	2ZTgTu5KMgiV6jwgirfoWcZN+ADNfrhjlqwP0P7BAeMPSBldQIoFBqaVklWyHNpZJ2MNs7qveEiHS
	4fgJeqiwe2HcblFmx9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohQ5-0000000GhbT-3dse;
	Mon, 25 Mar 2024 10:19:09 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohPw-0000000GhSc-2W4C
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:19:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2EEEFF809;
	Mon, 25 Mar 2024 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711361937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9Jq7H/XBIyV3DIEw2B4dugvyjD/myGnixXMCD+39xU=;
	b=RTxv0fHCjmG3bNbQHP+5G90SdQSb2xtRR+szDcwe9UynwVYBjAAxSGXjB/My52UjS7mxpj
	x73nANsiPZLD56O3pxNBunMd8bmsYfYkKLJ4uZ9y5QIn1NIWAQ5vffim29k1ysrbjxWUxW
	zV1fIAWuMkIvkNQ7ZZHcEJX8Wex4mF3iChgRHG7Tzde9QYfILlQErVh76ti7QAklVX2bHB
	pyTUC/hT5ZreHyDJCkLYb1yA/r86Z5D+Abgzifo2ZQKfzDVFeIwEHffywu3c0mfWc2bOTi
	XwEbuuj83rXNZT+8ebpRKXuYXXHROgnPAM20feDvzP2pH2x+5y3h82t0L2SfWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: mika.westerberg@linux.intel.com
Subject: Re: [PATCH v2 1/2] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
Date: Mon, 25 Mar 2024 11:18:55 +0100
Message-Id: <20240325101856.262530-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313173425.1325790-2-aapo.vienamo@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd44f0bbbd8d182debcce88bda55b05269f3d33d6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_031901_026172_8849046B 
X-CRM114-Status: UNSURE (   6.60  )
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

On Wed, 2024-03-13 at 17:34:24 UTC, Aapo Vienamo wrote:
> Jump to the error reporting code in mtd_otp_nvmem_add() if the
> mtd_otp_size() call fails. Without this fix, the error is not logged.
> 
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
