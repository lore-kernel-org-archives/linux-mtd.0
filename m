Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8A5C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2024 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lf5+n9jb1DvIXWORuNLGPVU+OzifXkIBBs6L8WbSkLc=; b=AYt3OdKBDbqj9G
	yJL/UdBgY/r+4wmUADomtdn2LD9fUnIBGycuSDlpnNdwPFNTsi2Syc3btdOT38FRPUs1UI67ql9Yy
	hUr0DWCsrYLJMk9+miQBPCqxJib1y6wvpH3KnC6jS6ctWsuhP5OpBC2VziuGOsNp0ewjnIahA1pN7
	dNh1HATQjH4KyrbReK+8jG3XYvUsupK19C7ADmDF05EMhuMzZk3L4/pB8MFOxGkqh0seKLrKYlHqu
	zSfZizo1N5tmpaa+23XosR7XcdmOfjB+SUjrSJyljFHhrQ+Ukwge2ZMpYSZZD70+nVAc9d7xZOX+Q
	yi3ElvvYx+wG+IZ9Apug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCh3f-00000007anw-12ne;
	Thu, 30 May 2024 14:47:11 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCh3M-00000007afy-2kI6;
	Thu, 30 May 2024 14:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=toaWrj5FfqF/ruqvJdFwvhUkuZ/5yd2B9mg0A1EUPCc=; b=i39I0L77RLa/WGDh9Rr8VkM6Ns
	UpmaSvHkHTN/CPEBgqmCyHI/OZQXd8UZrDjsbNpE5y5LQSfZFnZdlMldkzlgzFectIjOqX9zRM22R
	PAhaTuzYoojP7K7IXMRoW8jc5LAwkqCKAXXLw6xQHCf9qzh6LSGpMDGdqI8rKR031F0XJzyOphdJu
	l2bH7e+/99H2TjtCxOkzmORte2tJ8Br/R65LSW9/tf5lm1xVZaa6csPWrmyrOUY/kiO5+Fbf4Ib9g
	jLYNLzl2r3d++3k+VBXlmd/1TxYhhyziDu81OPW0n81QudB/XnnBgJ1Nfc7Z3Xhz5II1hMQ9pX5i+
	6uYAg+tA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sCh3C-000CAq-LO; Thu, 30 May 2024 16:46:42 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sCh3B-000NEd-27;
	Thu, 30 May 2024 16:46:41 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 30 May 2024 16:46:38 +0200
Subject: [PATCH v3 3/3] arm64/configs: Update defconfig with now
 user-visible CONFIG_FSL_IFC
MIME-Version: 1.0
Message-Id: <20240530-fsl-ifc-config-v3-3-1fd2c3d233dd@geanix.com>
References: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
In-Reply-To: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717080399; l=723;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=3WWCjetdOX3kQpU87n8wx9QXjR46liZT87iarxYhdGQ=;
 b=Kr8jncXQgANZyX+WMklgsKt5SScKqWEIneLy3JnIPD5Z7LxQ6+bIZGAEkTM7JxWF2zvKlqZa0
 xBCjvJcbjx7Cei1AW69pPLT8TqKo3ViOJHZyBPp8xAkLrH8gfItiX/j
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27291/Thu May 30 10:29:52 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_074652_736460_BCAA12D0 
X-CRM114-Status: UNSURE (   6.59  )
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

With CONFIG_FSL_IFC now being user-visible, and thus changed from a select
to depends in CONFIG_MTD_NAND_FSL_IFC, the dependencies needs to be
selected in defconfig.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..d101593c3be2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1429,6 +1429,7 @@ CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=m
 CONFIG_EXTCON_PTN5150=m
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
+CONFIG_FSL_IFC=y
 CONFIG_RENESAS_RPCIF=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y

-- 
2.45.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
