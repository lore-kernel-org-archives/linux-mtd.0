Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5613CC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 06:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2533420675
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 06:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfFDvkYr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tJO8UXWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2533420675
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fwd4nHvkfFOpr4OFQXH2myX2fXTtVlmtRtf0P52NrtE=; b=kfFDvkYr+gpw9x
	hth/Skg4X8OO8cpMVr2HFAcBV9qmQGdOA8xVkpoO/vZtVWSqiqOQlwBLKtR1DAoP876e5jf0BDcgN
	DA4kNCPhAA6iBJGCYkA9WrIDKZfI4LI589wr5dOra6H2qd/8sCAClKd5nKYj5WnCUWYylm1xrJcxp
	AJQ9xklAlh1QOt/ZElDxat4QferJO8ANSqqtpzGcWyWXqyT0Efhf5c9foaUWJWgyF6bemL5hCgwIW
	MUW6KyhHuadAkJHPJzUPAr4c/aYClAODiyamOR5jO3jv2ooREWEO8ECk5zwTDNWH7Evp1GCtpobpe
	FIUUJqCRlwhv57vcrL9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIof8-0005EE-ER; Tue, 23 Apr 2019 06:12:14 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIof5-0005Do-K4; Tue, 23 Apr 2019 06:12:13 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3N6C2MH058379;
 Tue, 23 Apr 2019 01:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1555999922;
 bh=k+UOFmEsUNmbjD6gX1BZX7XCEjixRWsf6RdCKrtCo7g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tJO8UXWMLzAElZsTMzDdycHqfDeYSYUvmlJTDoSt0AeEPR54qMz7MePSOzjKbkVp9
 K6kyrZq637TxE1ZruiIbEzTQPju9m0aWCNyymjEBq5lDKfofOOTkmYm/WLP/i963Pt
 N6tfr42+BHHArYwhplerXPdYz6fbhOWTepTIzHoI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3N6C2hX078028
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Apr 2019 01:12:02 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 23
 Apr 2019 01:12:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 23 Apr 2019 01:12:02 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3N6BvcS077231;
 Tue, 23 Apr 2019 01:11:58 -0500
Subject: Re: [PATCH v3 0/5] MTD: Add Initial Hyperbus support
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
References: <20190423060638.18197-1-vigneshr@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <7e5515f8-340c-bd63-2897-90e0d42cf264@ti.com>
Date: Tue, 23 Apr 2019 11:42:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423060638.18197-1-vigneshr@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_231211_736249_DDDDD9E8 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 23/04/19 11:36 AM, Vignesh Raghavendra wrote:
> 
> 
> Vignesh Raghavendra (5):
>   mtd: cfi_cmdset_0002: Add support for polling status register
>   dt-bindings: mtd: Add binding documentation for HyperFlash
>   mtd: Add support for HyperBus memory devices
>   dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>     controller
>   mtd: hyperbus: Add driver for TI's HyperBus memory controller

Please ignore this series. Ended up sending from stale patch output
directory. Sorry for the noise.

> 
>  .../bindings/mtd/cypress,hyperflash.txt       |   6 +
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt |  31 +++
>  MAINTAINERS                                   |   8 +
>  drivers/mtd/Kconfig                           |   2 +
>  drivers/mtd/Makefile                          |   1 +
>  drivers/mtd/chips/cfi_cmdset_0002.c           |  90 ++++++++
>  drivers/mtd/hyperbus/Kconfig                  |  23 +++
>  drivers/mtd/hyperbus/Makefile                 |   4 +
>  drivers/mtd/hyperbus/hbmc-am654.c             | 115 +++++++++++
>  drivers/mtd/hyperbus/hyperbus-core.c          | 192 ++++++++++++++++++
>  include/linux/mtd/cfi.h                       |   5 +
>  include/linux/mtd/hyperbus.h                  |  91 +++++++++
>  12 files changed, 568 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  create mode 100644 drivers/mtd/hyperbus/Kconfig
>  create mode 100644 drivers/mtd/hyperbus/Makefile
>  create mode 100644 drivers/mtd/hyperbus/hbmc-am654.c
>  create mode 100644 drivers/mtd/hyperbus/hyperbus-core.c
>  create mode 100644 include/linux/mtd/hyperbus.h
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
