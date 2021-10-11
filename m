Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F14C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 17:16:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A0BF60462
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 17:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A0BF60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fA2yWbxXzguiSCtwYPVaq5PtKZ9D4i/5F92JG4lGkNQ=; b=YMYeJh/WcJXVJv
	n6Mk16O/ghCXx0uK9kGrHeOx8VxWm4MJ2+tNdGUwacX4x0SUm7zsDFgz/Y+Y8S5goRIOJnsQSOjSt
	vMwGH0AO0IX5aqjPanX6c9WjbWKoWU538Nn9mCRAW6C5rCq4IenZzHWE3I3eihpUzeHK0XgFkdGdJ
	t+DBdmEJyw7Kiu9WkKEeod3B4srbbtK7xP0hnz1lmaNloFXybLYtktULuLjw9hxjijyhIPQubYsCb
	cSHz9VknEn4IBTuaFmW+r59Y5ffwHAeptXxK9lvCUvcAb8ZiWjlN72fSE7PcbC4tjjg5PA2Kgyw8E
	Hg7mf/GPkOs9TUzURKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZyuP-00AClq-Hr; Mon, 11 Oct 2021 17:16:17 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZyuM-00AClB-JE
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 17:16:16 +0000
Received: by mail-ua1-x936.google.com with SMTP id 64so14144233uab.12
 for <linux-mtd@lists.infradead.org>; Mon, 11 Oct 2021 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=rbwXVzLSnjP76u9z9w7zaAbcIQeJPjoDtzZ4ruOwzOA=;
 b=OGg1rykewJNop/sfw5ZuPEBFy3WeaH92iRO15P7m+G6sXo6Q76QFBifhbN/Z6GJh1D
 3tB6/PL7niFtKrcL0pttZ1VK4ZwjRQsrTCDcEb8jCxNDgBY9xt2PeMDAjX2cTzVpB1oE
 //ZnDhM+tsTZhFnLaiLKMD8CCZHLbRmmWaf2FPbtwaxAXMhC0s3WzuDIgFfZOIHG8jtr
 KNS5iDMG2KYYNr0S+9osg6cfHlS/gVZZUNJ2Vj4KN/esia+HQDDUsWTR4t5ZZ5vS/RNp
 ZYvlOrKdYv47j3wlM2LFI+O+qQVhqa39juj+eWlrFpr/b9P4DskT4x9YnCHNnasT3A2D
 9eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=rbwXVzLSnjP76u9z9w7zaAbcIQeJPjoDtzZ4ruOwzOA=;
 b=MY6fVKhqLnbarK7+f+LheVUpWCn5zYOpohjabbBcxf6kLg6qaCJhrjS8zgs2kAcMmq
 5Pn4TcAQfGzQBulnGCWFsib3DHavsM3Aii1NgB3Rh4Q6Vwh9C5+mqFiF2e9W4qI9aIko
 qrjeHndXc8lNvr1L1cw4+9jPSptyxeKLbkrBvhW8Erm29lZJTgbeIdVLST985wmNFsXC
 DssdOsmplKO72Go9CwEryaBh++wPx41Srl1x/dZdv9ozrKEGX8m20DPCYk3QDob7yG2d
 itY/euIZdqeL4YyKt5ZsVpEgKdkZHt5ylKwSHfIx7hM3uhMEaVkIJdy+aqyiuzoG9tyU
 Dzuw==
X-Gm-Message-State: AOAM5324Q/LwrNt23/i9nlO+muusXLKBFHcxLj6mIFHRy7TcG3tK9mvb
 7Iv5rB7/9skbF9dvC0Si/WxUKHqGItQkxWojh0+v7iudHNVdbg==
X-Google-Smtp-Source: ABdhPJwRZCgzMGkldo4iVQXkEMYZy2PkiPY+egZQITiJjU/lhvNejRw1We4ALSOPpJdzN443Z9HaAEquwgSChomcork=
X-Received: by 2002:ab0:6682:: with SMTP id a2mr5353040uan.59.1633972572632;
 Mon, 11 Oct 2021 10:16:12 -0700 (PDT)
MIME-Version: 1.0
From: Kristof Havasi <havasiefr@gmail.com>
Date: Mon, 11 Oct 2021 19:16:01 +0200
Message-ID: <CADBnMviweAwc1oFz2-4KtGBAQb3hii1ZkJpZDELXY_CASpd53w@mail.gmail.com>
Subject: UBIFS panic during brown-out
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_101614_676791_487D82EF 
X-CRM114-Status: GOOD (  10.17  )
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

RGVhciBSaWNoYXJkLAoKd2UgaGF2ZSBiZWVuIGluIGNvbnRhY3QgcmVnYXJkaW5nIGFub3RoZXIg
KHNpbWlsYXIpIGtlcm5lbCBwYW5pYyBhIHllYXIgYWdvOgpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMjAtU2VwdGVtYmVyLzA4MjE3NS5odG1sCgpOb3cg
d2UgYXJlIHN0cmVzcyB0ZXN0aW5nIG91ciBib2FyZCBmb3IgYnJvd24tb3V0IHN0YWJpbGl0eSwg
YW5kIHdlIGNhbgpzZWUgcmVwcm9kdWNpYmxlIGZpbGUgc3lzdGVtIGNvcnJ1cHRpb25zLgpUaGUg
Y3VscHJpdCB3YXMgbmFycm93ZWQgZG93biB0byBhIHBlbmRpbmcgU1FMaXRlIG9wZXJhdGlvbiBk
dXJpbmcgYnJvd24tb3V0LAppbiB0aGUgYnVzaW5lc3MtbG9naWMuCgpBcyBmYXIgYXMgSSB1bmRl
cnN0b29kLCBVQklGUyBpcyBleHRyZW1lbHkgcm9idXN0IGluIHN1Y2ggY2FzZXMsIHNvIEkgd291
bGQKZXhwZWN0IGEgY29ycnVwdGVkIGZpbGUgYXMgdGhlIHdvcnN0IGNhc2Ugc2NlbmFyaW8sIG5v
dCBhbiB1bmJvb3RhYmxlIHN5c3RlbS4KCkFtIEkgdG9vICJvcHRpbWlzdGljIiBhYm91dCBVQklG
UydzIGJyb3duLW91dCBzdGFiaWxpdHk/CgpEb2VzIHRoZSBBdXRoK0VuY3J5cHRpb24gY29tYm8g
aW5jcmVhc2UgdGhlIGNoYW5jZXMgZm9yIGNvcnJ1cHRpbmcgdGhlIEZTCmR1cmluZyBicm93bi1v
dXQsIGR1ZSB0byB0aGUgZXh0cmEgb3BlcmF0aW9ucz8KCldvdWxkIHlvdSBzdWdnZXN0IHR1cm5p
bmcgb24gYW55IG9mIHRoZSBjaGtfKiBrbm9icyBpbiB0aGUgZGVidWdmcz8KSSBhbSBub3Qgc3Vy
ZSB0aGF0IHRoZXkgYXJlIGhlbHBmdWwsIG9yIHdpbGwganVzdCBtb2RpZnkgdGhlIGJlaGF2aW91
ciBvZiB0aGUKdGltaW5ncyBvZiB0aGUgc3lzdGVtIHRvbyBtdWNoLgoKV291bGQgaXQgYmUgYSBs
YXN0IHJlc29ydCBpbiBjYXNlIHRoZSBicm93bi1vdXQgaXMgZGV0ZWN0ZWQgdG8gc3dpdGNoIHRo
ZSBGUwppbnRvIHJvIG1vZGU/IElzIHRoZXJlIGFueSBBUEkvQUJJIGFwYXJ0IGZyb20gdGhlIGRl
YnVnZnMncyByb19lcnJvciBrbm9iIHRvCnN3aXRjaCB0aGUgRlMgaW50byByZWFkLW9ubHkgbW9k
ZSBhbmQgc28gdHJ5aW5nIHRvIHByZXZlbnQgZmlsZS1zeXN0ZW0KY29ycnVwdGlvbj8KCkFueSBw
b2ludGVycyBhcmUgd2VsY29tZWQhCgpXZSBhcmUgb24gS2VybmVsIHY1LjQuMTUwCldlIHVzZSBf
Ym90aF8gVUJJRlMgQXV0aGVudGljYXRpb24gYW5kIEVuY3J5cHRpb24uClRoZSBib2FyZCBpcyBh
IFNBTUE1RDMgcG93ZXJlZCBlbWJlZGRlZCBkZXZpY2Ugd2l0aCAxR0IgTkFORCBmbGFzaCwKd2hp
Y2ggaXMgbm90IGV2ZW4gbmVhcmx5IGZ1bGwgKDEwJSB1c2VkKS4KCktlcm5lbCBwYW5pYyBhZnRl
ciB0aGUgbGFzdCBicm93bi1vdXQ6CnViaTA6IHNjYW5uaW5nIGlzIGZpbmlzaGVkCnViaTA6IGF0
dGFjaGVkIG10ZDEgKG5hbWUgInViaXZvbHMiLCBzaXplIDEwMjMgTWlCKQp1YmkwOiBQRUIgc2l6
ZTogMjYyMTQ0IGJ5dGVzICgyNTYgS2lCKSwgTEVCIHNpemU6IDI1Mzk1MiBieXRlcwp1YmkwOiBt
aW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDQwOTYvNDA5Niwgc3ViLXBhZ2Ugc2l6ZSA0MDk2CnVi
aTA6IFZJRCBoZWFkZXIgb2Zmc2V0OiA0MDk2IChhbGlnbmVkIDQwOTYpLCBkYXRhIG9mZnNldDog
ODE5Mgp1YmkwOiBnb29kIFBFQnM6IDQwODIsIGJhZCBQRUJzOiAxMywgY29ycnVwdGVkIFBFQnM6
IDAKdWJpMDogdXNlciB2b2x1bWU6IDUsIGludGVybmFsIHZvbHVtZXM6IDEsIG1heC4gdm9sdW1l
cyBjb3VudDogMTI4CnViaTA6IG1heC9tZWFuIGVyYXNlIGNvdW50ZXI6IDExOC8xMSwgV0wgdGhy
ZXNob2xkOiA0MDk2LCBpbWFnZQpzZXF1ZW5jZSBudW1iZXI6IDkyMTM2MTIzNQo+dWJpMDogYXZh
aWxhYmxlIFBFQnM6IDAsIHRvdGFsIHJlc2VydmVkIFBFQnM6IDQwODIsIFBFQnMgcmVzZXJ2ZWQg
Zm9yIGJhZCBQRUIgaGFuZGxpbmc6IDY3CnViaTA6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0
MGQiIHN0YXJ0ZWQsIFBJRCA2MTcKVUJJRlMgKHViaTA6NCk6IE1vdW50aW5nIGluIGF1dGhlbnRp
Y2F0ZWQgbW9kZQpVQklGUyAodWJpMDo0KTogcmVjb3ZlcnkgbmVlZGVkCj5WRlM6IENhbm5vdCBv
cGVuIHJvb3QgZGV2aWNlICJ1YmkwOnJvb3RmcyIgb3IgdWJpMDpyb290ZnM6IGVycm9yIC0xClBs
ZWFzZSBhcHBlbmQgYSBjb3JyZWN0ICJyb290PSIgYm9vdCBvcHRpb247IGhlcmUgYXJlIHRoZSBh
dmFpbGFibGUgcGFydGl0aW9uczoKS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5h
YmxlIHRvIG1vdW50IHJvb3QgZnMgb24gdWJpMDpyb290ZnMKQ1BVOiAwIFBJRDogMSBDb21tOiBz
d2FwcGVyIE5vdCB0YWludGVkIDUuNC4xMDktMDAwMzMtZ2E4ODk0M2MxZTY4ICMxCkhhcmR3YXJl
IG5hbWU6IEF0bWVsIFNBTUE1Cls8YzAxMGJhYmM+XSAodW53aW5kX2JhY2t0cmFjZSkgZnJvbSBb
PGMwMTBhOGQwPl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQpbPGMwMTBhOGQwPl0gKHNob3dfc3Rh
Y2spIGZyb20gWzxjMDU2OTk3MD5dIChwYW5pYysweGZjLzB4MmU4KQpbPGMwNTY5OTcwPl0gKHBh
bmljKSBmcm9tIFs8YzA4MDE1OTg+XSAobW91bnRfYmxvY2tfcm9vdCsweDI2OC8weDJhNCkKWzxj
MDgwMTU5OD5dIChtb3VudF9ibG9ja19yb290KSBmcm9tIFs8YzA4MDE2NzQ+XSAocHJlcGFyZV9u
YW1lc3BhY2UrMHg5Yy8weDE4NCkKWzxjMDgwMTY3ND5dIChwcmVwYXJlX25hbWVzcGFjZSkgZnJv
bSBbPGMwNTZiNzc0Pl0gKGtlcm5lbF9pbml0KzB4OC8weDEwOCkKWzxjMDU2Yjc3ND5dIChrZXJu
ZWxfaW5pdCkgZnJvbSBbPGMwMTAxMGU4Pl0gKHJldF9mcm9tX2ZvcmsrMHgxNC8weDJjKQpFeGNl
cHRpb24gc3RhY2soMHhjNzgyOWZiMCB0byAweGM3ODI5ZmY4KQo5ZmEwOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAw
MAo5ZmMwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo5ZmUwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAxMyAwMDAwMDAwMAotLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3lu
Y2luZzogVkZTOiBVbmFibGUgdG8gbW91bnQgcm9vdCBmcyBvbgp1YmkwOnJvb3RmcyBdLS0tCgpC
ZXN0IHJlZ2FyZHMsCktyaXN0w7NmIEhhdmFzaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
