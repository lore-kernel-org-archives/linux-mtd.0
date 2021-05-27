Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD1EC47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 16:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C6F61184
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 16:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C6F61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1QpM5xK0WHYYegse4giNdGZPTRWMAIgFP5MumweBVd4=; b=IQtTtxNBVw+lEC23qap2hyHgzz
	xEQ1RhDVAO5HiCG7yPaeRJnWvKX+Vgyt/Cne/VHw/45G40CDeatI5l/I+gClnhh6kAxu2Q83GTmuO
	HcPIeFmZ0EFVUpjVc4Dh2WLzrT7NPM1fJ/hTxjSylDetcdlk0c42lZYPEnXlVSa+lNApoAmjDvu0R
	AsWS9nEEYvfvqx359JGWnOkpW3M/0RqQbU9Q719J6Eirt5zYqOgCnjBgcrtvstVsHeFLBNQB0jfKa
	jLUg9LfTL9o6e93VbOt25oDkDJXY+TBQU3QBULV0Q4nYttW830mKKSGGpfWkYr/atvhkc/k/l0N0u
	TQcQahRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmJ4N-007iaw-F4; Thu, 27 May 2021 16:41:15 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmHqV-007BS0-7c
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 15:22:52 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lmHqT-0007O9-9F; Thu, 27 May 2021 15:22:49 +0000
Subject: Re: [PATCH][next] mtd: rawnand: ensure return variable is initialized
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210527145048.795954-1-colin.king@canonical.com>
 <20210527170309.4d99bc31@xps13>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <06e72a95-1f01-f9b7-d172-51f22224a2a7@canonical.com>
Date: Thu, 27 May 2021 16:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527170309.4d99bc31@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_082251_313162_28B5274B 
X-CRM114-Status: GOOD (  22.49  )
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

T24gMjcvMDUvMjAyMSAxNjowMywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBDb2xpbiwKPiAK
PiBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9uIFRodSwgMjcg
TWF5IDIwMjEKPiAxNTo1MDo0OCArMDEwMDoKPiAKPj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4gQ3VycmVudGx5IHRoZXJlIGFyZSBjb3JuZXIg
Y2FzZXMgd2hlcmUgc3BlY190aW1lcyBpcyBOVUxMIGFuZAo+PiBjaGlwLT5wYXJhbWV0ZXJzLm9u
Zmkgb3Igd2hlbiBiZXN0X21vZGUgaXMgemVybyB3aGVyZSByZXQgaXMKPiAKPiAgICAgICAgICAg
ICAgICAgICAgICAgIF4KPiBzb21ldGhpbmcgaXMgbWlzc2luZyBoZXJlLCB0aGUgc2VudGVuY2Ug
aXMgbm90IGNsZWFyCj4gCj4+IG5vdCBhc3NpZ25lZCBhIHZhbHVlIGFuZCBhbiB1bmluaXRpYWxp
emVkIHJldHVybiB2YWx1ZSBjYW4gYmUKPj4gcmV0dXJuZWQuIEZpeCB0aGlzIGJ5IGVuc3VyaW5n
IHJldCBpcyBpbml0aWFsaXplZCB0byAtRUlOVkFMLgo+IAo+IEkgZG9uJ3Qgc2VlIGhvdyB0aGlz
IHNpdHVhdGlvbiBjYW4gaGFwcGVuLgo+IAo+IEluIGJvdGggY2FzZXMsIG5vIG1hdHRlciB0aGUg
dmFsdWUgb2YgYmVzdF9tb2RlLCB0aGUgZm9yIGxvb3Agd2lsbAo+IGFsd2F5cyBleGVjdXRlIGF0
IGxlYXN0IG9uZSB0aW1lIChtb2RlIDApIHNvIHJldCB3aWxsIGJlIHBvcHVsYXRlZC4KPiAKPiBN
YXliZSB0aGUgcm9ib3QgZG9lcyBub3Qga25vdyB0aGF0IGJlc3RfbW9kZSBjYW5ub3QgYmUgbmVn
YXRpdmUgYW5kCj4gc2hvdWxkIGJlIGRlZmluZWQgdW5zaWduZWQsIGJ1dCB0aGUgY3VycmVudCBw
YXRjaCBpcyBpbnZhbGlkLgoKWWVwLCBJJ3ZlIGxvb2tlZCBhdCB0aGlzIGFnYWluIGFuZCBpdCBk
b2VzIHNlZW0gbGlrZSBhIGZhbHNlIHBvc2l0aXZlLgpBcG9sb2dpZXMgZm9yIHRoZSBub2lzZS4K
Cj4gCj4+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbmluaXRpYWxpemVkIHNjYWxhciB2YXJpYWJs
ZSIpCj4+IEZpeGVzOiA5ZDMxOTRiZjJhZWYgKCJtdGQ6IHJhd25hbmQ6IEFsbG93IFNEUiB0aW1p
bmdzIHRvIGJlIG5hY2tlZCIpCj4+IEZpeGVzOiBhOWVjYzhjODE0ZTkgKCJtdGQ6IHJhd25hbmQ6
IENob29zZSB0aGUgYmVzdCB0aW1pbmdzLCBOVi1ERFIgaW5jbHVkZWQiKQo+PiBTaWduZWQtb2Zm
LWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+PiAtLS0KPj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgNCArKy0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2Jhc2UuYwo+PiBpbmRleCA1N2E1ODMxNDljYzAuLjE4ZGI3NDJmNjUwYyAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPj4gQEAgLTkyNiw3ICs5MjYsNyBAQCBpbnQgbmFuZF9j
aG9vc2VfYmVzdF9zZHJfdGltaW5ncyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+PiAgCQkJCSBz
dHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAqc3BlY190aW1pbmdzKQo+PiAgewo+PiAgCWNvbnN0IHN0
cnVjdCBuYW5kX2NvbnRyb2xsZXJfb3BzICpvcHMgPSBjaGlwLT5jb250cm9sbGVyLT5vcHM7Cj4+
IC0JaW50IGJlc3RfbW9kZSA9IDAsIG1vZGUsIHJldDsKPj4gKwlpbnQgYmVzdF9tb2RlID0gMCwg
bW9kZSwgcmV0ID0gLUVJTlZBTDsKPj4gIAo+PiAgCWlmYWNlLT50eXBlID0gTkFORF9TRFJfSUZB
Q0U7Cj4+ICAKPj4gQEAgLTk3Nyw3ICs5NzcsNyBAQCBpbnQgbmFuZF9jaG9vc2VfYmVzdF9udmRk
cl90aW1pbmdzKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4+ICAJCQkJICAgc3RydWN0IG5hbmRf
bnZkZHJfdGltaW5ncyAqc3BlY190aW1pbmdzKQo+PiAgewo+PiAgCWNvbnN0IHN0cnVjdCBuYW5k
X2NvbnRyb2xsZXJfb3BzICpvcHMgPSBjaGlwLT5jb250cm9sbGVyLT5vcHM7Cj4+IC0JaW50IGJl
c3RfbW9kZSA9IDAsIG1vZGUsIHJldDsKPj4gKwlpbnQgYmVzdF9tb2RlID0gMCwgbW9kZSwgcmV0
ID0gMDsKPj4gIAo+PiAgCWlmYWNlLT50eXBlID0gTkFORF9OVkREUl9JRkFDRTsKPj4gIAo+IAo+
IFRoYW5rcywKPiBNaXF1w6hsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
