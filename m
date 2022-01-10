Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F68C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 23:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k/tfQuvDEzPJQjLzdYs0E7VbMzr286buHwEhtXVULlw=; b=rRDusySjVSse79pXmxzbmWqoM8
	KQDvtPF+yHUt/p80D3C61DXknZ5EYdSKWONunHh2I61OG0gLJCKTW5RkByubbCH85k8RUtmgT5j9z
	FJznlGgN/nVRDpUg0oSDjtOqXJaaPScU8QUXNvKvxRG3iPiafHLdkp3dsHTgGHDkNz9CIY4MkxD7B
	Mj3e8itD8Q+8jFURCMpAZ90kDJxqY5zw4fXxDKu8/5siiXrj/4fzkJo9FAX4UvXMgG4qdbraw8Hss
	oFqI/II5MbZqFTSvCiXZ7t9vemZEgMPiZqZCmMBsrd0TWSjhC4l69n7eBMtpVJJ8Hx0MtbRRjCL1w
	semKRdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n741B-00DrZm-Ai; Mon, 10 Jan 2022 23:24:01 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7417-00DrUr-Mb
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 23:23:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A39DB62DA5E9;
 Tue, 11 Jan 2022 00:23:46 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BniRRL-__YE9; Tue, 11 Jan 2022 00:23:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C774F62DA5FB;
 Tue, 11 Jan 2022 00:23:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id g8Rg32oBvwvf; Tue, 11 Jan 2022 00:23:45 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 98F0862DA5E9;
 Tue, 11 Jan 2022 00:23:45 +0100 (CET)
Date: Tue, 11 Jan 2022 00:23:45 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <361758697.248157.1641857025490.JavaMail.zimbra@nod.at>
In-Reply-To: <20211227032246.2886878-13-chengzhihao1@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-13-chengzhihao1@huawei.com>
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Add all fastmap pebs into 'ai->fastmap' when
 fm->used_blocks>=2
Thread-Index: 51VyhLwOOPkpCJ1OyaFQh0d2LFOdvw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_152358_085578_6AA4C6EE 
X-CRM114-Status: GOOD (  12.33  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
Ik1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFn
aGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJtY29xdWVsaW4gc3RtMzIiIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPiwgImtpcmlsbCBzaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBs
aW51eC5pbnRlbC5jb20+LCAiU2FzY2hhIEhhdWVyIgo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRl
Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogTW9u
dGFnLCAyNy4gRGV6ZW1iZXIgMjAyMSAwNDoyMjo0Mwo+IEJldHJlZmY6IFtQQVRDSCB2NiAxMi8x
NV0gdWJpOiBmYXN0bWFwOiBBZGQgYWxsIGZhc3RtYXAgcGVicyBpbnRvICdhaS0+ZmFzdG1hcCcg
d2hlbiBmbS0+dXNlZF9ibG9ja3M+PTIKCj4gRmFzdG1hcCBwZWJzKHBudW0gPj0gVUJJX0ZNX01B
WF9TVEFSVCkgd29uJ3QgYmUgYWRkZWQgaW50byAnYWktPmZhc3RtYXAnCj4gd2hpbGUgYXR0YWNo
aW5nIHViaSBkZXZpY2UgaWYgJ2ZtLT51c2VkX2Jsb2NrcycgaXMgZ3JlYXRlciB0aGFuIDIsIHdo
aWNoCj4gbWF5IGNhdXNlIHdhcm5pbmcgZnJvbSAndWJpX2Fzc2VydCh1YmktPmdvb2RfcGViX2Nv
dW50ID09IGZvdW5kX3BlYnMpJzoKPiAKPiAgVUJJIGFzc2VydCBmYWlsZWQgaW4gdWJpX3dsX2lu
aXQgYXQgMTg3OCAocGlkIDI0MDkpCj4gIENhbGwgVHJhY2U6Cj4gICAgdWJpX3dsX2luaXQuY29s
ZCsweGFlLzB4MmFmIFt1YmldCj4gICAgdWJpX2F0dGFjaCsweDFiMC8weDc4MCBbdWJpXQo+ICAg
IHViaV9pbml0KzB4MjNhLzB4M2FkIFt1YmldCj4gICAgbG9hZF9tb2R1bGUrMHgyMmQyLzB4MjQz
MAo+IAo+IFJlcHJvZHVjZToKPiAgSUQ9IjB4MjAsMHgzMywweDAwLDB4MDAiICMgMTZNIDE2S0Ig
UEVCLCA1MTIgcGFnZQo+ICBtb2Rwcm9iZSBuYW5kc2ltIGlkX2J5dGVzPSRJRAo+ICBtb2Rwcm9i
ZSB1YmkgbXRkPSIwLDAiIGZtX2F1dG9jb252ZXJ0ICAjIEZhc3RtYXAgdGFrZXMgMiBwZWJzCj4g
IHJtbW9kIHViaQo+ICBtb2Rwcm9iZSB1YmkgbXRkPSIwLDAiIGZtX2F1dG9jb252ZXJ0ICAjIEF0
dGFjaCBieSBmYXN0bWFwCj4gCj4gQWRkIGFsbCB1c2VkIGZhc3RtYXAgcGVicyBpbnRvIGxpc3Qg
J2FpLT5mYXN0bWFwJyB0byBtYWtlIHN1cmUgdGhleSBjYW4KPiBiZSBjb3VudGVkIGludG8gJ2Zv
dW5kX3BlYnMnLgo+IAo+IEZpeGVzOiBmZGYxMGVkNzEwYzBhYSAoInViaTogUmV3b3JrIEZhc3Rt
YXAgYXR0YWNoIGJhc2UgY29kZSIpCj4gU2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiBkcml2ZXJzL210ZC91YmkvZmFzdG1hcC5jIHwg
MzUgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvdWJpL2Zhc3RtYXAuYyBiL2RyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLmMKPiBpbmRleCA2
YjVmMWZmZDk2MWIuLjAxZGNkZDk0YzlkMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91Ymkv
ZmFzdG1hcC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAuYwo+IC8qKgo+ICAqIHVi
aV9zY2FuX2Zhc3RtYXAgLSBzY2FuIHRoZSBmYXN0bWFwLgo+ICAqIEB1Ymk6IFVCSSBkZXZpY2Ug
b2JqZWN0Cj4gQEAgLTg2NSw3ICs4NDcsNiBAQCBpbnQgdWJpX3NjYW5fZmFzdG1hcChzdHJ1Y3Qg
dWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QKPiB1YmlfYXR0YWNoX2luZm8gKmFpLAo+IAlzdHJ1Y3Qg
dWJpX3ZpZF9oZHIgKnZoOwo+IAlzdHJ1Y3QgdWJpX2VjX2hkciAqZWNoOwo+IAlzdHJ1Y3QgdWJp
X2Zhc3RtYXBfbGF5b3V0ICpmbTsKPiAtCXN0cnVjdCB1YmlfYWluZl9wZWIgKmFlYjsKPiAJaW50
IGksIHVzZWRfYmxvY2tzLCBwbnVtLCBmbV9hbmNob3IsIHJldCA9IDA7Cj4gCXNpemVfdCBmbV9z
aXplOwo+IAlfX2JlMzIgY3JjLCB0bXBfY3JjOwo+IEBAIC04NzUsMTcgKzg1Niw2IEBAIGludCB1
Ymlfc2Nhbl9mYXN0bWFwKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdAo+IHViaV9hdHRh
Y2hfaW5mbyAqYWksCj4gCWlmIChmbV9hbmNob3IgPCAwKQo+IAkJcmV0dXJuIFVCSV9OT19GQVNU
TUFQOwo+IAo+IC0JLyogQ29weSBhbGwgKHBvc3NpYmxlKSBmYXN0bWFwIGJsb2NrcyBpbnRvIG91
ciBuZXcgYXR0YWNoIHN0cnVjdHVyZS4gKi8KPiAtCWxpc3RfZm9yX2VhY2hfZW50cnkoYWViLCAm
c2Nhbl9haS0+ZmFzdG1hcCwgdS5saXN0KSB7Cj4gLQkJc3RydWN0IHViaV9haW5mX3BlYiAqbmV3
Owo+IC0KPiAtCQluZXcgPSBjbG9uZV9hZWIoYWksIGFlYik7Cj4gLQkJaWYgKCFuZXcpCj4gLQkJ
CXJldHVybiAtRU5PTUVNOwo+IC0KPiAtCQlsaXN0X2FkZCgmbmV3LT51Lmxpc3QsICZhaS0+ZmFz
dG1hcCk7Cj4gLQl9Cj4gLQoKc2Nhbl9haS0+ZmFzdG1hcCBtYXkgY29udGFpbiBhbHNvIG9sZCBm
YXN0bWFwIFBFQnMuCkluIHRoZSBhcmVhIDwgVUJJX0ZNX01BWF9TVEFSVCB5b3UgY2FuIGZpbmQg
b3V0ZGF0ZWQgZmFzdG1hcCBQRUJzLgplLmcuIGFmdGVyIHBvd2VyLWN1dC4KVGhhdCdzIHdoeSBz
Y2FuX2FpLT5mYXN0bWFwIGlzIGNvcGllZCBpbnRvIGFpLT5mYXN0bWFwLgpMYXRlciBpbiB1Ymlf
d2xfaW5pdCgpIHRoZXNlIG91dGRhdGVkIFBFQnMgd2lsbCBnZXQgZXJhc2VkLgpTbywgeW91IGNh
bm5vdCByZW1vdmUgdGhpcyBjb2RlLgoKQnV0IEkgZnVsbHkgYWdyZWUgd2l0aCB5b3UgdGhhdCB0
aGUgZm0tPnVzZWRfYmxvY2tzID4gMSBjYXNlIGlzIG5vdCBjb3JyZWN0LgpJIGZlYXIgaWYgc2Nh
bl9haS0+ZmFzdG1hcCBjb250YWlucyBvbGQgZmFzdG1hcCBQRUJzIGFuZCBmbS0+dXNlZF9ibG9j
a3MgaXMgPiAxCndlIG5lZWQgdG8gZmFsbCBiYWNrIHRvIHNjYW5uaW5nIG1vZGUgd2hpbGUgYXR0
YWNoaW5nLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
