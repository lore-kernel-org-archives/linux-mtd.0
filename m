Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC70C1975A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 01:34:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD63206F8
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 01:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHP5zpoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD63206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Mime-Version:References:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=uWa7PqjtTX9Zb5xVc4cWazXMc26z1NCVuD2aTIO6ppE=; b=GHP5zpoJuYHPpo
	nEDDCMjO4mBeclGgvEmWf0SCeVpWi+hgyTu7ZLK5qvoTEYGc6WST7G2Z1NlTYymcbAkWhUaa60zXu
	C/3bWauagfugQQn2NpLOhS+pQ/2VYFD+UNKYYp+H3t78IolVAN903q+AxrcoLx/7i6P/JqFuI3FDb
	FJ3ycvGZc8RTNHtpOzAAT8IROoi5kX9LnRiWtcn8Dr+pl9C89szDWJbDK4+PbOkc1a2usjaRGfJ+A
	6jWBnNc1eoOBNYs9O0b7pgzF+AScvutI8t0NOVUz76H8+vAdjgXDcGqY61XXtw+EkMdFA6Jw2mDRM
	3k6Ih27NB/8OkfHqjY3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGByV-0000sl-Ej; Mon, 23 Mar 2020 01:33:55 +0000
Received: from regular1.263xmail.com ([211.150.70.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGByO-0000rq-Ul; Mon, 23 Mar 2020 01:33:54 +0000
Received: from localhost (unknown [192.168.167.209])
 by regular1.263xmail.com (Postfix) with ESMTP id 2787D415;
 Mon, 23 Mar 2020 09:33:35 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from hp1216 (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P11671T139978406659840S1584927214117798_; 
 Mon, 23 Mar 2020 09:33:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1b0edf511b5824d2ec8bf57941cdf57b>
X-RL-SENDER: zyf@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: zyf@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Mon, 23 Mar 2020 09:33:35 +0800
Organization: =?UTF-8?B?55Ge6Iqv5b6u55S15a2Q?=
From: =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: Re: [PATCH v4 0/3] Add Rockchip NFC drivers for RK3308 and others
References: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>, 
 <20200320111841.3386d415@xps13>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.15.80[cn]
Mime-Version: 1.0
Message-ID: <2020032309312035921797@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_183349_219010_156AA3A1 
X-CRM114-Status: UNSURE (   5.12  )
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

SGkgTWlxdWVsLAoKRG8geW91IG1lYW4geW91IGhhdmUgcmVjZWl2ZWQgVjQgc2VyaWVzIHRocmVl
IHRpbWVz77yfIAoKSSBvbmx5IHNlbmQgdjQgZm9yIHRoaXMgc2VyaWVzIG9uZSB0aW1lLgrCoApU
aGFua3MsCllpZmVuZwoKPkhpIFlpZmVuZywKPgo+WWlmZW5nIFpoYW8gPHlpZmVuZy56aGFvQHJv
Y2stY2hpcHMuY29tPiB3cm90ZSBvbiBGcmksIDIwIE1hciAyMDIwCj4xNzozMzozOSArMDgwMDoK
Pgo+PiBSb2NrY2hwJ3MgTkZDKE5hbmQgRmxhc2ggQ29udHJvbGxlcikgaGFzIHRocmVlIHZlcnNp
b25zOiBWNiwgVjggYW5kIFY5Lgo+PiBUaGlzIHNlcmllcyBwYXRjaCBjYW4gc3VwcG9ydCBhbGzC
oCB0aHJlZSB2ZXJzaW9ucy4KPj4KPj4KPkl0IGxvb2tzIGxpa2UgaXQncyB0aGUgdGhpcmQgdGlt
ZSB5b3Ugc2VuZCBhIHY0IGZvciB0aGlzIHNlcmllcywgaWYgeW91Cj5jaGFuZ2UgdGhpbmdzIGlu
IHRoZSBzZXJpZXMsIHBsZWFzZSBpbmNyZWFzZSB0aGUgdmVyc2lvbiBudW1iZXIuIElmCj5pdCBp
cyBhIG1pc3Rha2UsIHBsZWFzZSB0ZWxsIHVzIHNvLCBiZWNhdXNlIGl0IGlzIG5vdCBlYXN5IHRv
IGZvbGxvdyA6KQo+Cj4KPlRoYW5rcywKPk1pcXXDqGwKPgo+Cj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
