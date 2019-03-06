Return-Path: <SRS0=kH4D=RJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D245C43381
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 14:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C2720675
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 14:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kT1cU7+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C2720675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lhLHnKWpQ3FaR2aAzO8MInbUBZaOWXYDv7Hz2hY9LbY=; b=kT1cU7+4whjeh6
	UwTbH5p5b3CN1c3+BDfKTt+KvvTK6MeEsCE3UEcZHuFoEILi92nN01GPDXdwKzmQfY6jhKvX75CNc
	bZLdgTgLdmYBYQRd6W6WXim7UJf87OkIuutrMwlEeROBVH6sg24Dw35OSMcn0fmhMYnjj/N3V3hki
	Mo/h0s908Wuwfi21nmavak6nuoDKwKJ6SwVyXTRVvR77C+6f6x/uB1q3O6Vl7SHWkOfnTNiqYWDcm
	pPb/Uw1Mb0hfgiU3zzg0kWOLO5tuIoBucFkiWBvwNvXTbJS51fn7OdWMrmj1Lj6K0rAdlsFXkAu6z
	FZOZLbEuP5m0nVbOJDVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1XJb-0000LI-6r; Wed, 06 Mar 2019 14:14:35 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1XJX-0000Ki-9f
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2019 14:14:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 12E234D4F
 for <linux-mtd@lists.infradead.org>; Wed,  6 Mar 2019 15:10:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvsQY6cUlHDK for <linux-mtd@lists.infradead.org>;
 Wed,  6 Mar 2019 15:09:56 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 4CC424DF5; Wed,  6 Mar 2019 15:09:56 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: atmel nand bindings vs. actual dts files
Date: Wed, 06 Mar 2019 15:07:52 +0100
Message-ID: <1823900.qPX5mxbl1h@ada>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_061431_516922_962CF72D 
X-CRM114-Status: UNSURE (   5.86  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hei hei,

I'm currently adapting the at91-sama5d27_som1_ek.dts file for a custom 
modification of that board [1], and had a look at how sama5d3.dtsi, 
sama5d4.dtsi and boards including those define the nand controller and the 
nand chip. What puzzles me is the following. The atmel-nand devicetree binding 
docs say:


Required properties:
- reg: describes the CS lines assigned to the NAND device. If the NAND device
       exposes multiple CS lines (multi-dies chips), your reg property will
       contain X tuples of 3 entries.
       1st entry: the CS line this NAND chip is connected to
       2nd entry: the base offset of the memory region assigned to this
                  device (always 0)
       3rd entry: the memory region size (always 0x800000)


However the actual node of e.g. at91-sama5d3_xplained.dts contains this:

                                nand@3 {
                                        reg = <0x3 0x0 0x2>;
                                        atmel,rb = <0>;
                                        nand-bus-width = <8>;
                                        nand-ecc-mode = "hw";
                                        nand-ecc-strength = <4>;
                                        nand-ecc-step-size = <512>;
                                        nand-on-flash-bbt;

So instead of "always 0x800000" that node has 0x2 as third entry for the 'reg' 
property. Why is that?

Bonus question: if the R/B line is not connected, how is that expressed in 
dts? As far as I understood that is possible, if the driver polls some status 
register instead of that line level, right?

Greets
Alex

[1] we piggyback soldered a raw NAND flash to the som1 module with some 	
enameled copper wire for evaluation, NAND is already responding in a modified 
U-Boot ;-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
