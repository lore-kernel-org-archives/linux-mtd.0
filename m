Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09268C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32D0600CC
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32D0600CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1N7dWiPA/hcHgg+aAHVB+SEPtlmfie8jghC+WpN6HZg=; b=BGfxAJ0vhvVkrWWwjayAzHfgm
	n3yZsEGrXKKitqWJf1NVDuDHsL8o6RTnN8Xng1s23kvikAdQGAiTV2HWfHLkW/qHd2XptH1s5Ab5U
	VEtX85kgx5MBUaZ/dC7PaogyJ9gKSxyWfhnVPDslJ/9R7PMBgF0arRP6W727Zew1e7rc1sysmTa20
	s+gSGI8eCMCr34KU9ZTeyF6O1lHlYy3DuonmsE5EoyVReWismikhzCUSG/7x3xDLbY7OXMVPTxrGB
	jMmRzevrji57ELzQdx2AWdb3PRMit3rImzteGBBy5/4BRwWqou9sReILT2tZSy3HqI//cRb9v3u9V
	mxbylO2zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEaLC-0008De-AF; Tue, 23 Feb 2021 16:15:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEaL9-0008D4-U6
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 16:15:12 +0000
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E31DCC0002;
 Tue, 23 Feb 2021 16:15:07 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:15:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: Rename parameter name in macro
Message-ID: <20210223171506.144c982e@xps13>
In-Reply-To: <1613979342-23572-1-git-send-email-mdalam@codeaurora.org>
References: <1613979342-23572-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_111512_089093_1DB7261B 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mani@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIE1v
biwgMjIgRmViIDIwMjEKMTM6MDU6NDIgKzA1MzA6Cgo+IFRoaXMgY2hhbmdlIHdpbGwgcmVuYW1l
IHBhcmFtZXRlciBuYW1lIGluIG1hY3JvCj4gbmFuZGNfc2V0X3JlYWRfbG9jKCkucmVuYW1lZCBw
YXJhbWV0ZXIgbmFtZXMgYXJlCj4gY3dfb2Zmc2V0LCByZWFkX3NpemUsIGlzX2xhc3RfcmVhZF9s
b2MuCj4gU2luYyBpbiBRUElDIFYyIG9uLXdhcmRzIHRoZXJlIGlzIHNlcGFyYXRlIGxvY2F0aW9u
Cj4gcmVnaXN0ZXIgdG8gcmVhZCBsYXN0IGNvZGUgd29yZCwgc28gdG8ganVzdCBkaWZmZXJuY2lh
dGUKPiBiL3cgaXNfbGFzdF9yZWFkX2xvYyBmcm9tIGxhc3RfY3cgdGhpcyBjaGFuZ2UgbmVlZGVk
LgoKIgpSZW5hbWUgdGhlIHBhcmFtZXRlcnMgb2YgdGhlIG5hbmRjX3NldF9yZWFkX2xvYygpIG1h
Y3JvIHRvIGF2b2lkIHRoZQpjb25mdXNpb24gYmV0d2VlbiBpc19sYXN0X3JlYWRfbG9jIHdoaWNo
IDxleHBsYWluIHdoYXQgaXQgaXM+IGFuZAo8bGFzdF9jdz4gd2hpY2ggPGV4cGxhaW4gd2hhdCBp
dCBpcyBhcyB3ZWxsPi4KCj4gCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8bWRhbGFt
QGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IDQxODlhN2Yu
LmJmZWZiNGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTE4MSwxMSAr
MTgxLDExIEBACj4gICNkZWZpbmUJRUNDX0JDSF80QklUCUJJVCgyKQo+ICAjZGVmaW5lCUVDQ19C
Q0hfOEJJVAlCSVQoMykKPiAgCj4gLSNkZWZpbmUgbmFuZGNfc2V0X3JlYWRfbG9jKG5hbmRjLCBy
ZWcsIG9mZnNldCwgc2l6ZSwgaXNfbGFzdCkJXAo+ICsjZGVmaW5lIG5hbmRjX3NldF9yZWFkX2xv
YyhuYW5kYywgcmVnLCBjd19vZmZzZXQsIHJlYWRfc2l6ZSwgaXNfbGFzdF9yZWFkX2xvYykJXAo+
ICBuYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX1JFQURfTE9DQVRJT05fIyNyZWcsCQkJXAo+IC0J
ICAgICAgKChvZmZzZXQpIDw8IFJFQURfTE9DQVRJT05fT0ZGU0VUKSB8CQlcCj4gLQkgICAgICAo
KHNpemUpIDw8IFJFQURfTE9DQVRJT05fU0laRSkgfAkJCVwKPiAtCSAgICAgICgoaXNfbGFzdCkg
PDwgUkVBRF9MT0NBVElPTl9MQVNUKSkKPiArCSAgICAgICgoY3dfb2Zmc2V0KSA8PCBSRUFEX0xP
Q0FUSU9OX09GRlNFVCkgfAkJXAo+ICsJICAgICAgKChyZWFkX3NpemUpIDw8IFJFQURfTE9DQVRJ
T05fU0laRSkgfAkJCVwKPiArCSAgICAgICgoaXNfbGFzdF9yZWFkX2xvYykgPDwgUkVBRF9MT0NB
VElPTl9MQVNUKSkKPiAgCj4gIC8qCj4gICAqIFJldHVybnMgdGhlIGFjdHVhbCByZWdpc3RlciBh
ZGRyZXNzIGZvciBhbGwgTkFORF9ERVZfIHJlZ2lzdGVycwoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
