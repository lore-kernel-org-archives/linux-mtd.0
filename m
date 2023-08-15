Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDEFC001DE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff6+ujNLsLYQMpcOKpSdqXmfC1g6PsbMYeB2IEbC74A=; b=bGAEVdqflc2bdy
	inGia0dS/JWLxvvAgOwu6Xg4FHJCZnNXTg+VskvUGKsJScxPeIdKzF/NPFi9XzJ9p8WXfIQkrjPq+
	ygnA/wWYhGBoyOUNhHZTmm8WZMFu1bzbQEk7aY6qPC+0y4eyJK+kIg+jFvtY7ibByGNnD87TLFqKy
	GwIYAbvWe7x4msO1yR2PnHG1bTvsKMA3KzQJw1dqRXnMwPCDV/pcCWT4X8YRzaHVtLKd89FhR/qbs
	+wh6QzHcXKkYWccrPXZTGlxaqwsMYdlBsovFgiBfeA/gd2Q9F30Z+zIkKy88kaWMJTNOuPXiRKsK0
	idTzDK9B4D99+qnTTcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwSS-001vRv-1Y;
	Tue, 15 Aug 2023 15:59:48 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwSP-001vQR-0D;
	Tue, 15 Aug 2023 15:59:46 +0000
Received: from [127.0.0.1] (ip-109-43-115-51.web.vodafone.de [109.43.115.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6B6F53D5;
	Tue, 15 Aug 2023 17:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692115176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74PPELyfTdRJMzG/844z25bsJa3XCvyEnvQBQNAdiaY=;
	b=2LurkNY/UP++tp7HyhcQAep+uOzh7mSWOIHO4I7wCdCKHTrppFFdvhjvrgs+ZrKui2E9xm
	JzvuT20uC9Zqh/+HN758R4LUWl8W3jqtbPyGvi2lWQol8JiWqVxuAeiF37/yk4M2ea73e7
	aST0SfYvNKisMulDXoy3rP7N4/V3meWHvzjvZ3KjmToa/WEbAs98POlxnc48ddolyzklhD
	2tn1oQ9akdoCL7IySSv+FNIigyHN+mvVecJ4hOCrPYm02RjxXEMaiIwd7m0LHhLhMMYnLI
	rBdaW6KeyIoU13hl8/44rNf7/hK9gozl9G2KXX/uAdh5QDeetvIsl5ILnk2m/g==
Date: Tue, 15 Aug 2023 17:59:34 +0200
From: Michael Walle <michael@walle.cc>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>
CC: Pratyush Yadav <pratyush@kernel.org>,
 "Miquel Raynal )" <miquel.raynal@bootlin.com>,
 "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 0/4] Add a property to override the quad mode
User-Agent: K-9 Mail for Android
In-Reply-To: <20230815154412.713846-1-hsinyi@chromium.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
Message-ID: <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_085945_337982_C5FDFD2D 
X-CRM114-Status: UNSURE (   8.36  )
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

Hi, 

>On gigadevice gd25lq64c, the quad mode is enabled after BFPT is parsed.
>According to datasheet[1], Quad enable (QE) bit needs to be set to 0 to
>use write protection (WP) pin. It also recommends setting default value of
>QE to 0 to avoid a potential short issue.

So you are using either dual or single io mode. Why can't you use the device tree property spi-{tx,rx}-bus-width? 

>Add a disable-quad-mode property in devicetree that platform can use it to
>override the quad mode status parsed from BFPT to use write protection.
>
>[1]
>https://www.elm-tech.com/ja/products/spi-flash-memory/gd25lq64/gd25lq64.pdf

should be a link on the vendor Homepage if possible. 

-michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
