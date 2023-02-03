Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F0C636D6
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLLH2nCzPUFebFy1DDmia7E2DCShfXlQC1mreP+I0vo=; b=UnQocK+1TtIjqS
	s02WiR1R7N+J35P6RHqwdR8AdxbbmChCYkPjpbHRMppTk1go7Bc+v9nzRFYTUgugdTeRlUmlKj5zT
	Cu8vxxdmHwyHJuKOYYsi2b3DCB/e2jjEDCpoEpZJQ/3V8M3Pt9CCvO4KpXcLJ6lQg1a1QG7M7uYvP
	0IDRrIxKofm7TzgnUQenzfajCXQ4AKM1WCTwN2eRFEH5DzQNOsh2dbwkdl+IHD34MJSmcwke2L3No
	uFuU4xQezxheEU03PhoJl3OYFKXO5f1VKahtbzguuZqEibi35oyk3I7Wnm+yMSAygfElC0Srm8Dbn
	KO0+eNiJDbdprSTtdUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0Wb-003C8V-Ab; Fri, 03 Feb 2023 18:11:01 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0WF-003BxX-Fo; Fri, 03 Feb 2023 18:10:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C38B51BF209;
	Fri,  3 Feb 2023 18:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675447836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbYumVFQdJh3v4fpXui6V//NHCF9KnW//5BymNroE+c=;
	b=oEx1mUdEZl5FKCBVldVayd0oQ0H5/H9+z8uGrsUCmhPyW6n0YrsXOic5QDcSHIWzDpLmoQ
	zGMnr15odXUtaSzN9bmtFR6mFXrRUOmALzUA0jsQIyAEj7uP9c95mhjyVGh7Popk4XwaXU
	Cw9dsCdKD7pzbHu97GL4Hn9Qgp0xy2KbDc4QVK7btd2WYa+L9QKgwAJaxJDpx0ODPEjXzN
	lTpV74hiVp7zL8TQocpGEWVYuIDVlainssRVTBHsa+wqZlHhojxlAg0Q9Jy+WPQ0Cd/qn1
	pEAd6vmJyi5n6CwcIAzvP4AzEKn5WoGDm4CbiC3HIvUibDShVLkyiuCCjx8auw==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 4/5] dt-bindings: mtd: mediatek,nand-ecc-engine: Add compatible for MT7986
Date: Fri,  3 Feb 2023 19:10:34 +0100
Message-Id: <20230203181034.436317-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201021500.26769-5-xiangsheng.hou@mediatek.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'70d3cf76f937fbef9c55eaffe1c848208e1372e2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_101039_886848_5055E41C 
X-CRM114-Status: UNSURE (   5.34  )
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

On Wed, 2023-02-01 at 02:14:59 UTC, Xiangsheng Hou wrote:
> Add dt-bindings documentation of ECC for MediaTek MT7986 SoC
> platform.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
