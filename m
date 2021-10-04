Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C61C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:55:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0279F6124D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0279F6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufOMXGwTwLEOnufBtaCn4cPS6B5C2MJsWMFpAKIbAhE=; b=cnaADTm2I3pn7x
	m6l9qBtWbAPlEAFiWwnI2k+mSq2bgDRLk52qcG6z3nauXjFiZ16xYdBtWNWDoCADy2Nm7W9Rl3czF
	2v8rUKOHLZBUM5GL9nVkfuW5+Tm5KDhTut882Z++C/u4UBpwnBBCuIRaBTXKk27GqqVEl6b8FjN11
	C2udOavtLBE8xzOEjrG+i7e6p9Oe5v1pBqwSuXlVZA5wbWIFrPMcFc3DFbn/v4jGVPe9luEuXQ+2D
	5AfufMRWEcdfQvYTV4S4H8RMFjNTpKDitnpz3KEfGDWvqPAsRykMiSlErrcOMvZl4XBGpDGeWu6Pf
	3UAiobCMHrSn+Beu/fqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXGvy-005AMS-Rn; Mon, 04 Oct 2021 05:54:42 +0000
Received: from mailout12.rmx.de ([94.199.88.78])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXGvt-005AGy-OY
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 05:54:41 +0000
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout12.rmx.de (Postfix) with ESMTPS id 4HN8zy3TK8zRq53;
 Mon,  4 Oct 2021 07:54:22 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin01.retarus.com (Postfix) with ESMTPS id 4HN8zs0KXmz2xlQ;
 Mon,  4 Oct 2021 07:54:17 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.55.32) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 4 Oct
 2021 07:54:16 +0200
From: Christian Eggers <ceggers@arri.de>
To: <linux-mtd@lists.infradead.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Greg Ungerer <gerg@kernel.org>, 
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Han Xu
 <han.xu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Mon, 4 Oct 2021 07:54:15 +0200
Message-ID: <3160469.44csPzL39Z@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.32]
X-RMX-ID: 20211004-075417-fLMDMrmDssxx-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_225438_033170_EF80A775 
X-CRM114-Status: GOOD (  18.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Monday, 29 July 2019, 08:41:51 CEST, Greg Ungerer wrote:
> Hi Miquel,
> 
> I am experiencing a problem with NAND flash DMA timeouts on
> iMX6ull based boards. The problem is very similar to that
> described in:
> 
>    https://linux-mtd.infradead.narkive.com/JIUulfFB/gpmi-imx6ull-timeout-on-dma
> 
> That didn't come to any specific resolution that I could see
> in that thread.

Hi all,

I am joining this thread because I am also affected by this problem. I use
kernel 5.10.65-rt53 but I have seen this issue on many previous versions. In the
past I only recognized this on my development setup but now this has been found
by our testing team.

In our test setup we simply perform a reboot every 30s. After 5 to 200 cycles
the test stops due to this error.

The kernel version I use already includes:

> Han Xu <han.xu@nxp.com>
> mtd: rawnand: gpmi: Fix the random DMA timeout issue

Additionally I tried ...

> Michael Trimarchi <michael@amarulasolutions.com>
> mtd: nand: Calculate the clock before enable it

... but the problem still persists.

In my case, some registers show different values (annotated below):

> 
> The boot trace on the console for me looks like this:
> 
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
  nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
> nand: Micron MT29F2G08ABAEAWP
  nand: Micron MT29F4G08ABADAH4
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> gpmi-nand 1806000.gpmi-nand: DMA timeout, last DMA
> gpmi-nand 1806000.gpmi-nand: Show GPMI registers :
> gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x20830002
> gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x01c6800c
> gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00010101
> gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0xe0000000
> gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x23023336
> gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x000001ee
> gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0xff000001
> gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x00000001
  gpmi-nand 1806000.nand-controller: offset 0x0c0 : 0x00000202
> gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x05020000
> gpmi-nand 1806000.gpmi-nand: Show BCH registers :
> gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x00000100
  gpmi-nand 1806000.nand-controller: offset 0x000 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000010
> gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0x030a2080
  gpmi-nand 1806000.nand-controller: offset 0x080 : 0x070a4080
> gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x083e2080
  gpmi-nand 1806000.nand-controller: offset 0x090 : 0x10da4080
> gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x070a4080
> gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0x10da4080
> gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x070a4080
> gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x10da4080
> gpmi-nand 1806000.gpmi-nand: offset 0x0e0 : 0x070a4080
> gpmi-nand 1806000.gpmi-nand: offset 0x0f0 : 0x10da4080
> gpmi-nand 1806000.gpmi-nand: offset 0x100 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x110 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x120 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x130 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x140 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: offset 0x150 : 0x20484342
> gpmi-nand 1806000.gpmi-nand: offset 0x160 : 0x01000000
> gpmi-nand 1806000.gpmi-nand: offset 0x170 : 0x00000000
> gpmi-nand 1806000.gpmi-nand: BCH Geometry :
> GF length              : 13
> ECC Strength           : 8
> Page Size in Bytes     : 2110
> Metadata Size in Bytes : 10
> ECC Chunk0 Size in Bytes: 512
> ECC Chunkn Size in Bytes: 512
  ECC Chunk Size in Bytes: 512
> ECC Chunk Count        : 4
> Payload Size in Bytes  : 2048
> Auxiliary Size in Bytes: 16
> Auxiliary Status Offset: 12
> Block Mark Byte Offset : 1999
> Block Mark Bit Offset  : 0

Please let me know if further information is required.

regards
Christian





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
