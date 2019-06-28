Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19ABC4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 14:35:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2999205C9
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 14:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sPTuRdOY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FJj16cKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2999205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUL3Cif57TxKyEoRPSc9ht1ckgbNWIorxyqBh+LuJ+c=; b=sPTuRdOY3M+B81
	X8OQec4+kYBNndgVXQfCe2G86A+n0DWMf2eJBpuxcAtGqyotLvVGIhYCYLlM6Z49T8bLVfPvXgF2Z
	PfthQasq+XJIkzITwk2ZdTeXJiNf5x7o0mI4QeVxv3B9FjJ4uY3/4/VW9RdSi9QgrAdIy0buz6nfB
	gEIS6EVEAIVJ1tLYX4u1GVOH8akw869vBcI8/J/uHwWA3rE4Sh9peUHwe8JiheDpeHd+wKW2PWK0N
	b948uQjRIDk1GTfOPuJ9GqY18KgaHCs6VBQyksFhF2UxeQLq8AXlwkVyHf2fXvmNLiN7ULgPJ1Jp/
	dwts8njgxIXbI884UBNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgryn-0003fy-FW; Fri, 28 Jun 2019 14:35:57 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgryk-0003dj-1Y; Fri, 28 Jun 2019 14:35:55 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SEZmsd069055;
 Fri, 28 Jun 2019 09:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561732548;
 bh=1EuGAs9Hme8Xg3Fp5x6Mxds32XVEe/eAw1K3JA7yOTI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FJj16cKDdf1jFEiZABXWqguchaVeSfpmtqdb9qMByJyUsuWjYm/w/2tqhrgpT9QvS
 FEQgBCHZzQf5CAaO6zKxS8p/ePzE4bb+xDiAI9IPtemLh7vT6mpDm0MK+reLjHHa0D
 nD5L0YQZql4sfHcqb3o4vM2UrRaCs2nzFy/QmYnU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SEZm56059265
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Jun 2019 09:35:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 28
 Jun 2019 09:35:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 28 Jun 2019 09:35:48 -0500
Received: from [10.250.132.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SEZhKg090817;
 Fri, 28 Jun 2019 09:35:44 -0500
Subject: Re: [PATCH v8 0/5] MTD: Add Initial Hyperbus support
To: Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring
 <robh+dt@kernel.org>
References: <20190625075746.10439-1-vigneshr@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <89b4b00a-0564-2b69-4324-d2554f69e9bf@ti.com>
Date: Fri, 28 Jun 2019 20:05:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625075746.10439-1-vigneshr@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_073554_259883_EE53FE70 
X-CRM114-Status: GOOD (  12.50  )
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
 Tokunori Ikegami <ikegami.t@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 25-Jun-19 1:27 PM, Vignesh Raghavendra wrote:
[...]
> Vignesh Raghavendra (5):
>   mtd: cfi_cmdset_0002: Add support for polling status register
>   dt-bindings: mtd: Add binding documentation for HyperFlash
>   mtd: Add support for HyperBus memory devices
>   dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>     controller
>   mtd: hyperbus: Add driver for TI's HyperBus memory controller
> 


Fixed comments on patch 3/5 locally and series applied to
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
branch mtd/next.

Regards
Vignesh

>  .../bindings/mtd/cypress,hyperflash.txt       |  13 ++
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt |  51 ++++++
>  MAINTAINERS                                   |   8 +
>  drivers/mtd/Kconfig                           |   2 +
>  drivers/mtd/Makefile                          |   1 +
>  drivers/mtd/chips/cfi_cmdset_0002.c           | 130 +++++++++++++--
>  drivers/mtd/hyperbus/Kconfig                  |  23 +++
>  drivers/mtd/hyperbus/Makefile                 |   4 +
>  drivers/mtd/hyperbus/hbmc-am654.c             | 141 ++++++++++++++++
>  drivers/mtd/hyperbus/hyperbus-core.c          | 154 ++++++++++++++++++
>  include/linux/mtd/cfi.h                       |   7 +
>  include/linux/mtd/hyperbus.h                  |  86 ++++++++++
>  12 files changed, 603 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  create mode 100644 drivers/mtd/hyperbus/Kconfig
>  create mode 100644 drivers/mtd/hyperbus/Makefile
>  create mode 100644 drivers/mtd/hyperbus/hbmc-am654.c
>  create mode 100644 drivers/mtd/hyperbus/hyperbus-core.c
>  create mode 100644 include/linux/mtd/hyperbus.h
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
