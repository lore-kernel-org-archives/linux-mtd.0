Return-Path: <SRS0=lAOP=UO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D31EC31E47
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 07:48:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448FB206B7
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 07:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3ASGVKY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448FB206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emcraft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxoM7XmYDd5o0lPy/TAuK7KtZy183ogiEqiBicKv2x4=; b=b3ASGVKYkLp2+y
	9Lt9GQCCawCu5naX00Q6PFG7jrSTVr5mEPVXpBrUlmEOePTMOKYmpH423M+jmSWD5GlFqfOp3wBW6
	C6ukrn+csc06uxoQsFNiyWSDQ4fvUYQGR3TKEYkvc1yCTaRkC29iLuIxLcNZfsY11GFWq+vNf4gUA
	qYrpGnHKg10cu9lUxhz5uSJi+FeR60EDcYKG4pu55S+E5F6o7vDW/toNgna2/ZD5mLPUDjuL6ErWs
	0yIBFgslq9lwULlQoGobJA6D4+rwP+eZr8Sbhf8w1EvCsnPEVkpYAlQ0elr485LRUCahXrnIfoXND
	T+uWA6CNEZDPd+98DrmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc3QK-0002L5-2Z; Sat, 15 Jun 2019 07:48:28 +0000
Received: from ocean.emcraft.com ([176.110.122.116])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc3QF-0002KT-Cv
 for linux-mtd@lists.infradead.org; Sat, 15 Jun 2019 07:48:26 +0000
Received: from [10.8.0.10] (helo=mehome.localdomain)
 by ocean.emcraft.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.76)
 (envelope-from <sposelenov@emcraft.com>)
 id 1hc3Q6-0006pf-Qm; Sat, 15 Jun 2019 10:48:18 +0300
Message-ID: <0d0d88653f1d339827543d83888b95d14ee395cf.camel@emcraft.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
From: Sergei Poselenov <sposelenov@emcraft.com>
To: Richard Weinberger <richard@nod.at>
Date: Sat, 15 Jun 2019 10:26:42 +0300
In-Reply-To: <1159355903.85757.1560074459598.JavaMail.zimbra@nod.at>
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
 <1299833819.84614.1559923336123.JavaMail.zimbra@nod.at>
 <08a796c9a296245c372511c683adb80913d14553.camel@emcraft.com>
 <766367078.85018.1559983598342.JavaMail.zimbra@nod.at>
 <a43eb232a51b7d0c95623de9403158c290163237.camel@emcraft.com>
 <1957000286.85744.1560070414116.JavaMail.zimbra@nod.at>
 <ac7d203471da8db3a148c207b586cae919304307.camel@emcraft.com>
 <1159355903.85757.1560074459598.JavaMail.zimbra@nod.at>
Organization: Emcraft Systems
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_004824_279966_5AC16A99 
X-CRM114-Status: UNSURE (   6.49  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gUmljaGFyZCwgKFN0ZXZlKSwKCk9uIFN1biwgMjAxOS0wNi0wOSBhdCAxMjowMCArMDIw
MCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwg
LS0tLS0KPiA+ID4gV2VsbCwgemVybyBieXRlcyBhcmUgbm90IGdhcmJhZ2UuIDspCj4gPiAKPiA+
IEkndmUgc2VlbiBzb21lIGRhdGEgaW4gdGhlIGxhc3QgNTEyIGJ5dGVzIGFzIHdlbGwuCj4gCj4g
VGhhdCB3b3VsZCBiZSBhIGJ1ZywgdW5sZXNzIHlvdSBhcmUgb3ZlcndyaXRpbmcgYW4gZXhpc3Rp
bmcKPiBmaWxlLgo+IApJIGRpZCBtb3JlIHRlc3RzIGFuZCB3YXMgdW5hYmxlIHRvIHNlZSBhIG5v
bi16ZXJvIGRhdGEgYXQgdGhlIGVuZCBvZgp0aGUgbGFzdCBmaWxlIGFmdGVyIHJlY292ZXJ5LiBB
cHBhcmVudGx5LCBJIHdhcyBtaXN0YWtlbi4KClRoZSBVQkkgcmVjb3Zlcnkgd29ya2VkIGZpbmUg
ZXZlcnkgdGltZSBhZnRlciB0aGUgcG93ZXIgY3V0LW9mZi4KClRoYW5rIHlvdSBhbmQgU3RldmUg
Zm9yIHlvdXIgY29tbWVudHMuCgpSZWdhcmRzLApTZXJnZWkKPiBUaGFua3MsCj4gLy9yaWNoYXJk
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
