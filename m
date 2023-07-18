Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998EAEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWGCOaYL9eKW+VQxI23azRPfHe7hJs8A3kXoRwHZLAw=; b=4D/9lA5R8Rozaz
	6VYbYLt28NK5pFcqiIYup/yzfZ3YQw7w73ZdQ2soKUnxK4c0BvDDForLDZNyfSqvJISt2yHJl42Ea
	TQucP8Dc3gJ2KdB73ouH65XcOCcFx2JOoISP1neg8EkhXFVH4zvaxmzxj/KnAOqlI7gDxjbdfGcSP
	elD+dL2sPqQ9YKIXdCXSxElt6fdhQ/QmVqKL0EqdVLgALCj/w+nZ2bjxb13ik4XnFGMCEvpiJZuR6
	lsEh7ipV+XSYxuSHVypchRh2OyO1HLTkjCNfxOF65zwFTwtbbja847pFMguUkfBvFYKIEFtA76Y44
	qKW1/08zXaOm4gXerroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Pn-005aoq-0V;
	Wed, 19 Jul 2023 06:11:59 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Pl-005an1-0b
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8Yaw/su3dm4lGxJq+uDwrFmIvx/782XRsFqzx0jPx1s=; b=Qg7WcWmcGLcunCmjeJdBQSA0Ie
	dPBjhjWT06HNIB1tsCrg8Na3mYqdy8vqKZ+zkiCX0rMMDEDeDrmPDTw3x1LqgQztoLez8RqP6wdJY
	Bf5JNNjMWW3t6bmy9k9vvrfgZyqhaLY/jspgHAgkpz5Xkw/+0prngyZ8xppbTNSc9T48pUXAwwGP/
	3m1AsPvm2/jpTRMBsBTkCXr9vwSrFX1wXZouvT70oT90uhMBXgpOAzKHvjSYcnLluceu9Qi5wWm9b
	zA1cqC5gs3eS6wnR+bdtOp5udHpPl2ej9XfW42nlN2385jyfHdm3S+YSY++oF+ETG+hf15XnQsE08
	3Z9NkjaA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLbLd-009qV4-1l
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 03:26:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso51902905e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 20:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689650638; x=1692242638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Yaw/su3dm4lGxJq+uDwrFmIvx/782XRsFqzx0jPx1s=;
        b=IOuykNH0+ZMFFZ7k3TlbVOJ/Pa6tE/WgWM+W0l7P09FJuYempieSJwdlPHh9K3znTF
         /3XE0ajAJ0H8RM2IfRskU7qmPxnjl9VFq+QEoL676a5BXTLgAeSgZvb8IU0zBjnLaZyz
         Tt3gIgXCmdic49WDgEuzmzl/pAP7xL58jO/7NOqaLg6z1WN0y8TPR5Z7CvIPz1Opt7JC
         DKeAkPBUXp9TMCFbbDNMK3VKB2+Ir1OQ588YHIcdIDehW71lzT5hszK5YsQbtd8SlmJt
         t44GnfFbTFzBHBBXcK+czgSZSIOcGj/3Jq/Cl98VsK5OYGS62Gvjupd4vlFMTYLZmGm1
         UlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689650638; x=1692242638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Yaw/su3dm4lGxJq+uDwrFmIvx/782XRsFqzx0jPx1s=;
        b=k5v9fs0emKZ0ixpAYG+eHapI5JUwNik3u05zAAQEBBddNqDuaU6HwshIJWcbHttXFw
         ipsMvXqfwRBpR5a0vM1+frkZh2Fe8TYyjdyROKZEoBitISX4D6Te8jpHs6F3IlGejIc7
         Rvts7G5aOnlK8+QvbiK2XVAarL8EodkcpSAjTu6/TYwcCi2Ug8luFLEiFXihgS4VzMqb
         yCcTUfEjrkJQeX7xAG0ljXo+o2/dyqWHYiB0LTnaZLNEtGpePc1NW5hsUvn0vss5gTja
         x1KSyEkuXk6SccafB0ulurUhzABLPqAEIOzM7uH3VpQfiT9KKmZPI1qCfLsxfJ8sVPRp
         ahRQ==
X-Gm-Message-State: ABy/qLZQ3WaLZZrTvQ2dyx5uogk2O/A//BCAhFy8pAeoxU4OFVf9nw7C
	xX+h40HpOzraX7uYZqYPfiFRpA==
X-Google-Smtp-Source: APBJJlEMo+94zfYvjjd0ST7tSjDvYxqx+bPRJDBcTj1MpaxD5e0ocYFgQRm385+XmJ39W4C80uucLg==
X-Received: by 2002:a1c:e90d:0:b0:3fc:524:e80a with SMTP id q13-20020a1ce90d000000b003fc0524e80amr776137wmc.18.1689650638531;
        Mon, 17 Jul 2023 20:23:58 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bce11000000b003fc07e17d4esm9223656wmc.2.2023.07.17.20.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 20:23:58 -0700 (PDT)
Message-ID: <d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org>
Date: Tue, 18 Jul 2023 06:23:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
To: Michael Walle <michael@walle.cc>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
 <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org>
 <0525440a652854a2a575256cd07d3559@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <0525440a652854a2a575256cd07d3559@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_042606_407280_E2F13166 
X-CRM114-Status: GOOD (  28.21  )
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

CgpPbiAxMy4wNy4yMDIzIDEwOjAxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+IEFt
IDIwMjMtMDctMTMgMDU6MzIsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gSGksIExpbnVzLAo+
Pgo+PiBPbiAxMy4wNy4yMDIzIDAwOjU5LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+Pj4gVGhlIFdp
bmJvbmQgIncyNXExMjgiIChhY3R1YWwgdmVuZG9yIG5hbWUgVzI1UTEyOEpWKQo+Pj4gaGFzIGV4
YWN0bHkgdGhlIHNhbWUgZmxhZ3MgYXMgdGhlIHNpYmxpbmcgZGV2aWNlCj4+PiAidzI1cTEyOGp2
Ii4gVGhlIGRldmljZXMgYm90aCByZXF1aXJlIHVubG9ja2luZyB0bwo+Pj4gZW5hYmxlIHdyaXRl
IGFjY2Vzcy4KPj4+Cj4+PiBUaGUgYWN0dWFsIHByb2R1Y3QgbmFtaW5nIGJldHdlZW4gZGV2aWNl
cyB2cyB0aGUKPj4+IExpbnV4IHN0cmluZ3MgaW4gd2luYm9uZC5jOgo+Pj4KPj4+IDB4ZWY0MDE4
OiAidzI1cTEyOCLCoMKgIFcyNVExMjhKVi1JTS9KTQo+Pj4gMHhlZjcwMTg6ICJ3MjVxMTI4anYi
IFcyNVExMjhKVi1JTi9JUS9KUQo+Pj4KPj4+IFRoZSBsYXR0ZXIgZGV2aWNlLCAidzI1cTEyOGp2
IiBzdXBwb3J0cyBmZWF0dXJlcwo+Pj4gbmFtZWQgRFRRIGFuZCBRUEksIG90aGVyd2lzZSBpdCBp
cyB0aGUgc2FtZS4KPj4+Cj4+PiBOb3QgaGF2aW5nIHRoZSByaWdodCBmbGFncyBoYXMgdGhlIGFu
bm95aW5nIHNpZGUKPj4+IGVmZmVjdCB0aGF0IHdyaXRlIGFjY2VzcyBkb2VzIG5vdCB3b3JrLgo+
Pgo+PiBJIGd1ZXNzIHlvdSByZWZlciB0byB0aGUgbG9ja2luZyBmbGFncy4gUHJvYmFibHkgeW91
ciBmbGFzaCBoYXMgdGhlIG5vbgo+PiB2b2xhdGlsZSBibG9jayBwcm90ZWN0aW9uIChCUCkgYml0
cyBmcm9tIHRoZSBTdGF0dXMgUmVnaXN0ZXIgc2V0LCB3aGljaAo+PiBtZWFucyB0aGUgZW50aXJl
IGZsYXNoIGlzIHdyaXRlIHByb3RlY3RlZC4gVGhlIGZhY3RvcnkgZGVmYXVsdCBmb3IgdGhlc2UK
Pj4gYml0cyBpcyAwL2Rpc2FibGVkIG9uIHRoaXMgZmxhc2ggc28gc29tZW9uZSBtdXN0IGhhdmUg
cGxheWVkIHdpdGggdGhlbS4KPj4gVGhlIHJlYXNvbiB3aHkgb25lIG1heSB3YW50IHdyaXRlIHBy
b3RlY3Rpb24gc2V0IGlzIHRvIGF2b2lkIGluYWR2ZXJ0ZW50Cj4+IHdyaXRlcyBkdXJpbmcgcG93
ZXItdXAuCj4+IE9uZSBjYW4gY29udHJvbCB3aGV0aGVyIHRvIGRpc2FibGUgdGhlIHNvZnR3YXJl
IHdyaXRlIHByb3RlY3Rpb24gYXQgYm9vdAo+PiB0aW1lIHdpdGggdGhlIE1URF9TUElfTk9SX1NX
UF8gY29uZmlncy4KPj4+Cj4+PiBBZnRlciB0aGlzIHBhdGNoIEkgY2FuIHdyaXRlIHRvIHRoZSBm
bGFzaCBvbiB0aGUKPj4+IEludGVubyBYRzY4NDYgcm91dGVyLgo+Pj4KPj4+IFRoZSBmbGFzaCBt
ZW1vcnkgYWxzbyBzdXBwb3J0cyBkdWFsIGFuZCBxdWFkIFNQSQo+Pj4gbW9kZXMuIFRoaXMgZG9l
cyBub3QgY3VycmVudGx5IG1hbmlmZXN0LCBidXQgYnkKPj4KPj4gVGhlIGZhc3RlZCBtb2RlIGlz
IGNob3NlbiBhZnRlciBTRkRQIHBhcnNpbmcsIHNvIHlvdSBzaG91bGQgdXNlIHF1YWQKPj4gcmVh
ZHMgaWYgeW91ciBjb250cm9sbGVyIGFsc28gc3VwcG9ydHMgNCBJL08gbGluZXMuCj4+PiB0dXJu
aW5nIG9uIFNGRFAgcGFyc2luZywgdGhlIHJpZ2h0IFNQSSBtb2RlcyBhcmUKPj4+IGVtaXR0ZWQg
aW4KPj4+IC9zeXMva2VybmVsL2RlYnVnL3NwaS1ub3Ivc3BpMS4wL2NhcGFiaWxpdGllcwo+Pj4g
Zm9yIHRoaXMgY2hpcCwgc28gd2UgYWxzbyB0dXJuIG9uIHRoaXMuCj4+Pgo+Pj4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IFN1Z2dlc3RlZC1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFl
bEB3YWxsZS5jYz4KPj4+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gT25seSBhZGQg
dGhlIHdyaXRlIGFjY2VzcyBmbGFncy4KPj4+IC0gVXNlIFNGRFAgcGFyc2luZyB0byBwcm9wZXJs
eSBkZXRlY3QgdGhlIHZhcmlvdXMKPj4+IMKgIGF2YWlsYWJsZSBTUEkgbW9kZXMuCj4+PiAtIExp
bmsgdG8gdjE6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNzEyLXNwaS1ub3It
d2luYm9uZC13MjVxMTI4LXYxLTEtZjc4ZjNiYjQyYTFjQGxpbmFyby5vcmcKPj4+IC0tLQo+Pj4g
wqBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYyB8IDMgKystCj4+PiDCoDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPj4+IGIvZHJpdmVycy9tdGQvc3BpLW5vci93
aW5ib25kLmMKPj4+IGluZGV4IDgzNGQ2YmE1Y2U3MC4uNmM4MmU1MjVjODAxIDEwMDY0NAo+Pj4g
LS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivd2luYm9uZC5jCj4+PiBAQCAtMTIxLDcgKzEyMSw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZmxhc2hfaW5mbwo+Pj4gd2luYm9uZF9ub3JfcGFydHNbXSA9IHsKPj4+IMKgwqDCoMKg
IHsgIncyNXE4MGJsIiwgSU5GTygweGVmNDAxNCwgMCwgNjQgKiAxMDI0LMKgIDE2KQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEspIH0sCj4+PiDCoMKgwqDCoCB7ICJ3
MjVxMTI4IiwgSU5GTygweGVmNDAxOCwgMCwgNjQgKiAxMDI0LCAyNTYpCj4+Cj4+IHdoaWxlIGhl
cmUgdHJ5LCB1c2luZyBJTkZPIHdpdGggSU5GTygweGVmNDAxOCwgMCwgMCwgMCksIHRob3NlCj4+
IHBhcmFtZXRlcnMgc2hhbGwgYmUgZGlzY292ZXJlZCBhdCBydW4tdGltZSwgc28gd2UgcHJlcGFy
ZSB0byBnZXQgcmlkIG9mCj4+IGV4cGxpY2l0bHkgc2V0dGluZyB0aGVtIHNvb25lciBvciBsYXRl
ci4KPiAKPiBUaGlzIGlzIGFuIGVudHJ5IG1hdGNoaW5nIHZhcmlvdXMgZmxhc2ggZmFtaWxpZXMg
ZnJvbSBXaW5ib25kLCBzZWUgbXkKPiByZXBseSBpbiB2MS4gSSdtIG5vdCBzdXJlIHdlIHNob3Vs
ZCByZW1vdmUgdGhlc2UgYXMgd2UgY291bGQgYnJlYWsgdGhlCj4gb2xkZXIgb25lcywgd2hpY2gg
bWlnaHQgb3IgbWlnaHQgbm90IGhhdmUgU0ZEUCB0YWJsZXMuIFdlIGRvbid0IGtub3cuCgpJJ2Qg
dGFrZSB0aGUgcmlzayBhbmQgYnJlYWsgdGhlIG9sZGVyIG9uZXMgaWYgdGhlcmUgYXJlIHNvbWUg
dGhhdCBkb24ndApkZWZpbmUgU0ZEUCBpbmRlZWQsIGp1c3QgdG8gaGFuZGxlIHRoZSBjb25mbGlj
dCBwcm9wZXJseS4gV2UgY2FuJ3QKZW5jb3VyYWdlIGNvZGUgYmFzZWQgb24gYXNzdW1wdGlvbnMg
b3RoZXJ3aXNlIHdlJ2xsIGdldCBiYWNrIHRvIHRoZQprbm90dGVkIHNwaS1ub3IgY29kZSB0aGF0
IHdlIHRyaWVkIHRvIHVudGllIGluIHRoZSBsYXN0IHllYXJzLgoKPiAKPj4KPj4+IC3CoMKgwqDC
oMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEspIH0sCj4gCj4gVGh1cywgSSdkIGFsc28ga2Vl
cCB0aGlzIG9uZS4KPiAKCktlZXBpbmcgdGhpcyBvbmUgZG9lcyBub3QgaGF2ZSB0aGUgZWZmZWN0
IHRoYXQgeW91IHdhbnQgYXMgU0VDVF80SyBpcwp1c2VkIGluIHNwaV9ub3Jfbm9fc2ZkcF9pbml0
X3BhcmFtcygpIHdoaWNoIGlzIG5vdCBjYWxsZWQgd2hlbgpQQVJTRV9TRkRQIGlzIHNldCwgd2hp
Y2ggbWFrZXMgcGVyZmVjdGx5IHNlbnNlLiBMZXQncyBkcm9wIHRoaXMgYW5kIGlmCmJ1Z3Mgd2ls
bCBiZSByZXBvcnRlZCwgSSBjb21taXQgSSdsbCBmaXggdGhlbSBpbiB0aGUgc2FtZSByZWxlYXNl
IGN5Y2xlLgoKSWYgYm90aCBvZiB5b3UgYWdyZWUsIEknbGwgYW1lbmQgTGludXMncyB2NCBwYXRj
aCB3aGVuIGFwcGx5aW5nLgoKQ2hlZXJzLAp0YQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
