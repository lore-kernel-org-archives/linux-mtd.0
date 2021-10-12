Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3558C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 18:25:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B37F60ED4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 18:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B37F60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KG3xe8Q9sBto49OV3Wu8FrpIF36LVvKTr6esVq1OyF4=; b=culjUsUOFo02vq
	vnwDbseThxb60JU5d+U8gBaSc3AgI0VOok1/QfK0pNz8vrDfoUDZQDKczJojl5SJ6/a2Ll0qhdQQ+
	rhf5k6Qw73/aH/IF59xst97R/fMkJTVA+1Zw+jGQtfUNDTn9UAgDgq8lSi6VqiqLRV7Bu5M7MBfjA
	jUaZPhy7E1UhRd3zv2H9iF+zeQinLD63MHlJ0IE+AfIzY8yoayDayKEnuayeMh4bs8RD2XL94RrjP
	pUEENNbXKCw/6rfb/ufAo3X9fNZJkjjO2NLr+18KDYXDD0E+LgEG+yVAds9hoEd8Ez+zVe2fs5FQS
	qtRPtIwH8tIJiMZjsHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maMSc-00Djjr-UP; Tue, 12 Oct 2021 18:25:11 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maMSK-00Djh4-Fq; Tue, 12 Oct 2021 18:24:55 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19CIOmlx112024;
 Tue, 12 Oct 2021 13:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1634063088;
 bh=N8ljt3/BRUcAh5ZZnY7/+EAddTqC56LKEo+230v3DP8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dvtybZxnEXfOAPFzHahAi4h+49ZWfumNFXU4FfgWU5/ya8OHh0FAXqWq6Lj7ZRaLI
 aOTWQQ/ceuCKExKgIwxJQQmr9FEGvixLl94Gf52P3H9g3ezlKTjAo2BboszUhznQC1
 paqLjAiobQemQDLEA5THjNKbPMeaWHtDcbwh0TYA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19CIOmDr054576
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Oct 2021 13:24:48 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Oct 2021 13:24:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Oct 2021 13:24:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19CIOk0D038630;
 Tue, 12 Oct 2021 13:24:47 -0500
Date: Tue, 12 Oct 2021 23:54:46 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Sven Eckelmann <sven@narfation.org>
CC: <openwrt-devel@lists.openwrt.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 Michael Walle <michael@walle.cc>, Adrian Schmutzler <dev@schmutzler.it>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 <linux-mtd@lists.infradead.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, <linux-kernel@vger.kernel.org>
Subject: Re: nvmem: Defining cells on mtd created by mtdparts
Message-ID: <20211012182444.qrn3lzp7vukklwlx@ti.com>
References: <18728084.NGlc0Rocea@sven-desktop>
 <14722734.oMan5NXi5u@sven-desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14722734.oMan5NXi5u@sven-desktop>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_112452_703941_46DFD073 
X-CRM114-Status: GOOD (  22.16  )
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

Hi Sven,

On 11/10/21 09:06AM, Sven Eckelmann wrote:
> On Sunday, 10 October 2021 14:53:13 CEST Sven Eckelmann wrote:
> [...]
> > Since there are most likely more devices out there which use mtdparts, I would 
> > guess that there might already be a strategy out there which can be used to 
> > define the nvmem-provider for mtdparts defined partitions. At least I saw that 
> > Bartosz Golaszewski added all the mtd devices automatically as nvmem provider 
> > in c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem 
> > API"). So there might also be something for nvmem-cells to find the correct 
> > mtd instead of relying on the fixed-partitions registration + of_node (which 
> > doesn't exist because it comes from mtdparts and not devicetree).

I have been wanting to fix this problem for a while but just never got 
around to it. I was thinking about either extending the mtdparts syntax 
to maybe add nvmem cell information in there or adding a separate 
cmdline argument that complements mtdparts with nvmem cell info. Dunno 
if either of these would work well though...

> 
> Ansuel Smith just proposed in OpenWrt [1] a workaround. It basically adds a 
> minimal fixed-partitions parser to the mtd cmdlinepart parser (responsible for 
> the mtdparts=) that tries to find the matching (size + offset) fixed-partition 
> from the devicetree. The code in mtd_device_parse_register
> (add_mtd_partitions -> add_mtd_device -> mtd_nvmem_add) will then 
> automatically take care of the rest.

I don't quite see how this helps. You say that some devices don't have a 
device tree at all so how would you even match the fixed partition? And 
this of course doesn't solve the problem where you might want nvmem 
cells with a partition layout that is different from the one in device 
tree.

I unfortunately don't really have any answers for this at this point, 
but maybe I can figure something out in the future...

> 
> Kind regards,
> 	Sven
> 
> [1] https://github.com/openwrt/openwrt/pull/4664#issuecomment-939567963



> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
