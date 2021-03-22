Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94449C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 15:49:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911416199F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 15:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911416199F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n7XEpzJn2zVkXS7bg7OFLAW/LQNVkT4ETsG4jnJqehE=; b=IluRy6gYBdxOhrM44VbPotjQQ
	8GKv/IL+EVV5cU/6q9QEVOh3rtdUj3nscKKJuGf872Qpvbkqb9iFuaTDtLDOs+gvPosBpq1YKuQFT
	trzPRkRkT2yANulh1i1KtP8xL0BAJRTAl5ohiBQTKKstTJlNYjDwBhtLVwFvHvNR0BZbj6Z3U1OBz
	WN5YUmPz/ArPN4CKTDm7qbawPLVAwAz0REifCtxiaLyvL8eXreW/C5TIZVW2QL4w+3sRO3pmWrm7J
	pdbrj4KTMVzkpWCCXAOpjiTsmdVOWgvy1dmckIRP4/sikX9w5M4lYbc9eTJ3Bm6AkTIoJYkkthsbS
	M8ZOelshQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOMnK-00Bvuo-DC; Mon, 22 Mar 2021 15:48:42 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOMnA-00BvuB-Mu
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 15:48:34 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 10DB722235;
 Mon, 22 Mar 2021 16:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616428112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3qa2pPQdTQJVJwKBRlFL0u42AQ4SJ4FARdq7h1EuZw=;
 b=lO1d6jyaMhQtRpC6Q6rpr/+nNMsVXAO9o+/jwg8BoCnK0jSFGoDbUpi0wFrfJ4Tg+CqLbW
 /mEzwKUBCNEFCcm0/ElK9GSWpTIorKFrfWkzfH4Aixo+U4UJn8La/QGrY8twqtB/qH8EbT
 rJtzF07IrJcNF0FARrPEGSjTf0j2TxQ=
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 16:48:31 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
In-Reply-To: <0efba47de8737059b4f3c593c26297bf@walle.cc>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-2-michael@walle.cc>
 <20210322142141.pd7ondg6l76idz7d@ti.com>
 <0efba47de8737059b4f3c593c26297bf@walle.cc>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9690ceb44cb1a09c03e2ac16569f3c6d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_154833_009254_0854EA8A 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-03-22 16:32, schrieb Michael Walle:
>>> +
>>> +	sfdp->num_dwords = DIV_ROUND_UP(sfdp_size, sizeof(*sfdp->dwords));
>> 
>> The SFDP spec says that Parameter Table Pointer should be DWORD 
>> aligned
>> and Parameter Table length is specified in number of DWORDs. So,
>> sfdp_size should always be a multiple of 4. Any SFDP table where this 
>> is
>> not true is an invalid one.
>> 
>> Also, the spec says "Device behavior when the Read SFDP command 
>> crosses
>> the SFDP structure boundary is not defined".
>> 
>> So I think this should be a check for alignment instead of a round-up.
> 
> Well, that woundn't help for debugging. I.e. you also want the SFDP 
> data
> in cases like this. IMHO we should try hard enough to actually get a
> reasonable dump.
> 
> OTOH we also rely on the header and the pointers in the header. Any
> other ideas, but just to chicken out?

Oh, forgot to mention, sfdp_size is used to read the data. I just want
to make sure, the allocated area is large enough. We shouldn't hit the
undefined behavior by reading past the SFDP.

Maybe that check should be part of the parsing code.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
