Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2044EC001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2MFI92rlRIFc3ui5dLO15c20FNXtK+RMkyy2sFTLuY=; b=uqPmQuQbmb29Xc
	X9GCQNdWQhhuz0SnqlJEt/AUzIo/is2KLA7wY7yTdZbBUe6jcyCecwV2dmwhCvl4a880/5Hwu/WK0
	UHnD3IYrMl+vF2hWx42Q4V6rE23ZPSy+brzru3PuyT/VftGIxJgJ1/Z3+uCnAr3Iq5ZEFwbYxSAJ/
	3ZbAMrAYBkOOSc7DPTse8zqsXvBO1EFijdCRXAGfCz1TXWEzG04r2/l2WDtv+1x37EsOF4YhWmZAI
	mzoSmk6dZ909wezIFv/roSvBdel4VY3By/Lb7DB+fEipVVHoqWIu0jMmSZ8WMvH5wbQAKKYHVFHfB
	T5XnlHLnBegANkYrArCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDc-002Jsn-09;
	Thu, 13 Jul 2023 07:58:32 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDS-002Jiq-2k
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 863821BF210;
	Thu, 13 Jul 2023 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0bjV29wYjqB+q/N2ZyF/FiTtB3lwfxaqS2uYRcMBcI=;
	b=XTspBV1M0r3b/VnnxufJIYNWdA4BhMTNO5ZtwPhoSgNhUk6eAzpNB00p1fSiz9+WCd2rKA
	Nxgjx5bLM4SmqQXXIHZyZh8PxLzId6TETat+Vh4iXrpdb8PN/sAO5HuIlx9sabcSh/C6pv
	SFrasJcnHUUyk7KBIEJGtk51HyNRHgGxNPpPS6sTXdZcQ9Kl8YguCHv/qPOMJ5OaogRmNV
	rCql6k0GUhIkWdI/uIedHXEPUQnorGBTAR73FPj15wRpViPuJe2lH5KA2GPh+v5itxN14/
	nQyYBOis2hoOLT0dHg91bucZiNO2ahwGlipP0oxECqrlx8UI5GH11HSUDaWdGw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/18] mtd: rawnand: mxc: Convert to devm_platform_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:19 +0200
Message-Id: <20230713075819.486335-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-3-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c96b3e0905b41cbf8e369faa1e4decded58860b5'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005823_095922_CFAA96BF 
X-CRM114-Status: UNSURE (   5.30  )
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

On Fri, 2023-07-07 at 04:06:07 UTC, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
