Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56836C3A59D
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 07:25:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC8622CF4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 07:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2tAx0Rk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intenta.de header.i=@intenta.de header.b="g9/LqEDF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC8622CF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intenta.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/F343T0lSzeWzkLdXZBw4KldTs0eDp5OwCVCAYdcb8=; b=Q2tAx0RkgpATbB
	7sS4qjmm1CTeQdGc9UPsA+cqtls0qAaz2eqAn/BMxOuiMl1CdCvX0pka2NaIFAtSTQKrArIUDDIIp
	evgGyHYbOfPRptqrstleg00BKrW2ovVWjC2yWdApkeTI2kqQxbAEKbPT0uwVWh/bbwgOkOdHbnXsD
	zyJhVrOE6fl61zTSemqZHj8kVQoR2GowyGnd+Bfl+9qlMYiZG96keHeSUNaPLFgamX9PztLwtY19k
	ZHVPHNlKvDD+i7SacIqOjD3Eo7OdC5OR5It5wGHFiqMG/OK0+J/0vGKOcq1sklPUotE4PGSwUVvvU
	rbY32ff2mpPlBcKNGpSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzyWN-0005dw-0p; Tue, 20 Aug 2019 07:25:35 +0000
Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzyWJ-0005dZ-7o
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 07:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de;
 s=dkim1; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date;
 bh=DkLrTcyw02QsvPxs9EBd44X1AWWhv0U810ENHIUA/sU=; 
 b=g9/LqEDF6XZckbNpR3jQejUs+HROnv2ykoZqqW2LC3V0TRMF2Zror6CHw4XIqioagA1NqXfY2Hahhxhx29qHokl12gcv4G34RkrM7q34dON5IihNfGJ6cyX82A84E3aeO+m5JBBKDx2nnwozUNRUy1HeP4ylgQ8VosgTe68aImulKo3K3I6QdZAUZYsEG27vkH7mLsJcc41ionMy1M7zSKrfEPUgtXXLO3ZKIfyK+2oDGPtkMK9tEr/l8bzqk2BXZbHB/trlDKTodhi+kGnzi5tQCemiYBSVVb4fhlpoPtC5NNWmoLZ4MQilhaFyaaJQ2KxtWmrZ+cOSA+yfzUmAIA==;
X-CTCH-RefID: str=0001.0A0C020F.5D5BA055.0034, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Date: Tue, 20 Aug 2019 09:25:08 +0200
From: Helmut Grohne <helmut.grohne@intenta.de>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Re: [LINUX PATCH v19] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Message-ID: <20190820072507.GA23478@laureti-dev>
References: <20190730114337.6601-1-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730114337.6601-1-naga.sureshkumar.relli@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_002531_977005_A1EEBDE4 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: srinivas.goud@xilinx.com, vigneshr@ti.com, bbrezillon@kernel.org,
 yamada.masahiro@socionext.com, richard@nod.at, shubhrajyoti.datta@xilinx.com,
 linux-kernel@vger.kernel.org, michal.simek@xilinx.com, marek.vasut@gmail.com,
 svemula@xilinx.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, nagasuresh12@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Jul 30, 2019 at 05:43:37AM -0600, Naga Sureshkumar Relli wrote:
> Add driver for arm pl353 static memory controller nand interface.
> This controller is used in Xilinx Zynq SoC for interfacing the
> NAND flash memory.

Is there a reason that you dropped me from the Cc list? If you Cc me,
the feedback loop is faster. Please continue to Cc me on this driver.

> -> Tested Micron MT29F2G08ABAEAWP (On-die capable) and AMD/Spansion S34ML01G1.

I tested this version of the driver with this exact Micron flash in an
on-die configuration against v5.3-rc4. The patch applied cleanly and
built without problems. The driver detects the chip and works
"somewhat". One can interact with portions of the flash, but the amount
of ECC errors returned makes it unusable. I was able to reproduce the
same issue on multiple devices.

...
[   14.909894] jffs2: mtd->read(0x178 bytes from 0x21e0688) returned ECC error
[   14.917250] jffs2: mtd->read(0x800 bytes from 0x21e0000) returned ECC error
[   14.952765] jffs2: mtd->read(0x364 bytes from 0x21c049c) returned ECC error
[   14.960070] jffs2: mtd->read(0x6f8 bytes from 0x21c0108) returned ECC error
[   14.967435] jffs2: mtd->read(0x800 bytes from 0x21c0000) returned ECC error
[   15.001194] ------------[ cut here ]------------
[   15.006092] WARNING: CPU: 0 PID: 94 at drivers/mtd/nand/raw/nand_micron.c:245 micron_nand_read_page_on_die_ecc+0x394/0x3a0
[   15.018148] ---[ end trace 2d1d02f05cac8fbb ]---
[   15.022909] jffs2: error: (94) jffs2_get_inode_nodes: can not read 344 bytes from 0x021a16a8, error code: -22.
[   15.035205] jffs2: error: (94) jffs2_do_read_inode_internal: cannot read nodes for ino 8375, returned error is -22
[   15.045744] jffs2: Returned error for crccheck of ino #8375. Expect badness...
[   15.231220] jffs2: Checked all inodes but still 0x15361c bytes of unchecked space?
[   15.238851] jffs2: No space for garbage collection. Aborting GC thread
...

I cannot confirm that the driver works.

For completeness sake, here is the decompiled DT that I used:

memory-controller@e000e000 {
	#address-cells = <0x2>;
	#size-cells = <0x1>;
	status = "okay";
	clock-names = "memclk", "apb_pclk";
	clocks = <0x1 0xb 0x1 0x2c>;
	compatible = "arm,pl353-smc-r2p1", "arm,primecell";
	interrupt-parent = <0x4>;
	interrupts = <0x0 0x12 0x4>;
	ranges = <0x0 0x0 0xe1000000 0x1000000>;
	reg = <0xe000e000 0x1000>;

	flash@e1000000 {
		status = "okay";
		compatible = "arm,pl353-nand-r2p1";
		reg = <0x0 0x0 0x1000000>;
		#address-cells = <0x1>;
		#size-cells = <0x1>;
		nand-ecc-mode = "on-die";
		nand-bus-width = <0x8>;

	};
};

I am posting a decompiled DT, because parts are generated using
https://github.com/Xilinx/device-tree-xlnx.

The driver from the xlnx 4.14 tree continues to work with the hardware I
used for testing.

Helmut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
