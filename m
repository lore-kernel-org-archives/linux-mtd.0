Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2B2C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 11:10:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EBA720731
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 11:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T35xSWHM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="ozlgJ5Bd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EBA720731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OIHHVgldyufXrGOByu36RvHaALeZc37wBagzHJimzxw=; b=T35xSWHMfxT/xTGNoXSNmALMj
	nFjCI/hxvaGyyIMxGJFNJDD3Y1DQjesUOsEaY4Il7/BWfT3ZK4H+kXAKaRP1P0XY8NKklTzGzlKEQ
	VNwbTIwmFur+i8NvmnlKrDUUgGCDBKx2AGN0BU1biirRl+MJkssU2ktMxOZOSGCzqSN9FaM3occnM
	z/bgpF4e+mbETX/urlTg3J+niR7CLuqBELZOFvbTWZOq/5Tp8uWMTCeGMn4BEiY7wenASzp8X6wSG
	qm4AN4gCcHKupTNfuWoDmCeBcKuMTmG0OUTpoD0aBoUCz8GjGUnUd82JycU6074yTlm5XHhuLm/x3
	5ucI+W3aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHmMl-0002CY-7X; Mon, 14 Sep 2020 11:09:47 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHmMi-0002Bw-Tp
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 11:09:46 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CC4EA22F53;
 Mon, 14 Sep 2020 13:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1600081776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yszHbgqX450NR05oYbyE31jOQW/bTnQLlOfg2qjJEo0=;
 b=ozlgJ5BdDpbabKUGdD25b0kKp+8wyFP/TZ6OkHrMwCyVFvIUAxHxHH1hTOmM0+ZAMaJAf2
 t7wa8Xq0Mc93xdcvqfKtENYJ1uVrfJb0QZOO10ufjLcmDusfLlIsvrY9oEKezzCSDGd5mP
 nrjh0WHu/aJ5vBzeiYZPhYNYyEtdtzQ=
MIME-Version: 1.0
Date: Mon, 14 Sep 2020 13:09:33 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <me@yadavpratyush.com>
Subject: Re: [PATCH v2 1/4] mtd: spi-nor: cleanup common code
In-Reply-To: <20200914094046.tccoc54n7e36zzyr@yadavpratyush.com>
References: <20200911222634.31804-1-michael@walle.cc>
 <20200911222634.31804-2-michael@walle.cc>
 <20200914094046.tccoc54n7e36zzyr@yadavpratyush.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <6d52e1bdbbefc9383904e28bcc1c78a7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_070945_078721_C98AE3C0 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jungseung Lee <js07.lee@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

Am 2020-09-14 11:40, schrieb Pratyush Yadav:
> Hi Michael,
> 
> *sigh* This patch will cause a _lot_ of conflicts with my series [0]. 
> It
> should hopefully go in the next merge window so maybe you can rebase on
> top of it? Dunno.

Could you pick up this patch in some form in your series? It looks like 
your
series touches most/some of the functions. The patch just removes code
repetitions.
TBH I don't need this patch as I just can implement my new one-byte 
command
using the current "if (nor->spimem) {} else {}" pattern.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
