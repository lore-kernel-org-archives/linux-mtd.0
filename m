Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29ABC4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 10:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D1220722
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 10:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejg6R/y/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D1220722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpEubN4+ptHQ0eio6lGw8r8PuMxRQL+dMkAPLY7TIcY=; b=ejg6R/y/eE3dg4
	IKj1UVI8LZvWarw9FSM+5Q3rbuwodvk5stifKPf134JGjr8Ssa/HXT3NC9Q76pPFS1y9pqtSz/RjN
	XvExMhpHg4Mgo6//2L0yPbM9Ub8pyIZotlqlgsXbn17T9MTAXbSPX/QPlcH2FTcWSjXLv+OfvYJQP
	HvBINSX44TJtmbyvXSwD4PDDpqFje0gZL3e6hFXKXJNhwbCamFzKbpg6UXnVn5QjGiFSHStryTqb3
	yo75YFoAGjw3QxobFRiN97cWGjJYoezapPBtL9dsM6hTkx4ie69pS02Bt5jcqJNTeBXIy+z8sItsK
	YQq5Vf6G+sfROwtQw0hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGKSZ-0002jh-AA; Mon, 23 Mar 2020 10:37:31 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGKSW-0002jC-Ce; Mon, 23 Mar 2020 10:37:29 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0A5B9FF810;
 Mon, 23 Mar 2020 10:37:16 +0000 (UTC)
Date: Mon, 23 Mar 2020 11:37:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v4 0/3] Add Rockchip NFC drivers for RK3308 and others
Message-ID: <20200323113714.375e656e@xps13>
In-Reply-To: <2020032309312035921797@rock-chips.com>
References: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>
 <20200320111841.3386d415@xps13>
 <2020032309312035921797@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_033728_561986_A70ECADE 
X-CRM114-Status: UNSURE (   6.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>, vigneshr <vigneshr@ti.com>,
 richard <richard@nod.at>, linux-rockchip <linux-rockchip@lists.infradead.org>,
 robh+dt <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?SGVpa29TdMO8Ym5lcg==?= <heiko@sntech.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWWlmZW5nLAoK6LW15Luq5bOwIDx5aWZlbmcuemhhb0Byb2NrLWNoaXBzLmNvbT4gd3JvdGUg
b24gTW9uLCAyMyBNYXIgMjAyMCAwOTozMzozNQorMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IERv
IHlvdSBtZWFuIHlvdSBoYXZlIHJlY2VpdmVkIFY0IHNlcmllcyB0aHJlZSB0aW1lc++8nyAKPiAK
PiBJIG9ubHkgc2VuZCB2NCBmb3IgdGhpcyBzZXJpZXMgb25lIHRpbWUuCgpZZXMsIEkgZGlkIHJl
Y2VpdmUgdGhlIHY0IHRocmVlIHRpbWVzLgpPbiAxOS8wMy8yMDIwIGF0IDA5OjQ1LCAxMDowMywg
MTA6MzMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
