Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F5DC31E5F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 09:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C85D20B1F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 09:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZpQmrrfJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c4JeQcHI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C85D20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AN9ky5p7yyBz/ACt2CoM3sXzqNf1rpolFkrp3VKSVs4=; b=ZpQmrrfJjimp4n
	IoczWbiPKrgg4MokaHPcMFvmcoAw9wf5tDGm73PK6iv20VEDL+4MCcAVJVBDgavNwy50xWVZLKiEc
	83jp3sfmUWq/ZFJRoy1xHo1Rn9rorPrgGcSXqqhdpp6bg0m4VLBu4hNrDcSJfZRVlvlSq3a/UdDf3
	DavCxT6CXaMbqQgQfQ2bWktsAw1BV6RVgBCIV/rIhV6u5ZgFdv4YehmrnLJvANdRLhIJsVZFFrYOy
	ClqK3f8trob9K0o5mbO1ZNjHtiPRmxV6sB/QvrFmVjL/K81A97DvpTLxTX7AMgWvQQ/ZeIXNdSvuS
	06bUsJX39nhGJS93ziLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdAQG-0006de-0s; Tue, 18 Jun 2019 09:29:00 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdAPu-0006L9-BW; Tue, 18 Jun 2019 09:28:40 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5I9SOg3084397;
 Tue, 18 Jun 2019 04:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560850104;
 bh=Kw8nG2OFHl2HBlGRL+a2UliJaSPF/WqQQvZMqq7/T4s=;
 h=From:To:CC:Subject:Date;
 b=c4JeQcHIUouBKyFdsZqQAdYiWcrqhOOUabfp/itwz6tBKuSfQa4E4GCw0TLl8BPRj
 eucqu8HvN3G0oYi2HRVE4Txh9R3OUS+f+P6qx30MlBlhXciRoNVEgEPar40andtfS4
 U4owmVSquQPdClpByjp6N2YZPe0GOkJIW8jvO8Jc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5I9SOxF042590
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Jun 2019 04:28:24 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 18
 Jun 2019 04:28:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 18 Jun 2019 04:28:23 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5I9SJRv067156;
 Tue, 18 Jun 2019 04:28:19 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 0/5] MTD: Add Initial Hyperbus support
Date: Tue, 18 Jun 2019 14:58:56 +0530
Message-ID: <20190618092901.31764-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190618_022838_479284_4B6EFD03 
X-CRM114-Status: GOOD (  16.28  )
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
Cc: devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Change log:
Since v5:
Fix up DT bindings comments for TI HBMC driver
Move calibration sequence out of core into TI HBMC driver

Since v4:
Fix Rob's comments on dt-bindings of TI HBMC driver

Since v3:
* Drop reading QRY string twice in hyperbus_calibrate()
* Fix doc/misc comments on v3.

Since RFC v2:
* use map_word_xxx() for handling status register to support interleaved
  flashes as suggested by Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
* Report error status/messages on erase/program failure by looking at
  status register bits.
* Add "cfi-flash" as fallback compatible for cypress,hyperflash
* Add support to select between HyperBus and OSPI using mmio mux

Since RFC v1:
* Re-work Hyperbus core to provide separate struct representation for
  controller and slave devices
* Rename all files and func names to have hyperbus_ prefix
* Provide default calibration routine for use by controller drivers
* Fix up errors with patch spliting
* Address comments by Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>


Cypress HyperBus is Low Signal Count, High Performance Double Data Rate Bus
interface between a host system master and one or more slave interfaces.
HyperBus is used to connect microprocessor, microcontroller, or ASIC
devices with random access NOR flash memory(called HyperFlash) or
self refresh DRAM(called HyperRAM).

Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
signal and either Single-ended clock(3.0V parts) or Differential clock
(1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
At bus level, it follows a separate protocol described in HyperBus
specification[1].

HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
to that of existing parallel NORs. Since Hyperbus is x8 DDR bus,
its equivalent to x16 parallel NOR flash wrt bits per clk. But Hyperbus
operates at >166MHz frequencies.
HyperRAM provides direct random read/write access to flash memory
array.
Framework is modelled along the lines of spi-nor framework. HyperBus
memory controller(HBMC) drivers call hyperbus_register_device() to register a
single HyperFlash device. HyperFlash core parses MMIO access
information from DT, sets up the map_info struct, probes CFI flash and
registers it with MTD framework.

This is an early RFC, to know if its okay to use maps framework and existing
CFI compliant flash support code to support Hyperflash
Also would like input on different types of HBMC master IPs out there
and their programming sequences.
Would appreciate any testing/review.

Tested on modified TI AM654 EVM with Cypress Hyperflash S26KS512 by
creating a UBIFS partition and writing and reading files to it.
Stress tested by writing/reading 16MB flash repeatedly at different
offsets using dd commmand.

HyperBus specification can be found at[1]
HyperFlash datasheet can be found at[2]
TI's HBMC controller details at[3]

[1] https://www.cypress.com/file/213356/download
[2] https://www.cypress.com/file/213346/download
[3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
    Table 12-5741. HyperFlash Access Sequence


Vignesh Raghavendra (5):
  mtd: cfi_cmdset_0002: Add support for polling status register
  dt-bindings: mtd: Add binding documentation for HyperFlash
  mtd: Add support for HyperBus memory devices
  dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
    controller
  mtd: hyperbus: Add driver for TI's HyperBus memory controller

 .../bindings/mtd/cypress,hyperflash.txt       |  13 ++
 .../devicetree/bindings/mtd/ti,am654-hbmc.txt |  51 ++++++
 MAINTAINERS                                   |   8 +
 drivers/mtd/Kconfig                           |   2 +
 drivers/mtd/Makefile                          |   1 +
 drivers/mtd/chips/cfi_cmdset_0002.c           |  90 ++++++++++
 drivers/mtd/hyperbus/Kconfig                  |  23 +++
 drivers/mtd/hyperbus/Makefile                 |   4 +
 drivers/mtd/hyperbus/hbmc-am654.c             | 141 ++++++++++++++++
 drivers/mtd/hyperbus/hyperbus-core.c          | 154 ++++++++++++++++++
 include/linux/mtd/cfi.h                       |   5 +
 include/linux/mtd/hyperbus.h                  |  86 ++++++++++
 12 files changed, 578 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
 create mode 100644 drivers/mtd/hyperbus/Kconfig
 create mode 100644 drivers/mtd/hyperbus/Makefile
 create mode 100644 drivers/mtd/hyperbus/hbmc-am654.c
 create mode 100644 drivers/mtd/hyperbus/hyperbus-core.c
 create mode 100644 include/linux/mtd/hyperbus.h

-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
