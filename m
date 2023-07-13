Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C97C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCFILnhF+QpfbFeXaP7wcEgyk63tGTZHxsTQYM4xktE=; b=0ymewNBvtMau7T
	BQVxP1MTrkBlX40YlNLWUKQ1JQ4GGTsx0zr//s/FjfZ2BlayjUnDMf3LU8PZBnm9U2rmLO1hn01Ey
	41bx2H+Bfb1qjWrE/QWatGq1p4BsRaVbVGtmhlAeC1SD+STxn3I2XIxl1gvBV7KEaaYYxFenRnEL7
	cukbIiuRBZfTXHhetUAHUoWCGvF3AGkiRtGN0YmdC81wfk9o0L50UXXRLvcn+9za8Pps8VDpoXeIK
	GPPF4Pkz2lrAtEdF37MyDD7fQGO4wJI7oSzOplTuTz1MTUAZmcShHIKZr8tbyY4WVrfg27PzZ041y
	gqGBG+V1RC1z39i7ICFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCw-002JOM-31;
	Thu, 13 Jul 2023 07:57:50 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCu-002JMf-1w
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:57:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 592F440003;
	Thu, 13 Jul 2023 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWvSrNQunJ8ljMyTw5kxdvMC1BOQXWHCrsc3G1hJsBo=;
	b=JbaSEYRUVfWqRnpwE/jRxxG2KLFHKBdC8YfqQtMFvmelVCGOazhplWIOtHok+NGIbu9ar3
	+iLUgAz2RaM8eO16BNZ18tR0zS6XhjE6PmFmHF/BeZmsIw7O7ghm0IzaEz0pu6AQxyIAY/
	ZJ0TkE4/JT/S69hirpbbWImb2P2P0aXVQWjwhp7s1n6dtW1g5YpgwubS06DHN2XWkltlnu
	/+H+AieYTLYcE+nuoaByzVshnbiZxW1OZMbI+8GVNKteCyS0p4+ubmVOZMfd8b7B0iTbOP
	+1sTKaQaIQXWxbAOkfFLsHNAbkgUR0BtjgTRjROr8GoEQPC7XAG/xV+1JkYyAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
	mani@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com
Subject: Re: [PATCH v5 2/2] mtd: rawnand: qcom: Remove legacy interface
Date: Thu, 13 Jul 2023 09:57:43 +0200
Message-Id: <20230713075743.486017-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710054440.23297-2-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'30e6a7c17d40e76ab4c4ef86e0e47b823a15ee17'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005748_771424_C0453FFC 
X-CRM114-Status: UNSURE (   3.53  )
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

On Mon, 2023-07-10 at 05:44:40 UTC, Md Sadre Alam wrote:
> Remove legacy interface implementation
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
