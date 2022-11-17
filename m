Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF306C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BxH5wgdQc+uRrihHDaZg1IxGTo3TFqFzJy4G6uhWWA=; b=1c/gsz2oI5UP2p
	p3AnEx24cwoYv1YQtT8kaAY2mUwPhkMgoJ/SHQAvbrE28TKLtDkc3K+DYFJafLBSXeQ1dTqaPy2lD
	4NAD6lBjpGU5GegHsYKoiJtnsCJoo3YBHw3zU4ooakq1y2ChCLld+7bMlgBraFZ+J1h1PbNnnHRaI
	BOEAVxSSVYJO8XnTLFq0YREKpdUbLjRGB6dk3jq+mjZW7nwkVqnwVXOmF2ROps6VRVfa4yNC7Pp+Z
	Ay6WigZynaa8Q+fu9cR3zPyLuY99fml59xMXWFv9NiRhsslsD5ERzjGajQlPhd4+S1pt3jiXVsADy
	4awor3awPaf2RlKSO54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmF8-00HYsv-4M; Thu, 17 Nov 2022 21:16:18 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEp-00HYb1-4i
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 32FECE0004;
	Thu, 17 Nov 2022 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmSG2ryhcdFT7d9uwU/rqC+y30C+C5ULy8i7jDFK438=;
	b=Blo/mK3hVR5g08POlDipvzelsxbWFIgGwguM/1SiUFoHybQyaOuwljcVp7A1Kk817KhBrG
	v5a7sgXX4UjwBMI8c5GHxMchg+NT0W5jtX0FM1iC9SWeJis9LQrTpi9+mCztrLd+9J3Hoj
	Z+1ERqswsSDyj6pjQdoHhxPckzuWcRJvtmuAd/C5zlQQOnBBHjKTrvTnU46oKZtJz1pyFn
	mIjz26qRKE8FQiBrYeArCTeaalsCGMbUmH7Nsv/DelFVePpPrT9B2ElYQFxVmTHAs0nWQT
	LjQreLYFDUaI34JiNkSBaf8KGBzMweOIGuU5dX+zPwVBB/7k1fxq3xPEHIsPxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 07/17] dt-bindings: mtd: onenand: Mention the expected node name
Date: Thu, 17 Nov 2022 22:15:55 +0100
Message-Id: <20221117211555.1273492-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'eb6fa33657da9526a9e5f43088d80b99a5c0315e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131559_468030_B77F1DF1 
X-CRM114-Status: UNSURE (   7.54  )
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

On Mon, 2022-11-14 at 09:03:05 UTC, Miquel Raynal wrote:
> The chip node name in this driver is expected to be different and should
> be prefixed with onenand instead of the regular "flash" string, so
> mention it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
