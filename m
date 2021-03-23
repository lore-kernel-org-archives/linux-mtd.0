Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3E9C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 18:45:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A358461993
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 18:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A358461993
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:MIME-Version:
	References:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPNstcz+DSxiJGQ0FfJBibove96+zJ/NCUkGOseb2kI=; b=kRn6WM9CuZ8k6D
	Php+FFTtsZ2HnDhGJoT9y7V2hScKwUkBMf88NB+36mQQB7J+z0QaqYZPBmMbCvQFO37IfmK51TmYG
	PgF6wB3k3v+YRFKOTbUbwKHYwk4UYGJAfRQSbpE18Yz8/C4lO6LEws1ohbmx59f5BWyVABCJiTrvb
	13HXSyT9yajzof5hQIC8O+eZqshcyf9/wLAchguxlaNSNHQ1FB7P+qlug8EMha8/+qtUvlJyhukVw
	xyL+8DZhaqlixlravwqxeXHuNjBysScwpa4lkjktEkBNjwIm8+GbNcBJMKTdHw7uipAMTmVNNHbfB
	sfFOjLL44BhRZKlPwlkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOm0V-00FXXF-0o; Tue, 23 Mar 2021 18:43:59 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOm0O-00FXWI-9X
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 18:43:55 +0000
Received: from [100.102.24.121] (ip-109-40-128-185.web.vodafone.de
 [109.40.128.185])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C799622234;
 Tue, 23 Mar 2021 19:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616525030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPoOEuwU9+tWbJsFhoeDobxLxpp6c1ZbdIs3ALLogA4=;
 b=GcG6hOQWuusgG4uW58n59WZyLGPYfGuJdwtAif44qwpEunGfaDGj0lObmSfATcCZbY7Blk
 EV5RpUc9nkIgny+A1phkBux6ZzB7KYYd22Xk4BKC11xHfqsscJarTTDzteuY47Y8N9HN9K
 VUXfom/Qs0t9hX90FfPoaye9N1bbXHY=
Date: Tue, 23 Mar 2021 19:43:47 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20210323173715.gyozhzbjyfv5osuc@ti.com>
References: <20210323143144.12730-1-michael@walle.cc>
 <20210323143144.12730-2-michael@walle.cc>
 <20210323173715.gyozhzbjyfv5osuc@ti.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
To: Pratyush Yadav <p.yadav@ti.com>
CC: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
From: Michael Walle <michael@walle.cc>
Message-ID: <C88FBBF6-4F5C-43A1-951E-332AEE9E3B3A@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_184352_423263_AE08B974 
X-CRM114-Status: UNSURE (   7.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjMuIE3DpHJ6IDIwMjEgMTg6Mzc6MTcgTUVaIHNjaHJpZWIgUHJhdHl1c2ggWWFkYXYgPHAu
eWFkYXZAdGkuY29tPjoKPk9uIDIzLzAzLzIxIDAzOjMxUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6
Cj4+IER1ZSB0byBwb3NzaWJsZSBtb2RlIHN3aXRjaGluZyB0byA4RC04RC04RCwgaXQgbWlnaHQg
bm90IGJlIHBvc3NpYmxlCj50bwo+PiByZWFkIHRoZSBTRkRQIGFmdGVyIHRoZSBpbml0aWFsIHBy
b2JlLiBUbyBiZSBhYmxlIHRvIGR1bXAgdGhlIFNGRFAKPnZpYQo+PiBzeXNmcyBhZnRlcndhcmRz
LCBtYWtlIGEgY29tcGxldGUgY29weSBvZiBpdC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4KPlJldmlld2VkLWJ5OiBQcmF0eXVzaCBZYWRh
diA8cC55YWRhdkB0aS5jb20+Cgp0aGFua3MgZm9yIHJldmlld2luZyEKCi1taWNoYWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
