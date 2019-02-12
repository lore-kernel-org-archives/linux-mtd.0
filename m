Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F3C282CE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 10:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06D62077B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 10:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAQbB6l6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06D62077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QABNNc0fVnD5KkA/6Cq/4mO6Pm5b/PCa1SLu7m29UCg=; b=uAQbB6l6HsYKQB
	0JmZEBJVQNAQgger/PFn0PKiZOhVmbUqdqLwOZSXE/0GNAlsPlA6TmXUCEQsPT/VJUp936SXjB/RT
	/zO8sps4FXGDpSzgEpuh/m2HOh4kkrAYNMFeZDoqy0Z+X3RsOstetQq9Rf/wjQwnNbg/wWSt3OJlh
	aKSeHWW0FiEWdnphEAsQ8t9PBcAkItCoZVrnarFHYTnLBZUxW7f0Cdn0AFFjE/Fc6jlPm+Fiar16V
	lt8MBJu72bbDoxZkCvuXfdZKlSwUVWgfF+xl0gGYn7tSoYpuCwW+wtxZbipjDuMHNW0Frp9xizrPh
	dhtqnAn1/wXZPA+H2rfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtV8t-0007XI-1k; Tue, 12 Feb 2019 10:18:19 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtV8o-0007WO-Pz
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 10:18:16 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 5.5.0) with ESMTP id SG003691558.MSG 
 for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2019 11:17:58 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Tue, 12
 Feb 2019 11:17:57 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1261.035; Tue, 12 Feb 2019 11:17:56 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [Question] Use mr25h40 in a custom DSDT ACPI table
Thread-Topic: [Question] Use mr25h40 in a custom DSDT ACPI table
Thread-Index: AdTCuhdrFxbBmAG0QiGvcJBIxgZFRQ==
Date: Tue, 12 Feb 2019 10:17:56 +0000
Message-ID: <57411b20308f471788dcffe6d9d6cb97@asem.it>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.161]
MIME-Version: 1.0
X-SGHeloLookup-Result: hardfail smtp.helo=webmail.asem.it (does not match
 172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0201.5C629D55.008B, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_021815_031686_0B76F6FB 
X-CRM114-Status: UNSURE (   4.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

I work on a custom x86 board. In this board I have to manage an MRAM chip mr25h40 (on the SPI bus).
I want to modify the DSDT ACPI table in the BIOS.
Unfortunately, the mr25h40 is not Jedec compatible, so, in my DSDT, if I use the classic:

{"compatible", "jedec,spi-nor"} 

the device drivers mtd and m25p80 are loaded, but obviously the MRAM is not initialized:

    Device (NVR0) {
	Name (_HID, "PRP0001")
	Name (_DDN, "Everspin MR25H40 MRAM")
	Name (_CRS, ResourceTemplate () {
		SpiSerialBus (
			0,                      // Chip select
			PolarityLow,            // Chip select is active low
			FourWireMode,           // Full duplex
			8,                      // Bits per word is 8 (byte)
			ControllerInitiated,    // Don't care
			10000000,               // 10 MHz
			ClockPolarityLow,       // SPI mode 0 ClockPolarityLow
			ClockPhaseFirst,        // SPI mode 0 ClockPhaseFirst
			"\\_SB.SPI1",           // SPI host controller
			0                       // Must be 0
		)
	})
	Name (_DSD, Package () {
		ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
		Package () {
			Package () {"compatible", "jedec,spi-nor"},
		}
	})
  }



Instead if I try to use:

Package () {"compatible", "mr25h40"}

obviously it doesn't work, because "mr25h40" is not in the m25p_of_table.
Does anyone have any ideas?

Thanks and best regards,

Flavio Suligoi



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
