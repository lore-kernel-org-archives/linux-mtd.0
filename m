Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE17EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pxrUWfarjXt+ZAi6grbOAEoCqgKx2YeTT+17S9PXic=; b=Bpq5Uq0v2YANck
	DpFh1IpAriFIJCAqkFUum3n6vbhiqVMAhfnI+0SXilOSNhMhkEOBmobt6ym3vJv9emMqjI12x6ymD
	PJy4KOi9LRGf4tWGx7iMD4Q7RLGFDfeW7R82qNONdai+Nm0h7egx1PxwzIF7DWxWHFbamyNBv+rmK
	x2qxVuTyA61mzpBC+0UOE4H4DO4aWTmB9qIAUREto/3UmAzFeiAtuqIS6D8GMBFDWDmeIg2UITPK6
	zkmpr4KYI/C6V2DBVOMEbJ8JiOioZO2atuaZWTwa1fgi3rUGKnb49JX4oIpu0ZWfTh0x+BTEslfe/
	BnwzTiFP8mo0NiG6UUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRe8-001ofl-1I;
	Thu, 22 Jun 2023 21:15:16 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRe4-001ocw-0U
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:15:14 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94gitttN9rQF7Ija26fdThSBLjBY3CodgQnT8Xorylg=;
	b=Dtw7wAYNiUwxZxJ7xmQsTEOdz9SJ8s9MeFJwWnHfH0OnSMse3CiLLh8naxSpZZNMDEucr1
	dEDujFPPALm9OgXShz+zzgCnQdUNg/ccOXVTrAtu5oUlM+0N5yGeYU5/F6gmexUEoYXoRK
	/Te0WBTsv4uuRaCmjpeYzkofH0x2EWHOKBcQDBU6FdUgXkMBgINDwdrnJr32SX5vySpaSo
	SKsSZwkrqwGdKN2NkSHQAPyf3uE33/gz5ItZzNrLKLelum9HL07ElgeHO9tPjmbvkTaEgH
	FV5TzZ6G5TMjUvzF5aMCmJ+pR9bbhtn9Yzyv4rR/QR1sDK2ydMBokfccxUdbAw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0EB21BF207;
	Thu, 22 Jun 2023 21:15:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 16/17] dt-bindings: mtd: mediatek: Prevent NAND chip unevaluated properties
Date: Thu, 22 Jun 2023 23:14:59 +0200
Message-Id: <20230622211500.3581569-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-17-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2beb46f04bd7a857f4994dd1085a49254d6c6602'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141512_353070_E097C3B3 
X-CRM114-Status: UNSURE (   8.27  )
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

On Mon, 2023-06-19 at 09:29:15 UTC, Miquel Raynal wrote:
> nand-on-flash-bbt is a generic property which may apply to any raw NAND
> chip, it does not need to be listed in each controller
> description. The raw NAND chip description file which contains the
> property is already referenced, so no need to mention the property here
> again.
> 
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
