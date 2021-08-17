Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A906C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 09:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B7C604D7
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 09:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53B7C604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=matouschek.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:In-Reply-To:Subject:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OzAo9BLBpRcCDLbwhWR3SzG0Oc6qLdF6Rp7iwByH3rc=; b=n/F98ICPEcl0HQ
	c8kSpzp+JvE63orIXYn9mMTIPU4ZvMIGjxPcgbnnWe3eN5iQ2W5ObC+uNtJtdgcm5UIek+FImnhPd
	M2tDX8swGBhqCxScZtpavut7JWaaaVyDo3leW7hqSyKBK1Ugf2ayRhjYZdA5JCmiMWWYd46t6GWZ0
	5bZ76BA1NU9vW+QBSnyBzbrwFi7xVPNYayeRAtqRqxLETlY63QZW4oIg9kv8iaIDZgW+ITx5rHXK4
	cBxBxIpC3Vml8y0qgUv8ora7iTRksLvHh+CkW9IMX+eDLjdxbewRN1BqGwiyFbycK/ywhPa2uD3rw
	7fyonTTlYBCu1UeMarjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvon-001xB9-Bg; Tue, 17 Aug 2021 09:55:37 +0000
Received: from mail.fmat.eu ([2a03:4000:21:70a:b8c2:1eff:fea5:fc02])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvoh-001x9U-Bl
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 09:55:35 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id 4AFC2E00B8
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 11:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1629193731;
 bh=jKbj6rrUfcCMX0PAqxUiHPJJ9GESKiPKcxLg1sBRuCE=;
 h=Date:From:To:Subject:In-Reply-To:From;
 b=FXGO/W9RAEjxYcPvrjC3j6Rl0ZHQ2omYMwBnbI+WfnmrBrhWuKHyCWl07igqJJvaK
 L5NNVbDqcMX2OuNrbhI6RLILS6syyxsKln5yJHmaZBPJCyyKvqIffERBpYkHiFKXT3
 wBTC+3qbKLE01tiM8/gI0NIw8hD6tciiyO0ga/b/BSwfU2htDUtX3NT9tLN+UAnjIY
 K2dFTNZ8ou+VrWtZG5/8O0k1ZRG6wKRahbyc5fcRdsUPcVYtKGKunXgw1MGsTeKK6B
 Fa7NdZgLrdoIGlZegE8563mhMko39ngAIAHHmlNX77Wv6ejGzbVph5Y0Iti2OBLW7R
 RylBBoWRIIlhg==
MIME-Version: 1.0
Date: Tue, 17 Aug 2021 11:48:51 +0200
From: Felix Matouschek <felix@matouschek.org>
To: linux-mtd@lists.infradead.org
Subject: Re: Re: [PATCH] mtd: spinand: Add support for XTX XT26G0xA
In-Reply-To: <20210702195235.555620-1-felix@matouschek.org>
Message-ID: <59d56e234630087b12b507b259681c1f@matouschek.org>
X-Sender: felix@matouschek.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_025532_067460_D331A4C4 
X-CRM114-Status: UNSURE (   5.36  )
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

can I do something to get this reviewed or accepted?

Thanks,
Felix

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
