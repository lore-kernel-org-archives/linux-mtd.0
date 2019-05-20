Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F04EC04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 21:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C802171F
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 21:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O45/tarr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BvdmZ/u0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C802171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CAIUOdQJuTzrRRE6iTrtgld0gJKOdNqwY4ne3C9DrQ=; b=O45/tarrVxnubW
	2LMfZQ+e+ONNz2LAf8WPSCAWa9+OzCf6P4tPUcM4N8Nqd+5TgWHYGt8R7hGxJi+DN+/5o24Fnslny
	n9OrvzY0YlGNkoy5tp6CFQ0BDDSrZUokuoPtAAuHchrfLZP3jGd5jJGmjG30Ziyd1PIQpwgZ8e9Tv
	Ox3N3zgCOIaJA8bTmtXtMLCSeZMrUtSBB5p0yzw/x+BgxLsk7hTQ67j5gf+b74nK/u3cAVJVN4GlX
	dRMUq/gOrswV5YwTqWF0QcXwVbTi+cAGFxet8Lgcr/ycQ/gdPyRqM6UKX7kjPqjIh/GRAg1cqTK1j
	VeifL84WZYrqiRnqYBNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSq5l-00042d-AH; Mon, 20 May 2019 21:45:09 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSq5f-0003Bk-CD
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 21:45:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4KLidv2104510;
 Mon, 20 May 2019 16:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1558388679;
 bh=0mhihxUdtwx1KaImKx+59h6yR8wNHT4PalPkaJF1ArE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BvdmZ/u0fKiFzCYUkb1UbyMW/OAZMx5XKjwL+gRxOuCHOIWV3ZjIZK6NSsgfVvPer
 /NgwJMAKmAUoblS7XhDOBnynokyUt7Jnb2bLg6i/LK+H87D96NQUjnpDhjch03dImp
 B6FprZmz2ckSfUCFW7juOb6oblRk2db2cxFGx3nc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4KLidk1071808
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 May 2019 16:44:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 20
 May 2019 16:44:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 20 May 2019 16:44:38 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4KLiXHF116189;
 Mon, 20 May 2019 16:44:35 -0500
Subject: Re: [PATCH v5 00/11] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
To: Tokunori Ikegami <ikegami_to@yahoo.co.jp>, Boris Brezillon
 <bbrezillon@kernel.org>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ce575536-c160-c7ef-e862-8345ae6c19fe@ti.com>
Date: Tue, 21 May 2019 03:15:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_144503_505256_7F2B56A6 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 05/02/19 7:37 PM, Tokunori Ikegami wrote:
> The change is based on the fix for flash erase to use chip_good() done in the past.
> And it is fixed as same way in the OpenWrt Project as below.
>   <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>
> Also includes some refactoring changes.
> 

This series needs to be rebased on top of Liu Jian's fixes in master.
Please rebase and resend for review. Thanks!

> Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> 
> Tokunori Ikegami (11):
>   mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
>   mtd: cfi_cmdset_0002: Remove chip_ready() from do_write_buffer()
>   mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
>   mtd: cfi_cmdset_0002: Call xip_enable() once only in
>     do_write_buffer().
>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
>   mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
>   mtd: cfi_cmdset_0002: Remove op_done goto statement from
>     do_write_oneword()
>   mtd: cfi_cmdset_0002: Remove retry goto statement from
>     do_write_oneword()
>   mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
>   mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 274 ++++++++++++++++++++++--------------
>  1 file changed, 168 insertions(+), 106 deletions(-)
>  mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
