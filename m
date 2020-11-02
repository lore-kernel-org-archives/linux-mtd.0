Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3818EC388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 17:02:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64DC20786
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 17:02:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lA6ilhQ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D64DC20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KHCmJaQbMI9nP8Kx2F5cV5QXRmeIiyeedfgZTl1QstQ=; b=lA6ilhQ6uCJwPnkGTVQJJ/sCq
	jsrWdV2oXOiTYpZ9/lEkE8lEkSlDciG1007LkwASOTXVQOig7knkiELw/vTZxiutJMwWY+TqCOxzo
	g/T5YlJ3pLJIczR4zGxlfMNhsmH0BHV37PjJPkhq2ZGJKTq3A+zzlVytdvtg2PZGESIL+G52wcq+7
	BiB+jdV0ZSVMpol3JgJzuLk4iF0v+e5ReKdekkc9ZbNWbXSnk/eYZPCmUzdwqeMNZN9/Zq/Q2Gshb
	XUtV2b8KCA0sQLjVAgXLsR34Gqn7euD4ZkmIrqKY2CVgD7MoSzavH3QXcGdM3RqiGNmHmBhfKmkip
	MJR+hyEAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZdCQ-0001lH-TW; Mon, 02 Nov 2020 17:00:54 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZdCI-0001j7-6q; Mon, 02 Nov 2020 17:00:47 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2B6131BF20A;
 Mon,  2 Nov 2020 17:00:41 +0000 (UTC)
Date: Mon, 2 Nov 2020 18:00:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
Message-ID: <20201102180039.757d3234@xps13>
In-Reply-To: <803e291f-67e0-f66c-6c9e-041db1b3847c@gmail.com>
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>
 <e02e13a0-769d-6b73-c87e-5b7d75fd4254@rock-chips.com>
 <0b417fc2-3503-9bf6-914d-0f8b38df1914@gmail.com>
 <20201102140725.66e7dcb1@xps13>
 <5ad70fa0-05a9-e1e7-32cc-32933ff25ae9@gmail.com>
 <803e291f-67e0-f66c-6c9e-041db1b3847c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_120046_389291_20837EE6 
X-CRM114-Status: GOOD (  20.41  )
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

SGkgSm9oYW4sCgpKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29tPiB3cm90ZSBvbiBNb24s
IDIgTm92IDIwMjAgMTc6MzE6MTgKKzAxMDA6Cgo+IE9uIDExLzIvMjAgMjoxMSBQTSwgSm9oYW4g
Sm9ua2VyIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IE9uIDExLzIvMjAgMjowNyBQTSwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPiA+PiBIaSBKb2hhbiwgWWlmZW5nCj4gPj4KPiA+PiBKb2hhbiBKb25r
ZXIgPGpieDYyNDRAZ21haWwuY29tPiB3cm90ZSBvbiBNb24sIDIgTm92IDIwMjAgMTM6NTc6NTYK
PiA+PiArMDEwMDoKPiA+Pgo+ID4+PiBIaSBZaWZlbmcsCj4gPj4+Cj4gPj4+IERvbid0IHBva2Ug
d2l0aCAiZWNjLT5ieXRlcyIgb25lcyBpdCBpcyBzZXQgaW4gcmtfbmZjX2VjY19pbml0KCkuIEl0
Cj4gPj4+IHdpbGwgbm90IGJlIG5vdGVkIGJ5IHRoZSBNVEQgZnJhbWUgd29yayBvciB1c2Vyc3Bh
Y2UuIEkgdGhpbmsgdGhlcmUncwo+ID4+PiBjdXJyZW50bHkgbm8gd2F5IHRvIGxldCB0aGUgdXNl
ciBrbm93IHRoYXQgYSBkaWZmZXJlbnQgRUNDIG11c3QgYmUgdXNlZC4KPiA+Pj4gTmVpdGhlciBj
YW4gdGhlIHVzZXIgc2V0IEVDQyBvbiB0aGUgZmx5Lgo+ID4+Pgo+ID4+PiBFeGFtcGxlIFIvVyBm
bG93Ogo+ID4+Pgo+ID4+PiAgICAgICAgIG5hbmRfc2VsZWN0X3RhcmdldCgpCj4gPj4+IAljaGlw
LT5lY2Mud3JpdGVfcGFnZV9yYXcoKQo+ID4+PiAJY2hpcC0+ZWNjLndyaXRlX3BhZ2UoKQo+ID4+
Pgo+ID4+PiBbLi5dCj4gPj4+Cj4gPj4+IAljaGlwLT5lY2MucmVhZF9wYWdlX3JhdygpCj4gPj4+
IAljaGlwLT5lY2MucmVhZF9wYWdlKCkKPiA+Pj4gICAgICAgICBuYW5kX2Rlc2VsZWN0X3Rhcmdl
dCgpCj4gPj4+Cj4gPj4+IEEgd3JpdGUvcmVhZCB3aXRoOgo+ID4+Pgo+ID4+PiBya19uZmNfcmVh
ZF9wYWdlX2h3ZWNjKCkKPiA+Pj4gcmtfbmZjX3dyaXRlX3BhZ2VfaHdlY2MoKQo+ID4+Pgo+ID4+
PiBvcgo+ID4+Pgo+ID4+PiBya19uZmNfcmVhZF9wYWdlX3JhdygpCj4gPj4+IHJrX25mY193cml0
ZV9wYWdlX3JhdygpCj4gPj4+Cj4gPj4+IG11c3QgZW5kIHVwIHdpdGggdGhlIHNhbWUgcmVzdWx0
LiBJZiB3ZSBjYW4ndCBhcmNoaXZlIHRoYXQsIHRoZW4gd2UKPiA+Pj4gc2hvdWxkbid0IG9mZmVy
IFJBVyBtb2RlIHRvIHRoZSB1c2VyIGZvciBub3cuIElmIE1pcXVlbCBhZ3JlZXMgeW91Cj4gPj4+
IHNob3VsZCBqdXN0IGdldCB0aGUgZHJpdmVyIHJlYWR5IG5vdyB3aXRob3V0IHRoZXNlIDIgZnVu
Y3Rpb25zIGFuZCByb3VuZAo+ID4+PiB0aGluZ3MgdXAuCj4gPj4KPiA+PiBXaGF0IGFib3V0IGp1
c3Qgbm90IHN1cHBvcnRpbmcgdGhlIEJvb3RST00gYXJlYSBpZiBpdCB3YXMgbWFya2VkCj4gPj4g
InJlc2VydmVkIiBieSB0aGUgQlJvbSBpbiB0aGUgRFQ/Cj4gPiAKPiA+IFNob3VsZCB3ZSBqdXN0
IGZpbGwgdGhlIGJ1ZmZlcnMgd2l0aCAnMHhmZicgZm9yIGJvb3QgYmxvY2tzPwo+IAo+IChwYXJ0
IDIpIDspCj4gTXkgZmF1bHQuLi4uCj4gQmV0dGVyIHVzZToKPiAKPiAgICAgaWYgKChjaGlwLT5v
cHRpb25zICYgTkFORF9JU19CT09UX01FRElVTSkgJiYKPiAgICAgICAgIChwYWdlIDwgKHBhZ2Vz
X3Blcl9ibGsgKiBya25hbmQtPmJvb3RfYmxrcykpKSB7Cj4gCj4gCXJldHVybiAtRUlPOwo+IAo+
ICAgICB9CgpZdXAsIEkgd2FzIGFib3V0IHRvIHRlbGwgeW91IHRoYXQgSSB3b3VsZCBwcmVmZXIg
cmV0dXJuaW5nIGEgbmljZQplcnJvciwgdGhpcyBpcyBmaW5lIEkgZ3Vlc3MuCgpBbnl3YXksIEkg
dGhpbmsgcmVhZGluZyBiYWQgYmxvY2sgbWFya2VycyBpcyBkb25lIGluIHJhdyBtb2RlLCBzbyBp
ZgpyYXcgYWNjZXNzb3JzIHJlZnVzZSB0byByZXR1cm4gdmFsaWQgdmFsdWVzIGZvciBib290IGJs
b2NrcywgeW91IHdvbid0CmJlIGFibGUgdG8gYWNjZXNzIGl0IG5laXRoZXIgd2l0aCByYXcgbm9y
IGNvcnJlY3RlZCBob29rcy4KClBlcmhhcHMgcmVmdXNpbmcgdGhlIGFjY2VzcyB0byB0aGUgcmVn
dWxhciBwYWdlIGFjY2VzcyBpcyBvaywgYnV0IG1heWJlCndlIHNob3VsZCBiZSBhYmxlIHRvIGF0
IGxlYXN0IHJlYWQgdGhlc2UgcGFnZXMgaW4gcmF3IG1vZGUKKGFuZCBtb3ZlIHRoZSBCQk0gdG8g
aXRzIHJpZ2h0IGxvY2F0aW9uKS4gV2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MsCk1pcXXDqGwK
Cj4gCj4gCj4gPiAKPiA+Pgo+ID4+IFJhdyBhY2Nlc3NvcnMgaXMgcmVhbGx5IGEgbmljZSBhbmQg
YmFzaWMgZmVhdHVyZSB0aGF0IEkgd291bGQgbGlrZSB0bwo+ID4+IGhhdmUgaW4gZXZlcnkgbmV3
IGRyaXZlci4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBNaXF1w6hsCj4gPj4KPiA+IAo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
