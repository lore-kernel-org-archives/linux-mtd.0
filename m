Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F91C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5wwq9//As3860S8HDVTvec5YaD8CrLLQ0oF2usn4Nk=; b=UJI9dcxgRfCJ0l
	oJlJ47eXyZ0sl5BRUnR1hEof3pvvGay7JyVMPdyHIDXWuVdRy4pHkjGCn2gunXzd9T3FMaSE2xXo0
	rMML0/VkxizPz5wmQZ9g7hmXyRI2CFdjRNBeZSTeA3d2mbKZRZjC9K6Sr1MBf6NhfBPVhObrtpaN/
	rwPEf6qmSjJCDEmxoca+GbXrurJYbgTdumVmfzItn1tcIpW1BhvqDwrjXszAbT61QNl0y73QoLShi
	a6GTF+f8DIQi4nxMqsJ6R/ZMgX3Sho8OI1YgHMqvmJ1nJu4NPA3/a9l3TgB+9voyg8M6Yx1MxpV8i
	WdNVKGQx5hQ3VX8yowag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEN-00HYEE-Hl; Thu, 17 Nov 2022 21:15:31 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEF-00HY5z-I8
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8306D60002;
	Thu, 17 Nov 2022 21:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6qGJ8hYEOcikxIJlQMYtOeajjjWYsxMhSCOqXTk/ZTE=;
	b=XCEAxK2bgH/xR2W8/FHsFMoyF3M+3P6B3DnVbRnW4yNlzGSLWcch1/I957XpgthqJZ948i
	XlHE26UmH7BjuWSTdxiPJDjJjLv2ehUyJsKdjT/9AfpskmDL3wWiTDCskbGHys3OvBwkiN
	oHE/Cujy0RxbINcvtZyVHCZ+H4p/tmQy4RXePNO4uYHqNEcb0kZtHS/pPTdWCcvxHyqoK/
	kc+vD2jNLNu/VHPENFIxJ8pwCIA/Tt3DQgXHpMvNb4H3PQ0VyJeWDTaGnBxy9IGX55blpD
	hCUUvK6cAx3oPUs2sheQxVxHpHKbmWehPakdbA77Oy466YzwJ3Uo2dNC7qUcfA==
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
Subject: Re: [PATCH v3 14/17] dt-bindings: mtd: nvmem-cells: Inherit from MTD partitions
Date: Thu, 17 Nov 2022 22:15:17 +0100
Message-Id: <20221117211517.1273290-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-15-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f4b37577a431fe1e79b859f6ad3890e29cfcf747'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131523_803159_31389B06 
X-CRM114-Status: UNSURE (   6.65  )
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

On Mon, 2022-11-14 at 09:03:12 UTC, Miquel Raynal wrote:
> The aim of MTD nvmem-cells is to treat MTD partitions as NVMEM
> providers. Hence, MTD partition properties are valid here. Let's
> reference mtd/partition.yaml which gives us a chance to drop
> "additionalProperties: true" in favor of "unevaluatedProperties:
> false".
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
