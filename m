Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCFBC433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 06:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C492073F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 06:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PZrxKvUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C492073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQtNkE7Sg7x9V8rier0FpG3Vbd7p0shEiG1pI3FrlkE=; b=PZrxKvUtjHyVn1oDWed7Y6ugL/
	QuNnp6Qc/oZfGnYgrzyE1vHVyzujQx93lkXWlqKZXpEdXXg/RVEYDW+/2chqoM/Yx6NrYnkHoHQg7
	iomEzi3+iSBASX5Np0aP2+D1HX2YeNYhicjG5usKmlPJCURWbuUuOVQZpvGeIP3rjjPTsmro+CV4L
	vLvQngkAR231BLoFsw0r/uw+5T5HdoU8TfH0y3HNMZkVEbMieas3d+tPvt7/IiYY70u8hEVI6vqT9
	lYnRkpFekVU/yOrSxxUzBFEqDCrKm+YQO0MyJsyOyyBpz97addiQzyIsWtCobW/p7O/ubtVvBqZmG
	14Gkk+zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrzMM-0006OA-Ou; Mon, 29 Jul 2019 06:42:15 +0000
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.153])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hrzMD-0006NT-2Q
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 06:42:08 +0000
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AJAAC4kz5d/zXSMGcNWRoBAQEBAQI?=
 =?us-ascii?q?BAQEBBwIBAQEBgVYCAQEBAQsBgwOBLoQekWMBAQEBAQEGgRGECYV+jzOBZwk?=
 =?us-ascii?q?BAQEBAQEBAQEtCgEBhECDCDcGDgEDAQEBBAEBAQEFAYVSOYVZJwQRQSgNAiY?=
 =?us-ascii?q?CXw0IAQGDHgGBdiOqQHF/MxqFLoMwgUIGgQwoAYFiihR4gQeBEScMhy4BEgG?=
 =?us-ascii?q?DKoJYBIw7iD2VfwmCHIZbjTMGG41NA4o+lQWSGoEJcTMaCCgIgyiCSgMXg06?=
 =?us-ascii?q?KZWGMCoJDAQE?=
X-IPAS-Result: =?us-ascii?q?A2AJAAC4kz5d/zXSMGcNWRoBAQEBAQIBAQEBBwIBAQEBg?=
 =?us-ascii?q?VYCAQEBAQsBgwOBLoQekWMBAQEBAQEGgRGECYV+jzOBZwkBAQEBAQEBAQEtC?=
 =?us-ascii?q?gEBhECDCDcGDgEDAQEBBAEBAQEFAYVSOYVZJwQRQSgNAiYCXw0IAQGDHgGBd?=
 =?us-ascii?q?iOqQHF/MxqFLoMwgUIGgQwoAYFiihR4gQeBEScMhy4BEgGDKoJYBIw7iD2Vf?=
 =?us-ascii?q?wmCHIZbjTMGG41NA4o+lQWSGoEJcTMaCCgIgyiCSgMXg06KZWGMCoJDAQE?=
X-IronPort-AV: E=Sophos;i="5.64,321,1559491200"; d="scan'208";a="200405390"
Received: from unknown (HELO [10.44.0.22]) ([103.48.210.53])
 by icp-osb-irony-out3.iinet.net.au with ESMTP; 29 Jul 2019 14:41:52 +0800
To: Miquel Raynal <miquel.raynal@bootlin.com>
From: Greg Ungerer <gerg@kernel.org>
Subject: GPMI iMX6ull timeout on DMA
Message-ID: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
Date: Mon, 29 Jul 2019 16:41:51 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_234205_665078_EC7F4E32 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

I am experiencing a problem with NAND flash DMA timeouts on
iMX6ull based boards. The problem is very similar to that
described in:

   https://linux-mtd.infradead.narkive.com/JIUulfFB/gpmi-imx6ull-timeout-on-dma

That didn't come to any specific resolution that I could see
in that thread.

The boot trace on the console for me looks like this:

nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
gpmi-nand 1806000.gpmi-nand: DMA timeout, last DMA
gpmi-nand 1806000.gpmi-nand: Show GPMI registers :
gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x20830002
gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x01c6800c
gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00010101
gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0xe0000000
gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x23023336
gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x000001ee
gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0xff000001
gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x00000001
gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x05020000
gpmi-nand 1806000.gpmi-nand: Show BCH registers :
gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x00000100
gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000010
gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0x030a2080
gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x083e2080
gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x070a4080
gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0x10da4080
gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x070a4080
gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x10da4080
gpmi-nand 1806000.gpmi-nand: offset 0x0e0 : 0x070a4080
gpmi-nand 1806000.gpmi-nand: offset 0x0f0 : 0x10da4080
gpmi-nand 1806000.gpmi-nand: offset 0x100 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x110 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x120 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x130 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x140 : 0x00000000
gpmi-nand 1806000.gpmi-nand: offset 0x150 : 0x20484342
gpmi-nand 1806000.gpmi-nand: offset 0x160 : 0x01000000
gpmi-nand 1806000.gpmi-nand: offset 0x170 : 0x00000000
gpmi-nand 1806000.gpmi-nand: BCH Geometry :
GF length              : 13
ECC Strength           : 8
Page Size in Bytes     : 2110
Metadata Size in Bytes : 10
ECC Chunk0 Size in Bytes: 512
ECC Chunkn Size in Bytes: 512
ECC Chunk Count        : 4
Payload Size in Bytes  : 2048
Auxiliary Size in Bytes: 16
Auxiliary Status Offset: 12
Block Mark Byte Offset : 1999
Block Mark Bit Offset  : 0
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -110
nand: timing mode 5 not acknowledged by the NAND chip
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
Scanning device for bad blocks
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
....
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -22
5 fixed-partitions partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000000000-0x000000500000 : "u-boot"
0x000000500000-0x000000600000 : "u-boot-env"
0x000000600000-0x000000800000 : "log"
0x000000800000-0x000010000000 : "flash"
0x000000000000-0x000010000000 : "all"
gpmi-nand 1806000.gpmi-nand: driver registered.


This is using a linux kernel v5.1.14. I have seen this happen on
a number of boards I have here - but it is only occasional. It
only happens once in a while on boot, maybe 1 in 40 or more times.
So it can take quite a while to reproduce (using a boot loop setup).

As per the email thread I pointed to above I looked at reverting
those patches, but that was not at all easy given how much the gpmi
driver code had moved. So instead I modified the code with this:

--- a/linux/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/linux/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -481,6 +481,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
  
  void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
  {
+#if 0
         struct gpmi_nfc_hardware_timing *hw = &this->hw;
         struct resources *r = &this->resources;
         void __iomem *gpmi_regs = r->gpmi_regs;
@@ -505,6 +512,7 @@ void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
  
         /* Wait for the DLL to settle. */
         udelay(dll_wait_time_us);
+#endif
  }
  
  int gpmi_setup_data_interface(struct nand_chip *chip, int chipnr,

So far after a couple of days of testing with this I no longer
see the DMA timeout.

Any thoughts?

Regards
Greg


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
