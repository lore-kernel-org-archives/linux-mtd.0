Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E775C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 06:49:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD21C64D99
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD21C64D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xFVcb0Mprb7HFJICGOfaWZrn8prjZQFSv6q1d/O4cD4=; b=E/LN6/ScoMY4al9Orqps5qGTz
	D8lcYjyCm66A1mf36eTDCETMLPqZsGxhQwbac8cxiRwPB1zVMgdpL+DD8IKDsWLIjo6eq48UWTiP4
	eZ084u1ilwHkL16FAuBlN5TUOUJsEyMN3YQgCPAEoYH0BhB52JhdoWm8ziNbWeu4QRmt/QSmy7Ii8
	lmq7s9RYvpQb6DAyh8LePs6Nn2yQsKOrjXQEYLNMxeQ2JXrLTIeOx0Gu9hV3L4k/RFFujfsPfyhSp
	0ImN9pN/tcLNomz9rBvQ0jfX5XqgwFbkGAuduhDGHnFdhavxTTM3b7LVh6rm2eKnzhByOVVtFJ0/T
	Y7U5IrsTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEnyp-0004xH-61; Wed, 24 Feb 2021 06:49:03 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEnyk-0004wR-1w
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 06:49:01 +0000
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3E15A240005;
 Wed, 24 Feb 2021 06:48:51 +0000 (UTC)
Date: Wed, 24 Feb 2021 07:48:50 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
Message-ID: <20210224074850.0c74154d@xps13>
In-Reply-To: <38da9d1d4a96f1b42ba0b194da265e6b@codeaurora.org>
References: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
 <20210223173449.1a55df1e@xps13>
 <a5650f33b493b987d45525ea57fdfd8a@codeaurora.org>
 <38da9d1d4a96f1b42ba0b194da265e6b@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_014858_237465_27E486B6 
X-CRM114-Status: GOOD (  21.43  )
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
Cc: mani@kernel.org, linux-kernel@vger.kernel.org,
 mdalam=codeaurora.org@codeaurora.org, linux-mtd@lists.infradead.org,
 boris.brezillon@collabora.com, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gV2VkLCAyNCBGZWIgMjAyMSAx
MDowOTo0OCArMDUzMDoKCj4gT24gMjAyMS0wMi0yNCAwMToxMywgbWRhbGFtQGNvZGVhdXJvcmEu
b3JnIHdyb3RlOgo+ID4gT24gMjAyMS0wMi0yMyAyMjowNCwgTWlxdWVsIFJheW5hbCB3cm90ZTog
IAo+ID4+IEhlbGxvLCAgCj4gPj4gPj4gTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEu
b3JnPiB3cm90ZSBvbiBUdWUsIDIzIEZlYiAyMDIxICAKPiA+PiAwMTozNDoyNyArMDUzMDogIAo+
ID4+ID4+PiBGcm9tIFFQSUMgdmVyc2lvbiAyLjAgb253YXJkcyBuZXcgcmVnaXN0ZXIgZ290IGFk
ZGVkIHRvIHJlYWQgbGFzdCAgCj4gPj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGEgbmV3ICAKPiA+PiA+Pj4gY29kZXdvcmQuIFRoaXMgY2hhbmdlIHdpbGwgYWRkIHRoZSBSRUFE
X0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3Rlci4gIAo+ID4+ID4+ICAgICAgICAgICAgIEFkZCBz
dXBwb3J0IGZvciB0aGlzIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJlZ2lzdGVyLiAgCj4gPj4g
Pj4+ID4+PiBGb3IgZmlyc3QgdGhyZWUgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fbiByZWdpc3Rl
ciB3aWxsIGJlICAKPiA+Pj4gdXNlLkZvciBsYXN0IGNvZGUgd29yZCBSRUFEX0xPQ0FUSU9OX0xB
U1RfQ1dfbiByZWdpc3RlciB3aWxsIGJlCj4gPj4+IHVzZS4gIAo+ID4+ID4+ICIgIAo+ID4+IElu
IHRoZSBjYXNlIG9mIFFQSUMgdjIsIGNvZGV3b3JkcyAwLCAxIGFuZCAyIHdpbGwgYmUgYWNjZXNz
ZWQgdGhyb3VnaAo+ID4+IFJFQURfTE9DQVRJT05fbiwgd2hpbGUgY29kZXdvcmQgMyB3aWxsIGJl
IGFjY2Vzc2VkIHRocm91Z2gKPiA+PiBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbi4KPiA+PiAiICAK
PiA+PiA+PiBXaGVuIEkgcmVhZCBteSBvd24gc2VudGVuY2UsIEkgZmVlbCB0aGF0IHRoZXJlIGlz
IHNvbWV0aGluZyB3cm9uZy4gIAo+ID4+IElmIHRoZXJlIGFyZSBvbmx5IDQgY29kZXdvcmRzLCBJ
IGd1ZXNzIGEgUVBJQyB2MiBpcyBhYmxlIHRvIHVzZQo+ID4+IFJFQURfTE9DQVRJT05fMyBvciBS
RUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMCBpbnRlcmNoYW5nZWFibHkuIElzbid0IGl0PyAgCj4gPj4g
Pj4gSSBndWVzcyB0aGUgcG9pbnQgb2YgaGF2aW5nIHRoZXNlICJsYXN0X2N3X24iIHJlZ2lzdGVy
cyBpcyB0byBzdXBwb3J0ICAKPiA+PiB1cCB0byA4IGNvZGV3b3JkcywgYW0gSSB3cm9uZz8gSWYg
dGhpcyB0aGUgY2FzZSwgdGhlIGN1cnJlbnQgcGF0Y2gKPiA+PiBjb21wbGV0ZWx5IGZhaWxzIGRv
aW5nIHRoYXQgSSBkb24ndCBnZXQgdGhlIHBvaW50IG9mIHN1Y2ggY2hhbmdlLiAgCj4gPiAKPiA+
IFRoaXMgcmVnaXN0ZXIgaXMgb25seSB1c2UgdG8gcmVhZCBsYXN0IGNvZGUgd29yZC4KPiA+IAo+
ID4gSSBoYXZlIGFkZHJlc3MgYWxsIHRoZSBjb21tZW50cyBmcm9tIGFsbCB0aGUgcHJldmlvdXMg
c3ViIHNlcXVlbnQKPiA+IHBhdGNoZXMgYW5kIHB1c2hlZAo+ID4gYWxsIHBhdGNoZXMgaW4gb25s
eSBvbmUgc2VyaWVzLgo+ID4gCj4gPiBQbGVhc2UgY2hlY2suICAKPiAKPiAgIFRoZSByZWdpc3Rl
cnMgUkVBRF9MT0NBVElPTiAmIFJFQURfTE9DQVRJT05fTEFTVCBhcmUgbm90IGFzc29jaWF0ZWQg
d2l0aCBudW1iZXIgb2YgY29kZSB3b3Jkcy4KPiAgIFRoZXNlIHR3byByZWdpc3RlcnMgYXJlIHVz
ZWQgdG8gYWNjZXNzIHRoZSBsb2NhdGlvbiBpbnNpZGUgYSBjb2RlIHdvcmQuCgpPay4gQ2FuIHlv
dSBwbGVhc2UgZXhwbGFpbiB3aGF0IGlzIGEgbG9jYXRpb24gdGhlbj8gT3IgcG9pbnQgbWUgdG8g
YQpkYXRhc2hlZXQgdGhhdCBleHBsYWlucyBpdC4KCkJvdHRvbSBsaW5lIHF1ZXN0aW9uOiB3aHkg
aGF2aW5nIFJFQURfTE9DQVRJT05fMCwgXzEsLi4uIGFuClJFQURfTE9DQVRJT05fTEFTVF8wLCBf
MSwgZXRjPwoKPiBTbyB3aGV0aGVyIHdlIGFyZSBoYXZpbmcgNCBjb2RlIHdvcmRzCj4gICBvciA4
IGNvZGUgd29yZHMgaXQgZG9lc24ndCBtYXR0ZXIuIElmIHdlIHdhbnRlZCBhY2Nlc3MgdGhlIGxv
Y2F0aW9uIHdpdGhpbiBub3JtYWwgY29kZSB3b3JkIHdlIGhhdmUgdG8KPiAgIHVzZSBSRUFEX0xP
Q0FUSU9OIHJlZ2lzdGVyIGFuZCBpZiB3ZSB3YW50ZWQgdG8gYWNjZXNzIGxvY2F0aW9uIGluIGxh
c3QgY29kZSB3b3JkIHRoZW4gd2UgaGF2ZSB0byB1c2UKPiAgIFJFQURfTE9DQVRJT05fTEFTVC4K
PiA+ICAgCj4gPj4gPj4+IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2Rl
YXVyb3JhLm9yZz4gIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
