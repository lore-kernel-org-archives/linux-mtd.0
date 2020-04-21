Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29AAC54FCC
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 19:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781E4206D5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 19:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P7NVFzRa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="dQNSrRum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 781E4206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qLDEBvmqs/MrtIfrpLtPRBzbFhbh/BXJXXrh4bvwajI=; b=P7NVFzRaVoRCjD
	RbOLwmorR8jPl4n+df111z8yC+SaSBuiub7aqadFOfPySIOfxs8JhmI3R+BC7rmaGW/XYE4oSHFZC
	Rjp14U6hUtyuKlLVXkyyygOmU8Vz9kaeB9xQOzM0unI6GKwvaclJari65XxPgwibtRw5/3DhwODM+
	KKFLDXKZt369Via5OANO596T9x68IARPF7YG1H5gXv+YNLeyswES+FXdjX0gDtpiPFDoU2U2fA6HR
	NHwjuaNBQu2+XfgzY/5J0BMC/BzsDeqzclHe6GMtgP6+YN+BBR8Lgyd3G7X4damQH9q5jaQxINKnK
	RwwAYrkjwil08PY9HWUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQyiE-0003yK-TI; Tue, 21 Apr 2020 19:37:42 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQyi9-0003x3-Ds
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 19:37:39 +0000
Received: by mail-lf1-x143.google.com with SMTP id 131so12054068lfh.11
 for <linux-mtd@lists.infradead.org>; Tue, 21 Apr 2020 12:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=WMsa1Q/5tMpRpGdUQD2bCLfFbbM1rgvZXFv5APeCsgo=;
 b=dQNSrRum1yV+pK4Act6+PIahVCFP6O20cbnwuxljdPZOtsPg2PfU3ubWqgU8QtUnAQ
 qN+gWGA95CI4iq6Xd+l+isNTLBiDgXeprqCKfahGOzDfi2iBSq+bRvQIex2njQnG5UkA
 s+CCfEfkDwO1Rxl3BU9p3/A+EkMEOyTTh1i/RqYFxAE7HC6Ry9Y1Z7j71L5935VBhy3b
 no7lWNy2AoGM2MqhvfLcuGL75Tfiwhc0ojPs6is5hZHe+0YP5Kykb3p9g4+2XiO2DoBs
 rrgub8T0FAlSDQHE7TVQL3lFImxIQlnCLT+hYdPEuLabtpwX4NjIZ3xoywfxYiEOIXJ2
 88gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=WMsa1Q/5tMpRpGdUQD2bCLfFbbM1rgvZXFv5APeCsgo=;
 b=M/KcvZyISjudAsQXhOAqQdVqybPDDy7KPMunSKpBA0nZFwzhk6urZXwZNWXK+NXSeV
 amUE/TzQiWpi0Aqd9U8S42zjOcdPCzWdU06YiMhrrfT1dJBc4LRC18gMJGv7MW/CLth6
 Sw+R7g5zDptXBp7mA0aTSES6NM34d4b3YwfKZOnaa9QeQ/lVJYvrMfrP4xjMnal8XIcV
 mr97uHibSZIskXoxk5dopXyiSN6oiPLSizlOp+2JeSKYAiPVmCWfarw1Rda+nBJGxHt0
 unFVGKcQ+0EP1i5dTi6sK/Li5DDV77AOM2O/8szVDDkMHitRpn1Ygble68NTI4XOdmv+
 MPFQ==
X-Gm-Message-State: AGi0PuaFNo50sLOJOb8QaMuTfP6lSoLZOzuwT4ls7SruP0c98XOQh1u1
 6LTkD2ayYWwfVWhYkl95aI7pPA==
X-Google-Smtp-Source: APiQypJS5GCbi59QHpZvwrq3pChIRf8Tu1mwyk40GJJLGxznbixMt3gNnW1GwnDtB4UrYR5njaK2QA==
X-Received: by 2002:a19:e049:: with SMTP id g9mr15257770lfj.198.1587497853935; 
 Tue, 21 Apr 2020 12:37:33 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44ea:bbc9:93b5:ce4b:a4b8:c36c])
 by smtp.gmail.com with ESMTPSA id a13sm2572609ljm.25.2020.04.21.12.37.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 12:37:33 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/5] Fix typo ('struct spi-nor') in the kernel-doc comments
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Organization: Cogent Embedded
Message-ID: <255c50e1-f233-6cb1-f170-aa0c384ca8bd@cogentembedded.com>
Date: Tue, 21 Apr 2020 22:37:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_123737_668211_42143924 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

Here's a set of 2 patches against the 'mtd/fixes' branch of the MTD 'linux.git' repo.
I'm fixing a number of the kernel-doc comments to having 'struct spi-nor' instead of  'struct spi_nor'.  Instead of a single patch, I'm fixing the kernel-doc comment with
several patches, each fixing its own broken commit -- this simplifies porting to the
stable kernels (if that ever happens). :-)

[1/2] mtd: spi-nor: core: fix kernel-doc typo for spi_nor_manufacturer_init_params()
[2/2] mtd: spi-nor: core: fix kernel-doc typo for spi_nor_[{info|sfdp}_]init_params()

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
