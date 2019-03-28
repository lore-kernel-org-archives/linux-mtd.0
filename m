Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEF3C10F03
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CFF5206DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCKH7qmG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Ae28Bbbu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CFF5206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BpRpIyHEzdLI2o7ci3MUi3VSTefzyrCHdUO7eI57/fY=; b=RCKH7qmGqBRnIB
	+VpEL7IAZHF2ZEp/kdipZe/szuQqZZUskj/oCTia1LeH8vOAp8OG5AfUvk0MEff7zKs/il00EX7c+
	lDpJcqxllEx9uCdNISC9yH84tSFMWj0hLFEpGznrqS55j7Zu+6WCHKdDdY8ehOApJrvbUUhjU9hF7
	e2zcCB/WMwuFKYIlcJVN5DVYoFYopfPbqtQWY2jBLWS17kMNijxrrvFfAuZjdiIIMZafaIWcMBzSL
	ytq0XC4PyfO7wUO1BaEsGK1x9jrdIoWDCRBRpc0ObP9aL3uIG+rzh5LZETCnRCY5suez0CdfGV/R3
	1myOeXtFzHkwSt46vw6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9MFY-0007qd-EI; Thu, 28 Mar 2019 04:02:44 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9MFQ-0007ow-VH
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 04:02:40 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BB28F806CB;
 Thu, 28 Mar 2019 17:02:29 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1553745749;
 bh=7NBDjca8CqFcBIzIKTpm1tSjsqP/Let6MA2LwzfnQeE=;
 h=From:To:Cc:Subject:Date;
 b=Ae28BbbuNTaxgA8nBhTM7fizpTYIqcS3Izm9jZmEzKtIfM3lNS/Og+6/v/pZtxAQs
 ZlC/AhYciReoGFw21y/eIcapPGZQjAGdiLm+42btNcWaByR9rOyEfSXnwewQaO2z7L
 z5Y+W2ocCOxudnOJU3hWfqMxEULlChKz8Xx8TGr7rpTCppBjT4CiY8Zs78pb+hwV0e
 N/PFYvht2+ijusNOzhzNfbliabVt0DzG/IgsVcwNaNA+fNbTFLYboj62CuLTqOwBoN
 Pu4g8YlX9gGJvCzrbOW6DOpRNe0c9d4D9rUjQO37byqHDy4GHU0hr+aypzmvJk3UCT
 JBab1Gc6CO4xQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5c9c47510000>; Thu, 28 Mar 2019 17:02:30 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 9BBBB13EEF7;
 Thu, 28 Mar 2019 17:02:24 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 77BD81E1124; Thu, 28 Mar 2019 17:02:24 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [PATCH 0/2] mtd: physmap: Using gpio-addrs
Date: Thu, 28 Mar 2019 17:02:14 +1300
Message-Id: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_210238_295070_E2DA8F4D 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I have a system with ADDR24 of the flash chip connected to a gpio pin. This
series fixes a bug in physmap-core.c and adds an example for using gpio-addrs
to the dt-binding based on the system I'm using.

Chris Packham (2):
  mtd: maps: physmap: Store gpio_values correctly
  dt-binding: mtd: physmap: Add example using addr-gpios property

 .../devicetree/bindings/mtd/mtd-physmap.txt      | 16 ++++++++++++++++
 drivers/mtd/maps/physmap-core.c                  |  2 ++
 2 files changed, 18 insertions(+)

-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
