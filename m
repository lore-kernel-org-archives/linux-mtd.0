Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92908C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E88206A4
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Us7oRHMA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boniqFtw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E88206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qLrWRwKvVKE1VojOUrmIZ8DyZ9hk+NvpPYJxEOm5hs=; b=Us7oRHMACqpPXd
	oAHw/FE/KK9YFLr/uMRV81D+dJwdMOMjR8urKB5h+H0VKOEfI3nHzIhtgDvtlDfiN8yzqFxueoXZJ
	V3xsn5Wlk6rx1anps6TY+NBZzzyqXpL7QD65M+tqUCmQQKh7znqfxoMNFg4PqMFCQoNSJRgzS2mNj
	+Q+zRiO7BpNKtlScQ8E92Eba+VeimOaVto7iefKlsadIeOF3RC073UpqXsbm2bLjb1G3dU3me/Tbj
	Y4vBhe1JupCyPXMiF9fzMmLwUxcHDB6J+3Nssu8wtvTciqNHojw0tppyUEmteczg91W+UraPNnOOL
	rBao7dXccmO88rV+1Yow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjOwJ-0004RP-2D; Thu, 11 Jun 2020 15:16:23 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjOw5-0004HZ-VR; Thu, 11 Jun 2020 15:16:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id q11so6582900wrp.3;
 Thu, 11 Jun 2020 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ekZS4aH+9SdzL+TCB6y0YZ7lKqUewvODAqRgveIbzBQ=;
 b=boniqFtwc6F5pPI2Ls4+Ba7k45IGWop1Bff1qXYj94NW5TCfQBIOcWtiS+/AR2EVJG
 7F4g67hCPrnfisVbm7XAtyEdyYCdD2qWd6u6CU3bQdl54QMFLwta81YoFrh0tI4QQdYN
 FHjtpTFxDnbjJgs+4rpqSlE7L3Bg4IENUJ2yd4pTMWCFlwjwVOfABk+hwOVHfnXTHdfI
 0iPw9nxcEiBXTChqMqbCgzyVOvfcrskmrApZyc6v7VXj5Ue8Vr16/C8e7RsHxBvh8xK9
 qDCFDJm159eyRs4whTdZpBtuaDUUXTQrNpa5zFxgqY7A4kejR/IMc4wvQkIA5IIzNvWb
 0C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ekZS4aH+9SdzL+TCB6y0YZ7lKqUewvODAqRgveIbzBQ=;
 b=Ob4KhFib8V8ivqlI1w2CpiAVtUzUKS7qzLT7BtlGk6C5m7+lY7tpZJfEbDQhVFdxPC
 LEm9HnClKEbdJbvcwdfCjsNv5+xxK2/Z9p63O5SeMHUGBgoiNQ1S7xeLqCX62JJxo/wu
 cXUGt2mJ+BEpzmJTsJTpW+s+ajwysqj+gzP0aX7msAg9eDmd/v75KHbxc2WTx6PitjWq
 LoIrn4jNFh+zRO2kltLznRW5g/brDiuGsKrxw3YCQbEIxRfIicpZvjP15aIzm8hLmk5+
 wGbRWQDlK6qssPPx4cD/bS8l29MsJLmkUSfSffKZeDffOkKv5wYMopZ0G34+KNPzPX0K
 pbAA==
X-Gm-Message-State: AOAM5302dhoPKalYucqx1oVs3kvWurh/CWnx5PNQPiS+6marC35mYDp+
 Y4wOJuLkH56Anp+nyVS+jWA=
X-Google-Smtp-Source: ABdhPJwA+DiZuy6xl8wG41wqWju0oynDNJh6M3rEm018zeY+edIUL8WNZYWusLz93cuBSfoRG/fQhg==
X-Received: by 2002:a05:6000:1ce:: with SMTP id
 t14mr10050620wrx.300.1591888567919; 
 Thu, 11 Jun 2020 08:16:07 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net.
 [83.49.61.28])
 by smtp.gmail.com with ESMTPSA id z6sm5408008wrh.79.2020.06.11.08.16.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jun 2020 08:16:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200611095540.250184d2@xps13>
Date: Thu, 11 Jun 2020 17:16:04 +0200
Message-Id: <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com> <20200611095540.250184d2@xps13>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_081610_011563_A13C9343 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, vigneshr@ti.com, richard@nod.at,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
 bcm-kernel-feedback-list@broadcom.com, Jonas Gorski <jonas.gorski@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKPiBFbCAxMSBqdW4gMjAyMCwgYSBsYXMgOTo1NSwgTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+IAo+IEhpIMOBbHZhcm8sCj4g
Cj4gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGUgb24g
TW9uLCAgOCBKdW4gMjAyMAo+IDE4OjA2OjQ5ICswMjAwOgo+IAo+PiBJbnN0ZWFkIG9mIHRyeWlu
ZyB0byBwYXJzZSBDRkUgdmVyc2lvbiBzdHJpbmcsIHdoaWNoIGlzIGN1c3RvbWl6ZWQgYnkgc29t
ZQo+PiB2ZW5kb3JzLCBsZXQncyBqdXN0IGNoZWNrIHRoYXQgIkNGRTEiIHdhcyBwYXNzZWQgb24g
YXJndW1lbnQgMy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2ph
cyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEdvcnNraSA8am9u
YXMuZ29yc2tpQGdtYWlsLmNvbT4KPj4gLS0tCj4+IHYyOiB1c2UgQ0ZFX0VQVFNFQUwgZGVmaW5p
dGlvbiBhbmQgYXZvaWQgdXNpbmcgYW4gYWRkaXRpb25hbCBmdW50aW9uLgo+PiAKPj4gZHJpdmVy
cy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jIHwgMjkgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0p
Cj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jIGIv
ZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4+IGluZGV4IDc4ZjkwYzZjMThmZC4u
NDkzYTc1YjJmMjY2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhw
YXJ0LmMKPj4gKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4+IEBAIC0y
Miw2ICsyMiw5IEBACj4+ICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0aW9ucy5oPgo+PiAjaW5j
bHVkZSA8bGludXgvb2YuaD4KPj4gCj4+ICsjaW5jbHVkZSA8YXNtL2Jvb3RpbmZvLmg+Cj4+ICsj
aW5jbHVkZSA8YXNtL2Z3L2NmZS9jZmVfYXBpLmg+Cj4gCj4gQXJlIHlvdSBzdXJlIGJvdGggaW5j
bHVkZXMgYXJlIG5lZWRlZD8KCmFzbS9ib290aW5mby5oIGlzIG5lZWRlZCBmb3IgZndfYXJnMyBh
bmQgYXNtL2Z3L2NmZS9jZmVfYXBpLmggaXMgbmVlZGVkIGZvciBDRkVfRVBUU0VBTC4KCj4gCj4g
SSBkb24ndCB0aGluayBpdCBpcyBhIGdvb2QgaGFiaXQgdG8gaW5jbHVkZSBhc20vIGhlYWRlcnMs
IGFyZSB5b3Ugc3VyZQo+IHRoZXJlIGlzIG5vdCBhbm90aGVyIGhlYWRlciBkb2luZyBpdCBqdXN0
IGZpbmU/CgpCb3RoIGFyZSBuZWVkZWQgdW5sZXNzIHlvdSB3YW50IHRvIGFkZCBhbm90aGVyIGRl
ZmluaXRpb24gb2YgQ0ZFX0VQVFNFQUwgdmFsdWUuClRoZXJlIGFyZSBjdXJyZW50bHkgdHdvIENG
RSBtYWdpYyBkZWZpbml0aW9ucywgdGhlIG9uZSBpbiBhc20vZncvY2ZlL2NmZV9hcGkuaCBhbmQg
YW5vdGhlciBvbmUgaW4gYmNtNDd4eHBhcnQuYzoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRz
L2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9mdy9jZmUvY2ZlX2FwaS5o
I0wyOApodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVy
cy9tdGQvcGFyc2Vycy9iY200N3h4cGFydC5jI0wzMwoKPiAKPj4gKwo+PiAjZGVmaW5lIEJDTTk2
M1hYX0NGRV9CTE9DS19TSVpFCQlTWl82NEsJLyogYWx3YXlzIGF0IGxlYXN0IDY0S2lCICovCj4+
IAo+PiAjZGVmaW5lIEJDTTk2M1hYX0NGRV9NQUdJQ19PRkZTRVQJMHg0ZTAKPj4gQEAgLTMyLDMw
ICszNSw2IEBACj4+ICNkZWZpbmUgU1RSX05VTExfVEVSTUlOQVRFKHgpIFwKPj4gCWRvIHsgY2hh
ciAqX3N0ciA9ICh4KTsgX3N0cltzaXplb2YoeCkgLSAxXSA9IDA7IH0gd2hpbGUgKDApCj4+IAo+
PiAtc3RhdGljIGludCBiY202M3h4X2RldGVjdF9jZmUoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIp
Cj4+IC17Cj4+IC0JY2hhciBidWZbOV07Cj4+IC0JaW50IHJldDsKPj4gLQlzaXplX3QgcmV0bGVu
Owo+PiAtCj4+IC0JcmV0ID0gbXRkX3JlYWQobWFzdGVyLCBCQ005NjNYWF9DRkVfVkVSU0lPTl9P
RkZTRVQsIDUsICZyZXRsZW4sCj4+IC0JCSAgICAgICAodm9pZCAqKWJ1Zik7Cj4+IC0JYnVmW3Jl
dGxlbl0gPSAwOwo+PiAtCj4+IC0JaWYgKHJldCkKPj4gLQkJcmV0dXJuIHJldDsKPj4gLQo+PiAt
CWlmIChzdHJuY21wKCJjZmUtdiIsIGJ1ZiwgNSkgPT0gMCkKPj4gLQkJcmV0dXJuIDA7Cj4+IC0K
Pj4gLQkvKiB2ZXJ5IG9sZCBDRkUncyBkbyBub3QgaGF2ZSB0aGUgY2ZlLXYgc3RyaW5nLCBzbyBj
aGVjayBmb3IgbWFnaWMgKi8KPj4gLQlyZXQgPSBtdGRfcmVhZChtYXN0ZXIsIEJDTTk2M1hYX0NG
RV9NQUdJQ19PRkZTRVQsIDgsICZyZXRsZW4sCj4+IC0JCSAgICAgICAodm9pZCAqKWJ1Zik7Cj4+
IC0JYnVmW3JldGxlbl0gPSAwOwo+PiAtCj4+IC0JcmV0dXJuIHN0cm5jbXAoIkNGRTFDRkUxIiwg
YnVmLCA4KTsKPj4gLX0KPj4gLQo+PiBzdGF0aWMgaW50IGJjbTYzeHhfcmVhZF9udnJhbShzdHJ1
Y3QgbXRkX2luZm8gKm1hc3RlciwKPj4gCXN0cnVjdCBiY205NjN4eF9udnJhbSAqbnZyYW0pCj4+
IHsKPj4gQEAgLTEzOCw3ICsxMTcsNyBAQCBzdGF0aWMgaW50IGJjbTYzeHhfcGFyc2VfY2ZlX3Bh
cnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCj4+IAlzdHJ1Y3QgYmNtOTYzeHhfbnZy
YW0gKm52cmFtID0gTlVMTDsKPj4gCWludCByZXQ7Cj4+IAo+PiAtCWlmIChiY202M3h4X2RldGVj
dF9jZmUobWFzdGVyKSkKPj4gKwlpZiAoZndfYXJnMyAhPSBDRkVfRVBUU0VBTCkKPj4gCQlyZXR1
cm4gLUVJTlZBTDsKPj4gCj4+IAludnJhbSA9IHZ6YWxsb2Moc2l6ZW9mKCpudnJhbSkpOwoKQmVz
dCByZWdhcmRzLArDgWx2YXJvLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
