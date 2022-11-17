Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82659C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjhlGDV2JZ0SdSHOJD2fTBxUBRbhBrcjEIuBLUHc7yY=; b=06XujfDN6LPZFT
	2msnSdmnQSasygnGfZqHZGnhRJfuTOgIglssggyLdb9YbVTsXw5C19vMjaKew9mJxh7v70t5f2Rz/
	jTbqI9kXU1Ca/wlYMuIMnJArD8EiVewC0tULek7A9YDar1LW3VHnpUxLFFPON+6TBKNx3xBKa48yD
	WRwehyTu8FTsNiPZZiDaoELgVd0mD1LCp2d7d14+aEoP3k1jNWJ6obhjlvQ/gw2KURAGuw3KRrg2X
	1Cmhf+pICCe9tNKS8F/V+u2f865Rbj3sGRMfR2ex2Cd/+XgzjJVSb2CDYV8CAt4syTfzv3dZcM0Qd
	/uj73ifke4Qyn6aGW5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmDx-00HXrX-NC; Thu, 17 Nov 2022 21:15:05 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmDu-00HXoc-9P
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2E579240006;
	Thu, 17 Nov 2022 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=676Ci+ArdGmO9gtFmjKwk3wPDlLDxMlHsS2sEFwfOTU=;
	b=neLKmiZ4QTXkhSKVHie20Ze27uces7qsZa7Pg1ITeRq5shfv5JtkLyCd7piax0uHjLRTqX
	mjYg99+yLIPtMksv7tnyOffFfIiRYz+U5i99W1+bS/Z2N3S4fEpF1WdA0r9I8NA2gFQLDf
	qtAF4VOjjTFGc30WKhY77uk4QTz4nKCcoTvPgPJD40eBwTa9yeaLi8dfHEN9c+GM20h7cK
	XKi44VGvLD5IIkPvbacTQco5DOBxiC2qegtcFhHcb4t6GUDfXEk5ej9E3tHHTnjAce+6+o
	Pkj5+l5CYaX78RtsolZrsHSsPKJEpBmQ0/xwFaF7Tk6/TilKEuvmM7zRjL62nA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: fixed-partitions: Fix 'sercomm,scpart-id' schema
Date: Thu, 17 Nov 2022 22:14:54 +0100
Message-Id: <20221117211454.1273169-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111212824.4103514-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2f05bff26c9e847ac5f68370eaf3e5f5d3bc58ce'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131502_501772_3B2ADD2F 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, 2022-11-11 at 21:28:24 UTC, Rob Herring wrote:
> The schema for 'sercomm,scpart-id' is broken. The 'if' condition is
> never true because 'compatible' is in the parent node, not the child
> node the sub-schema applies to. The example passes as there are no
> constraints on additional/unevaluated properties. That's a secondary
> issue which is complicated due to nested partitions.
> 
> Drop the if/then schema and the unnecessary 'allOf' so that the
> 'sercomm,scpart-id' property is at least defined.
> 
> Cc: Mikhail Zhilkin <csharper2005@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
