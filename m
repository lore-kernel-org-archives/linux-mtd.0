Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80721E7C4F4
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEqsSLtoCOYCt2YoR1+DKsehvDUcAEJf3i/wcJj3SY4=; b=JTFhSAvigOArScqUS2Xe6FHonf
	KtOM9YOf/RsVEXR2BZlrmCqYuSTebLVuCLOPrxLxDKmvmvDMpkYH8ou4PsxUqPw5DWbYjRdxOXyYz
	jyZ9SHfqmyNmy6jKQgwixMTjMm82u8TBGkTYYQCRmlJieh9dXufkZYfMDE1N7eelxvEIPxGXCKWbY
	htiBO0WxAX/sSyGnFWQfJXwDcK4BsnznNp4pp0o9Xhho0F/EOMBpPSIe3b9fmkJxNRwU6XcsDgoj6
	qnd6Cck949bNoaod9HqLlYO+7HOXwSRQLI0Y0vBzSvttxaQtE1ASxbdVbHCLpTGTZRwPNV6ZSN2QM
	G/AhyYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJmZ-001gbF-1d;
	Thu, 05 Oct 2023 08:32:31 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJmW-001gZ9-1e
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 08:32:30 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B93A711B;
	Thu,  5 Oct 2023 10:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1696494736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pYnmT/hkngviokVgbVqLwNTeLD7icavcSaf+5X0RBMU=;
	b=uEUJhITuDkQ5CLEfpEcjF6n2lQxmIE3lCo/tP3rFTpHB1QdbbJl18JUJBAf1TBdADSUuJp
	XUZon6JXnXpbith3cIYaQlFDlmtli81FGi+/gKeuytGPv3CB/JG9iCU4xtey1Ov6vmEmsu
	rBH9yEFSFOpw5TrJulcOPWALFyj6KM73UlRQ1FctD5p1Nj0rvrrxuCxAdHvQ/6uUBiC0MR
	3SIBaUR+NQCh7wJlWDHdwwzkg6BGY532aP/xpaxYAjS0xtt9p5CY4r5Mk/hHuPQePhg0Py
	7Lj+YGA6FzqVR1zXmcxlll387eoojKTPdys+ZW1kJg8OWjw6JEWWh5fTGL4z0A==
MIME-Version: 1.0
Date: Thu, 05 Oct 2023 10:32:16 +0200
From: Michael Walle <michael@walle.cc>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 tudor.ambarus@linaro.org
Subject: Re: EM016LXQAB313CS1T
In-Reply-To: <6e5e4221-9abf-e572-304d-1150ebd15ab9@kernel-space.org>
References: <6e5e4221-9abf-e572-304d-1150ebd15ab9@kernel-space.org>
Message-ID: <fbff7dde1b2d6c85650fe16560ce38a7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_013228_859537_DD01F477 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

Hi,

> as far as you know,
> is there some development ongoing for the EM016LXQAB313CS1T
> mram ?

No, in fact, we'd like to get rid of these MRAM devices as they don't
have anything to do with NOR flashes - or move them over to the at25
driver.

Now I see that this part is rather new, supports faster modes and
even DTR, emulates erase op codes, etc. But they are lacking SFDP 
support..

You might get away with adding an entry to the database with it's ID.
But please *don't* use the SPI_NOR_NO_ERASE.

I'm curious, do you have a board with that chip? If so, why don't you
use a cheaper NOR flash? Genuine question.

> On mainline i only see
> 
>         /* Everspin MRAMs (non-JEDEC) */
>         { "mr25h128" }, /* 128 Kib, 40 MHz */
>         { "mr25h256" }, /* 256 Kib, 40 MHz */
>         { "mr25h10" },  /*   1 Mib, 40 MHz */
>         { "mr25h40" },

Btw, have a look at the new linux-next. that format has changed.


-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
