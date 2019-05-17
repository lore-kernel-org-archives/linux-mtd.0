Return-Path: <SRS0=qEsD=TR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4027C04AB4
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 08:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C4320848
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 08:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="isb2BnBI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WXTjCO/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C4320848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTXCzJJzElSG6jdXlryCf/msTa7SqSGbItcVi83iGZY=; b=isb2BnBIZSG+05
	I0JrhQlh5VtQPQzO7fKf999PtjJ+I1nmLf+4EdRfXxacJMMbK5kcqOXVV20nuQKMl043LB23QbpgN
	rwlzSar6AkfHEPA7MU7nPIXo5fJ9qAxBX5y8kBWqHXKbgXwkBoF6Jn4ZN+f06vznnW6jG1u6mPDH3
	a6avbjopVNnIZoe5njitkZlufLo/hf3KMBh9GBC3PTurRtYkyCTkyCdu2mm5DW0hSYGzKoSuhuVpi
	s2HhRlmJECfO+Dub3L2hXXGOKqnGzu/RLELNLVIeLESNKpAud33xVke6t3eJ3XbTypKw3h0iigWLY
	7d7tjhuU/SJ7TspBNLFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRXzJ-00044r-1Q; Fri, 17 May 2019 08:13:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRXzH-000445-Aw; Fri, 17 May 2019 08:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HfUNCgi2KJv5E7lE8RJSS6Eat2wh8JSxuM+Bk6ck2dE=; b=WXTjCO/t8XLvCQh9WMCHkg/eoG
 cNzGKJst36yVR+b/2sh5uvNrQ0yfr981h+Wu9lQxFqiI7SV8nqjdEiVDLLANr9UZ/Z7a5a8yqNyWB
 rj47cFdE2d+35Klf8y4u7+cPHGaNcUaLiEQnnr+TVq5yNZIrvY8E0s9HWwEjV5YtG2pgsSXFxB47b
 sNLzXUHf6zdlVI1G7XqGBeT2MCdvD39UOV+IksffAAMdvB1JbKzFZvJJWslPyHCWj3C+51Tqy6xxr
 6hMPjxwGzLhffeGxKorze1/+9NNNA7Gr7pqOSrzh1gKwuNCi+RZkqpp0NXjXaNsE0hslhIdSNg2fS
 qMCKcTXg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRXzD-00024m-VR; Fri, 17 May 2019 08:13:05 +0000
Received: from xps13 (246.41.136.77.rev.sfr.net [77.136.41.246])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3BFC924000F;
 Fri, 17 May 2019 08:12:28 +0000 (UTC)
Date: Fri, 17 May 2019 10:12:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: xiaolei li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH v3 0/4] MTK NAND driver improvements and fixes
Message-ID: <20190517101226.17b23550@xps13>
In-Reply-To: <1558056767.26455.98.camel@mhfsdcap03>
References: <20190507102541.34341-1-xiaolei.li@mediatek.com>
 <1558056767.26455.98.camel@mhfsdcap03>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_091304_068103_86EC798C 
X-CRM114-Status: UNSURE (   5.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgeGlhb2xlaSwKCnhpYW9sZWkgbGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBGcmksIDE3IE1heSAyMDE5IDA5OjMyOjQ3CiswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gU29y
cnkgdG8gYm90aGVyIHlvdSwgYnV0IG1heSBJIGFzayBpZiBpdCBpcyBmaW5lIHRvIGFjY2VwdCB0
aGlzIHBhdGNoCj4gc2V0IG5vdywgcGF0Y2hlcyBhbGwgd2l0aCB5b3VyIHJldmlldy4KCldlIGFy
ZSBpbiB0aGUgbWlkZGxlIG9mIHRoZSBtZXJnZSB3aW5kb3csIHNvIHllcywgSSB3aWxsIHRha2Ug
eW91cgpwYXRjaGVzLCBidXQgbm90IG5vdy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
