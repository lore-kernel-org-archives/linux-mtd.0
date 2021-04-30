Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0B7C43460
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 07:03:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D006F61423
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 07:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D006F61423
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+G+n2nOjQnxCyJ9qzINiE5Dn+5cG376nPx+gvuVROWY=; b=RoZuyCIR7zfOJBVo6dmecuOkg
	MHtaE7y8UhFNkcxSIpN8LEs4tLzD2Ywr1Q94P8UJldge6bOB0zU8i0+/fm6IRsCdm2vd8VLz8P3OZ
	wIz9q/z6MP2ZO1/RVMxDz+YqSO4e0rAhauIzcEgAta0jhzlm6SYUR+8xbK9OidLiVl3t6SCCoRsYb
	rSs0KMM/QmS+Z3iIyVmACy+Qtz3avHb6/HJ6HTimel93ofm7NC5CrwnI8bMdtphKEZehe633T4pF2
	j7zisVp6WQDXaHcY6bnJXx8ejCMBaD+qxtSowqgGcbtiwzm/IDKSdSdaYq1a/BC3fzHylsIXzx+e/
	qoYyhmyjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcNAR-007OhL-IT; Fri, 30 Apr 2021 07:02:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNAO-007OhE-3o
 for linux-mtd@desiato.infradead.org; Fri, 30 Apr 2021 07:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2DCITNn+x2MH0Gn9mGX5H2TLa9RW8pHg/Gp9BeikUBw=; b=IB6h0j1dhDCDvLqrezNMMSh7OF
 xMUh3uvoOylWndloW01qih7LuqPFOOoV27EPYBhXEysMitG6Nq0wxGx4n816Mf2RZBr82+CucVczv
 pWsKOczgRyCO6tmSyk5pwny6VMNHKW4JICf3BG4oedhjTQKKsis93IPtctppw5vWCIyJpH+UGwjW7
 P3mfsLhech6Px7yU5ie0U6JoAPOV2oAvn01RnkkhZd8qqJuNny3y3ekUwnw1drP4sZt0dIRmh9bFx
 vl/EhvlyBTDP+N+GupiMCQLqAkxD0hp+ZBeq+o+lrWKR/g9adFBVGsRMIzapc1HtDsK5/Mldg9LhU
 g4BAEk3w==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNAL-001Bg7-1K
 for linux-mtd@lists.infradead.org; Fri, 30 Apr 2021 07:02:22 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7733C22236;
 Fri, 30 Apr 2021 09:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619766136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2DCITNn+x2MH0Gn9mGX5H2TLa9RW8pHg/Gp9BeikUBw=;
 b=uRxj57wgK6mm+pDqvsseG9YPzK20uDfasiHMNLV6jHkvUdMaOjXtnyzqVVVAFyLuQKzbCB
 MqQqrbP1DGrzG2kDqOEugR5gjMziTrSbBnhDSCAb5WijYUgM4QLixwuBlijJoFYJI4SW28
 gJ4IADSrg5HcqUZAyM+IxA3SYPDhUKI=
MIME-Version: 1.0
Date: Fri, 30 Apr 2021 09:02:14 +0200
From: Michael Walle <michael@walle.cc>
To: Petr Malat <oss@malat.biz>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: Create partname and partid debug files for child MTDs
In-Reply-To: <20210430065057.32018-1-oss@malat.biz>
References: <20210430065057.32018-1-oss@malat.biz>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dc9d00dd84d4fa1f4219cd769922312e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_000221_259497_0DBE71F4 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi Petr,

Am 2021-04-30 08:50, schrieb Petr Malat:
> Partname and partid are set by the upper driver (spi-nor) on the master
> MTD. If this MTD is partitioned and CONFIG_MTD_PARTITIONED_MASTER is
> disabled, the master MTD is not instantiated and partname and partid
> aren't available to the userspace.

You might have a look at:
https://lore.kernel.org/linux-mtd/20210429155713.28808-1-michael@walle.cc/

This is just for spi-nor though, but attaches the properties to the
flash device instead of the mtd device.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
