Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BF3C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:15:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05966218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZubxH9z5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05966218D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KY3QPsMpSFc2ay84bXDtftyhaPk5+23x2MISn8+z9I=; b=ZubxH9z5tMerIn
	1PsxF8A/+DIavZO8CNtKVymzMAoGu8Y41exLr75BCsEL3xUhX2tHP3pmANlBsHDXhtGfIWFEgejc6
	68Tgd+e+C5FBxo5+cNXsDS6JSCg2P5NBvbbW3LER0BnC/vNC/q5YJvTNJhu+Y66sUMz+qkjLAsWs/
	ZTLyaO4CzkiXAIgw6dAjyKJZBbLGXnoacj07YItvsxL5C3lrYnU1vxiIZLplGiLbyUTEcnxaNqmxr
	GptFJxoe6te//kVTUdjzjfmfegVs0tZXzvTH7XvcpSbiJfbSzDSXd9IQPq0CKb8nGMbZwVHucvZTf
	lQxb4xl8Uaod40Bf7rAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1Jy-0005eH-8D; Fri, 25 Jan 2019 13:14:58 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1Jv-0005dg-KI
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:14:57 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 2056C207AD; Fri, 25 Jan 2019 14:14:54 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id C9D3420397;
 Fri, 25 Jan 2019 14:14:43 +0100 (CET)
Date: Fri, 25 Jan 2019 14:14:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: denali: just trivial cleanups
Message-ID: <20190125141443.1e3ec2f4@xps13>
In-Reply-To: <1548303547-21156-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548303547-21156-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_051455_856829_0C4AAC00 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUaHUsIDI0IEphbgoyMDE5IDEzOjE5OjA1ICswOTAwOgoKPiBNYXNhaGly
byBZYW1hZGEgKDIpOgo+ICAgbXRkOiByYXduYW5kOiBkZW5hbGk6IHJlbW92ZSB1bm5lZWRlZCBk
ZW5hbGlfcmVzZXRfaXJxKCkgY2FsbAo+ICAgbXRkOiByYXduYW5kOiBkZW5hbGk6IHJlbW92ZSB1
bnVzZWQgZnVuY3Rpb24gYXJndW1lbnQgJ3JhdycKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
ZGVuYWxpLmMgfCAyMSArKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCgpTZXJpZXMgYXBwbGllZCB0byBuYW5k
L25leHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
