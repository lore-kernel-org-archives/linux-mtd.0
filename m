Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25250C2BC11
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 15:51:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544D82087D
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 15:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XMBxMWrd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=robart.cc header.i=@robart.cc header.b="LpAjp7KR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 544D82087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robart.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNKYz85wPywvE3+/aQ0t9v8ejoCuj6OS8c59mNxYl5g=; b=XMBxMWrdJR9ACtVkwxK+YO5BKg
	KO2W7pxj5onDswdkaRrV3Mlbay2dEg5K4sElXBvhVM12ctVKX0fe0zNnJ1dKM4y4fqfYDXyUI8Vxt
	9majVyaCY3YH7NUrOctaifYcNJQqN0QNbMxC0HFiIBC4hRRbhuoGm+mxckTws8+uL7uSP3CP00Qci
	eEB+WLVFkVNStLkQseBw4PVC7KXAX/9CWoFIkjRYto2i5GjJCx7HxGx1OVZuItN7UFDrVzu73/Yob
	Ir5dn23E3dCoB69X43feWmzyzCzNHHnaorgGTKSkCF9xbIO+EUBqJwM8xQbvfV8Jeib7krku0M3dP
	mKv7qxrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFJPH-0007IZ-Le; Mon, 07 Sep 2020 15:50:11 +0000
Received: from srv-mta-01.robart.cc ([80.123.245.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFJPE-0007Gc-Gf
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 15:50:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 2839A1C0E03;
 Mon,  7 Sep 2020 17:50:02 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GyE0awTvajK4; Mon,  7 Sep 2020 17:50:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id F11F21C0E41;
 Mon,  7 Sep 2020 17:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc F11F21C0E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
 s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1599493802;
 bh=VPbJ4HhZrCBKNFTnoo2T25m7lfZiMIPC63eS00jP+9Y=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=LpAjp7KRz5iWUH4QuDuD9Dbb6UTJtKSxW9R8eyYawDE0TsU+BmCxrNiiEW4P2vadm
 /8jIzBRJy/YsfAGWQMCQWEQGRwUCiUaEWL2c0b0mkYYo7b9inW8Fv1J9zdv1694tAB
 5QmoK5IfNk6mjjjSzZWd2/vWablYmk/+OTwKFKSjvqoyFVYF7e4TQdVV1pSzz7SCt+
 IXDtX8DOe5A8fvTIxFH5dV24O2a3fCRDTnaNluDF6UuNYBMdML9W34OuJLk8rSmj7/
 aCMlcSV7BBMXVoUrzMeQarowCOjHhQXcPak1YzME4MYWjNwvSpFgtiRgJmHVF6MZJn
 JB1p5S3qIKjqw==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7b4OhX3yMYf7; Mon,  7 Sep 2020 17:50:01 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.intern.robart.cc [10.0.10.21])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id D42391C0E03;
 Mon,  7 Sep 2020 17:50:01 +0200 (CEST)
Date: Mon, 7 Sep 2020 17:50:01 +0200 (CEST)
From: Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
To: linux-mtd@lists.infradead.org
Message-ID: <277948161.2144658.1599493801799.JavaMail.zimbra@robart.cc>
Subject: sunxi_nand.c: Allwinner H3 dma support not mainline
MIME-Version: 1.0
X-Originating-IP: [10.0.20.3]
X-Mailer: Zimbra 8.8.15_GA_3959 (ZimbraWebClient - FF81 (Linux)/8.8.15_GA_3953)
Thread-Index: 2X/LTA/+ZbVadPYOmZbmGMFLRUo9jw==
Thread-Topic: sunxi_nand.c: Allwinner H3 dma support not mainline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_115008_940231_0D8855B5 
X-CRM114-Status: GOOD (  11.08  )
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
Reply-To: Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
Cc: bbrezillon@kernel.org, Manuel Dipolt <manuel.dipolt@robart.cc>,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi there,

Does anyone know anything about Allwinner H3 SoC interaction between the DMA controller and the nand flash controller?  

I am currently working on an embedded linux project on a Allwinner H3 SoC. We use a raw (SLC) nand chip for read/write storage and boot device. 
We have been using the nand flash controller in "non dma mode" until now. We want to switch over to using "DMA mode", because we started to question
the reliability of the non DMA direct SRAM access mode. 

We have experienced numerous data corruption issues while using UBIFS. The errors are 
almost exclusively non-recoverable, which essentially bricks the whole device. Errors can be reproduced by inducing random power cuts on the
device, while doing write IO on the mounted file system.

Our current theory is, that the sunxi NDFC does not properly write whole pages to the actual flash device, when working in direct SRAM access mode.
As I understand, only 1K of the NDFC SRAM is actually directly mapped into memory, so maybe the flash controller writes part of a page to the actual
storage device (maybe in ECC step sizes).

We tried to enable DMA mode, because the official Allwinner https://github.com/allwinner-zh/linux-3.4-sunxi/tree/master/modules/nand/nand_sun9i always
uses some sort of DMA for the NDFC. Maybe they did not properly test the non-dma mode.

Now to the actual problem:

We can not get the upstream driver to work with DMA on the H3 SoC. We tried it on a A33 dev board, where it works out of the box.
We assume that there is some sort of undocumented difference between the A23/A33 and H3 NDFC. The official sunxi linux-3.4 nand driver does a
check for a magic byte at physical address 0x01c00024 with the value 0x00001650. If this value matches, it uses the "gdma", which we assume means
generic / normal DMA.

Here are the values for A33 and H3
 * A33 0x1667
 * H3  0x1680

Do you think, that we have to use the dedicated IDMA on the Allwinner H3? If so, we would appreciate any pointers / tips, maybe even some datasheets,
if someone has access to them. The datasheets on https://linux-sunxi.org/Main_Page do not tell us any difference between the H3 and A33 NDFC.

We would be happy to upstream the necessary changes for supporting the H3 NDFC. We already have a working prototype driver with IDMA, but we don`t
really trust it. We also have some difficulties integrating it with mainline, e.g. we have no idea how to cancel a timed out dma transaction etc...

Hope anyone can help,

Roland Ruckerbauer, Manuel Dipolt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
