Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199ACCA9ECB
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 20:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBBC420656
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 20:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SXcYCl7K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="HuZhoap1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBBC420656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OhKk+eX+2epVJBm8VpsSbKXHJMIK6bQTs5zKIeIO7P8=; b=SXcYCl7K9r4Clv
	4C7BcLIrdboiv1mQZ6mvJiXM9roKSXPO0UtJJRZr0dcFlLWn6gT9bbB1hkV8+NMLAX0HiBpoOcnib
	UFY+iGi7I2IQxebSNVx9fSDxfR3t2YWWW3sf2slE5/SP7reRK67jXuBT54MgEN1YWrXmfz/+MoeOn
	mHex0/oEECQAugqxy45cAJCmB4wb1CYgnx6kuBtWhlGFuiJlz5rDK6/3g6jkxj8eWscQZSk3E0ne0
	ct813E0Swkf1yOc2p5YcsKqpV/fxtawHC6ILjjoI1fAd9CWa8qm38USKEjVdE21X/InM2YMTw3rQf
	lotZ1kq16iptWb3awE6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQHAu-0000Tb-6J; Thu, 31 Oct 2019 20:36:08 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQHAo-0000Sj-Sb
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 20:36:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id y127so5720034lfc.0
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2019 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=T8iWgk6u8bXJ3aM5ZnY2C7+rXPFoHovL9xQYUKl6oJc=;
 b=HuZhoap11bCazDThdiSRAIgmkfaWnb792ot1Cxwx/I3P0W3yqOozfeWTptq4FSguP4
 tVnho9S+p4ZesLcippAbHR/+HKs48EKY/eMtlnJitGsJ+zeWodyxChe+R0N03rItXUFF
 UQ5/yzowWkU+wkQqfsc8KiU4Q0vTOHtpEnYY/GqYRkMkB52bhm73oRiRKY7oXZ4UFHuX
 MgqUEhVH/cKxgairpcv/X/ZpOu/sP1G6srh2cQ3UyvoD523WbW3tUYMoFvRxLX/OCRqa
 E92tW7z1w2uVed5rchawvZPSatRQq2JwBCOmFZrIfoeoJEFol0WaF7HPvEE2mV1USfka
 dFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=T8iWgk6u8bXJ3aM5ZnY2C7+rXPFoHovL9xQYUKl6oJc=;
 b=V+Clb6BTkCrDhgWC5pdKWOrYNtlJxjaVpuB4DOSwtxPZ0IpEEjkHmyFYPsLgb/G815
 +0Glsw2QzBlY3051FzI7UKHLc2MT8rNEJXt0kIFZ5Tu3Go0kg0OSHwapbVGISNFWNc6w
 zVjIVw+3q6sqHtKberhSyg2UMhJlYDcl89Az5ZPL6HdIM5c0H7T63CDsSntJuLfpjvmw
 H+6y4MlYKhmkXidWsWX3eLXzk703O2ddqXExROrCmOh7FcutagJ4nKRO2LLQA452z9cL
 FtxTRYufvKTuFYoViwGs/KjjT98tc0HKMRGYmV+MCx0loKaBvd6CxHGy6ff5Q2/DmIdB
 Hx0A==
X-Gm-Message-State: APjAAAXheIksl4kJoR+4V/cw1WmNQ6mQq1S3jj2AdrBFSlSGlGqI7u9q
 9/ic+Hu67wjZA3XkwEyJtNMlqiAAUts=
X-Google-Smtp-Source: APXvYqxEbs+yK0QRAx4Zf9OcjdbzL5q0i+YkT7pXdiIBUI4v9Cnj834zm8BIh9qMs4tlUZeVR7hvcg==
X-Received: by 2002:a19:2356:: with SMTP id j83mr4824984lfj.103.1572554160573; 
 Thu, 31 Oct 2019 13:36:00 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4822:288d:75c2:539e:7f95:d420])
 by smtp.gmail.com with ESMTPSA id f1sm1572040ljk.77.2019.10.31.13.35.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 13:35:59 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Fix the HyperFlash support in the AMD/Fujitsu/Spansion
 CFI driver
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <6e2348cc-7035-29b9-5172-ada329bea397@cogentembedded.com>
Date: Thu, 31 Oct 2019 23:35:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_133603_335217_08103373 
X-CRM114-Status: GOOD (  11.25  )
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

Hello!

Here's a set of 2 patches against the 'mtd/fixes' branch of the MTD repo.
Linux 5.4-rc1 received initial support for the HyperFlash. However, the patch
adding the status register polling to the AMD/Fujitsu/Spansion CFI driver has
couple issues which I'm trying to solve here...

[1/2] mtd: cfi_cmdset_0002: only check errors when ready in cfi_check_err_status()
[2/2] mtd: cfi_cmdset_0002: fix delayed error detection on HyperFlash

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
