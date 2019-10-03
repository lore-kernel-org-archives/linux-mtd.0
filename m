Return-Path: <SRS0=mpCX=X4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82847C10F14
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 18:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A02720865
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 18:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aqDta/2S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="EIf2+2gl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A02720865
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=swynHWo+JxRVsNbj3hSrcXFA0y7ojdivACKHaKscFiA=; b=aqDta/2SBDzL7wnxEFFgUJQ+Wp
	DsQ7Z4+K3rbb0W45oNzi0ojIqmIf5sa13hoPJgX+bH6TXxctSe5XcYaCU0ooOxl0Bsb+0vipFuGfy
	AWoJWQQL5+Pzo8LpkJeBhsblCEbAiCQrf6+AkFrDbkfY+rB/4k2/xMYkVUkNKGPtOll+DOWl9bgwH
	cfnVCwDa18U9Eq+XQMCJisyQH4zTMg7wT8vId5X9QM3w/0hO0iu3B4lLXeagKcrZ4LQNv8YPmV/xl
	S5oLz4g1meUTMrTcPb9YbLO1HIpbEDXmHXmkg6vnD+RxxDe6zESnjm6JQIleAtqNAp+y+51MH+wat
	fp9RIPVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG5tl-00035p-5U; Thu, 03 Oct 2019 18:32:21 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG5ti-00035R-7H
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2019 18:32:19 +0000
Received: by mail-lf1-x143.google.com with SMTP id r2so2592253lfn.8
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2019 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fj0DCcYfELBsqONSDs288m2oy9cFQweEebiXnDy1Us8=;
 b=EIf2+2gl5wvqgQq9s+zFXwk8y9lcLZnws2n0z3y0+CPzi+uceEVnx4F3j4BblUofd9
 mlQnBDW2goyKOIvbiIb5PdhTXZUQ7/jZbUMbIiR5CPMbeN6rXwTrx2BMN4IBuFYEGNNv
 hiRL2PnikdXFWuEynHMgjArqhCWZ1wHpVuXx1zFm5WIEDE5oE7GnPDzW5Akb1CV8ijVT
 KwefZ3TBnvtokCQ4iVhAJhp01sM6cHNjYuTKIsgzATmvKpdBr5Hx9w9WIdSbIfnLgJB+
 eYDyYEmgK8SA8mI6j8td9a4RAYdCzs/0hmJv5p60ZZyqczm8m00Ab4Bka+zEVmzckqoQ
 ql7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fj0DCcYfELBsqONSDs288m2oy9cFQweEebiXnDy1Us8=;
 b=LoZiMdixV8M2vZ/m1LLHr5vAfm6Avklbg2ClIkZeRUqOPBtcvGuXFBuVwgjIylI1Ah
 PEJJ8qQYGpILThHZjPPWcrZKfJfquSO+ELLu8qnHmAgSvkGy/XcQUotjpBaUxAvxQ/2p
 D/cYFMeQS/fpkJ/Gd0FetfBISRtrFrfV9Hh13bpkveVXmQevD0HHMabdV2u33Zjh/40H
 Kkkxbla4N2KYjxAw2jHmkp8vCj2mi7pDNuPQyJDSVdm5oBfhApZfT+gXOWrIAcB/8WRa
 +eZfw0gSxtCnvVJPiwHQ17U2A9iZcR5KBy0lx2XnnkL2bE/+kMrSRDyOwtoI9UhCHT1X
 3pWQ==
X-Gm-Message-State: APjAAAUv7iPO/pE6dYwiTPfYBkJDWlTCtDzTuQn8XrOMmOvBhHTf36mn
 LJie/1WjDMRimyaQ5anKk0dMUDwPWNY=
X-Google-Smtp-Source: APXvYqxKcd1GPt8GEpDfFhJuGpKA6z7kKCshEtpfOsL8NwSN4TiYY+vLHpv4tDOgROL5nkwVUDUKsQ==
X-Received: by 2002:a19:f711:: with SMTP id z17mr6476768lfe.58.1570127535814; 
 Thu, 03 Oct 2019 11:32:15 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4289:fe73:b1e7:ad72:df1a:c82e])
 by smtp.gmail.com with ESMTPSA id 134sm608853lfk.70.2019.10.03.11.32.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 11:32:14 -0700 (PDT)
Subject: [PATCH 1/2] mtd: cfi_cmdset_0002: only check errors when ready in
 cfi_check_err_status()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <146a49cc-fb1a-36cf-75b6-cf472d264c7b@cogentembedded.com>
Date: Thu, 3 Oct 2019 21:32:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_113218_263469_23F31DB7 
X-CRM114-Status: GOOD (  16.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cypress S26K{L|S}P{128|256|512}S datasheet says that the error bits in
the status register are only valid when the "device ready" bit 7 is set.
Add the check for the device ready bit in cfi_check_err_status() as that
function isn't always called with this bit set.

Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux.orig/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -136,6 +136,10 @@ static void cfi_check_err_status(struct
 			 cfi->device_type, NULL);
 	status = map_read(map, adr);
 
+	/* The error bits are invalid while the chip's busy */
+	if (!map_word_bitsset(map, status, CMD(CFI_SR_DRB)))
+		return;
+
 	if (map_word_bitsset(map, status, CMD(0x3a))) {
 		unsigned long chipstatus = MERGESTATUS(status);
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
