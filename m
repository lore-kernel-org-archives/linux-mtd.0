Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73FACA0FED
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ue72lLHp7GDxwuweaOPxziSCVKnfMZFe9Ea9pLm09c=; b=k30sAIM1v3JHZ2
	cax/KfUbNp/22L5smDABAiLrNDP7xDflSAoQilvpZh9C2IMDH9JrJ+K2Ki6wbxD1nWOH8xy7NZ0rT
	EwswbcYmicwknmDCGK8tcLYZhZ0WIvq/Y1h39ML8K5hL56gNOJjEMT6ezz9icOpfRQorNPJYbzTFw
	nQ8O9qD6cv+zTvKmRzxEW/lYzdkQztwh/GyUpOaQUxf2q8/crIAKEkEhYaHWyPSzmwJo7eLJxBRzt
	tPJLCkk8jKUKr7hivshLSy0n4FQTG1f2XsiU5tXmYift7FRDNNuHnFT7qfaOhMzjQqMaZ4mHgHQxy
	5aqKXwfEyP5ApIA5fOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vK-00000008mvk-3H4f;
	Tue, 09 Sep 2025 17:14:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwmi-00000006q1H-1vmg
	for linux-mtd@lists.infradead.org;
	Tue, 09 Sep 2025 11:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A668460202;
	Tue,  9 Sep 2025 11:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D883FC4CEF4;
	Tue,  9 Sep 2025 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757418315;
	bh=I1Zr6GfPdUae0GCJN0Q4GLwwgUaClw/TDrb4ATn1Wi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D0O9oSA9/kDnGADolh+NtrobV41APUI0gxZCt+g98Jkheqv0ld0VPIQw1y5ipZDdK
	 pEViCp+8jlAP8bmYhdzaIa+4FD2LZa8UIEnHKf919YjoRYWPhS5ERwXTcbibsQcA7R
	 Q8/mdKoBIR9VcFwcRjENaO0NidjCVX+8aPaR7hdWeC44z0OtF/pG45H0i9KU5TLk7L
	 sywWS3Kzl3VSFwALy304kEI2G3Tyl1mdrIX5kRQiPy1lGMS73qVJSCGF3BOgE/SzW6
	 v2aUV6EIqb+HNh1vucshaCtzZmCacsU2gXQsuf4J8xFMIRfJkzeBgaCdkbCUZZU9CD
	 qbRWiN1P80xAg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,  Rahul Kumar
 <rk0006818@gmail.com>,  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd
 <linux-mtd@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-kernel-mentees@lists.linux.dev,
  Shuah Khan <skhan@linuxfoundation.org>,  pratyush <pratyush@kernel.org>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
In-Reply-To: <93578759.11447.1757322260340.JavaMail.zimbra@nod.at>
References: <20250908070124.2647038-1-rk0006818@gmail.com>
	<87tt1djtot.fsf@bootlin.com>
	<93578759.11447.1757322260340.JavaMail.zimbra@nod.at>
Date: Tue, 09 Sep 2025 13:45:12 +0200
Message-ID: <mafs08qinn92v.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

T24gTW9uLCBTZXAgMDggMjAyNSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgo+PiBBbjogIlJhaHVsIEt1bWFyIiA8cmswMDA2ODE4QGdtYWls
LmNvbT4KPj4+IC0Jc3RybmNweShidWYsIHNtX2F0dHItPmRhdGEsIHNtX2F0dHItPmxlbik7Cj4+
PiAtCXJldHVybiBzbV9hdHRyLT5sZW47Cj4+PiArCW1lbWNweShidWYsIHNtX2F0dHItPmRhdGEs
IHNtX2F0dHItPmxlbik7Cj4+PiArCWJ1ZltzbV9hdHRyLT5sZW5dID0gJ1wwJzsKPj4+ICsJcmV0
dXJuIHNtX2F0dHItPmxlbiArIDE7Cj4+IAo+PiBBcmUgd2Ugc3VyZSB0aGUgYnVmZmVyIGlzIGFs
d2F5cyBzbV9hdHRyLT5sZW4gKyAxIGxvbmc/CgpZZWFoLCB0aGF0IHdhcyB3aGF0IEkgd2FzIHdv
bmRlcmluZyBvbiB0aGUgb3JpZ2luYWwgcGF0Y2ggdG9vLiBQb2tpbmcKYXJvdW5kIHRoZSBjb2Rl
LCBJIHNlZSBpbiBkZXZfYXR0cl9zaG93KCkgdGhhdDoKCglpZiAoZGV2X2F0dHItPnNob3cpCgkJ
cmV0ID0gZGV2X2F0dHItPnNob3coZGV2LCBkZXZfYXR0ciwgYnVmKTsKCWlmIChyZXQgPj0gKHNz
aXplX3QpUEFHRV9TSVpFKSB7CgkJcHJpbnRrKCJkZXZfYXR0cl9zaG93OiAlcFMgcmV0dXJuZWQg
YmFkIGNvdW50XG4iLAoJCQkJZGV2X2F0dHItPnNob3cpOwoJfQoKU28gSSBzdXBwb3NlIHRoZSBi
dWZmZXIgaXMgUEFHRV9TSVpFIGxvbmcsIHRob3VnaCB0aGUgc2hvdygpIEFQSSBpcwpraW5kYSBw
b29yIGZvciBub3QgcmVwb3J0aW5nIHRoZSBzaXplIGV4cGxpY2l0bHkuIElmIHdlIGRvIHJlYWxs
eSB3YW50CnRvIG1ha2UgdGhpcyBzYWZlciwgSSBzdXBwb3NlIHRoaXMgaXMgd2hhdCBzaG91bGQg
YmUgY2hlY2tlZCBmb3IuIFRoZQpzdHJuY3B5IHdpdGggbGVuZ3RoIGJlaW5nIGxpbWl0ZWQgdG8g
dGhlIHN0cmluZyBsZW5ndGggaW5zdGVhZCBvZiBidWZmZXIKbGVuZ3RoIGlzIGNvbXBsZXRlbHkg
dXNlbGVzcy4KCkFueXdheSwgaGVyZSBzbV9hdHRyLT5kYXRhIGlzIChTTV9TTUFMTF9QQUdFIC0g
U01fQ0lTX1ZFTkRPUl9PRkZTRVQgKyAxKQpieXRlcyBsb25nLCB3aGljaCBzaG91bGQgYWRkIHVw
IHRvIDE2OCBieXRlcywgd2hpY2ggaXMgcGVyZmVjdGx5IHNhZmUgdG8KanVzdCBjb3B5LgoKPgo+
IENhbiB3ZSBwbGVhc2UganVzdCBzdG9wIG1lc3Npbmcgd2l0aCBwZXJmZWN0bHkgZmluZSBjb2Rl
Pwo+IEknbSBzaWNrIG9mIHRoZSB3YXIgb24gc3RyaW5nIGZ1bmN0aW9ucy4KPiBGaXJzdCB3ZSBo
YWQgdG8gcmVwbGFjZSBldmVyeXRoaW5nIHdpdGggc3RybmNweSgpLCB0aGVuIHN0cmxjcHkoKSwK
PiB0aGVuIHN0cnNjcHkoKSwgLi4uCgpJIGhhZCBhIHNpbWlsYXIgcmVhY3Rpb24gaW5pdGFsbHkg
dG9vLiBCdXQgVEJIIGlmIHRoZSBwYXRjaCBtYWRlIHRoZQpjb2RlIGFjdHVhbGx5IHNhZmVyIEkg
cmVja29uIGl0IHdvdWxkIGJlIGZpbmUuIExvbmcgdGVybSwgdGhlc2Uga2luZCBvZgp0aGluZ3Mg
Y2FuIGhlbHAgcHJldmVudCB1bmV4cGVjdGVkIGJ1Z3MuIEJ1dCBoZXJlIHdlIGRvbid0IGV2ZW4g
a25vdyBob3cKbGFyZ2UgYnVmIGlzIHNvIHRoZXJlIGlzIG5vIHBvaW50IGluIHVzaW5nIGFueSBv
ZiB0aGUgZmFuY3kgc3RyaW5nCmZ1bmN0aW9ucy4gQSBwbGFpbiBzdHJjcHkoYnVmLCBzdHIpIGlz
IGp1c3QgYXMgInNhZmUiIGFzIGEKc3RybmNweShidWYsIHN0ciwgc3RybGVuKHN0cikpLCBvciBh
bnkgb3RoZXIgZmFuY3kgdmFyaWF0aW9uLgoKU28geWVhaCwgSSBkb24ndCB0aGluayB0aGlzIHBh
dGNoIGRvZXMgbXVjaC4uLgoKVGhhdCBzYWlkLCBSYWh1bCB5b3Ugc2VlbSBsaWtlIGEgbmV3IGNv
bnRyaWJ1dG9yLiBJIHdvdWxkIHNheSBkb24ndCBiZQp0b28gZGlzY291cmFnZWQuIE5vdCBldmVy
eSBwYXRjaCBlbmRzIHVwIGdvaW5nIHRocm91Z2guIEkgaGF2ZSBoYWQgbXkKZmFpciBzaGFyZSBv
ZiByZWplY3RlZCBwYXRjaGVzLiBUYWtlIHRoaXMgYXMgYSBsZWFybmluZyBhbmQga2VlcCBsb29r
aW5nCmZvciBvdGhlciBpbXByb3ZlbWVudHMgOi0pCgo+Cj4gRG9uJ3QgZ2V0IG1lIHdyb25nLCBJ
J20gYWxsIGZvciBoYXJkZW5pbmcgY29kZSBwYXRocyB3aGVyZQo+IHN0cmluZ3MgYXJlIGFyYml0
cmFyeSBpbnB1dCwgYnV0IGluIG1hbnkgb2YgdGhlc2UgY2FzZXMgYWxsIHN0cmluZ3MKPiBhcmUg
bm8gaW5wdXQgb3IgYWxyZWFkeSBzYW5pdGl6ZWQuCgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFk
YXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
