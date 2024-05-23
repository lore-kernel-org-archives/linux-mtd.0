Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30844C25B75
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2024 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RwW7WJD0czgwkVhVgI/FmrzNzVpkWttHV9L4rpjxPMg=; b=b1dv6OI/LJ0ryB
	qnCBXX0AXjGqFZ+tkZpJu7piIkiWtT4pGqSN5mZgGSL7l3qPsuWA5Sm7C2MxWYweF8mp4T39JGSbS
	xlNRzkPG2zYELC4yJqUZFhNjJ3gq7pTowguhEivcBg5aM9COoRkZtnCZfCYs/QaZCeCSf6Zq81zV0
	lVBdohJWfS/5+WJTqt8Lhf/vOxuSP+pujRPfMaQwJYW4NdRgLjNUP4t95EKE59TLkZGfnjRIK3yQM
	AL1uNXozG3IRnCekUpJif2oP+8hzrXvsHLEX2pHuFxJV+VUUweuhsQgzvbCwQ8bO7kSDxGxNlSsfw
	6cLiOyS+X0EIyueQJ8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA8xz-00000006QWG-1kUM;
	Thu, 23 May 2024 13:58:47 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA8xu-00000006QTW-3OZe
	for linux-mtd@lists.infradead.org;
	Thu, 23 May 2024 13:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=Wi7mrKqXXrJP2C7bbxhuWiixIqln+QxOIIfqxzOJhsE=; b=B9
	WduptFYpkNFUY/yOKcu7PUOWulGWckQ9s1eiukQWg6xDcHopsS022VdxwN1bH/ThCTNwbCM1jl18+
	T7ggZulEdyzPcVbENgxE2TwYeMMFq8FhWWIS3wV7z0D2B+eM0Xtj2fdfrWYkmOqOW84X+NjA44u4K
	1sf2ELgpGCqTHPXYQAN9dQhz8SZoAftMhcLxjqs9uRN0ibqmXxhVIhDJhErrHSjM+z3VM3iTVok5B
	TvjkFe++Swfbln71vwWLlWEAmUh3Ys52OxzGN6pzyNXP9GfLKCjFBjpULSZGV7pyM8tKtNJxRrbjN
	6fECV2DI7ohHDtw1dUthqERwIQEf7T5w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sA8xm-0009t7-4N; Thu, 23 May 2024 15:58:34 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sA8xl-0003xo-1I;
	Thu, 23 May 2024 15:58:33 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 23 May 2024 15:58:22 +0200
Subject: [PATCH] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
MIME-Version: 1.0
Message-Id: <20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com>
X-B4-Tracking: v=1; b=H4sIAH1LT2YC/x3MQQqAIBBA0avErBuwqTC7SrQoG20gLBQikO6et
 HyL/zMkjsIJxipD5FuSnKGgqSuw+xI8o2zFQIo61VOLLh0ozqI9gxOPdtDaKFrJaIYSXZGdPP9
 wmt/3A7VDsm1gAAAA
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716472713; l=1025;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=K8S/RH5xbSFWbYcSj/xEygnrg6Y4m/tKjga93P359e8=;
 b=qMuktJFS7Ku96n3tugCChtvnkI020HZp6LQY2vjkxJtjzq5YyGqp4QT7ihudxDbqvvFJ7p5kc
 4dXzuNWAZPCDV4wHDnPRFHVKrCOskNIYCrfGHJ5Tah+LRPszD0Z6MmS
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27284/Thu May 23 10:32:30 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_065843_177610_D8AA4352 
X-CRM114-Status: UNSURE (   9.77  )
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

While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
driver selects FSL_IFC automatically, we need the option to be selectable
for platforms using fsl_ifc with NOR flash.

Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/memory/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 8efdd1f97139..c82d8d8a16ea 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -167,7 +167,7 @@ config FSL_CORENET_CF
 	  represents a coherency violation.
 
 config FSL_IFC
-	bool "Freescale IFC driver" if COMPILE_TEST
+	bool "Freescale IFC driver"
 	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
 	depends on HAS_IOMEM
 

---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240523-fsl-ifc-config-c877902b297e

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
