Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14266C432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 07:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D9A6101B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 07:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1D9A6101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdUMnBQ3Ojl2xTJDYu69rQbJlTC7M32+zKFPsidFKRg=; b=ZgbbQOkOwBJEMN
	jePWR9fIehH+fa3NAYM6kaZJAiO/2CzoN1CrXwl5xfDO1mza42vK6mvFabxPCkqvwXy5qz2HNqQ94
	Z6ppkeiND8xG65rKza4UtSxf53PI2hZKSD3AvZoaEAQd2nwQCZ15gZ+vKPUkDO+lYzsA9rvKBG4P9
	zDSB7MANjuYzfn+VQvE7Jh/LLwrv6WVkKUHt6Rhp2PLon3Jk4GI+OGo5/pul/kY1rgvEik3AjwXgl
	KNNcyUvMwJENwlSbxIziE5u6jaIfp0D+aziQ3EVIZVOQU+wka99vWaEGhTfogibMvNvB3TfeDugC8
	JW8/04+PIMSqkQRdOsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKc9X-00GfWD-Fg; Mon, 30 Aug 2021 07:56:23 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKc9N-00GfV2-IN
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 07:56:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 244F460009;
 Mon, 30 Aug 2021 07:56:07 +0000 (UTC)
Date: Mon, 30 Aug 2021 09:56:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Update code word value for raw read
Message-ID: <20210830095607.6be588fe@xps13>
In-Reply-To: <1629973862-7248-1-git-send-email-mdalam@codeaurora.org>
References: <1629973862-7248-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_005613_784478_FC98E0DB 
X-CRM114-Status: GOOD (  16.88  )
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

SGVsbG8KCk1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4gd3JvdGUgb24gVGh1
LCAyNiBBdWcgMjAyMQoxNjowMTowMiArMDUzMDoKCj4gRnJvbSBRUElDIFYyIG9ud2FyZHMgdGhl
cmUgaXMgYSBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFkCj4gbGFzdCBjb2RlIHdvcmQgIlFQSUNf
TkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiIuCj4gCj4gcWNvbV9uYW5kY19yZWFkX2N3X3Jh
dygpIGlzIHVzZWQgdG8gcmVhZCBvbmx5IG9uZSBjb2RlIHdvcmQKPiBhdCBhIHRpbWUuIElmIHdl
IHdpbGwgY29uZmlndXJlIG51bWJlciBvZiBjb2RlIHdvcmRzIHRvIDEgaW4KPiBpbiBRUElDX05B
TkRfREVWMF9DRkcwIHJlZ2lzdGVyIHRoZW4gUVBJQyBjb250cm9sbGVyIHRoaW5rcwo+IGl0cyBy
ZWFkaW5nIHRoZSBsYXN0IGNvZGUgd29yZCwgc2luY2UgZnJvbSBRUElDIFYyIG9ud2FyZHMKPiB3
ZSBhcmUgaGF2aW5nIHNlcGFyYXRlIHJlZ2lzdGVyIHRvIHJlYWQgdGhlIGxhc3QgY29kZSB3b3Jk
LAo+IHdlIGhhdmUgdG8gY29uZmlndXJlICJRUElDX05BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NX
X24iCj4gcmVnaXN0ZXIgdG8gZmV0Y2ggZGF0YSBmcm9tIGNvbnRyb2xsZXIgYnVmZmVyIHRvIHN5
c3RlbQo+IG1lbW9yeS4KCkZpeGVzL0NjOiBzdGFibGUgdGFncyBhcmUgbWlzc2luZz8KCj4gU2ln
bmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA4ICsrKysrKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IGVmMGJhZGUuLjA0ZTZmN2IgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTE2NzYsMTMgKzE2NzYsMTcgQEAgcWNvbV9uYW5kY19y
ZWFkX2N3X3JhdyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
PiAgCXN0cnVjdCBuYW5kX2VjY19jdHJsICplY2MgPSAmY2hpcC0+ZWNjOwo+ICAJaW50IGRhdGFf
c2l6ZTEsIGRhdGFfc2l6ZTIsIG9vYl9zaXplMSwgb29iX3NpemUyOwo+ICAJaW50IHJldCwgcmVn
X29mZiA9IEZMQVNIX0JVRl9BQ0MsIHJlYWRfbG9jID0gMDsKPiArCWludCByYXdfY3cgPSBjdzsK
PiAgCj4gIAluYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBOVUxMLCAwKTsKPiAgCWhv
c3QtPnVzZV9lY2MgPSBmYWxzZTsKPiAgCj4gKwlpZiAobmFuZGMtPnByb3BzLT5xcGljX3YyKQo+
ICsJCXJhd19jdyA9IGVjYy0+c3RlcHMgLSAxOwo+ICsKPiAgCWNsZWFyX2JhbV90cmFuc2FjdGlv
bihuYW5kYyk7Cj4gIAlzZXRfYWRkcmVzcyhob3N0LCBob3N0LT5jd19zaXplICogY3csIHBhZ2Up
Owo+IC0JdXBkYXRlX3J3X3JlZ3MoaG9zdCwgMSwgdHJ1ZSwgY3cpOwo+ICsJdXBkYXRlX3J3X3Jl
Z3MoaG9zdCwgMSwgdHJ1ZSwgcmF3X2N3KTsKPiAgCWNvbmZpZ19uYW5kX3BhZ2VfcmVhZChjaGlw
KTsKPiAgCj4gIAlkYXRhX3NpemUxID0gbXRkLT53cml0ZXNpemUgLSBob3N0LT5jd19zaXplICog
KGVjYy0+c3RlcHMgLSAxKTsKPiBAQCAtMTcxMSw3ICsxNzE1LDcgQEAgcWNvbV9uYW5kY19yZWFk
X2N3X3JhdyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAg
CQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgY3csIDMsIHJlYWRfbG9jLCBvb2Jfc2l6ZTIsIDEp
Owo+ICAJfQo+ICAKPiAtCWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwgZmFsc2UsIGN3KTsKPiAr
CWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwgZmFsc2UsIHJhd19jdyk7Cj4gIAo+ICAJcmVhZF9k
YXRhX2RtYShuYW5kYywgcmVnX29mZiwgZGF0YV9idWYsIGRhdGFfc2l6ZTEsIDApOwo+ICAJcmVn
X29mZiArPSBkYXRhX3NpemUxOwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
