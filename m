Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8560CC61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 18:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5lAOd6xHflyf+CBqu+MFL2GZTP5tR5mZMgB2h3KYB0=; b=G8MRFbZSDwlIo5
	K9SxSQAXKAAzdOXhR5G1NsQF//EstL6Ou0BTYUNsb49OSZsM2xrWSzw26avHglTMwxIPJHGRBqrR6
	5HGp5v22yb++EkMgZUEvhDlU9GmyGyoeqh+WMQZJE0TaYa3Sim6W2Nb3Fh3Lc9BTU9pkBMYbBm2NA
	Cj6T51cdsRqENQVO3m0cPTwrvH9grpsfi2quMUXhhXwBcmtTGdQW6vmtmCJ2o3KJ8So77WYW8Rciv
	2iWTPtJdhI/zd+nVE2/qYXIc5uavZqhXYqcfMAlJMO3dZVv08EYPf9DmbaHx3P9Dwkw/sLN/w2SYT
	6ctiq/yElp8iZEPDbC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0WP-003C2Y-ER; Fri, 03 Feb 2023 18:10:49 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0WA-003BvK-Hy; Fri, 03 Feb 2023 18:10:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1CEF41BF205;
	Fri,  3 Feb 2023 18:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675447830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpgofewfeUpP0G2YrwylOH0ay6haU8cUq6WmPtCbgPA=;
	b=V4vJJUndyagh//+LFto4ZLaVa2r3WbhPnsUnG/KBL2Svgu87+kEUsAaXXDAy5l3tgHzjzB
	5QazFLOVLXrAbn3bqlnWw4bEDUqcGSHxrpUFcGQOhTvBD092K2wVNDOnNveMLbLmScW/q7
	hAdKXFEG4TXEZ+BThNYt9z9muxMnzfw320+pWS70FTRz8JJBi674kCRndvLs89is2HnGSq
	o5Ho+h5bn2S4bGVKPsHIpOcnKhtHaDgaTxbW4GkOnAcR15vVQGu5z6+/NqljC+LBE+7lWX
	BHCZgWY6LGGulpDhT7rQcj4dRwdxeKWfMy/3s5ostUh1rmH+ICWkNtvdtpIHiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 5/5] mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
Date: Fri,  3 Feb 2023 19:10:24 +0100
Message-Id: <20230203181024.436280-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201021500.26769-6-xiangsheng.hou@mediatek.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4d21176f48124e06c3251af38350b05a50ac4b01'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_101034_759929_3EB53401 
X-CRM114-Status: UNSURE (   5.68  )
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

On Wed, 2023-02-01 at 02:15:00 UTC, Xiangsheng Hou wrote:
> Add ECC support fot MT7986 IC, and change err_mask value with
> GENMASK macro.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
