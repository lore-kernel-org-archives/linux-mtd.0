Return-Path: <SRS0=Qvgb=JP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4369CC433ED
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 16:54:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B35260FF1
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 16:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B35260FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YlfAOREw5AJ3sLLdqhNqd2v4oj+ZNtEpMJ3Oq7zk7ZE=; b=ZP/GKsG56wRkAyto7Jdaq6h5m
	HwvsJvZp64uqYTyyVaCU7XV6EdLSTi9ZHCYSwAtTaDHMaIvLAZeppEKfopnblpiOCw+04Rm6QT07F
	zxHGTtYQNiyqqMt09ka2Id7/4ZigHLk0dfr6RygxSF7E6SKX8Bj8O2TCMPgqPxBjwgIEF6jlUfKbx
	PuCOIsiHxju0VFVcWroquIBtgowJDyo2K3itmYXZxkvwho345aFNgG+zRr+P4VTznlBAgrR0zzM5H
	dEkvGc0pCpw58b1wV7ueJLNoM/oMQM+Z0MAVkwxHaZl3lVWHP8ndvZUGr9xH8e6AbzyRjx1T80WHr
	/BtkmgyLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYAgB-008Kap-7c; Sun, 18 Apr 2021 16:53:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAg7-008Kak-C9
 for linux-mtd@desiato.infradead.org; Sun, 18 Apr 2021 16:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=6lPwZCh2gDrqCBlpGB5V+6FrhCa0rgJFX0WJJvDlyY8=; b=XHimTHOH6JgfFXHYJuXbugj69m
 4LWOsi++bqkGd+rd7QskxzlBb9W24K6oEPfDaCxzmaqCIj5vmHEAM/pCFOLAuPjdbH9v5GxxhIg9z
 2b4U1DDIyxblxl8DPyQKBujIQIdo40JvrZGZEKRDTisVUma36F/NA4GuIRqFDYbtj3Cj/Revp2rV7
 Nuz36EO0E2pQpAxGx8jyPtMtrfOHhDSxSNX1IenifiKT5QkHpk/yZUQD0443rsx/U2Ngw5GBiuITe
 Eme8i6g3E7FN4MS55gsbNoVeS29o4L1rEQXtdrMRqMlDAYBJEdU8MDv8//DBpdB0fBrdDKX16XQl+
 aCpFiWUQ==;
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAg1-00AWVv-QK
 for linux-mtd@lists.infradead.org; Sun, 18 Apr 2021 16:53:45 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4FNbcW00twzQk1r;
 Sun, 18 Apr 2021 18:53:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1618764809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lPwZCh2gDrqCBlpGB5V+6FrhCa0rgJFX0WJJvDlyY8=;
 b=lOSI2w8PRGRgIh+RT5YGCfIkO8n/lQ/utmBMre7Vl7Lz0d75ytz8dQ5x78P3Numr31SHZt
 xWYOqEHY2iQ28Y6kQELFmct5UNsncgjJYrVPLGlNVDlKvQ3NDqQ4OomDi1r9ETcbiQhQqY
 6El/V8rUxbG5b4WEsODdgxoDC9uJtkbtqyCsWh7EL56RiBbj1Kq22rmElVYDGqDBgDBGxK
 DYN1nlp/rl4xRGTv/DQWICBPbczYDQJNWf32JFbj5vKvy/cmKJOtkFRdXioXYn/e7Mri5i
 yJifBpVqXB+WOjt83bhbohqGThFQoNVL6gpoCS8Xjv0ReCURhYoQTmw5MIdufQ==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id y0yDlwiINpdG; Sun, 18 Apr 2021 18:53:26 +0200 (CEST)
Subject: Re: [PATCH 1/2] mtd: parsers: trx: Allow to specify trx-magic in DT
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, rafal@milecki.pl,
 musashino.open@gmail.com
References: <20210315170711.567358-1-hauke@hauke-m.de>
 <20210315170711.567358-2-hauke@hauke-m.de> <20210317102556.68b76e96@xps13>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <0934457e-5f8e-dd9b-bd14-de93c5eb06ec@hauke-m.de>
Date: Sun, 18 Apr 2021 18:53:25 +0200
MIME-Version: 1.0
In-Reply-To: <20210317102556.68b76e96@xps13>
Content-Language: en-US
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.40 / 15.00 / 15.00
X-Rspamd-Queue-Id: DD9F517F6
X-Rspamd-UID: bbd099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_095342_154497_D72B3C2F 
X-CRM114-Status: GOOD (  13.10  )
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

On 3/17/21 10:25 AM, Miquel Raynal wrote:
> Hi Hauke,
> 
> Hauke Mehrtens <hauke@hauke-m.de> wrote on Mon, 15 Mar 2021 18:07:10
> +0100:
> 
>> Buffalo uses a different TRX magic for every device, to be able to use
>> this trx parser, make it possible to specify the TRX magic in device
>> tree. If no TRX magic is specified in device tree, the standard value
>> will be used. This value should only be specified if a vendor chooses to
>> use a non standard TRX magic.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>   .../bindings/mtd/partitions/brcm,trx.txt      |  5 +++++
>>   drivers/mtd/parsers/parser_trx.c              | 21 ++++++++++++++++++-
> 
> Can you please split this patch:
> 1- dt-binding update
> 2- driver update
> 
> This way we can collect Rob's ack for the binding patch.
> 
Hi,

Sorry for answering so late.

I will split this into two patches.

Hauke

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
