Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1559BC79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 03:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Message-ID:Date:
	Mime-Version:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYWO0iklVx5ApNDrCLxd8LNqbgDTAVnb2y3+QVkxV+Q=; b=sDQq3jtjxSQ8pP
	pCx60S1m9H7+foo/QxQoEnIOhdqyG/tkDUOa9xg/zq+iJpYTSCgPZhHu7AXV0GemxuAshjQMHsHyV
	iY24+wf7mRuBZNVh1H7nOZpOYM4X1D2PeKivrlhtSiFm8oGsu4kg2VZiFTSCnpBqiqf3zDuEgORtr
	DSgP2S4gXretZakDseoNSjc0XWiCDPbkvVI31F+zIvIUJniw6kNdPfnOa/ibykWKkDCtt94qOTxK1
	3zjAsbx75+PHj4emKca9a0U5qolAYLxaBMQ62MiDHs6uWfX3aBJFK/D9R42dOnlUx7PtWolqtSp4p
	/paRFb/+C1AsBGqTGREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mbS-00000007ytQ-3rV6;
	Tue, 08 Sep 2026 03:34:34 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mbP-00000007ysq-3I9H
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 03:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788838467; bh=KWjiqmx5jxUmfL2zWElh8jvFeL+eqa+Egvh9KBljaIA=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=oTBg6t0KBBo6hS8nIVneR/eoL5SkuRSxsTkLl365+T2Rcwoz9j8C1TP0pCq0wN4ay
	 1dGJAnKwtIGenrkeqTEjRerTdMxIjs22PNoN9EowO6iBhTBooM1r5SVf0MFKx00l4m
	 icm/W+YaNOVNcq2b1hieYClt+MFNkZPobOT7tqdY=
X-QQ-XMRINFO: MSVp+SPm3vtSYucI6VcG6/eGeelPZU7wMQ==
X-QQ-XMAILINFO: MOQpAxjIVJuk8VRF4XCPuVCBcIz7GlyDgYHv9fKdfmdbsCU6SCUGoDq+7Uv0s1
	 vjiYpyEhDW+fKtvc6MOOT/ZcAU7is4iZU6/DYNMTMiowFuxdlkbkCVJeWiLx0HYQcLF8JxoFai34V
	 fhKf3yYAppZsHBcWQzC+3oZZe1c54Munl2sPQc+J6DNThSIpo6L8CXiA46FR6LQVge4Z4WgbHLI7V
	 QubSzwF+9YgLoIZ0C3MomnHuuSg0nDR8uBE5JmK/Bbp1EcuMaTv6n5qs6q1iUBdDyMjDWUVo9lR7G
	 YKICStWRulmmP3WYeAKM1nbyWrsl/iVzQt1M4XASrzOm8Tp/PyZP7vxNq/toC3DsT6C2v+oCNzina
	 1awQkKif0af6IUioHH1+VUBlAdV78j9jUgVZNkyMLRydSVGyc3H63cvEKtpGnhR+x2BdJ2/TuMN5D
	 fHA3j8yIthu1l29SogmnVNlbAqxg+7yEp92boCQmE5mg0nBkgrpW3Yh1TCTyVqsdm0BsHQTut7i3/
	 8uVGk09RlrgwaNtgBbbvUdCbOVj0Y8xLUbEYB2FE3Zy8CqBXUC6KUIlFDpq3MiztUmsYG2jbi0HIo
	 xT44HwZQUahkwqjrMlhSjexbVvD/YbV+ZdbHpE0+posbR6yQ/n3K2wlzmL7mqeLZqrNrLq88VrXdx
	 6jTtjm754BjYROUAIFAvdqQy6tq6w/wns4Jb1mw8osXVhxrsA3hGaCIYtWa7whlOfgu3mwcHpNG/c
	 tZFVPCblftNWiNY3fTzC82musKCtl8FzJc6T7l9e02lqVoXSR4aG6bWwrrMCvyBpvPno3h+RsfB2n
	 cM7Q1T30UKoMjErEGV+dZyat+UZJ75doLyoWYHURRTapQLxbhO/CId++DDjwlWHX9XS1j+kgkuDPt
	 keEfTrG4zugZiBkruoPnS4q1Ijc8DQKGJjWr+5gp/Riu7I/RMtpjFjPxHUlkUTToJ0BFMorFDSXJg
	 XlsVTbvw2AIqxTsTEw40q9ziYClbXMdEfPd7OUGv0gb9iaXJdfLlZIcixoYrb6omkgapMPeYhQUxK
	 kNupiB4pVyOntl+rQKTFRBDKb5YLyBtlTWzESk6/Ottv074s=
From: "=?utf-8?B?MTc2ODMxNTMwNw==?=" <1768315307@qq.com>
To: "=?utf-8?B?TWlxdWVsIFJheW5hbA==?=" <miquel.raynal@bootlin.com>
Cc: "=?utf-8?B?VmlnbmVzaCBSYWdoYXZlbmRyYQ==?=" <vigneshr@ti.com>, "=?utf-8?B?UmljaGFyZCBXZWluYmVyZ2Vy?=" <richard@nod.at>, "=?utf-8?B?bGludXgtbXRk?=" <linux-mtd@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spinand: cache the last read page to avoid redundant SPI operations
Mime-Version: 1.0
Date: Tue, 8 Sep 2026 11:34:26 +0800
X-Priority: 3
Message-ID: <tencent_B6583056E4084CFC16E65D3CE8099ABBC906@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>
	<87jyoxw8a3.fsf@bootlin.com>
In-Reply-To: <87jyoxw8a3.fsf@bootlin.com>
X-QQ-mid: xmsezc43-0t1788838466tqnxzbzy5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_203432_138004_7901CB4B 
X-CRM114-Status: GOOD (  23.93  )
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

SGkgTWlxdWVsLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBTZW50IHYyIHdpdGggdGhlIGZpeGVz
LgoKPiB3aHkgd291bGQgeW91IHVzZSBtdGRibG9jayBvbiB0b3Agb2YgYSBTUEkgTkFORD8gSXQg
c291bmRzIGxpa2UgYSB2ZXJ5Cj4gYmFkIGNob2ljZS4gTWF5YmUgbXRkYmxvY2sgaXRzZWxmIGNv
dWxkIGJlIGltcHJvdmVkIHRvIGF2b2lkIDUxMkIKPiBhY2Nlc3NlcyBpbnN0ZWFkPwoKV2UgdXNl
IGEgcmVhZC1vbmx5IHNxdWFzaGZzIHJvb3RmcyBvbiBtdGRibG9jayBmb3IgU1BJIE5BTkQuIFRo
aXMgaXMKYSBtaW5pbWFsIGNvbmZpZ3VyYXRpb24gdGhhdCBhdm9pZHMgdGhlIGNvbXBsZXhpdHkg
b2YgVUJJL1VCSUZTIGZvcgphIHJlYWQtb25seSBwYXJ0aXRpb24sIGFuZCBpcyBjb21tb25seSB1
c2VkIGluIGVtYmVkZGVkIGRldmljZXMgbGlrZQpyb3V0ZXJzIGFuZCBJb1Qgc3lzdGVtcy4KClRo
ZSBibG9jayBsYXllcidzIDUxMi1ieXRlIHNlY3RvciBzaXplIGlzIG5vdCBlYXNpbHkgY29uZmln
dXJhYmxlIHBlcgpkZXZpY2UsIGFuZCB0aGUgZHJpdmVyIGFscmVhZHkgaG9sZHMgdGhlIGZ1bGwg
cGFnZSBpbiBpdHMgYm91bmNlIGJ1ZmZlcgphZnRlciBlYWNoIHJlYWQuIEFkZGluZyBhIGxpZ2h0
d2VpZ2h0IGNhY2hlIGF2b2lkcyB0aGUgcmVkdW5kYW50IFNQSQpyZWFkcyB3aXRob3V0IGFueSBh
ZGRpdGlvbmFsIGhhcmR3YXJlIGNvc3QuCgo+IFBzZXVkb255bXMgYXJlIG5vdCBhbGxvd2VkIGlu
IHRoZSBMaW51eCBrZXJuZWwuCgpGaXhlZCBpbiB2Mi4KCj4gU3B1cmlvdXMgY2hhbmdlLgoKRml4
ZWQgaW4gdjIuCgpUaGFua3MsClpvbmd6aGVuIEZlbmcKCgoK5Y6f5aeL6YKu5Lu2CuWPkeS7tuS6
uu+8mk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CuWPkeS7tuaXtumX
tO+8mjIwMjblubQ55pyIN+aXpSAyMDozMwrmlLbku7bkurrvvJpmenogPDE3NjgzMTUzMDdAcXEu
Y29tPgrmioTpgIHvvJpWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+LCBSaWNo
YXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiwgbGludXgtbXRkIDxsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZz4sIGxpbnV4LWtlcm5lbCA8bGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZz4K5Li76aKY77yaUmU6IFtQQVRDSF0gbXRkOiBzcGluYW5kOiBjYWNoZSB0aGUgbGFzdCBy
ZWFkIHBhZ2UgdG8gYXZvaWQgcmVkdW5kYW50IFNQSSBvcGVyYXRpb25zCgoKSGVsbG8sCgpPbsKg
MDcvMDkvMjAyNsKgYXTCoDE5OjEwOjQwwqArMDgswqBmenrCoDwxNzY4MzE1MzA3QHFxLmNvbT7C
oHdyb3RlOgoKPsKgV2hlbsKgc3F1YXNoZnPCoHJlYWRzwqBmaWxlc8KgdGhyb3VnaMKgbXRkYmxv
Y2sswqB0aGXCoG10ZGJsb2NrwqBsYXllcgo+wqBzcGxpdHPCoEkvT8KgaW50b8KgNTEyLWJ5dGXC
oHNlY3RvcnMuwqBGb3LCoGHCoDRLLXBhZ2XCoFNQScKgTkFORCzCoHRoaXMKPsKgbWVhbnPCoHJl
YWRpbmfCoHRoZcKgc2FtZcKgcGFnZcKgOMKgdGltZXPCoCg0MDk2wqAvwqA1MTIpLMKgZ2VuZXJh
dGluZ8KgN3gKPsKgcmVkdW5kYW50wqBTUEnCoHJlYWQtZnJvbS1jYWNoZcKgb3BlcmF0aW9ucy7C
oEVhY2jCoHN1Y2jCoG9wZXJhdGlvbgo+wqBpbnZvbHZlc8KgYcKgZnVsbMKgU1BJwqBidXPCoHRy
YW5zYWN0aW9uLMKgc2lnbmlmaWNhbnRsecKgc2xvd2luZ8KgZG93bgo+wqBib290wqB0aW1lwqBh
bmTCoGZpbGXCoGFjY2Vzcy4KPgo+wqBDYWNoZcKgdGhlwqBsYXN0wqBzdWNjZXNzZnVsbHnCoHJl
YWTCoHBhZ2XCoGluwqBzcGluYW5kX2RldmljZcKgdG/CoGF2b2lkCj7CoHRoZXNlwqByZWR1bmRh
bnTCoG9wZXJhdGlvbnMuwqBXaGVuwqB0aGXCoHNhbWXCoHt0YXJnZXQswqBlcmFzZWJsb2NrLAo+
wqBwYWdlfcKgaXPCoHJlcXVlc3RlZMKgY29uc2VjdXRpdmVseSzCoHRoZcKgZGF0YcKgaXPCoHNl
cnZlZMKgZGlyZWN0bHkKPsKgZnJvbcKgdGhlwqBib3VuY2XCoGJ1ZmZlcsKgKGRhdGFidWYpwqB2
aWHCoG1lbWNweSzCoHNraXBwaW5nwqB0aGXCoFNQSQo+wqB0cmFuc2FjdGlvbsKgZW50aXJlbHku
Cj4KPsKgVGhlwqBjYWNoZcKgaXPCoGludmFsaWRhdGVkwqBvbsKgd3JpdGXCoGFuZMKgZXJhc2XC
oG9wZXJhdGlvbnMuwqBSQVfCoHJlYWRzLAo+wqBPT0LCoHJlYWRzLMKgYW5kwqBjb250aW51b3Vz
wqByZWFkc8KgYXJlwqBleGNsdWRlZMKgZnJvbcKgY2FjaGluZ8KgdG8KPsKgbWFpbnRhaW7CoGNv
cnJlY3RuZXNzLgoKV2h5wqB3b3VsZMKgeW91wqB1c2XCoG10ZGJsb2NrwqBvbsKgdG9wwqBvZsKg
YcKgU1BJwqBOQU5EP8KgSXTCoHNvdW5kc8KgbGlrZcKgYcKgdmVyeQpiYWTCoGNob2ljZS4KCk1h
eWJlwqBtdGRibG9ja8KgaXRzZWxmwqBjb3VsZMKgYmXCoGltcHJvdmVkwqB0b8KgYXZvaWTCoDUx
MkLCoGFjY2Vzc2VzwqBpbnN0ZWFkPwoKPsKgU2lnbmVkLW9mZi1ieTrCoGZ6esKgPDE3NjgzMTUz
MDdAcXEuY29tPgoKVW5mb3J0dW5hdGVseSzCoGZvcsKgbGljZW5zaW5nwqBhbmTCoGNvcHlyaWdo
dMKgcmVhc29ucyzCoHBzZXVkb255bXPCoGFyZcKgbm90CmFsbG93ZWTCoGluwqB0aGXCoExpbnV4
wqBrZXJuZWwuCgo+wqAtLS0KPsKgwqBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmPCoHzCoDM2
wqArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPsKgwqBpbmNsdWRlL2xpbnV4
L210ZC9zcGluYW5kLmjCoHzCoMKgOcKgKysrKysrKysrCj7CoMKgMsKgZmlsZXPCoGNoYW5nZWQs
wqA0NMKgaW5zZXJ0aW9ucygrKSzCoDHCoGRlbGV0aW9uKC0pCj4KPsKgZGlmZsKgLS1naXTCoGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jwqBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUu
Ywo+wqBpbmRleMKgOGJmOTMwMWYyNWU3Li5mYzA4MjEyN2JkYTjCoDEwMDY0NAo+wqAtLS3CoGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj7CoCsrK8KgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPsKgQEDCoC01NTcsN8KgKzU1NywxNMKgQEDCoHN0YXRpY8KgaW50wqBzcGluYW5k
X3JlYWRfZnJvbV9jYWNoZV9vcChzdHJ1Y3TCoHNwaW5hbmRfZGV2aWNlwqAqc3BpbmFuZCwKPsKg
wqAgwqDCoMKgwqByZXEtPm9vYmxlbik7Cj7CoMKgIGVsc2UKPsKgwqAgbWVtY3B5KHJlcS0+b29i
YnVmLmluLMKgc3BpbmFuZC0+b29iYnVmwqArwqByZXEtPm9vYm9mZnMsCj7CoC0gwqDCoMKgwqDC
oMKgwqByZXEtPm9vYmxlbik7Cj7CoCsgcmVxLT5vb2JsZW4pOwoKU3B1cmlvdXPCoGNoYW5nZS4K
Cj7CoCsgfQo+wqArCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
