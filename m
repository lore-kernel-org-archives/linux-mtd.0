Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEFCC33CAE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 07:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BE92075B
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 07:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pi5dYci2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BE92075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoPTdfgFbHpOR6sgeFDjAIFOPSsdQn1/rhYyy1QFlNU=; b=pi5dYci2zXJOdC
	uBpSg+ci0sc+xGAmKeKH4HEDAD6zzkxCL2f9VnwD9LSRuoYclAKbBkMhGfelDodu7anXrXDSa/EFk
	x4ngHYHCjHHHxVvkioD4/IOq4f7AKI4TmL2/OlRgV1ITFyU4sTzJtWc04/G9rwgc0vXk1BNqhqsBg
	cfpGOcsQqeYyAZlb2KLTk3cN0Y+ee/EeGcCrZv21Xml0wBNmU1uqn/5ucmdU++4Xb8SAaBpiPl9Wo
	W8rQSpWG2l6ScTApv4Td6o9pBfI2NqtwONOvwiwrGgjghdWNL0ThSKuzbNePqyLG1oy5u4MkBdHB9
	a9bxosrtyEU9BoN6OdaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iquYA-0007NF-1m; Mon, 13 Jan 2020 07:54:14 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iquY7-0007MO-DP
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 07:54:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3D7D56088971;
 Mon, 13 Jan 2020 08:54:09 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TUaezdVo-5cL; Mon, 13 Jan 2020 08:54:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BF4B8608310A;
 Mon, 13 Jan 2020 08:54:08 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0HgxGEBIOJfD; Mon, 13 Jan 2020 08:54:08 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6D7DB6088971;
 Mon, 13 Jan 2020 08:54:08 +0100 (CET)
Date: Mon, 13 Jan 2020 08:54:08 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: liu song11 <liu.song11@zte.com.cn>
Message-ID: <1681702500.19692.1578902048331.JavaMail.zimbra@nod.at>
In-Reply-To: <202001131229371470661@zte.com.cn>
References: <20191216154441.6648-1-fishland@aliyun.com,
 CAFLxGvyU=zh23vkYiAGRzyd4LGJodLwRRa1S03THAoSaSL=dGA@mail.gmail.com>
 <202001131229371470661@zte.com.cn>
Subject: Re: [PATCH] ubifs: Fix potentially out-of-bounds memory access in
 ubifs_dump_node
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix potentially out-of-bounds memory access in
 ubifs_dump_node
Thread-Index: U75eDtes0zTxvtUwzHGII2MO4QYnug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_235411_598308_E7C177F3 
X-CRM114-Status: UNSURE (   7.67  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 jiang xuexin <jiang.xuexin@zte.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFByb2JsZW1zIHdpdGggc3RvcmFnZSBk
ZXZpY2VzIGFyZSBpbmRlZWQgYSBwcm9ibGVtLCBCdXQgYmVjYXVzZSB0aGUgd3JvbmcKPiAiY2gt
PmxlbiIgY2F1c2VzIHRoZSBrZXJuZWwgdG8gY3Jhc2gsIHRoaXMgY29zdCBpcyB0b28gaGVhdnku
IFdlIHNob3VsZAo+IGF2b2lkIGtlcm5lbCBjcmFzaGVzIGR1ZSB0byBzdWNoIGVycm9ycy4KPiAK
PiAKPiBBbHRob3VnaCBhIGNyYyBlcnJvciB3YXMgZm91bmQgaW4gInViaWZzX2NoZWNrX25vZGUi
LCBpdCBpcyBkaWZmaWN1bHQgdG8KPiBzaW1wbHkganVkZ2Ugd2hldGhlciAiY2gtPmxlbiIgaXMg
cmVhc29uYWJsZSwgc28gSSB0aGluayB3ZSBvbmx5IG5lZWQgdG8ga25vdwo+IHRoZSBfbG9jYXRp
b25fIG9mIHRoZSBlcnJvciBkYXRhIG5vZGUsIGFuZCBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIHBy
ZXNlbnQgaXRzCj4gY29udGVudHMgdG9nZXRoZXIuCgpXaGF0IHdlIGNhbiB0cnkgaXMgb3B0aW9u
YWxseSBwYXNzaW5nIHRoZSBidWZmZXIgbGVuZ3RoIHRvIHViaWZzX2R1bXBfbm9kZSgpLgpJZiBj
cmMgaXMgYmFkIGJ1dCBjaC0+bGVuIGlzIHdpdGhpbiBib3VuZHMgd2UgY2FuIHN0aWxsIHNhZmVs
eSBkdW1wLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
