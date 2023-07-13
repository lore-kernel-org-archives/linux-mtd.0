Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5428EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fL9GpXw2hmkfuTdUKOq3tlqrx0UGu3hTgNFAhC1uZNo=; b=xuZsW9jZndEJgj
	gJ455lh2iFn3RxGCpuzw5X8PIn7kp5qhOAr/IJZjCSBUIbX8T4QRU+ON4bN636GuVns7Zdqc+benh
	AVMOJNTegUyKxT+8yJ+ZQ+LtMxpnx66v2g2m2qJLN73MKyaQe9Cm5Va4mo0KKLApSL/qtVknLHUrV
	tnQtNk8tRZnRjj8rcZ/5tsensTBgyOU+YqjipEOf/gpwCrUWhGGv5HJ43gvI4AMQnxfuXJAcwcaGN
	zfbpi5+z/gAEnfej1G463UIHnrtV9HPiu/39Ybag1HJvtsRyRMpjGdtnMSsMHgMGwQXCIgC7SgsBz
	GHMMwpKOq7QnV4SSo73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCl-002JKu-0a;
	Thu, 13 Jul 2023 07:57:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCh-002JJU-26
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:57:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E680120003;
	Thu, 13 Jul 2023 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2F/bUME+pf0s7vBUvHy7WZs0ckzsbwRu5dNQlGBwthg=;
	b=P8ftI59+SD0TPQod/rhciM+WFNJdIxxKI78PZ+JLD87iF4G1tAAG8gtr5QVEyEboB/3ZO8
	3+ogFfV9VEIe1Qn1w4zB+gPnU1gFPPHC0/aKPfw61ikTeTdW/51WUeYFgVvNzUbavGmHJg
	S1vKdTe5oUmRlhPbdV2gJ0N6CcqcaXfyUpRek8LM1m485q/LTcDqtdGz0fwi0Ttt6skgiL
	q58R3IS2fdSkNCYeYHo3SX9B2nSF5eiWhqmVQHCc3sCXxhZNYQbWAOKL2kdpfoba1TmaXn
	18VPEDPXf9YjbIdmqfDlKzgC4aapmc9yNV3KAYLCtbRH43Ie1Ww1qKdyxqqIDw==
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: Fix nand-controller.yaml license
Date: Thu, 13 Jul 2023 09:57:29 +0200
Message-Id: <20230713075729.485928-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712151042.433593-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2b42d718c7d7f4269d45fb58b4f74d7b2bfb08bd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005735_816268_433D9897 
X-CRM114-Status: UNSURE (   7.58  )
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

On Wed, 2023-07-12 at 15:10:42 UTC, Miquel Raynal wrote:
> Binding files should be dual licensed. This file was initially written
> as a .txt file with no specific license, so was implicitely
> GPLv2. Significant part of this file and its conversion into yaml were
> written by Bootlin employees which agree to comply with the rules
> regarding the dual licensing so let's fix the SPDX tag to reflect the
> correct license by changing it from GPL to GPL + BSD-2-Clause.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
