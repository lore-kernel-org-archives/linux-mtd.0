Return-Path: <SRS0=ZonW=LG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CD9C48BCF
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Jun 2021 15:24:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7257C6120E
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Jun 2021 15:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7257C6120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuYL3YocVErcd1IdPqRWQUn6nozYyQdW6dc0NnhoBPU=; b=INf+5WuTZd79kplMsVuxJO5v/1
	OBhX9kUUwvwqVwLwreRp+juRlsSj5XVavQsDN0OAXS5UOETGLNtHCixANPDYmOzq4A4DMzE0o2fYI
	UXITvUsvvft63DW1REp60FL7RRfsGTrnkp/E79yoyeNCYD05Z6ek6TeJ7vzuz81MPV9eG+186Rh8K
	e12nLK2vRKrnMKb0z5exKqZtviCPDPeZvzPTWErC2jnGntbYIWkLl8JD1hAGl4E19B5xsq6u6l5kc
	T555kHZUyACAigItJm9SniZUWfIN5glTn6hJUuTURoOiUGFD3uKgqYqHiXsslS9IF3TZo29/Pvtn4
	B7LfY67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls5Ty-008i10-Od; Sat, 12 Jun 2021 15:23:34 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls5Tr-008hzx-Kp
 for linux-mtd@lists.infradead.org; Sat, 12 Jun 2021 15:23:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id AD4971817A0D5;
 Sat, 12 Jun 2021 17:23:16 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id d-nmmjP2vNAt; Sat, 12 Jun 2021 17:23:16 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BPCECeFlMa4W; Sat, 12 Jun 2021 17:23:16 +0200 (CEST)
Subject: Re: [PATCH] mtd-utils: Add flash_otp_erase
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20210510201319.25975-1-michael@walle.cc>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Message-ID: <5e955e73-6404-0a09-79ee-8867fdb3b513@sigma-star.at>
Date: Sat, 12 Jun 2021 17:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510201319.25975-1-michael@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_082327_853874_1281B29F 
X-CRM114-Status: UNSURE (   7.31  )
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

Sorry for the long delay, got a bit swamped on my end and
forgot about the patch. But I see there was no opposition
to it either in the mean time.

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
