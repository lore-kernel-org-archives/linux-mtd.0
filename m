Return-Path: <SRS0=yUT7=7V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD6AC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 12:38:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016802072F
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 12:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dxu0Q7Nv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 016802072F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pjgHGe4MnLkg53X8kn6fjP0VrRQymQEetELk1m4f3A=; b=Dxu0Q7NvG+Qacm
	PRNLT9MOlgByDP5JgWLoNrzsZPosFdTz4lInL7eXU/wR7wEfG9eCtRlawAfN1Z7QpPi4A+2PoCQPK
	C/1MCinwk0k4EXyHYva6c2tgABZuIyRoE6eGAX/j8Pf5M7Cu+YbLmHeYpRyVi4hKFQfcBR+JHl0Xj
	jqqhOp/ZgwFgqMxTxOsOUe3f2cOVs8qAKInafwgivrO6TD/w7AbIccn8S8Clal0hkP9jUZTn4g6w7
	AiNDPqwEhVgDrnCSpKtyboKWfCoMlqPCqQbaUZqQi2W62HCodxjeKehA7DlUqLxr/XVcfV1vyXQQm
	8n0a4nlAeCTi/luZLqTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiH2L-0005l3-J2; Mon, 08 Jun 2020 12:37:57 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiH2I-0005kF-3F
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2020 12:37:55 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 11E49240013;
 Mon,  8 Jun 2020 12:37:40 +0000 (UTC)
Date: Mon, 8 Jun 2020 14:37:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH] mtd: raw: qcom_nand: Fix register write error
Message-ID: <20200608143739.368f2b53@xps13>
In-Reply-To: <1591613254-1065-1-git-send-email-sivaprak@codeaurora.org>
References: <1591613254-1065-1-git-send-email-sivaprak@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_053754_276223_42DD3CD6 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: peter.ujfalusi@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2l2YXByYWthc2gsCgpTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJv
cmEub3JnPiB3cm90ZSBvbiBNb24sICA4IEp1bgoyMDIwIDE2OjE3OjM0ICswNTMwOgoKU3ViamVj
dCBwcmVmaXggc2hvdWxkIGJlIG10ZDogcmF3bmFuZDogcWNvbToKCkFuZCBJIGRvbid0IHRoaW5r
ICJGaXggcmVnaXN0ZXIgd3JpdGUgZXJyb3IiIGlzIHJlbGV2YW50IGluIGFueSBvZiB0aGUKdHdv
IGZvbGxvd2luZyBjYXNlcy4KCj4gMS4gU0ZMQVNIQ19CVVJTVF9DRkcgcmVnaXN0ZXIgaXMgbm90
IGF2YWlsYWJsZSBvbiBhbGwgaXBxIG5hbmQgcGxhdGZvcm1zLAo+ICAgIGl0IGlzIGF2YWlsYWJs
ZSBvbmx5IG9uIGlwcTgwNjQgZGV2aWNlcyBhbmQgdGhlIG5hbmQgY29udHJvbGxlciB3b3Jrcwo+
ICAgIHdpdGhvdXQgY29uZmlndXJpbmcgdGhlc2UgcmVnaXN0ZXJzIGluIHRoaXMgcGxhdGZvcm0s
IHNvIHJlZ2lzdGVyCj4gICAgd3JpdGUgdG8gdGhpcyBjYW4gYmUgcmVtb3ZlZC4KPiAKPiAyLiBP
bmNlIEJBTSBtb2RlIGlzIGVuYWJsZWQgcmVnaXN0ZXIgd3JpdGVzIHRvIE5BTkRfQ1RSTCBzaG91
bGQgYmUKPiAgICBwZXJmb3JtZWQgdGhyb3VnaCBCQU0gY29tbWFuZCBkZXNjcmlwdG9ycy4gVGhl
IE5BTkQgQkFNIG1vZGUgd2lsbAo+ICAgIGJlIGVuYWJsZWQgYnkgYm9vdGxvYWRlcnMuIENoZWNr
IGlmIEJBTSBtb2RlIGlzIGFscmVhZHkgZW5hYmxlZCBhbmQKPiAgICBlbmFibGUgaXQgb25seSBp
ZiBub3QgZW5hYmxlZCBhbHJlYWR5Lgo+IAoKSXQgbG9va3MgbGlrZSB0aGVyZSBhcmUgdHdvIGNv
bXBsZXRlbHkgZGlmZmVyZW50IGNoYW5nZXMgdGhhdCB5b3UgYXJlCmRvaW5nIGhlcmUsIHBsZWFz
ZSBzcGxpdC4KCkFsc28sIHBsZWFzZSBleHBsYWluIHdoeSAjMiBpcyBuZWVkZWQsIGl0IGlzIG5v
dCB2ZXJ5IGNsZWFyLgoKVGhhbmtzLApNaXF1w6hsCgo+IFNpZ25lZC1vZmYtYnk6IFNpdmFwcmFr
YXNoIE11cnVnZXNhbiA8c2l2YXByYWtAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDExICsrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fj
b21fbmFuZGMuYwo+IGluZGV4IDViMTFjNzAuLjdiZmQ5M2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4gQEAgLTM2LDcgKzM2LDYgQEAKPiAgI2RlZmluZQlOQU5EX0RFVl9DTUQx
CQkJMHhhNAo+ICAjZGVmaW5lCU5BTkRfREVWX0NNRDIJCQkweGE4Cj4gICNkZWZpbmUJTkFORF9E
RVZfQ01EX1ZMRAkJMHhhYwo+IC0jZGVmaW5lCVNGTEFTSENfQlVSU1RfQ0ZHCQkweGUwCj4gICNk
ZWZpbmUJTkFORF9FUkFTRURfQ1dfREVURUNUX0NGRwkweGU4Cj4gICNkZWZpbmUJTkFORF9FUkFT
RURfQ1dfREVURUNUX1NUQVRVUwkweGVjCj4gICNkZWZpbmUJTkFORF9FQkkyX0VDQ19CVUZfQ0ZH
CQkweGYwCj4gQEAgLTI3NzQsMTQgKzI3NzMsMjAgQEAgc3RhdGljIGludCBxY29tX25hbmRjX3Nl
dHVwKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMpCj4gIAl1MzIgbmFuZF9jdHJs
Owo+ICAKPiAgCS8qIGtpbGwgb25lbmFuZCAqLwo+IC0JbmFuZGNfd3JpdGUobmFuZGMsIFNGTEFT
SENfQlVSU1RfQ0ZHLCAwKTsKPiAgCW5hbmRjX3dyaXRlKG5hbmRjLCBkZXZfY21kX3JlZ19hZGRy
KG5hbmRjLCBOQU5EX0RFVl9DTURfVkxEKSwKPiAgCQkgICAgTkFORF9ERVZfQ01EX1ZMRF9WQUwp
Owo+ICAKPiAgCS8qIGVuYWJsZSBBRE0gb3IgQkFNIERNQSAqLwo+ICAJaWYgKG5hbmRjLT5wcm9w
cy0+aXNfYmFtKSB7Cj4gIAkJbmFuZF9jdHJsID0gbmFuZGNfcmVhZChuYW5kYywgTkFORF9DVFJM
KTsKPiAtCQluYW5kY193cml0ZShuYW5kYywgTkFORF9DVFJMLCBuYW5kX2N0cmwgfCBCQU1fTU9E
RV9FTik7Cj4gKwkJLyogT25jZSBCQU1fTU9ERV9FTiBiaXQgaXMgc2V0LCB3cml0ZXMgdG8gdGhl
IE5BTkRfQ1RSTAo+ICsJCSAqIHNob3VsZCBiZSBkb25lIHRocm91Z2ggQkFNIGNvbW1hbmQgZGVz
Y3JpcHRvcnMuCj4gKwkJICogaW4gbW9zdCBjYXNlcyBib290bG9hZGVyIGVuYWJsZXMgdGhlIGJh
bSBtb2RlIHdlCj4gKwkJICogbmVlZCB0byBzZXQgdGhlIEJBTSBtb2RlIG9ubHkgaWYgaXQgaXMg
bm90IHNldCBieQo+ICsJCSAqIGJvb3Rsb2FkZXIKPiArCQkgKi8KPiArCQlpZiAoIShuYW5kX2N0
cmwgJiBCQU1fTU9ERV9FTikpCj4gKwkJCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0NUUkwsIG5h
bmRfY3RybCB8IEJBTV9NT0RFX0VOKTsKPiAgCX0gZWxzZSB7Cj4gIAkJbmFuZGNfd3JpdGUobmFu
ZGMsIE5BTkRfRkxBU0hfQ0hJUF9TRUxFQ1QsIERNX0VOKTsKPiAgCX0KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
