Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74254C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vs+35LBohBphKXGTJxxpcBHGArFSggwxZCSwqJUT04M=; b=AeTrAoUkCHtaik
	CkGj5sMikJRv2sUQ6AypXVhkIqciPkuz8r0Y1R6YTNBR1yBiQDnCg+ij9Z2Y5LS2fvry21OmOfWjU
	YkorznD8FrkjanuZhFTBKRc97oT2/vedYoy2D9t4nMuDqfqyKi/kK8Uhzd8loonwzSpsz0KW6kA4I
	bU9tv/Xbgr1GwqhSmmj+hhyNgJ1pLUgK2cp09FdTUqvR1KcfTCmf9olb4tl6v7qAnQBBMBuf+nGqi
	4eF5G8+LYTRJw04lKe7mXVEVP7f6u0J0q/17LcrRvSZkPcXjEqCNMXWSMIVtiNb4cqGgrDFzqw67t
	qg5FstZPzq01DVtNxTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0Wz-003COf-6y; Fri, 03 Feb 2023 18:11:25 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0WN-003C0s-KZ; Fri, 03 Feb 2023 18:10:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19BAAFF805;
	Fri,  3 Feb 2023 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675447843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9bjPh0iT94QVZCkysZQQHnFLioRTLBYvi144JTODXNU=;
	b=XhDkeWUlEurhZ3Bgl+5msyAWrbPKfkj3YTYEnmQLMeVYVWdU5m6CKF7q3531ClOozMraox
	HUAr/RAHLitM46YO2BSWtH+lIbL2yWIQjAQYvF8vtpuCEthQk/mjToEbJ0mwtZruv9q6th
	KoImtBb7r6XfuhLTdzENxcsC9lRcLUf4nTfVtKGfEiyhSz1+mp/RJHPJV/vQdG/ojbts+G
	y/mBMCjwvBe9gVAvX0pGzfuVUlhkte9YcvMSleuAlo8MOyNYJQO1MzvSktgG4s4sZHkOI8
	4+z42D78om4UtgsLdXkboKguxmJHFHkqDwUenexArPJb6bUimaXbAh0/5cwxOg==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: mtd: Split ECC engine with rawnand controller
Date: Fri,  3 Feb 2023 19:10:39 +0100
Message-Id: <20230203181039.436352-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201021500.26769-2-xiangsheng.hou@mediatek.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3af7ade257649d8e2e17eae96422b7868ed215a8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_101047_856102_5FBD5A2E 
X-CRM114-Status: UNSURE (   5.94  )
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

On Wed, 2023-02-01 at 02:14:56 UTC, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
