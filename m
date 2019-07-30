Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6540C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 00:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A456F20651
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 00:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HsFjmjvQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A456F20651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=igrZQ3ShURnKHyXqFVfsCYXTMZzn2Rvd3KyuHEZBgSs=; b=HsFjmjvQ+V/lNGJXpm+UhjDI1
	AWqh34nMaS+RxQTRsRRzSG+VErgGn++2HbuZHMeEcXvyLsAlNL3aKd3yJXA9bs2MGytBdXHYsVKp6
	W7S11uWJsNCShRD+8gUOd3W8vfIRyzg45/eUAu+X14GbnFxhsveFAxPcmy04paKDIOCmPBsaicez1
	E1kOBRgyCL+A3xe95194WAAk2UwrENYCW2TzMSr/3K/CZDK5XpAXH3NjAVs8lzaLyVYCQldtC8H3g
	vSfkxAWxMftJRBtAvW66r668XggsB9R4ptb7+7LxRQxB4TeCHEwuk2zOAE+CtD/4Om0QSWG8dD3O2
	omCzlR35A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsGCw-0000Em-Ax; Tue, 30 Jul 2019 00:41:38 +0000
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hsGCs-0000EO-Hz
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 00:41:36 +0000
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AHAAAGkT9d/zXSMGcNWRkBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEHAQEBAQEBgVYBAQEBAQELAYMDgS6EHpFrAQEGgQktg2SFfpEaCQE?=
 =?us-ascii?q?BAQEBAQEBAS0KAQGEQAKDDzcGDgEDAQEBBAEBAQEFAYVSOYVXAQEBAyMEEQ8?=
 =?us-ascii?q?yEAsNCwICJgICVwYNBgIBAYMeAYF2I6wDcX8zGoMVhUqBQgaBDCgBgVkJihR?=
 =?us-ascii?q?4gQeBESeCaz6CSBkEgTmDMYJYBIw7iD2VfwmCHIZbjTMGG4IuhyWDegOKPpU?=
 =?us-ascii?q?FkhqBejMaCCgIgyeCSxqDToplYAEBi0iCUQEB?=
X-IPAS-Result: =?us-ascii?q?A2AHAAAGkT9d/zXSMGcNWRkBAQEBAQEBAQEBAQEHAQEBA?=
 =?us-ascii?q?QEBgVYBAQEBAQELAYMDgS6EHpFrAQEGgQktg2SFfpEaCQEBAQEBAQEBAS0KA?=
 =?us-ascii?q?QGEQAKDDzcGDgEDAQEBBAEBAQEFAYVSOYVXAQEBAyMEEQ8yEAsNCwICJgICV?=
 =?us-ascii?q?wYNBgIBAYMeAYF2I6wDcX8zGoMVhUqBQgaBDCgBgVkJihR4gQeBESeCaz6CS?=
 =?us-ascii?q?BkEgTmDMYJYBIw7iD2VfwmCHIZbjTMGG4IuhyWDegOKPpUFkhqBejMaCCgIg?=
 =?us-ascii?q?yeCSxqDToplYAEBi0iCUQEB?=
X-IronPort-AV: E=Sophos;i="5.64,324,1559491200"; d="scan'208";a="193361724"
Received: from unknown (HELO [10.44.0.22]) ([103.48.210.53])
 by icp-osb-irony-out7.iinet.net.au with ESMTP; 30 Jul 2019 08:41:25 +0800
Subject: Re: GPMI iMX6ull timeout on DMA
From: Greg Ungerer <gerg@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190729103655.095297a2@xps13>
 <18734a1d-17d9-d390-58ef-ad8ca1be925f@kernel.org>
 <20190729144730.4a58de32@xps13>
 <17b49e7d-ff63-315f-cf12-3474f7228c6d@kernel.org>
Message-ID: <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
Date: Tue, 30 Jul 2019 10:41:25 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <17b49e7d-ff63-315f-cf12-3474f7228c6d@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_174134_836209_9D5EC484 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: s.hauer@pengutronix.de,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On 30/7/19 10:28 am, Greg Ungerer wrote:
> On 29/7/19 10:47 pm, Miquel Raynal wrote:
>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 22:33:56 +1000:
>>> On 29/7/19 6:36 pm, Miquel Raynal wrote:
>>>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 16:41:51 +1000:
[snip]
>>>>> nand: timing mode 5 not acknowledged by the NAND chip
>>>>
>>>> What is the final timing mode used? Most of us tested in mode 5 I
>>>> guess, maybe mode 4 is broken (don't know if this is the one used here,
>>>> neither why mode 5 is refused). Can you please try by limiting the mode
>>>> to 0, 1, 2... until, hopefully, we narrow down to the failing mode.
>>>
>>> Sure, how to do that?
>>
>> This loop [1] tries to configure each mode (5, 4, ...) until one
>> succeeds (default is 0: must always work). Please try to limit mode to
>> 0, 1, etc.
>>
>> Mode 0 should work.
>>
>> [1] https://elixir.bootlin.com/linux/v5.3-rc1/source/drivers/mtd/nand/raw/nand_base.c#L933
> 
> The normal behavior - which usually works - has
> chip->onfi_timing_mode_default=5 here. So in other words on the first pass
> through this loop it is checking mode 5, and setting it as the default.
> 
> I am running a test/reboot loop now waiting for failure to see
> if it is still using mode 5 in that case.

With this trace in place:

--- a/linux/drivers/mtd/nand/raw/nand_base.c
+++ b/linux/drivers/mtd/nand/raw/nand_base.c
@@ -910,6 +910,7 @@ static int nand_init_data_interface(struct nand_chip *chip)
         }
  
         for (mode = fls(modes) - 1; mode >= 0; mode--) {
+               printk("%s(%d): checking mode=%d\n", __FILE__, __LINE__, mode);
                 ret = onfi_fill_data_interface(chip, NAND_SDR_IFACE, mode);
                 if (ret)
                         continue;
@@ -923,10 +924,12 @@ static int nand_init_data_interface(struct nand_chip *chip)
                                                  &chip->data_interface);
                 if (!ret) {
                         chip->onfi_timing_mode_default = mode;
+                       printk("%s(%d): BREAKING AT mode=%d\n", __FILE__, __LINE__, mode);
                         break;
                 }
         }
  
+       printk("%s(%d): chip->onfi_timing_mode_default=%d\n", __FILE__, __LINE__, chip->onfi_timing_mode_default);
         return 0;
  }
  

First NAND failure gives this:

nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
gpmi-nand 1806000.gpmi-nand: use legacy bch geometry
drivers/mtd/nand/raw/nand_base.c(913): checking mode=5
drivers/mtd/nand/raw/nand_base.c(927): BREAKING AT mode=5
drivers/mtd/nand/raw/nand_base.c(932): chip->onfi_timing_mode_default=5
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
gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x00000100
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

Regards
Greg



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
