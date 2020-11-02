Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CF4C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 13:13:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DB421D40
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 13:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W5WEkSOT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeiW3q+D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DB421D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7GYMB1aPbC3unSr20T+HS9o5iybQNj/0SuvKtFvfoMI=; b=W5WEkSOTaKc2JI1Pdk8uSGlF4
	dgOv6ldqrojMRz+vr/EqVsyWMeyA7bWzJS8Jj2Tc8ZTLkjq95Kck7jhyl6Y5b43qVkKgPeF7CTxC5
	h6+zBLSB0jyNacnOcBihPoxToGXGpnlTGaC+uzilRQIYG5HH69mTyVpvVYbNTLw2fFhkFA0+liwtC
	QCyMsTVCPg3YTveXQGwWPMVdqBEiBMAJIqe/IdtwHdeyE+cjAeXycIkXYbEzd1eJVIDdSgbF6sXkd
	JVXZlmABe08D6A65NT5ef7cuKcBugVs1HPbC3qrGywSDrJww3z37EAH+xO/6f4ijI7Az3gF5Lmp9D
	sjQ/RLjwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZZcc-0007Vf-Ns; Mon, 02 Nov 2020 13:11:42 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZZcX-0007Tx-HX; Mon, 02 Nov 2020 13:11:38 +0000
Received: by mail-ej1-x641.google.com with SMTP id w13so5337066eju.13;
 Mon, 02 Nov 2020 05:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/RkXN4OFo+W9SVpTQ7rTjG1Jc2YrNCnjrHWcZHJNoak=;
 b=HeiW3q+D4q/dUP81vDVW90V67wNYM2TbE9aabOW4o/LsEfTM9Glle15KCmRWW3H4cf
 PkJYIFzrBXbkWMhc4vSiPicfo0JkfxceUEWyFU/c4hwiLryOCAeD+SG9IFIyhEae5Jad
 FYGKgCk8L6SH7fNx8QYiu0DsX4wKm6YMC1pj702LxmIHhni2kLBlucJjxQZqdL6M1jVI
 F5CJi3GEdhyU09s5tebgmQuWFlGyUm6Pac4BYisf2yQScTOcys6cQflmkrpEmcs610lH
 Gz1EQeiC8A66G7zhKl7HBz2JfOVle+arsrAW7pM/wOrkYPkRRl12LaNHdQlPzTAlPYUF
 0SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/RkXN4OFo+W9SVpTQ7rTjG1Jc2YrNCnjrHWcZHJNoak=;
 b=UBzjcFr19riCsxDASCmMjY5eXWmeENk94IB/wWzNEJjVGrGA/6nYxmn9CTd4FdIxD3
 J9Ao89coBhFKPvabWQVTMCZUqUqwe2lV5nIkSDR1tRtfykrwKTGtwx7xUpekU+KVaVDy
 46wvrrPhYtNNdyAcTwTcodcufKfR5UF4xc4dOAfpRvqQkwaJ3LX34NHf/omYGIFHIiJt
 kJJ+ocT7X5+Qtp9lLfv8W+yeNZEmbz83eHBwh1QizhaZ45IWgsrDIHzcIsxyyelIwreD
 jNhoDg8jgvi5Uf6L1uovDKDWlItrTj6dzfpUrfAq0ly0SCF1wHAsPAMmzZC4L6MenEcY
 oVjw==
X-Gm-Message-State: AOAM530bXz9bzGjteXh53SDtC6O/fLTsVxgiISMzMSJhBlUSIeAc+0rW
 vQNUMErUppVsDXHZA5xO15M5wCFJ8wZsHg==
X-Google-Smtp-Source: ABdhPJwKgliX46cwTLehe50qr8MXMOVehZnw1Fh0wN0HrPpMeF9lyDdEJlH9ePlsXo6WCylsBCpiWw==
X-Received: by 2002:a17:907:2089:: with SMTP id
 pv9mr1845201ejb.34.1604322696126; 
 Mon, 02 Nov 2020 05:11:36 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 b8sm7282438ejx.11.2020.11.02.05.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 05:11:35 -0800 (PST)
Subject: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>
 <e02e13a0-769d-6b73-c87e-5b7d75fd4254@rock-chips.com>
 <0b417fc2-3503-9bf6-914d-0f8b38df1914@gmail.com>
 <20201102140725.66e7dcb1@xps13>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <5ad70fa0-05a9-e1e7-32cc-32933ff25ae9@gmail.com>
Date: Mon, 2 Nov 2020 14:11:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201102140725.66e7dcb1@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_081137_609657_8F2E9795 
X-CRM114-Status: GOOD (  17.78  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 Yifeng <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMS8yLzIwIDI6MDcgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgSm9oYW4s
IFlpZmVuZwo+IAo+IEpvaGFuIEpvbmtlciA8amJ4NjI0NEBnbWFpbC5jb20+IHdyb3RlIG9uIE1v
biwgMiBOb3YgMjAyMCAxMzo1Nzo1Ngo+ICswMTAwOgo+IAo+PiBIaSBZaWZlbmcsCj4+Cj4+IERv
bid0IHBva2Ugd2l0aCAiZWNjLT5ieXRlcyIgb25lcyBpdCBpcyBzZXQgaW4gcmtfbmZjX2VjY19p
bml0KCkuIEl0Cj4+IHdpbGwgbm90IGJlIG5vdGVkIGJ5IHRoZSBNVEQgZnJhbWUgd29yayBvciB1
c2Vyc3BhY2UuIEkgdGhpbmsgdGhlcmUncwo+PiBjdXJyZW50bHkgbm8gd2F5IHRvIGxldCB0aGUg
dXNlciBrbm93IHRoYXQgYSBkaWZmZXJlbnQgRUNDIG11c3QgYmUgdXNlZC4KPj4gTmVpdGhlciBj
YW4gdGhlIHVzZXIgc2V0IEVDQyBvbiB0aGUgZmx5Lgo+Pgo+PiBFeGFtcGxlIFIvVyBmbG93Ogo+
Pgo+PiAgICAgICAgIG5hbmRfc2VsZWN0X3RhcmdldCgpCj4+IAljaGlwLT5lY2Mud3JpdGVfcGFn
ZV9yYXcoKQo+PiAJY2hpcC0+ZWNjLndyaXRlX3BhZ2UoKQo+Pgo+PiBbLi5dCj4+Cj4+IAljaGlw
LT5lY2MucmVhZF9wYWdlX3JhdygpCj4+IAljaGlwLT5lY2MucmVhZF9wYWdlKCkKPj4gICAgICAg
ICBuYW5kX2Rlc2VsZWN0X3RhcmdldCgpCj4+Cj4+IEEgd3JpdGUvcmVhZCB3aXRoOgo+Pgo+PiBy
a19uZmNfcmVhZF9wYWdlX2h3ZWNjKCkKPj4gcmtfbmZjX3dyaXRlX3BhZ2VfaHdlY2MoKQo+Pgo+
PiBvcgo+Pgo+PiBya19uZmNfcmVhZF9wYWdlX3JhdygpCj4+IHJrX25mY193cml0ZV9wYWdlX3Jh
dygpCj4+Cj4+IG11c3QgZW5kIHVwIHdpdGggdGhlIHNhbWUgcmVzdWx0LiBJZiB3ZSBjYW4ndCBh
cmNoaXZlIHRoYXQsIHRoZW4gd2UKPj4gc2hvdWxkbid0IG9mZmVyIFJBVyBtb2RlIHRvIHRoZSB1
c2VyIGZvciBub3cuIElmIE1pcXVlbCBhZ3JlZXMgeW91Cj4+IHNob3VsZCBqdXN0IGdldCB0aGUg
ZHJpdmVyIHJlYWR5IG5vdyB3aXRob3V0IHRoZXNlIDIgZnVuY3Rpb25zIGFuZCByb3VuZAo+PiB0
aGluZ3MgdXAuCj4gCj4gV2hhdCBhYm91dCBqdXN0IG5vdCBzdXBwb3J0aW5nIHRoZSBCb290Uk9N
IGFyZWEgaWYgaXQgd2FzIG1hcmtlZAo+ICJyZXNlcnZlZCIgYnkgdGhlIEJSb20gaW4gdGhlIERU
PwoKU2hvdWxkIHdlIGp1c3QgZmlsbCB0aGUgYnVmZmVycyB3aXRoICcweGZmJyBmb3IgYm9vdCBi
bG9ja3M/Cgo+IAo+IFJhdyBhY2Nlc3NvcnMgaXMgcmVhbGx5IGEgbmljZSBhbmQgYmFzaWMgZmVh
dHVyZSB0aGF0IEkgd291bGQgbGlrZSB0bwo+IGhhdmUgaW4gZXZlcnkgbmV3IGRyaXZlci4KPiAK
PiBUaGFua3MsCj4gTWlxdcOobAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
