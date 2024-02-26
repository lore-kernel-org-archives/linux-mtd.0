Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C481C54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9hfW4mJ36WePQDXcl0tywiTZ8xgYYHIDkRWflWKBUk=; b=bJzE3Qt1b67C4M
	ie2lcIUyHI57D1l2aTkB4t7+XFtiqzGh+Y21iv6HjpJPWsrHB6hhTr3D9kKsRuT4AYROefXokwKFh
	8/lAZSWJPnGvUxC2TKEIAtII9Jh2G3eGs/gUmPjRns4tXAz3CQfic9822T7o+5g3FpfB7hL81V8tA
	Gnlv7L7wEjOpsMvra+vkTYBYgVXDu0ZsjX8cIZn5LeFGGpblXnWi8a0EGSQ9xaZVTLv4ZpJDLW8mo
	WrHYMefJOQsSXIJkiSdpua542hcZLfCW/LQxFdww0D4hCEELlihCUafX8QyJY1vxrhpZfOp0Um+AC
	9I0tlzpl5WJzHjRJOZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZfY-00000000SeT-08M1;
	Mon, 26 Feb 2024 12:01:16 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTY-000000009Gc-2uRy
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:44:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA30AE0002;
	Mon, 26 Feb 2024 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AO4akNw+96Nu8tYAznJ+U/EWh5SkwWOrFAKal+L/WwY=;
	b=MoqjKKzWXG0b3EBe8D9j+rmKxHoUn0TlC8U+WLxwFy6KATGubMq+rkhE3TlWjpNWEYeMe5
	/xgaTNwLMeFUwEfo2IjJNWpYxMn0rJsNuuj0rcJho501SWMzUvwXijWRCii9gtN16CUCpL
	2H5sFXeWTbdSxQz2wx2Z5rGP6Ua33RC24ejaIH4Q7foyQA47I8ee+81vhjXpoUtydQHcK5
	mGnDEH3zN4nXz5gEVLOxGDKv6eXT61ewSjxeXkP4qnub/qnpGv1eHfG+r5UZ0QCZpS7oVv
	XC3768fpMK1InfB9vN5lO45qmKJcr1mPYyeAkdGbfWC4pDTuGvmGVJCvaDTCFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: stm32_fmc2: use dma_get_slave_caps to get DMA max burst
Date: Mon, 26 Feb 2024 11:44:45 +0100
Message-Id: <20240226104445.489926-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219140505.85794-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a9ae475cc60d908dfd232d1c064fc34ec51d3228'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024449_016733_DA403C09 
X-CRM114-Status: UNSURE (   5.45  )
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

On Mon, 2024-02-19 at 14:05:04 UTC, Christophe Kerello wrote:
> Use dma_get_slave_caps API to get the max burst size of a DMA channel.
> 
> For MP1 SoCs, MDMA is used and the max burst size is 128.
> For MP25 SoC, DMA3 is used and the max burst size is 64.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
