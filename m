Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECDAC4CECD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 04:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E8120862
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 04:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NSBe/zNX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sBF1eVTc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E8120862
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUjgx+ivvUvBM19BpEa9xkiiXc7D8fVMP3VBEyG/Alc=; b=NSBe/zNXRSpVuy
	lcYxZPEGpHF/ua4GEaP/KaoStXGTPksQVLdfsHyAcM82Zpq6d5UsZNyFzaF7/c9H90S/UXbPoUgN7
	eyu3HtH34fa+E54aH8MuNoazzNmFKtsL4Pm3pMdFj8iNL0rCtLbA6qHyF6YkdUeb6Diwl0jOQQEV9
	YVELVzVF5AyKn1xNuT+vG7PNULNNpqqfZCwboDEU9txEs4pghINW4LBbyT4n9M1YK6b6EzXjc7x1h
	f9VEqrx0MCQlxSkYTOGgVyvZJMM4u9iOAwZ37lT24z30Bu0ALMwJp0sfvU3jJwj37IKhDf65Kbb+f
	kibE2vYq7TZeXtBEt23g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iA4yf-0001mN-Pf; Tue, 17 Sep 2019 04:20:33 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA4yY-0001lT-Ud
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 04:20:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8H4JvnH094997;
 Mon, 16 Sep 2019 23:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568693997;
 bh=P73JMkJWeKEbpyGMWSEW8V4ubgvBo+oZqb8XLiEt0TI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=sBF1eVTc5f4JQw6d9bOPt7tLE/VfrWmABQwAT8Bw1YE+LrOIWpvuvL1HR/Cz6BCP2
 DElAISdWsTHBNS08wA6NI0bQPPrSmZJGYsW6KbeeCp/SUzpnwy9iqVOY58vJFZGNkZ
 dj9YCZaX2VDvbiIxEHihQs7VWJLaKai/BcuB68UQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8H4JvNW118025
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Sep 2019 23:19:57 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 23:19:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 23:19:57 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8H4JsUK096972;
 Mon, 16 Sep 2019 23:19:55 -0500
Subject: Re: [PATCH v8 0/9] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
To: Tokunori Ikegami <ikegami.t@gmail.com>
References: <20190805190326.28772-1-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5e018d22-99ae-1155-bf64-105a912a20f5@ti.com>
Date: Tue, 17 Sep 2019 09:50:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805190326.28772-1-ikegami.t@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_212027_096584_6D929DF6 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 06/08/19 12:33 AM, Tokunori Ikegami wrote:
> The change is based on the fix for flash erase to use chip_good() done in
> the past. And it is fixed as same way in the OpenWrt Project as below.
>  <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932>
> Also includes some refactoring changes.
> 
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> 
> Tokunori Ikegami (9):
>   mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
>   mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
>   mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
>   mtd: cfi_cmdset_0002: Remove op_done goto statement from
>     do_write_oneword()
>   mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
>   mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths
>   mtd: cfi_cmdset_0002: Disable write buffer functions if
>     FORCE_WORD_WRITE is 1
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 296 ++++++++++++++++++++++--------------
>  1 file changed, 184 insertions(+), 112 deletions(-)
> 

Merged into git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next

Thanks!

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
