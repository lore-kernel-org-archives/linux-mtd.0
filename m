Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281F0CA9ECB
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 20:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A9620656
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 20:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="idjqI8NZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="t5BfzX/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6A9620656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xaaYsI6gJ4sMYPqgzIj7Ll6OcZDWYuO7r+GJRhpZnCo=; b=idjqI8NZijgCSoNQRi4CkXk+c8
	UIo7Fu+WOo9yBYtiFeZJdEqgxDhmJBADx7bYNREBjJaferT2Ph8xcn9xHK9CD4evZoli4Q/FQqU1e
	UlbvFytnHosYyNFhQwopIEjl8WMMS8VZkAK4sKLuj8h2c0wcX0PThEatQgv7Xa1vNlmOUj+why4eQ
	LFOmQJVWqnKZGLGU0hAh93Fcti8ZdqcB8T3aYRtQoB58r0f8MX+NjwK97fV2/Q1BuQ7hOiYq2ZLKU
	iyl8VS5PybRhBs17T1xmWebnAAu3G0RgYo4KhIj/NA7pZ2aX3oXP8+S1Juv6Mm58wuvV9l6vR27MA
	JygidJxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQHCI-0000mC-Od; Thu, 31 Oct 2019 20:37:34 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQHCG-0000lk-5U
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 20:37:33 +0000
Received: by mail-lj1-x241.google.com with SMTP id x9so3243956lji.3
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2019 13:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rj5TWwT5R02KbBn9LQgKi7SKTH+J8M6OqlmepHiWJUI=;
 b=t5BfzX/+EQgS/vhp9ZuVbTBh7ymInaLGNlQYesxucJhlKRUoQPyyTjBszzVbSEwmtc
 lUhTkQdHXRzCwye4hXD3XMHPUdxzQjfpkH//BTN16+pmy3F3rNbgwLVarrGhsOq5Oqkr
 dHkRNVHT1adOa0J/utkBq1b+2AwrSWNUWD797O1xFoaNhM9rua4p5NGL5w8Nmt28kcXe
 eUwwHRIFZk6bMtiHWRZEgPjytSAHgxLkB7otJQb1glZgQJlY80AKSWGdetX7v8ZsQLCm
 aCVkBTZHGKZ3kXS3JP7ZlYxERKSmYja+N6jphoRbLxmVnwNnhi1INNeVxrQvE3Qy1fLa
 NH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rj5TWwT5R02KbBn9LQgKi7SKTH+J8M6OqlmepHiWJUI=;
 b=I1/rZDdxgWaajXB+u4g6CYJzz+Diqc2mcbOVeB1mpJSBMABXEaLTJXdIb8W7ZZwQvy
 4C1RqMOLK8EQoAFuuF/3aaJPY+NOkQoN5+COArmBLk51NGySFs9DMQgzzU0/d6i4/Oc6
 lI7xi+do+YoLH04Nf8X4/YexaGM4JDHz1rFiTxmmu61yc3iH0vL033gO282A1rAub+hG
 Tw73q4am97B/rh+JEMdN0P1gMMoyKt1+nSEL+BiCvakKtIAgGm7PeX4ZWz36aVbxISoz
 HA8dZdjZsYCEJVlbkVMyb2HcQyy9V+7Rb1Lpy2LpxfNV/TH+QsD0+OwKzVz+2mNO7d0f
 R8tA==
X-Gm-Message-State: APjAAAUqErSTsK18eFz/xkX6wjc4B8ub671bmHRtd71h4e6Y5oFoDkqB
 DkYzIABALTZszv1Qd69a8wbX2BCUFG4=
X-Google-Smtp-Source: APXvYqyzgWI7eK3JiPOwTWDCocKB1CBzNQj7FUEoWp+qVkxNMooAcUzGsWHJ5eDrNNsr4NqxzqI92w==
X-Received: by 2002:a2e:8118:: with SMTP id d24mr5239366ljg.111.1572554249247; 
 Thu, 31 Oct 2019 13:37:29 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4822:288d:75c2:539e:7f95:d420])
 by smtp.gmail.com with ESMTPSA id o18sm2043731ljj.27.2019.10.31.13.37.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 13:37:28 -0700 (PDT)
Subject: [PATCH v2 1/2] mtd: cfi_cmdset_0002: only check errors when ready in
 cfi_check_err_status()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <6e2348cc-7035-29b9-5172-ada329bea397@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f395d94b-40ca-6037-3e6c-f6fbf46882e5@cogentembedded.com>
Date: Thu, 31 Oct 2019 23:37:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <6e2348cc-7035-29b9-5172-ada329bea397@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_133732_208050_3696285A 
X-CRM114-Status: GOOD (  16.26  )
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
Changes in version 2:
- refreshed the patch.

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
