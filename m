Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE7CCC6B1D
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 15:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzFXXpfozmreHc10RCaCYXaN/Zoq+KXtg5Q4n6tkUkI=; b=q2GBkCMuYZ4AmG
	CNXUgkZzLbLk7xDcjUUXHObi0GwzuIifATQAEen5jrN1DDgYrn/sZ0j04reIWDVSke/fnA8Wp2jna
	FU6Jsw+V/fSHnKYihl7c9ON2cghbj4Ez/BXlz8swKe4SY6LZG4kBfwXkSXkX+SS73r6zqWZeS1VfM
	IseoyzpuNWTUM1HF9cVN7kJsPkDhuDnbKj7TQlXQkN9SiiGVKhGuttJQH2Fp95A/Q9muteQSq4AnQ
	D/zT1TuQyY9NkoN79mHSw4u4kWDlyA30osu+1oG7iVWu+Nv+lwL08hJ83aa5YweZnCGce42PxrBGB
	c9GEWTxZiaTdMbHxvWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH19q-0000000Ft7r-2b6g;
	Wed, 14 Oct 2026 15:44:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH19p-0000000Ft6g-2wAe
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Oct 2026 15:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JpGa2J+Yir8NlaoWWrLQkWYYdSPxD080ddpDNAunxZs=; b=S2ZOv6RLShXD45CHfYrWVJYdbo
	4Yg4t/8qRVLz3t5CuGQxNeK0xlUN+WOV9VGlShIE9p+ERMG0UynE+ygZsXPXYPgOuvmpyS0ZeFoHs
	o3Gpd9Ptc7fTRNw+cAHxj0RvTBiq7r4mZx9iCs07JB/pIi/wP3zrIz7fy7jgI90mLAxHtFaieHmOL
	IIyue/oe4uPkOxEVja0ISdgOM3z0qpgVon5PrspP/kzzOXsC6JghoB77CZir8eHdRfiIoWFwsuyK2
	435ZNYfHvC3oNY4jz4vTYOP+yXXmNTDiGPftrLLmQTOu4TcTRVMfY84Mxpx9gcIFjMI3HU6QylDIZ
	pUUH6UPQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH19n-0000000GxPH-040l
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 15:44:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 04A511A1230;
	Wed, 14 Oct 2026 15:44:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD75C60368;
	Wed, 14 Oct 2026 15:44:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED58E1032806C;
	Wed, 14 Oct 2026 17:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791992680; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JpGa2J+Yir8NlaoWWrLQkWYYdSPxD080ddpDNAunxZs=;
	b=NpxY5RkCJv4zVUqluSlYSwRk9b0+FUwlK3pf/YrjAGwD54ZxcqtpQb2QONLrJe7bz7TRFN
	+tpOuvaClBjbZygtv59LQnBOabuEPxhzuz4b4uWKJrC0dbZRPeNEBfdfBOEJk7fjmKQLeD
	m0P3xDHJKEbQL/7TB4qEIeRUh314cdOvc3EbfWDrIOfLoPMFpS6k2EAYruhOVkC/fmg0Yv
	ZwX0ZeJTK7kaVnDYGivmPlQ1IDjkVp2KJlrntIXezzHcU4EkDgC6qTEiFFi9VLTSzmqKwr
	O570leonU/rpGNnf/99UWvB4+23jUzCqcUS/2tk+j80iJvvT64jQKJD9fb0bdQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 7/7] spi: dt-bindings: cadence: Make XSPI's IRQ line optional
Date: Wed, 14 Oct 2026 17:43:01 +0200
Message-ID: <20261014154301.157755-8-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014154301.157755-1-paul.cercueil@bootlin.com>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164443_172295_A63D6C27 
X-CRM114-Status: UNSURE (   7.93  )
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

From: Tanmay Jagdale <tanmay@marvell.com>

The spi-cadence-xspi driver will happily work without an IRQ line
registered, which means that this IRQ line is optional.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

Notes:
    v2: New patch
    
    v3: No change

 Documentation/devicetree/bindings/spi/cdns,xspi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
index 38a5795589de..dd8d03c07e68 100644
--- a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
@@ -43,7 +43,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: spi-controller.yaml#
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
