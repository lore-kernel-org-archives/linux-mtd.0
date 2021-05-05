Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E622C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 06:51:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B787B61078
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 06:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B787B61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=A/frInKyRPQvwvlw+V/8MOTGy
	5ii33rwEY0SAGF7c3CO95Pk1AuYtA3ySPXvCVNJnbA+O+DAX3aIfLEAt4fe+jdL4BHvGCEIc6JdrL
	+THVZ1rn3BpNS5e+zRGL9OnNY/vagfQW/8w3E/xA2Tm2QRRj6WxaWORtpDQZynUEt9jpkaIt13Sr8
	lEIlYnR5VvI7ItpSR66hjRoPtYwOpL2zOOY4J8ZolV0xEQH6eB/gy8APbqH7f4aiWefKvdhB4D0DC
	xxkuonpVGi5ue0B2RcAKe5Mout8x77BAz0n2t42RKdrTzXlE70nAMtX5AbCkhX/lpJHtfZ5kTEpvj
	9NqGw+BRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leBN2-000NoW-92; Wed, 05 May 2021 06:50:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBMz-000NoE-Md
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 06:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :To:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=; b=TXXc+1TKDyLyjjcKtzbdxK9xH0
 joMJ7HsSUmAUPZaNMKWLu6K79raVoopE37LYdoLLGlspw3VgdS3TbBUHa7uHmHajb7YL/0rGl62K9
 0rtM96/BLG2qfCE34WQzRAqkxx4UWUH0zqFrv+/V12LDavA/hyU1XG23QszgXSWBEREoIRBFaq9/F
 wNIIeZrECbBA1wDUoyH2vjADQ7kY9K9iQhZjR1f2kiEJ5Y4ha2enjHK9xKLxJWfBmprI7avb7VaZk
 OdnnMJjOlMPnzQOqMtYalWq3FOaafDPQkRmxRzwwDGQq53kAiafSjk006q5HvPxxlQcaZIWaEUDdN
 X7JLTyEQ==;
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBMw-004Vgg-Mj
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 06:50:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 22E8F1817A0D6;
 Wed,  5 May 2021 08:50:40 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yBGMp1xxuJ9S; Wed,  5 May 2021 08:50:39 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id I7OJpWFFxibp; Wed,  5 May 2021 08:50:39 +0200 (CEST)
To: Larisa Ileana Grigore <larisa.grigore@nxp.com>,
 linux-mtd@lists.infradead.org
References: <20210423150704.7248-1-larisa.grigore@nxp.com>
 <20210423150704.7248-2-larisa.grigore@nxp.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Subject: Re: [PATCH 1/1] mtd-utils: flash_erase: Add flash erase chip
Message-ID: <80538f01-c7c8-8760-9a33-995b82c623cb@sigma-star.at>
Date: Wed, 5 May 2021 08:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423150704.7248-2-larisa.grigore@nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_235050_929117_1EC52244 
X-CRM114-Status: UNSURE (   5.40  )
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

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
