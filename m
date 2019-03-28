Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0D3C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 03:38:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C3F92075C
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 03:38:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/WDsSWf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="t+3+ldWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C3F92075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z2mko2mQiaX1Zx0PdjS2h6jAjpaJbytQM7cZ6Fy464Y=; b=u/WDsSWfoD2zn0
	bmpVXGV5SsKIrMizP0G4Xgci9jWN+PmXBh2elmTms92agz6no41Uplkd9Mx3p2Ju2De1b4oJxghxh
	Cjj9VLWwftTRlYSfEbD9KzrJKF36sMsIuOPG9/IZO6WbMvY2HHyK81ulMaULDUnWK0e3vx6tlwNTX
	NuPKSHlaEFLRUbixAcuERPbpZu2x7V8672vnCgd9qIZG3gLMBkiaX+MSr23y7vF8GDPtvFPCPa8XV
	+EjUmH8Byhl61R4Gzp0+loKxpKqp2KNWYcrSl3QLziNwXHJc5nL3b71tm74I+wXgQA8fJKaeHfodZ
	odPqozcLTc67Wt6eSbiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9LsH-0008AX-Kk; Thu, 28 Mar 2019 03:38:41 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9LsD-0007xK-8R
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 03:38:39 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A62EB806CB;
 Thu, 28 Mar 2019 16:38:27 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1553744307;
 bh=TMQsj0iEVlrTopQL3qF6pCFTntpVYbtyetiZk/Qggfw=;
 h=From:To:CC:Subject:Date;
 b=t+3+ldWeyuslzhu26mmhfihZdnvqp2U+s1JGbD4WvRfi8nmlTG+EF30/zvpdnXgpN
 fm0yX3bFee5Ff4U0ZYan7Z50+QJyRAshn6I99OrX+7vbGVzmRo9xIXogBl+lNiNjKo
 ZNL/gYCcWYWx+NKyVdlQx9KzYX8wxWIUpzDVQ6bNDppOtOxfjLY7gS25oYvC87SEqg
 zSMbwyout2D6fgTafhZoX62e3kmAQYJbZt98CaM+qoyZlJP8Z5pqBkLsFjxMWl729P
 sun/jBfX5LjKef5LsL9dsblhMmbN9uRusWkQtAqPz+mTAoAHJho2u4JFuMEVDCewOT
 ANvOOwXJlCgYw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5c9c41b30000>; Thu, 28 Mar 2019 16:38:27 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Thu, 28 Mar 2019 16:38:27 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 28 Mar 2019 16:38:27 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "ricardo.ribalda@gmail.com" <ricardo.ribalda@gmail.com>
Subject: Using MTD_PHYSMAP_GPIO_ADDR
Thread-Topic: Using MTD_PHYSMAP_GPIO_ADDR
Thread-Index: AQHU5Re0OYYWh165qkWsUeV6G9tIRQ==
Date: Thu, 28 Mar 2019 03:38:26 +0000
Message-ID: <31f3d96e24394ce198019367fffeda26@svr-chch-ex1.atlnz.lc>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_203837_868442_47FBFA0C 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi All,

I'm having a little trouble understanding how to use the updated 
MTD_PHYSMAP_GPIO_ADDR support.

I think there is a bug introduced by commit ba32ce95cbd9 ("mtd: maps: 
Merge gpio-addr-flash.c into physmap-core.c") because I see nothing that 
sets info->gpio_values in the old gpio-addr-flash.c the equivalent was 
done in gf_set_gpios so I think maybe physmap_set_addr_gpios() needs this.

I'm also finding the devicetree binding a little hard to get right (or 
maybe I have got it right and there's just a bug).

What I have so far is

nor@20000000 {
         status = "okay";
         #address-cells = <1>;
         #size-cells = <1>;
         compatible = "cfi-flash", "jedec-flash";
         reg = <0x20000000 0x02000000>;
         ranges = <0 0x00000000 0x02000000
                   1 0x02000000 0x02000000>;
         bank-width = <2>;
         addr-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
         partition@0 {
                 label = "u-boot";
                 reg = <0x00000000 0x000c0000>;
         };
         ... more partitions
         partition@220000 {
                 label = "user";
                 reg = <0x00220000 0x03de0000>;
         };
};

What I have seems to pass the probe but it doesn't seem to be toggling 
the gpios and mounting the "user" partition fails.

# mount -t jffs2 /dev/mtdblock5 /mnt
jffs2: error: (1026) jffs2_do_read_inode_internal: CRC failed for 
read_inode of inode 1 at physical location 0x33dc1d8
mount: mounting /dev/mtdblock5 on /mnt failed: Input/output error

The hardware in question has a GPIO connected to ADDR24 of the flash chip.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
