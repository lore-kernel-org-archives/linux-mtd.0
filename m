Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC47E6FE20
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAx6B2CzLZAShoy2WDah3CITuGUBlUcH45aGzbLDIT0=; b=OrAqYq7KvvSk4S
	bGECwIpQah4BOM3cTp0szGPi5sMSotIcdLzAVIvm49nSDbdJz2EjqnTSNlfBVMrEjrEPewze37Tso
	f2YWK1z+uaqVM2loxI2WwSuEphuwLnDwNQQ7df+yrm4K3CZOCZstGI/27KKRatYGW6+uAI2tslpDg
	gzV9ecF3z6zipKrSUHmMT86lZMbsy1QA7tu/9QbmLC46Dyf7dmqG6NCAmG0Q0YIldPX5EBrejRbQ+
	IWctjtaZri9k3OJ45E9wf1whcJ5GdSLs9fAG48PwhXPEA3qY8h8Sh5jvUiEC3kQcvCCaJydTR8H/l
	eUJI8NGFb4zAMrs4M13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaYv-0000000Cgvd-3nga;
	Fri, 06 Sep 2024 15:07:49 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaV1-0000000CexQ-1MUd;
	Fri, 06 Sep 2024 15:03:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79075E000F;
	Fri,  6 Sep 2024 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ee9E1EaKOTlVdaGoV/jFTAD6cKrW6LwAZgqUGO3N8fI=;
	b=QFdduUkyT1+QwBo+jlvyJMYP3/45JVTkmvu1YL4mwpOQaUBF1aV/jkT92vRfa8v3SRbIqZ
	fk9Sf+TsTdH61rs3UzxlhLpC6Q7AP2yYrvo/6ici5ot19NZWbvbWuJfXIYTzRGW42988WJ
	I1KJDnY/Ysxq2db8P9yqJosCZpcc9iOTgQHFx0HO/ZV9wGiXDrwCM4Vh869XCOF3T0EIaI
	f0PA4B8JkRH1iJDwhoFpLxZtxIecWCDA4tbGw9FV9w6IFu2pwt0SpkPOS4cXDtMPFRNxPz
	Tfxgn6/Nl/KYg78OmDL12HTvgIlWD5IXAnugF/St6P5p8E03rJPuCp5gAa7Mbw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>,
	miquel.raynal@bootlin.com,
	michal.simek@amd.com,
	richard@nod.at,
	vigneshr@ti.com,
	liang.yang@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux@treblig.org,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	erick.archer@gmx.com,
	christophe.jaillet@wanadoo.fr,
	val@packett.cool,
	christophe.kerello@foss.st.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	krzk@kernel.org,
	jic23@kernel.org
Subject: Re: [PATCH -next RESEND 07/10] mtd: rawnand: mtk: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:40 +0200
Message-ID: <20240906150341.734598-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-8-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8795952679494b111b7b2ba08bb54ac408daca3b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080347_539179_6FB69EBB 
X-CRM114-Status: UNSURE (   4.53  )
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

On Mon, 2024-08-26 at 09:43:25 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
