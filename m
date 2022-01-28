Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7637EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBFA20jG//Wsg3hJ8Z1Zx7ZgESUNg7cZpDJpAZh5rts=; b=kpUk2GlRBfORjV
	ENyuQwy5v7k3SPh6gZ4/FUa/weKOTU0wtNqYM2VsAwkig4twVz5qYgdmMwrpsiRWA+/l4XGNmatdG
	nmWiA/Ixp7Mw6q9wcsBqLoUIkwq6J5B0U1OP96TxVaEUe4ItJBsqPBpDFYrm8Ye+E8IFKuM+UgeUA
	UOZJi0HvEy2owVJb+HCGId738d0fi8GvbrFGjqOjCogBgarv8YFhmLk/j+oL7UXKRmla54gj00hTP
	YBKZ7KXp8PvVyfs8716lqE1k7SFcd0FfIxS8B+Jy2yiPAceRyhy8ks2WW8D1Sfjl7Y+abfutu6Jzd
	faRXNS7FqSO043cMlu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDPcv-001kbw-II; Fri, 28 Jan 2022 11:41:13 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDPcU-001kSd-FP; Fri, 28 Jan 2022 11:40:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17EA760008;
 Fri, 28 Jan 2022 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643370040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQ1me8J/Zy0/NpDBsjxiNJCRMDYVYBgfgf4KXYlMBQE=;
 b=mhkRrkTFQg/3TwqlXdkqBpBcXYqooijDEC2Kv+kedQOmu14iMZ3uqYYp7BiMJpKHPzO7iy
 K64mkM4MAc2MJ7OVlGPAgcqvyNzthsTgD/NKZuOl7ELRyABV+8rc8HwoIbzZmAtRAuWGg+
 fzwgwjlFGo6ML3GP5Mj3WTlewRxkK7vgDTYSnmuUQ8OA+C5eK0WJSiW0qjzuSdhgMtfPC0
 8FQsAx5DK5K0oJiMV2V1Tq1YhS+iDXdMMvRuwx48thJ7g0dGuFvVEItgQzpadG/4q3RABR
 FvkCkJISCwUQzpok9OZsWFy77buG+yRQap9aK4cOeMt6MKRMAkLsFcmMpngpDg==
Date: Fri, 28 Jan 2022 12:40:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Message-ID: <20220128124036.25fe0539@xps13>
In-Reply-To: <20220128113237.39996-2-liang.yang@amlogic.com>
References: <20220128113237.39996-1-liang.yang@amlogic.com>
 <20220128113237.39996-2-liang.yang@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_034046_857388_2D8D7355 
X-CRM114-Status: GOOD (  19.14  )
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

SGkgTGlhbmcsCgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIEZyaSwgMjggSmFuIDIw
MjIgMTk6MzI6MzYgKzA4MDA6Cgo+IEVNTUMgYW5kIE5BTkQgaGFzIHRoZSBzYW1lIGNsb2NrIGNv
bnRyb2wgcmVnaXN0ZXIgbmFtZWQgJ1NEX0VNTUNfQ0xPQ0snIHdoaWNoIGlzCgpoYXZlCgo+IGRl
ZmluZWQgaW4gRU1NQyBwb3J0IGludGVybmFsbHkuIGJpdDB+NSBvZiAnU0RfRU1NQ19DTE9DSycg
aXMgdGhlIGRpdmlkZXIgYW5kCj4gYml0Nn43IGlzIHRoZSBtdXggZm9yIGZpeCBwbGwgYW5kIHh0
YWwuCgo+IFByZXZpb3VzbHkgYSBjb21tb24gTU1DIHN1YiBjbG9jayBmcmFtZXdvcmsgaXMgaW1w
bGVtZW50ZWQgYW5kIHNoYXJlZCBieSBFTU1DIGFuZAoKSSBiZWxpZXZlIHlvdSBtZWFudCB0aGF0
IHRoaXMgaGFzYSBhbHJlYWR5IGJlZW4gY29udHJpYnV0ZWQ/IEkgd291bGQKdGhlbiByZXBocmFz
ZSB3aXRoOgoKQSBjb21tb24gTU1DIGFuZCBOQU5EIHN1Yi1jbG9jayBoYXMgYmVlbiBpbXBsZW1l
bnRlZCBhbmQgY2FuIGJlIHVzZWQgYnkKdGhlIGVNTUMgYW5kIE5BTkQgY29udHJvbGxlciAod2hp
Y2ggYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZSBhbnl3YXkpLgoKTGV0J3MgdXNlIHRoaXMgbmV3IGNs
b2NrLgoKPiBOQU5ELCBidXQgdGhhdCBpcyBjb3VwbGluZyB0aGUgRU1NQyBhbmQgTkFORCwgYWx0
aG91Z2ggRU1NQyBhbmQgTkFORCBpcyBtdXR1YWxseQo+IGV4Y2x1c2l2ZS4KPiAKPiBDaGFuZ2Ut
SWQ6IEliZWI0YzdmZjg4NmY1ODg2YWFjNGQ2YzY2NGQ3YmJkMWIxYmNiOTk3CgpObyBjaGFuZ2Ug
SWRzLgoKPiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBZYW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAxNjEgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4OSBpbnNlcnRpb25z
KCspLCA3MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gaW5k
ZXggYWMzYmU5Mjg3MmQwLi5mNmEzZDVjMmVhMWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25f
bmFuZC5jCj4gQEAgLTIsNyArMiw3IEBACj4gIC8qCj4gICAqIEFtbG9naWMgTWVzb24gTmFuZCBG
bGFzaCBDb250cm9sbGVyIERyaXZlcgo+ICAgKgo+IC0gKiBDb3B5cmlnaHQgKGMpIDIwMTggQW1s
b2dpYywgaW5jLgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTgtMjAyMSBBbWxvZ2ljLCBpbmMuCgpQ
bGVhc2UgZG9uJ3QuCgo+ICAgKiBBdXRob3I6IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1sb2dp
Yy5jb20+Cj4gICAqLwo+ICAKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgv
ZG1hLW1hcHBpbmcuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvY2xrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L210ZC9yYXduYW5kLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+Cj4gQEAgLTE5LDYgKzIwLDcgQEAKPiAg
I2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFza19zdGFjay5oPgo+ICAKPiAgI2RlZmluZSBO
RkNfUkVHX0NNRAkJMHgwMAo+IEBAIC0xMDQsNiArMTA2LDkgQEAKPiAgCj4gICNkZWZpbmUgUEVS
X0lORk9fQllURQkJOAo+ICAKPiArI2RlZmluZSBDTEtfRElWX1NISUZUCQkwCj4gKyNkZWZpbmUg
Q0xLX0RJVl9XSURUSAkJNgo+ICsKPiAgc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgewo+ICAJ
c3RydWN0IGxpc3RfaGVhZCBub2RlOwo+ICAJc3RydWN0IG5hbmRfY2hpcCBuYW5kOwo+IEBAIC0x
NTEsMTUgKzE1NiwxNyBAQCBzdHJ1Y3QgbWVzb25fbmZjIHsKPiAgCXN0cnVjdCBuYW5kX2NvbnRy
b2xsZXIgY29udHJvbGxlcjsKPiAgCXN0cnVjdCBjbGsgKmNvcmVfY2xrOwo+ICAJc3RydWN0IGNs
ayAqZGV2aWNlX2NsazsKPiAtCXN0cnVjdCBjbGsgKnBoYXNlX3R4Owo+IC0Jc3RydWN0IGNsayAq
cGhhc2Vfcng7Cj4gKwlzdHJ1Y3QgY2xrICpuYW5kX2NsazsKPiArCXN0cnVjdCBjbGtfZGl2aWRl
ciBuYW5kX2RpdmlkZXI7Cj4gIAo+ICAJdW5zaWduZWQgbG9uZyBjbGtfcmF0ZTsKPiAgCXUzMiBi
dXNfdGltaW5nOwo+ICAKPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiAtCXZvaWQgX19pb21lbSAq
cmVnX2Jhc2U7Cj4gLQlzdHJ1Y3QgcmVnbWFwICpyZWdfY2xrOwo+ICsJc3RydWN0IHsKPiArCQl2
b2lkIF9faW9tZW0gKnJlZ19iYXNlOwo+ICsJCXZvaWQgX19pb21lbSAqc2RfZW1tY19jbG9jazsK
PiArCX0gcmVzOwoKUGxlYXNlIHNwbGl0IHlvdXIgY29tbWl0OiBmaXJzdCB0aGUgbWVjaGFuaWNh
bCBjaGFuZ2VzLCB0aGVuIHRoZSB1c2Ugb2YKdGhlIG5ldyBhcmVhIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCgpPdGhlcndpc2UgdGhlcmUgYXJlIHRvbyBtYW55IGxpbmVzIGNoYW5nZWQsIEkgY2Fu
J3Qgc3BvdCB3aGVyZSBpdCBpcwppbnRlcmVzdGluZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
