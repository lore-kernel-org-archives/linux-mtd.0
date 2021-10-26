Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D3EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 19:37:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B4160720
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 19:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5B4160720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3+jTiVkAXFYljyoq6uyRp8/P5ZJMJKU5K3hUHGrBVZY=; b=RZFay45yX/jeDKhFZzIIOJwQgk
	RU36PRUtGQzcTW5ASLORcu1Gryt4DQJl59qMOhkNJ+DvDoNqZzPwcMVMr+U63bl5hCGM4m4MCEVTN
	gapfqxPpSQR/+PbxlV6uGRGT48FJ0oSbulJ2lq/7CI2z3lcz4f9hs0bKCUdI+HHG8/sviwAoQQW8l
	J0BaplK53+K75nLOorMEjg/bvs9eSL0SVGqvdMaAXq2e9xCN02rJm3zYsEugtPURXm3jvu+9XBW7a
	4/wYJVV3cXOWvM2uLOA9F1SlTyJpBAk+yxrNBBLTmIXkAgo4aGhGxbPNww1OmIs3LJFcrnnGW9ZQe
	AhaG8SQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfSFc-002vlm-5N; Tue, 26 Oct 2021 19:36:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfSFZ-002vkw-R6
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 19:36:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6AC6361EAE61;
 Tue, 26 Oct 2021 21:36:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7wGUL2xiZPGU; Tue, 26 Oct 2021 21:36:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EA44561EAE60;
 Tue, 26 Oct 2021 21:36:43 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QBTsJ4QC7-1X; Tue, 26 Oct 2021 21:36:43 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C1881608890D;
 Tue, 26 Oct 2021 21:36:43 +0200 (CEST)
Date: Tue, 26 Oct 2021 21:36:43 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: schaecsn <schaecsn@gmx.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Stefan Schaeckeler <sschaeck@cisco.com>
Message-ID: <2065858791.38760.1635277003599.JavaMail.zimbra@nod.at>
In-Reply-To: <20211010042239.2888-1-schaecsn@gmx.net>
References: <20211010042239.2888-1-schaecsn@gmx.net>
Subject: Re: [PATCH v2] ubifs: ubifs to export filesystem error counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: ubifs to export filesystem error counters
Thread-Index: aM4D8UF/9n8qFEnXdnQOShonLtWUPw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_123646_049147_7CE128CF 
X-CRM114-Status: UNSURE (   9.66  )
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

U3RlZmFuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInNjaGFlY3Nu
IiA8c2NoYWVjc25AZ214Lm5ldD4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJs
aW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwi
Cj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gQ0M6ICJzY2hhZWNzbiIgPHNjaGFl
Y3NuQGdteC5uZXQ+LCAiU3RlZmFuIFNjaGFlY2tlbGVyIiA8c3NjaGFlY2tAY2lzY28uY29tPgo+
IEdlc2VuZGV0OiBTb25udGFnLCAxMC4gT2t0b2JlciAyMDIxIDA2OjIyOjM5Cj4gQmV0cmVmZjog
W1BBVENIIHYyXSB1YmlmczogdWJpZnMgdG8gZXhwb3J0IGZpbGVzeXN0ZW0gZXJyb3IgY291bnRl
cnMKCj4gTm90IGFsbCB1YmlmcyBmaWxlc3lzdGVtIGVycm9ycyBhcmUgcHJvcGFnYXRlZCB0byB1
c2Vyc3BhY2UuCj4gCj4gRXhwb3J0IGJhZCBtYWdpYywgYmFkIG5vZGUgYW5kIGNyYyBlcnJvcnMg
dmlhIHN5c2ZzLiBUaGlzIGFsbG93cyB1c2Vyc3BhY2UKPiB0byBub3RpY2UgZmlsZXN5c3RlbSBl
cnJvcnM6Cj4gCj4gL3N5cy9mcy91Ymlmcy91YmlYX1kvZXJyb3JzX21hZ2ljCj4gL3N5cy9mcy91
Ymlmcy91YmlYX1kvZXJyb3JzX25vZGUKPiAvc3lzL2ZzL3ViaWZzL3ViaVhfWS9lcnJvcnNfY3Jj
Cj4gCj4gVGhlIGNvdW50ZXJzIGFyZSByZXNldCB0byAwIHdpdGggYSByZW1vdW50Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFN0ZWZhbiBTY2hhZWNrZWxlciA8c3NjaGFlY2tAY2lzY28uY29tPgo+IC0t
LQo+IENoYW5nZXMgaW4gdjI6Cj4gIC0gbWVyZ2VkIHN5c2ZzLmggaGVhZGVyIGludG8gdWJpZnMu
aC4KPiAgLSBpby5jOiB3cmFwcGVkIGluY3JlbWVudGluZyBlcnJvciBjb3VudGVycyBpbnRvIG5l
dyBmdW5jdGlvbnMKPiAgICByZWNvcmRfKl9lcnJvcigpLgo+ICAtIHN5c2ZzLmM6IHJlbW92ZWQg
c3lzZnMgd3JpdGUgY2FsbGJhY2sgZm9yIGNsZWFyaW5nIHN0YXRzLgo+ICAtIHN5c2ZzLmM6IHVi
aWZzX3N5c2ZzX3JlZ2lzdGVyKCk6IGZyZWUgYy0+c3RhdHMgb24gZXJyb3IuCj4gIC0gc3lzZnMu
YzogdWJpZnNfYXR0cl9zaG93KCk6IHVzZSBzeXNmc19lbWl0KCkuCj4gCj4gZnMvdWJpZnMvTWFr
ZWZpbGUgfCAgIDIgKy0KPiBmcy91Ymlmcy9pby5jICAgICB8ICAyMSArKysrKysrCj4gZnMvdWJp
ZnMvc3VwZXIuYyAgfCAgMTYgKysrKy0KPiBmcy91Ymlmcy9zeXNmcy5jICB8IDE1MyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gZnMvdWJpZnMvdWJpZnMu
aCAgfCAgMzUgKysrKysrKysrKysKPiA1IGZpbGVzIGNoYW5nZWQsIDIyNSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBmcy91Ymlmcy9zeXNmcy5jCgpR
dWV1ZWQgZm9yIDUuMTYuCgpJIGp1c3Qgbm90aWNlZCBmb3Jnb3QgdG8gcmVxdWVzdCBzeXNmcyBk
b2N1bWVudGF0aW9uIGluIERvY3VtZW50YXRpb24vQUJJLy4KQ2FuIHlvdSBwbGVhc2Ugc2VuZCBh
IGZvbGxvd3VwIHBhdGNoPwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
