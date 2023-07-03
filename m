Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9668EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jul 2023 03:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj1hd57TkGdR6piqSZNq9uoIFU9EZnG3Oqbk29WfhNo=; b=xv2T5SXHfWO1DL
	tVa3cJHx/G4oo+eIfhx/sRCaeYRC98FvlAFbVlbFDONggSrc8+NvhSB4DOFonbTX1/9Tw7G4O3VCw
	+xruXI5R9Wfgtbew0n1wyCbiq9jGQriDb0ji5VIsXCSs6Jf3uUEZHSoIV7wSjhZuuAK1L8Uj/96BP
	P/olrrKTUfh6HEsTTAnbUSNtu7ChWas4pVvVImEPMPRV5KA55YaQ+DVWE4n3UCfujZMow385XLz3+
	BXZKJul0xLRBEsMC1DPts8rWF8Vzng1pI8qIgFQjwcIFsIwnNWNiaiUVdEwmk25rnlBHQ3rjvLTaY
	EhCYZPbYoqEjCYpIAluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAac-009Ceo-11;
	Mon, 03 Jul 2023 03:51:02 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAaZ-009CdR-1S
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jul 2023 03:51:01 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0CDBC2C04A2;
	Mon,  3 Jul 2023 15:50:49 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1688356249;
	bh=V/moquzw94k+RD/17vle2ubXDMwNpgVNQy7Yswy0IyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qHO2p0ily3m712nHX8LWyPpjiQlm23Fam3ARpukZt087eBjBNucFeF3VU2roiZ/S+
	 0q8+47P+il/rzpiG/f2DpU12GpN43stuU7PiMPYuZlN8yoBp9FK3ARVU8mRbkUHCdP
	 7jKce2+WN2/C9pTUDarOwRO0ly58tJA17owHlxm4/IOASpPdrCYGRJD7RkgoK8dpPP
	 Te6chOyVzujhqdlvJmjE199l1y4sp8UHj+9zsgAk7jcELpArJMOizOTVMzSOnub8eP
	 I72ElAxREHBQGugA4YgAmCRfauO4ziZCdpJgVO0MbJlrp0GmDkVdpYobGFUxXcBF5T
	 Kk65muAFzUS0g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64a245980001>; Mon, 03 Jul 2023 15:50:48 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A208413EE4C;
	Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id A13A5280011; Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/3] dt-bindings: mtd: Add AC5 specific binding
Date: Mon,  3 Jul 2023 15:50:42 +1200
Message-ID: <20230703035044.2063303-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
References: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=ws7JD89P4LkA:10 a=XYAwZIGsAAAA:8 a=egi5vsMYxoiYnfbZUMcA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_205059_987387_A669C50D 
X-CRM114-Status: UNSURE (   7.68  )
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

Add binding for AC5 SoC. This SoC only supports NAND SDR timings up to
mode 3 so a specific compatible value is needed.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v3:
    - Collect ack from Conor
    Changes in v2:
    - Keep compatibles in alphabetical order
    - Explain AC5 limitations in commit message

 .../devicetree/bindings/mtd/marvell,nand-controller.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
index a10729bb1840..1ecea848e8b9 100644
--- a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
@@ -16,6 +16,7 @@ properties:
           - const: marvell,armada-8k-nand-controller
           - const: marvell,armada370-nand-controller
       - enum:
+          - marvell,ac5-nand-controller
           - marvell,armada370-nand-controller
           - marvell,pxa3xx-nand-controller
       - description: legacy bindings
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
