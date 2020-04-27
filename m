Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B673BC4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:22:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A17F20775
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EoS5fKqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A17F20775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7JTR66zGxiA5htklKR4mWDP0vSTS/jCNe/sNQPnlxk=; b=EoS5fKqgBda6KO
	vyU4/LZMJHYxwcQF3iQtqxfcSfgyUODxAGRdM2DLi4S8EM85ZB5RFFeSk84oT79/YGCkb1K6/N3Uw
	u6e2ZS14iUf4qOtZBeRewqaIuzzGNZz2Uien2nn5G0nXnH5Ss6wHP5Xv/gscUmbpctWrP/5QYmmLM
	uMLSrQbJ95UNpAvClkWw1qG8D0p4aDUazj2A3vP66RsfdNWrKTRo7zyhaXdMu0D4ApQFBn5h+47E4
	jqrW5+4jJiWj8YAhXrD55h+XXKi53U86YoOIYchQ58K9M9uXdb11BW9732Dob4mFqWQb20n/qqJz3
	K5Q1HB+VrEIFJ7/rEoxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8Oe-0004sh-4w; Mon, 27 Apr 2020 18:22:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8Ob-0004rH-5Z
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:22:22 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6483A20005;
 Mon, 27 Apr 2020 18:22:13 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:22:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS
 for timeouts
Message-ID: <20200427202212.0235d987@xps13>
In-Reply-To: <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_112221_347254_ECCBE5AD 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKMjAyMCAxNzo1NzozMCArMDIwMDoKCj4gVGhpcyBw
YXRjaCByZW1vdmVzIHRoZSBjb25zdGFudCBGTUMyX1RJTUVPVVRfVVMuCj4gRk1DMl9USU1FT1VU
X01TIGlzIHNldCB0byA1IHNlY29uZHMgYW5kIHRoaXMgY29uc3RhbnQgaXMgdXNlZAo+IGVhY2gg
dGltZSB0aGF0IHdlIG5lZWQgdG8gd2FpdCAoZXhjZXB0IHdoZW4gdGhlIHRpbWVvdXQgdmFsdWUK
PiBpcyBzZXQgYnkgdGhlIGZyYW1ld29yaykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMTEgKysrKystLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IGluZGV4IGFiNTMzMTQuLmYxNTljMzkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IEBAIC0zNyw4ICszNyw3IEBACj4g
IC8qIE1heCBFQ0MgYnVmZmVyIGxlbmd0aCAqLwo+ICAjZGVmaW5lIEZNQzJfTUFYX0VDQ19CVUZf
TEVOCQkoRk1DMl9CQ0hEU1JTX0xFTiAqIEZNQzJfTUFYX1NHKQo+ICAKPiAtI2RlZmluZSBGTUMy
X1RJTUVPVVRfVVMJCQkxMDAwCj4gLSNkZWZpbmUgRk1DMl9USU1FT1VUX01TCQkJMTAwMAo+ICsj
ZGVmaW5lIEZNQzJfVElNRU9VVF9NUwkJCTUwMDAKPiAgCj4gIC8qIFRpbWluZ3MgKi8KPiAgI2Rl
ZmluZSBGTUMyX1RISVoJCQkxCj4gQEAgLTUyNSw5ICs1MjQsOSBAQCBzdGF0aWMgaW50IHN0bTMy
X2ZtYzJfaGFtX2NhbGN1bGF0ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqZGF0
YSwKPiAgCXUzMiBzciwgaGVjY3I7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCXJldCA9IHJlYWRsX3Jl
bGF4ZWRfcG9sbF90aW1lb3V0KGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLAo+IC0JCQkJCSBzciwg
c3IgJiBGTUMyX1NSX05XUkYsIDEwLAo+IC0JCQkJCSBGTUMyX1RJTUVPVVRfTVMpOwo+ICsJcmV0
ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKGZtYzItPmlvX2Jhc2UgKyBGTUMy
X1NSLAo+ICsJCQkJCQlzciwgc3IgJiBGTUMyX1NSX05XUkYsIDEsCj4gKwkJCQkJCTEwMDAgKiBG
TUMyX1RJTUVPVVRfTVMpOwoKSXMgdGhlIF9hdG9taWMgc3VmZml4IG5lZWRlZCBoZXJlPyBJZiB5
ZXMgaXQgd291bGQgZGVzZXJ2ZSBhIHNlcGFyYXRlCnBhdGNoIHdpdGggRml4ZXMvU3RhYmxlIHRh
Z3MuCgo+ICAJaWYgKHJldCkgewo+ICAJCWRldl9lcnIoZm1jMi0+ZGV2LCAiaGFtIHRpbWVvdXRc
biIpOwo+ICAJCXJldHVybiByZXQ7Cj4gQEAgLTEzMTUsNyArMTMxNCw3IEBAIHN0YXRpYyBpbnQg
c3RtMzJfZm1jMl93YWl0cmR5KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcg
dGltZW91dF9tcykKPiAgCS8qIENoZWNrIGlmIHRoZXJlIGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMg
dG8gdGhlIE5BTkQgZmxhc2ggKi8KPiAgCWlmIChyZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9h
dG9taWMoZm1jMi0+aW9fYmFzZSArIEZNQzJfU1IsIHNyLAo+ICAJCQkJCSAgICAgIHNyICYgRk1D
Ml9TUl9OV1JGLCAxLAo+IC0JCQkJCSAgICAgIEZNQzJfVElNRU9VVF9VUykpCj4gKwkJCQkJICAg
ICAgMTAwMCAqIEZNQzJfVElNRU9VVF9NUykpCj4gIAkJZGV2X3dhcm4oZm1jMi0+ZGV2LCAiV2Fp
dHJkeSB0aW1lb3V0XG4iKTsKPiAgCj4gIAkvKiBXYWl0IHRXQiBiZWZvcmUgUi9CIyBzaWduYWwg
aXMgbG93ICovCgpZb3UgY2hhbmdlIHRoZSB0aW1lb3V0cyBmcm9tIDFtcyB0byA1cy4KCk1heWJl
IDVzIGlzIGEgbGl0dGxlIGJpdCB0b28gbXVjaCBJTUhPIGJ1dCB3ZSBkb24ndCByZWFsbHkgY2Fy
ZSBhcyB0aGlzCmlzIGEgdGltZW91dC4gSG93ZXZlciAxbXMgaXMgdGlnaHQuIElmIHlvdSBhcmUg
Y2hhbmdpbmcgdGhpcyB2YWx1ZQpiZWNhdXNlIGl0IHRyaWdnZXJzIGVycm9yIChlZy4gd2hlbiB0
aGUgbWFjaGluZSBpcyBsb2FkZWQpLCB0aGVuIGl0IGlzCmEgZml4IGFuZCBzaG91bGQgYXBwZWFy
IGxpa2UgaXQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
