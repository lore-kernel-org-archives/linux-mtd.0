Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CECEC83F12
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTMoiKuc3Wf03JVWlZDbL311hvv+7u0zPY67xrYyIZo=; b=bEArX9fOn6FZhg
	aXrNEmlPHsS92wdzrEatatUBwNgE2gddpkAMlXwNgf07NaZ9YlSGeNiS+gQCgAwu41lgSKnAgQjkb
	RkCEnevXqm601j5tcWcxngKtAfWgIAoHkCk8zC6OL99mC4np1JZ6V2nE1talp/sIWSjDB+u4Tu9yo
	nD6c0ZGBpL7Mi+p2560vQ+MmoobV8KRkaYs6MU+XlwelHuZGzfHOMXT9ct3ULNIrNX/UHjrzhqZEI
	dFPlZlm7TZWqJjvihAh6yt4QZyFAvMt+zr5OgTcCeNT0B5kwc9SgkUFJ73lP8U4cxHRHgQO20aRSv
	c+aJ69R8uN5bLGXMzMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVuR-008xn8-0O;
	Mon, 28 Aug 2023 06:39:35 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVuN-008xlf-0s;
	Mon, 28 Aug 2023 06:39:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D82F140004;
	Mon, 28 Aug 2023 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693204765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpQUqoK74x7Exw74wcARNL1ZHPIzosJd/zpLIVQLopE=;
	b=Eq2H0ewTKGbyEHunUQ7Fm1msiYuDUHWx8ldS+nPI1ah/cvKP92pz2fQDhziqOP2NBBW8+a
	IaDgYXRFfGTCpMF3vjTf/h3v6W1QpAoHZVMeXJsx02Vjc+P7Zn0LfNtos4nFE5ZrsKDUzF
	DNZjr9lVqe7BYfDfWSRhbi39Lt4aPnuB5wybG257vD0v1m70AwIXXeq34jmH6vYnW4wCWv
	CJHKbvaToHTGoD8cmiRLL6UxOk/kMDY6B5JnpwzvTHL3yG1uQaPYqm7duMCau8kt+fZWEE
	FCyObF1PNHdgCtOCUjNJw7l7TCBVTkNfirjUCnWniUg7cux8JREbxlGVTL6A7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: amlogic,meson-nand: drop unneeded quotes
Date: Mon, 28 Aug 2023 08:39:23 +0200
Message-Id: <20230828063923.8644-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230826093852.9334-1-krzysztof.kozlowski@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b9283ac01a277e73111dbd06d1974ace30e40f16'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_233931_623506_AC894A27 
X-CRM114-Status: UNSURE (   5.55  )
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

On Sat, 2023-08-26 at 09:38:52 UTC, Krzysztof Kozlowski wrote:
> Drop unneeded quotes over simple string values to fix recently enabled
> yamllint warning:
> 
>   [error] string value is redundantly quoted with any quotes (quoted-strings)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
