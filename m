Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE56C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:17:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53EE720C09
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1X/a1C5W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LNOZT4tB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53EE720C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0TQT/b1QO3M4yCylcrEtIltNSRMfAQgrA+LuJq7Ggk=; b=1X/a1C5WDrkgeiWxw/CQnD0hRu
	Jvk4o13gWqyoudOceFnuWqpY4a6qWKLlbt+TAb1nJPWG2apreHqtt2Qzy+97fdK7TrKUJlxjnH7Po
	10ollGYvz29R+NEzBry2X3W56GM52xIpkH1/8L4l5dncCdvoeapWdMV8d/vPfT65P4ZS8OzMHCWne
	Fwo2fq19G/61bA1llSZM7T6uQ8uF1RZkRJ4Y1QefUWj7stsDCyDoIm/b6562AhWaDUvuqO8OHalnk
	ymyM7AT1Se8iP11P3D3XgJ6y/61Oja8Qh6zbyX8/eQXxPMXLuSO154j9xNL40bEs/wQftJoqLLMLT
	O2+hcy7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolP6-0006fQ-0m; Fri, 26 Jun 2020 10:16:16 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolOx-00014E-Er
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ttWaWLHPEPo4XuAawPA9X0lyS/Xcx7gA0pZmInVCtRs=; b=LNOZT4tBVsk1QSBc88UEJrnKzf
 dQNzwGoLf/Y2kHfzTAFbC8IfftrX30r2qH4o0o9MvATu7/xCAT2fwm13qL/ovPwGazJw4NRmkNdwH
 ra/meuCmIwFujh8nZexvEtIKG+uBzaP0XDhQ961Nq1FYpHht2t1cpyH2SRkZsCHrJel2gkoRqaitr
 +Ph0ectJLDT9za3iylVxGyBIdNE4vucJXmcxcEThdmEbiU4j32rT3VnoMUwKIJ6u6BRQnlQQeP6mS
 smffqZIyuPPcLAdqvEoFN1koURx9GZai+5NQrJGY6q7YlT3kJqH0rszz/6ht/P/NM4CgLAP2nmTI9
 1xZTwveQ==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joiZ9-0003UW-Vb
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 07:14:29 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 55195100006;
 Fri, 26 Jun 2020 07:13:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v11 0/2] NAND ECC engine binding changes
Date: Fri, 26 Jun 2020 09:13:55 +0200
Message-Id: <20200626071357.21421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_081428_163217_4BCE7337 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As part of a bigger series, I proposed these changes to facilitate the
insertion of a generic ECC engine abstraction, needed specifically for
new SPI-NAND devices not featuring any on-die engine.

The series is almost ready to be merged but the bindings did not pass
the checks. Now it is solved so I am just waiting for Rob's ack on
these two patches to apply the whole series.

Miquel Raynal (2):
  dt-bindings: mtd: Document nand-ecc-engine
  dt-bindings: mtd: Document boolean NAND ECC properties

 .../bindings/mtd/nand-controller.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
