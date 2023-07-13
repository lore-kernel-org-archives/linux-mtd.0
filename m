Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36A1EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgZi3it8Q9jkjKgiABJwzZtboo3RcKtXXjCJnkw726g=; b=2REFLwdKqTaCdD
	ocs9JWKsEerFE16qt3QGBRPG1/5LI1GuMKEuNPg4euPc+vsb80NqZTlCHXT7uheP1MQbhHD0S4+k1
	IU/mMPTfPL9GoCaGdEexBreqkvDMBrS3ZMrvbGnNthDaxaDby6V2eyPHodtWYzX2+PMvufISd3Ehe
	iUZuwY0cLk2DJJ+uFNA3Ds9HZbSzXyJkpsyQTqpvP2j0geTx4OXRNF5DYUE5rAuM8/berRGo3kKzx
	iTbYv8+yitcseTXh6Ledpn9p8e73ivXieRiV5OZ0o2cejkxaiTGrle04iLnrVG3vQlN+jcUdekYmf
	eG/UamhJwehzNBMocu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCu-002JNP-0o;
	Thu, 13 Jul 2023 07:57:48 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCq-002JLq-37
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:57:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56988E0004;
	Thu, 13 Jul 2023 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MzsWKu93YUuwDnnOYLybugWHj+sLe8pGA0PY2y1AfTY=;
	b=RpuvX0wATqkGz3AN4v96SEsjo5sXZy/JmAWgdT7IrbPqC7Y1i2HOFQqFujeTrrcWhnguRi
	X5m0qZ5TBmbMqoEUKFehAOacSzmoJdF3MADTC/cNEHKE+5dpoIRsQiJgAYC0haIEDklmin
	rL4x7sC4PHdeHk+l56BO2hrm5g4pfCKIzG21xYdaSSNGx3aQjL1OLSXs6CRo7cPdg5w23v
	xMu2IwB5R81/XJisyaglpUpgxF0rKRaErUd7hwNfMp1G05VCpW6lCgz38mTw2xaybyqZIu
	TaY2iZygJ6DSdcQ8g9dbburtjRJz6kCxYqXpwYOQdItfFjnFE8E035mKvC4cpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: Add AC5 specific binding
Date: Thu, 13 Jul 2023 09:57:39 +0200
Message-Id: <20230713075739.485988-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703035044.2063303-2-chris.packham@alliedtelesis.co.nz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4729fa4304c3e5191cb407885abfc9ec55a1429b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005745_133555_46AE8839 
X-CRM114-Status: UNSURE (   5.80  )
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

On Mon, 2023-07-03 at 03:50:42 UTC, Chris Packham wrote:
> Add binding for AC5 SoC. This SoC only supports NAND SDR timings up to
> mode 3 so a specific compatible value is needed.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
