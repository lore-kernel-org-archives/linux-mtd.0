Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBCEC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A//q+GrS/5R6PV4cw5wnIyE0zU+Hmd0BAUUBDPT7oSo=; b=C/0xzm4Qbf0UYo
	Ut3KXPUAyUKd7IiHbIpycyYQ7h0/wQgdv/2UIIy9INFJkNvc2K33xkOjZmwAa9Iv/hUvT5/KwPcWY
	3QbnCHop2WMjlS/WeYJm3S1c+sWnLow7cQ3wxlCaH9Rg/KVeOocdovU0c5pJFmEengJJ6zopI8ksj
	S8ZpZNEud0EY9AiXc328fXCrXc/4DhBeqRAyAWYeI35DmI/ElP0fzU9gbXn+RJdUbcUksqM/qv4Ou
	oSgDua17GyKkfCCDiZS8+cElZnDC0p9MbEayk9xYAOfmJedi0d7oAZp4aF6WCgZvq54daYHSyu14e
	/7zS+mUTzMX85MaRKJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG2h-000000038wK-0sfV;
	Mon, 01 Jul 2024 12:21:59 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFhv-00000002zzi-3cUR
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:00:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 581EE4000D;
	Mon,  1 Jul 2024 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUg8N+QU6C4GigySnqcnzizYYV5dL0IssWNRBHYgoR4=;
	b=V2oJLv+RDDvqgpngTUbpB2a6TqKGtzwCGJpaaFDMDfbnge8RAnjGpH1m6ap5z8NWqCS/2W
	IU1MMAw6Ba7+TjoXnpgHbxTuLB+qiRTqiBNp9PuiDOWqb54yDwkx7F09HhUpzb56wjVEpR
	DJoReRIf7jPqHRlz2OmTy0RCnV9vK+Ltu/Gjf/ucBlgZluSn6e/8uiJJS4aQED73zbbqoA
	eKFmmHfh2k22S6YbUD6c7jqPUeF1tX9Ppota+lkv6pAQnO/NXbKHjSV5qatTzmjjW3Cywb
	THYi+GtG0MNmJ1dAwk4+zBwSbpTKOnMfcDKNHWc+Qb1DcoXhMPjFYlKZSCj8cg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: qcom,nandc: Define properties at top-level
Date: Mon,  1 Jul 2024 14:00:22 +0200
Message-Id: <20240701120022.525479-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625215605.192260-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'31489eac5e4835d4521be320c8e5f4517780572b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050032_501508_DF38ABA3 
X-CRM114-Status: UNSURE (   8.16  )
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

On Tue, 2024-06-25 at 21:56:05 UTC, "Rob Herring (Arm)" wrote:
> Convention is DT schemas should define all properties at the top-level
> and not inside of if/then schemas. That minimizes the if/then schemas
> and is more future proof.
> 
> There were 2 "if" schemas for "qcom,ipq806x-nand" and the
> "qcom,boot-partitions: true" unnecessary, so the conditional schemas
> can be simplified a bit.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
