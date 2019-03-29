Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD20C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 14:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86452173C
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 14:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HidJPWzm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="ZK2GIDfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86452173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O85mRSyPW2/2KVQaBBmrOW+mmkhIG79aGRUcOs/XADY=; b=HidJPWzm8pbHLA
	icTNz6ffSDim7h1BfM7jYfpcV5Zww/4xrQ3ZYXrzp7sLr+D7mW+0I2v4W9JHjT3Gi1GkGLutFOjaO
	xA8GOMe4ZRhjX0Hivv7LVT6CyFilyV3sy5lvB4AY78x6SxcRypN89eL8bVwkUb/LKUjxx905OojPd
	XEud6H5v0XsGj4kHFnd7TwLcJ0ewMo3JC5/C2gbgmt59ZLxOVtoDNnXNUrlyHpfkEN33SYDMXOsA5
	CB2FF3jEbmGCJ+IRV9A6aYVXSAeJHfVHv4zgou5sroPcnupHTufohaHapkEYucpPcsjkSeGmLyEaS
	Cdui0uzAd/VrbjrOELsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9sdv-00074l-Ki; Fri, 29 Mar 2019 14:38:03 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9sds-00074P-86
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 14:38:02 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5BA695C274A;
 Fri, 29 Mar 2019 15:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1553870276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CznT+VfKzcSSwZRvdaEl0403YGGH9yITApt9CECC0Ms=;
 b=ZK2GIDfFTJRNLa04Sbf8BXO90N8m8Gjm+sS61UQZHOdsNczl5PhFc0Kaijzsj/zLAAzobz
 D+WfD+jf/b239SgwS1UBa1R21YEIL6UTYQQepfhLz7vJd+DO5H4rd8TnMyPFcw9GCwBAYF
 HufYXFV1bCg0XTnOz1G0BsrBoO2iClg=
MIME-Version: 1.0
Date: Fri, 29 Mar 2019 15:37:56 +0100
From: Stefan Agner <stefan@agner.ch>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: nand_op_parser_exec_op should use longest pattern
In-Reply-To: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
References: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
Message-ID: <bc75ec7a12c681a618ee641736141100@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_073801_039652_A72C9AAE 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: linux-mtd@lists.infradead.org, Boris BREZILLON <b.brezillon@overkiz.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29.03.2019 14:35, Sascha Hauer wrote:
> Hi All,
> 
> I just played with the new exec_op interface for the first time and
> together with Boris we found a problem in the pattern table parser.
> 
> The vf610 driver uses this pattern table:
> 
> static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
> 	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> 		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> 	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
> 	);
> 
> It has two patterns, one supposed for writing and one for reading. All elements
> are optional. Now with a typical page read we'll get this:
> 
> [   33.932464] nand:     ->CMD      [0x00]
> [   33.936338] nand:     ->ADDR     [5 cyc: 00 00 00 0a 00]
> [   33.941755] nand:     ->CMD      [0x30]
> [   33.945628] nand:     ->WAITRDY  [max 1 ms]
> [   33.949909] nand:       DATA_IN  [2176 B]
> 
> Only the first four elements are executed in one go, the fifth is
> exectuted separately. This is because the pattern table parser finds
> that the first pattern (supposed for writing) already matches for the
> first four elements and then uses it instead of realizing that the
> second pattern matches the whole operation.

Hm, I do not remember noticing that during development. I wonder if it
was the case already back then.

If yes, it did not seem to have a negative impact on performance
compared to the old interface:
https://linux-mtd.infradead.narkive.com/qZgEnPsC/patch-v6-0-3-mtd-rawnand-vf610-nfc-make-use-of-exec-op

> 
> I have no fix for this, just wanted to let you know. It turned out that
> in my case for the GPMI nand driver I probably won't need any pattern
> table.

Thanks for bringing it up! Will try it out when I come around.

--
Stefan


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
