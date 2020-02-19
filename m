Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F68CC34047
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A54208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SZ9pIt+Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="kA4Zb0Jp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6A54208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m4YURzVU7b+51lzDGEL/nn/LIqb7La0ZxvuXrERR/U8=; b=SZ9pIt+ZMio60dOcZ3tG3ToOj
	tXZuL1yDXLxIhRRDsTxd66iDqD+H17e2bKcM7LyqphBaJ11QtG4ufifqtShMJA8EGKCFEgt4k9ouP
	7RrVwt+k63hClmju13segVusooWiPsBHbFh49Sz7VaBF3/KEGxA3oz7N5xDEc6iFR82/aJ4aTPSgO
	+QtVT+QXSBDVgF2GEe4I7PuOzFcLMTKPhV8RJeF4EDHNI933jBvVkoPMAypX18kJllD05zQXBPmgU
	jt49nqNcpaoBGx5wVEbIaF2p9sgnE+ywDcyuVQhQEsC6XMtvGvl0Gl/7rveNO/CpMoo7ggS/YeMIG
	c5dh3hlTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4NDW-0002A8-0i; Wed, 19 Feb 2020 11:08:34 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4NDR-00029T-N4
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 11:08:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 11DB322F53;
 Wed, 19 Feb 2020 12:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1582110502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1ekk2Amb4pf1yh0m+TDZuLzVTEPLp0Qv33U+lyBhwo=;
 b=kA4Zb0Jpo4d0+osza1FhykdKLAJJeQnE1rKV36cCdC+T0yRbSY9bjU9+dlioMNrhCCRVtR
 SANJk43ZOM6rtwCIOIbX2GJ2O1EQ8DpwqixAlQ35klAinxJRu9TqILVLqwnz2vPoW7JlrS
 MGcvmAQAeVeaMvrXd1QsTmfXl38IX7s=
MIME-Version: 1.0
Date: Wed, 19 Feb 2020 12:08:21 +0100
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <4000296.ZurDTCRVlM@localhost.localdomain>
 <23efafdb8c439838338eef421e341f4a@walle.cc>
 <CGME20200210112615epcas1p1c838e38a519a3f3e390bfc51d4db1d3b@epcas1p1.samsung.com>
 <132665276.5Rxbr4LpEM@localhost.localdomain>
 <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
Message-ID: <1dea94d182249f9640e2cfb2f7ef402a@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 11DB322F53
X-Spamd-Result: default: False [1.40 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.833];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[microchip.com,ti.com,gmail.com,lists.infradead.org];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_030829_908075_8855EE21 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
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
Cc: js07.lee@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 Tudor.Ambarus@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-02-19 11:50, schrieb Jungseung Lee:
> Hi, Tudor and all
> 
> 2020-02-10 (Mon), 11:26 +0000, Tudor.Ambarus@microchip.com:
> We could also find a few flashes that does not following the overall
> logic. For example, "en25qh256" and "en25qh16" which was manufactured
> by EON. They are always following way (2) no matter what the number of
> slot is. It seems that it could be handled like below with custom hook
> later.

For these two flashes, BP3 is just the TB bit. So it should already work 
with the current logic.

-michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
