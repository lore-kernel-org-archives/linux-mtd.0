Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C149BC7115A
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7bkBtQfaKdJvACjJwPE6nE77Xoof5FK4NtfzsVTIHE=; b=R8ZMWICxqWWzqN
	DC4V4yr2TxOOS7wyQEXJdcocG6qNrKjiEf91hGcG2itzrAYuXOLk7S9BbGPsLWc+AhYhid/nW2JNL
	gU1i7tineg8HrekNebTrIbGroHcX+m/bjBp7sYmQa+2wpHHGxtIAE/+M2Q/5uUviQRMw9kQ/A7TU+
	O0XVP5ba5yZat5GYx/njyL6ZpgnrpQZ6dNkWvxysC0+Qx7cW1WxLQM8KuEPrjFn2aKlXaf3qr10Zl
	lnbYKSNF7kQCnFmwHoxM5ZVgWpq50Ea7xPwtWH4cDJGfJ45FAdcVp9wbNKFqdztBmHCLCCj84BRhZ
	1epzuT5CGJnzA38WPnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fE-009Vgk-1Y;
	Fri, 18 Aug 2023 14:41:24 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0f9-009Veu-1n
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 552304000B;
	Fri, 18 Aug 2023 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FLAseE1T0hWy5Y5VYaJohb6YUOHEOK8PID3n6/GDsDs=;
	b=FT/XC3e/DgWNjIC9vgKskc/heRbRSqFAnhX5NDA1H5anIEQPZ7f8T3Em97px30vWeeF5Cc
	vdtqb7bzZECb2qvLNFhMCE1UOBaHoQmLKyLy1yA1Yj9WqMP/Qi8a10D2QRkPLTPy5XjEWg
	sukjYLE6ZyWWd6uleEgReC66zc8ZqeT9HH5Q8YKPsr+0eM/tQSCl6wn1XEQyepLfXO9Fb8
	HbltG+z38N5Mnu9FMAwrubpevg0XZJRZTc3zv++tUNSapKoZvSaqFyLp/w7Mi7h5+7Cmjn
	B1wVgTxpQri38awlGQmZppqxddEykyGp7AvsgkTmdrSggaTdwpaGt+t+6favdw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH 09/10] mtd: rawnand: qcom: Do not override the error no of submit_descs()
Date: Fri, 18 Aug 2023 16:41:15 +0200
Message-Id: <20230818144115.145909-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-10-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dcd1e618b6cb59b87eedcbaae184dfa982689b01'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074119_786837_A5F04178 
X-CRM114-Status: UNSURE (   6.01  )
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

On Sat, 2023-08-05 at 17:41:45 UTC, Manivannan Sadhasivam wrote:
> Just use the error no returned by submit_descs() instead of overriding it
> with -EIO.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
