Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04887C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:28:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC5FC64D9F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC5FC64D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YH2fBqrlx0216akJTcv2+TUPVbzDHawzXq3VJh+TTmo=; b=E3gFpjqlpEckU5bfnm1l1RBXw
	V0x2YLCNjbEEudAsrRAR1vxtzPceyObszshLsJpVyRiOMuRogEucjU8AuoJPeIE2zXZV2+4lq/4Sm
	SJrFadZB6TfpXTU0jFumD9tyAREQrplQkoH7IHKXAvAwf5C0Vu/JLrBTMUFl7tYxGkNiGHs/gEMzI
	m0W9wm+jF5+nBbQWMFXkyq15vC1rMa/cBhwXQphsZZ3GDrYgeWdRtP8rpl5loxg8blTVqt1tuPDoy
	kkYM6++Zs/NvyS26w9/ZV+0v4YwRIl1KiNK86KnvRE6OeFxAucowEM3pvPrgkSVXgGfAD7sxQm/UH
	vlAewNVWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBwe8-0001L8-Jm; Tue, 16 Feb 2021 09:27:52 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBwe6-0001KQ-6C
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 09:27:51 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11G9RltY074895;
 Tue, 16 Feb 2021 03:27:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1613467667;
 bh=E1J9uj0Y/Kr3fE85lJmlo5jo509mn4fRq5IQgUx1ZPY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=SM77Rp93LyJXI8L0SbtEuDWVSriShjusiq+uE/vCIt2xKdYNnSzTUboBQ8mf5CE93
 piOnrNe6OukyuoD+Q0OxlvRS0uX8HATGIZqymsG3L+dfKWNsa6mk4zW7Udt3XLWFAC
 FE3VB7xi9b/kRsEFAUiLlG+SK5DYNBapQsu+pqcU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11G9RliS125987
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Feb 2021 03:27:47 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Feb 2021 03:27:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Feb 2021 03:27:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11G9Rkna039018;
 Tue, 16 Feb 2021 03:27:46 -0600
Date: Tue, 16 Feb 2021 14:57:45 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Message-ID: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_042750_890637_EC093D74 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 15/02/21 10:53PM, Heiko Thiery wrote:
> Hi all,
> 
> I faced an issue with a SPI flash on our board. We use a macronix
> MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> the MX25L12805D [2].
> 
> The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> while the older doesn't.
> 
> I thought that I could do a fixup with a device specific
> post_bfpt_fixups() call but by now this seems not possible. The older
> MX25L12805D has no flags set that allows a call to
> spi_nor_sfdp_init_params() and implements the fixup.
> 
> Has anyone an idea how to solve this?

The post_sfdp fixup is always run regardless of whether the flash has 
SFDP or not. You can try putting your flash-specific fixups there.

> 
> 
> [1] https://www.macronix.com/Lists/Datasheet/Attachments/7397/MX25L12835F,%203V,%20128Mb,%20v1.6.pdf
> [2] https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf

Both these links are broken.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
