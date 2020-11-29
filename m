Return-Path: <SRS0=FZfr=FD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5576EC64E7B
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Nov 2020 23:05:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D0C21973
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Nov 2020 23:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AShGIuvf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D0C21973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=AShGIuvfsxs+BoplUBRXWGOoi
	7MFxZGMLm00d7RzCF82mwjG6LITTEbGE44MjLn0+XpzS5HiBwyToLw09b8C9sDW/pj4/MfDjfKnpq
	Cp22ZzamZl3ECw3E/hbr2d71781lJL9slDEqy5Uh0V9JP+A5KDl7we5ZKbmm/hnS/iWpmA4hfDtx1
	IGfbxSF3h4neESCe2MFOfwKh2kNXA7tCmJY6OnugK00j3DE/E+2yOLyqp1mVfEmPKp0bIdxNSnIG+
	9MCwe2Wp7Mjpj/jiESra93HugCgkla4uOzqGf61Yok3VdTOyOcA3K04Son8zJiic3x3+Gjbc1fS1y
	/73hL7ivg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjVjp-0001ov-8t; Sun, 29 Nov 2020 23:04:13 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjVjk-0001oS-W3
 for linux-mtd@lists.infradead.org; Sun, 29 Nov 2020 23:04:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 31D6118172F05;
 Mon, 30 Nov 2020 00:04:08 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id upXSr19y1y1H; Mon, 30 Nov 2020 00:04:07 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IYGVf6EZTboZ; Mon, 30 Nov 2020 00:04:07 +0100 (CET)
Subject: Re: [PATCH v2] libmtd: avoid divide by zero
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20201127000708.2894-1-chris.packham@alliedtelesis.co.nz>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Message-ID: <0daf400f-6104-b70a-2688-d8ce7b8421b1@sigma-star.at>
Date: Mon, 30 Nov 2020 00:04:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127000708.2894-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_180409_300026_F67FC397 
X-CRM114-Status: UNSURE (   7.77  )
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
Cc: linux-mtd@lists.infradead.org
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
