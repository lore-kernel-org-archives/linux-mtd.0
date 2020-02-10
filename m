Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE22CC352A4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 09:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D75720733
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 09:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXApgktK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="BvVzN30E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D75720733
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ipor7xKVgfhY3In+2OhH9JSvMsP5gbmSz06Yp+Ex8u8=; b=hXApgktK9Go7jIrfT3rP2Yg63
	Y7zoev96pjn9EUcWT0bd7s0//VoyYdFUZy0bVzVG6iWQWbWkswXf/pnjj3GzwpZOP8krW7+cjvarg
	EWL3HXgEmXLiXIRmoa1rnQlGXreymCJxbe7Lr22Xnsk97xs6ryrH03EvgpiLr+f2Q1YI2B8xSi0QA
	CjV9EmVYP4Xgzj59zkumJvwM/sLNS40GWhT5vpBjgD/jmgoMPUG1dTMQlCEUmCvBR3qma1fM1s+68
	5tlcKRBHxGaKLcmOoU3NSrivvwGoAAJTPXe7Gm6meZQGZ4Q5+8y/46T0TVCD7fssJBT+G0N7OtPbX
	dkVqycJ8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j15DA-0002dy-Eo; Mon, 10 Feb 2020 09:18:36 +0000
Received: from de-out1.bosch-org.com ([139.15.230.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j15D6-0002cb-0d
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 09:18:34 +0000
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 48GL135tbdz1XLDRB;
 Mon, 10 Feb 2020 10:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key3-intmail; t=1581326295;
 bh=SqzLuJ1ANKTKmizHYFfnDr0NqN/csyjclOZkgTOs2K4=; l=10;
 h=Subject:From:From:Reply-To:Sender;
 b=BvVzN30Ej5vzyXdhHxMVe6Bpvd//TCX96OxRJM0KAkIzJicQkcPcCXfXpg5Iim5jN
 0Db/mbTcAzO3WVxSqkoCjFZIq4kDyYjjA3kAGyCXtWdHptF9dt9tyYbdpb2uzAEU9i
 ftTNvsN+oXBwrTzNFHpUGNb+WYB416mgj4TMGTTQ=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 48GL135QM6z6CjR3W;
 Mon, 10 Feb 2020 10:18:15 +0100 (CET)
X-AuditID: 0a3aad0c-747ff70000004730-bd-5e411fd7bb6d
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id B0.97.18224.7DF114E5;
 Mon, 10 Feb 2020 10:18:15 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 48GL133kr9zW79;
 Mon, 10 Feb 2020 10:18:15 +0100 (CET)
Received: from [10.34.222.178] (10.34.222.178) by SI-HUB2000.de.bosch.com
 (10.4.103.108) with Microsoft SMTP Server id 15.1.1847.3; Mon, 10 Feb 2020
 10:18:15 +0100
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Dirk Behme
 <dirk.behme@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <34271135-d103-ccd2-2933-59fd4a399795@de.bosch.com>
 <3ea71f24-d466-81f8-2c1e-239b59e712f8@cogentembedded.com>
 <02108a3e-4527-ee53-3d6a-07b78cad5b60@gmail.com>
 <5fc79de7-fd24-0ded-d696-cba81ad0e336@cogentembedded.com>
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Message-ID: <7e279907-a436-b1e2-5d0b-df501933aa80@de.bosch.com>
Date: Mon, 10 Feb 2020 10:18:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5fc79de7-fd24-0ded-d696-cba81ad0e336@cogentembedded.com>
Content-Language: en-US
X-Originating-IP: [10.34.222.178]
X-Brightmail-Tracker: H4sIAAAAAAAAA22ScUwbZRjG+a5H79r13PW60rdlSKxZTDDDgnOWaSYzbjYa3WJijOjQYm9t
 pS3YK9uYmyPEjA3RAQUijWm3jIkQjEtx0lKnpDKZ2uHcjGUEjCMEAWE4KxtEoV45WPuH/73f
 +7y/78n3fC8pYn4lNKTV4WKdDqNNK5bi0m2fZm2OZu8o1vWf3KSPBDtE+lD1x4T+m5qv0vXu
 4AzSRzqHCX388p9Eodjg7Xrb8FtzHDMEPaOEobvtqOG69y3DwFAPtkdcJH3cxNqs+1nnQ9tf
 l1r6G6Pi8uaCgz1XrVVobHMtkpBAb4GflqKiWiQlGfpDDAL1vyDhEELQ11AtFg7tCE4HjqME
 oqCfhuGFXiIhbKAXEfzVNo8JU2MYTFyqwxNTYnor/NHmWSEo+glonxxKT9Q4vQnmq5dXaiW9
 F77tOUYIM3L4rnV8hZXQu2DIPSFK1CJaD62+H5FQq2B43IcJdTb0zH4kEh5xH5wfbSLqkdyT
 cpUnBfek4J4U/BTCO1HGPla3367LL9Dpcp0lLHdIl5f7Rpndj4TPkAXQxTZzGGEkCqNHSEyr
 pEqVO4qZe0rKTJUWI2d5zVlhYzmthjo6c2Ivo7jb5ipK7FaOs5Y5wghIkXYDVZDJc5TJWHmI
 dZYJWBhlkrhWRZnJ3a8ytNnoYktZtpx1rqmPkaQWKDu/DozcyZrZg/usNtearM2iUFpaGpOR
 qqTaYqQkjB4mZbz34XsT3ly50c5Zzau4WsCZtW4S/R49qlFRdMKWTqiWCsddV81GanDX9mJG
 mSIkyWkURSTSKqgns3hYxm920g+oqkRE8tVmEso/wzP0mJLfDTt4q53gDcwjeLfhNoLY4DIG
 HZ/X4DC5EMKh/0ZLOr9/59Lhaq+HgLj3DgHB49dJCHnfl8DfjQEJxOouS2BhJroOlpdi62Ay
 ckkGFyOnKPh68V8K5n+eWA/TcTcNXc03aWic65SD/9aSHAItZxUQm5tSwfjUsgo+C7oBuqdr
 1NC9MKWG2OKsepqPEuOjjG4pTETpMrr+J8rVbvJtmip0P/ODwxcPX3vmudETJ48U3RyMdB54
 5drLI3jtTnW2D+/b+ubzroGXSmUthowHLzTpK/31ue6JK+dsT4WK5i6It/WZH7AVvnf4xd4v
 /aYPfoc75O0jA35G4cs5vbH42fZxc21Hq+LMF+dfmO06tn5nTmbDP8Q7t/KaDpz95EadaeRK
 /ginxTmLMS9H5OSM/wEwrWslcQQAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_011832_732694_FC45D078 
X-CRM114-Status: GOOD (  26.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07.02.2020 21:17, Sergei Shtylyov wrote:
> On 02/07/2020 10:31 PM, Dirk Behme wrote:
> 
> [...]
>>>>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>>>>> driver using the "back end" APIs in the main driver to talk to the real
>>>>> hardware.
>>>>>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>> [...]
>>>>> Index: linux/drivers/mtd/hyperbus/rpc-if.c
>>>>> ===================================================================
>>>>> --- /dev/null
>>>>> +++ linux/drivers/mtd/hyperbus/rpc-if.c
>>>>> @@ -0,0 +1,162 @@
>>> [...]
>>>>> +static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
>>>>> +{
>>>>> +    struct rpcif_hyperbus *hyperbus =
>>>>> +        container_of(hbdev, struct rpcif_hyperbus, hbdev);
>>>>> +    struct rpcif_op op = rpcif_op_tmpl;
>>>>> +    map_word data;
>>>>> +
>>>>> +    op.cmd.opcode = 0xC0;
>>>>> +    op.addr.val = addr >> 1;
>>>>> +    op.dummy.buswidth = 1;
>>>>> +    op.dummy.ncycles = 15;
>>>>> +    op.data.dir = RPCIF_DATA_IN;
>>>>> +    op.data.nbytes = 2;
>>>>> +    op.data.buf.in = &data;
>>>>> +    rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
>>>>> +    rpcif_io_xfer(&hyperbus->rpc);
>>>>> +
>>>>> +    return be16_to_cpu(data.x[0]);
>>>>> +}
>>>>> +
>>>>> +static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned long addr,
>>>>> +                 u16 data)
>>>>> +{
>>>>> +    struct rpcif_hyperbus *hyperbus =
>>>>> +        container_of(hbdev, struct rpcif_hyperbus, hbdev);
>>>>> +    struct rpcif_op op = rpcif_op_tmpl;
>>>>> +
>>>>> +    op.cmd.opcode = 0x40;
>>>>> +    op.addr.val = addr >> 1;
>>>>> +    op.data.dir = RPCIF_DATA_OUT;
>>>>> +    op.data.nbytes = 2;
>>>>> +    op.data.buf.out = &data;
>>>>> +    cpu_to_be16s(&data);
>>>>
>>>>
>>>>
>>>> Testing this, I found that writing data to the Hyperflash results in swapped _data_ in Hyperflash due to this cpu_to_be16s() conversion:
>>>>
>>>> 02 01 04 03 06 05 08 07 ...
>>>>
>>>> Breaking the usage of the data written for other users, i.e. the boot loaders.
>>>>
>>>> On the other hand, dropping this cpu_to_be16s() (and be16_to_cpu() in the read16 above) makes the probing to fail completely.
>>>>
>>>> The topic seems to be that rpcif_hb_write16() handles command _and_ data, and the commands seem to need the conversion.
>>>
>>>      The HyperBus spec says the register space is always big-endian but the
>                                                                            ^^^ then
> 
>>> again
> 
>>> HypoerFlash doesn't have the register space...
>>>
>>>> As mentioned, the first idea, dropping the conversion and adding some debug output in the driver [1] results in failed probe [2]. Successful probing of the unmodified driver  results in [3], then.
>>>>
>>>> Seems I need some advice: Why is this conversion for successful probe required?
>>>> Why is the first 'QRY' returned by the device not detected by cfi_qry_mode_on()?
>>>
>>>      "QRY" is in the MSBs?
>>
>>
>> Well, even if we have swapping enabled and with this it's in the LSBs, it's not detected in the first run. See the first 5 traces in [3] below.
>>
>>
>>>> Is the any possibility to drop the conversion _and_ make the driver probe
>>>> successful? Or do we need to split the path the commands and the data are
>>>> routed? If so, how?
>>>
>>>      I've found some interesting options under the CFI advanced config options,
>>> e.g. "Flash cmd/query data swapping" having MTD_CFI_BE_BYTE_SWAP value in this
>>> item. With this variant chosen, I don't need any byte swapping in the driver
>>> any more... and the QRY signature is read correctly on the very 1st try.
>>
>>
>> Yes, but ;)
>>
>> I tried MTD_CFI_BE_BYTE_SWAP config option, too. Enabling that and dropping cpu_to_be16s()/be16_to_cpu() in the driver result in a successful probe. And
>> /dev/mtdx afterwards. That's the good news.
>>
>> But, the bad news:
>>
>> Trying a write (dd to /dev/mtdx) hanged and never returned. In contrast to the
> 
>     Not for me:
> 
> root@192.168.2.11:~# dd if=jffs2.img of=/dev/mtd11
> random: crng init done
> 2666+1 records in
> 2666+1 records out
> 1365320 bytes (1.4 MB) copied, 33.0917 seconds, 41.3 kB/s
> 
>> solution with the cpu_to_be16s()/be16_to_cpu() in the driver, which wrote nicely to the Hyperflash, but swapped.
> 
>     Something's wrong at your end...


Yes, fixed that, working now :)

For reference, I did [1].

Best regards

Dirk

[1]

 From af977d8e53cca6f2e20fb737b4c8655d83e2d7c4 Mon Sep 17 00:00:00 2001
From: Dirk Behme <dirk.behme@de.bosch.com>
Date: Mon, 10 Feb 2020 09:11:40 +0100
Subject: [PATCH] mtd: hyperbus: rpc-if: Use built in endian conversion

Instead of 'manually' doing the endian conversion in the driver,
use the MTD built in one.

FIXME: How to autoselect MTD_CFI_BE_BYTE_SWAP? 'select MTD_CFI_BE_BYTE_SWAP'
        in Kconfig doesn't seem to work?

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
  arch/arm64/configs/rcar3_defconfig | 1 +
  drivers/mtd/hyperbus/Kconfig       | 2 ++
  drivers/mtd/hyperbus/rpc-if.c      | 8 ++++++--
  3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/rcar3_defconfig 
b/arch/arm64/configs/rcar3_defconfig
index d04d5bd83580..cf5636b333b9 100644
--- a/arch/arm64/configs/rcar3_defconfig
+++ b/arch/arm64/configs/rcar3_defconfig
@@ -172,6 +172,7 @@ CONFIG_DEVTMPFS_MOUNT=y
  CONFIG_DMA_CMA=y
  CONFIG_CONNECTOR=m
  CONFIG_MTD=y
+CONFIG_MTD_CFI_BE_BYTE_SWAP=y
  CONFIG_MTD_PHYSMAP_OF=y
  CONFIG_MTD_M25P80=m
  CONFIG_MTD_SPI_NOR=m
diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
index d80489d9989c..353be8c8f339 100644
--- a/drivers/mtd/hyperbus/Kconfig
+++ b/drivers/mtd/hyperbus/Kconfig
@@ -25,6 +25,8 @@ config HBMC_AM654
  config RPCIF_HYPERBUS
  	tristate "Renesas RPC-IF HyperBus driver"
  	depends on RENESAS_RPCIF
+	select MTD_CFI_ADV_OPTIONS
+	select MTD_CFI_BE_BYTE_SWAP
  	help
  	  This option includes Renesas RPC-IF HyperFlash support.

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index a66a5080b482..6e0c45b5ef95 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -17,6 +17,11 @@

  #include <memory/renesas-rpc-if.h>

+/* FIXME: How to drop this? */
+#if  !defined(CONFIG_MTD_CFI_BE_BYTE_SWAP)
+#error Enable config "Flash cmd/query data swapping (BIG_ENDIAN_BYTE)"
+#endif
+
  struct	rpcif_hyperbus {
  	struct rpcif rpc;
  	struct hyperbus_ctlr ctlr;
@@ -60,7 +65,7 @@ static u16 rpcif_hb_read16(struct hyperbus_device 
*hbdev, unsigned long addr)
  	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
  	rpcif_io_xfer(&hyperbus->rpc);

-	return be16_to_cpu(data.x[0]);
+	return data.x[0];
  }

  static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned 
long addr,
@@ -75,7 +80,6 @@ static void rpcif_hb_write16(struct hyperbus_device 
*hbdev, unsigned long addr,
  	op.data.dir = RPCIF_DATA_OUT;
  	op.data.nbytes = 2;
  	op.data.buf.out = &data;
-	cpu_to_be16s(&data);
  	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
  	rpcif_io_xfer(&hyperbus->rpc);
  }
-- 
2.20.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
