Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CE9C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 01:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0RJPdjeqteiNTMn7uoSNKGmsxnDDWu0ubVTQK4sIwU=; b=F/UMNEhk40xSHjrP4BH5yOq4UV
	M9fQPPUPAfMf7BBUZGSB16Ds/KBqclk3Wa1cop/7u2BzHRPuFd9yhVoxb/GhUafVwdOPszYM924AE
	b1LzhCk/E38A5EgPrDvFixtsImxA9qE3pUKL66bNdXJEALXMTcDJ97XeQ2fdtzGcdOCi9XiRh0Uk1
	uovFjhYHxoRPtEbAcaDR8tBi5OU6ee2cdO5NmJXM7J8ICxzhP9yvju0Pd0GtOcJiwLkktp8KT87Go
	NNA0ZoDus28iECkaIA3tsz6U5q4bjOqrcTO2dnbdK1ZbBDS0GpIuWHyUyUCwMMua0se24bK1TCfNW
	zNcZ0qFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQMW-009OTO-If; Sun, 24 Jul 2022 01:24:52 +0000
Received: from out28-193.mail.aliyun.com ([115.124.28.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQMT-009OQ2-Ti
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 01:24:51 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09999388|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0805319-0.0018128-0.917655;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.Oc.heif_1658625883;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Oc.heif_1658625883)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 09:24:45 +0800
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
To: Mark Brown <broonie@kernel.org>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
 <YtrukeLk9fInqQIL@sirena.org.uk>
 <89d22457-8c62-e441-3bf4-2734ec2a45e1@wanyeetech.com>
 <YtxMwyRghFKS/vu5@sirena.org.uk>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <1404dd8d-475e-b3b6-a3da-4eeddca3070b@wanyeetech.com>
Date: Sun, 24 Jul 2022 09:24:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YtxMwyRghFKS/vu5@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_182450_142193_B60F4C66 
X-CRM114-Status: GOOD (  17.90  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyaywKCk9uIDIwMjIvNy8yNCDkuIrljYgzOjMyLCBNYXJrIEJyb3duIHdyb3RlOgo+IE9u
IFN1biwgSnVsIDI0LCAyMDIyIGF0IDAxOjA2OjE2QU0gKzA4MDAsIFpob3UgWWFuamllIHdyb3Rl
Ogo+PiBPbiAyMDIyLzcvMjMg5LiK5Y2IMjozOCwgTWFyayBCcm93biB3cm90ZToKPj4+PiArKysg
Yi9kcml2ZXJzL3NwaS9zcGktaW5nZW5pYy1zZmMuYwo+Pj4+IEBAIC0wLDAgKzEsNjYyIEBACj4+
Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkKPj4+PiArLyoKPj4+PiArICogSW5nZW5pYyBTb0NzIFNQSSBGbGFzaCBDb250cm9sbGVy
IERyaXZlcgo+Pj4gUGxlYXNlIG1ha2UgdGhlIGVudGlyZSBjb21tZW50IGEgQysrIG9uZSBzbyB0
aGluZ3MgbG9vayBtb3JlCj4+PiBpbnRlbnRpb25hbC4KPj4gSSdtIHNvcnJ5LCBJIGRpZG4ndCB1
bmRlcnN0YW5kIHdlbGwgd2hhdCB5b3UgbWVhbnQgOigKPj4gQ291bGQgeW91IHBsZWFzZSBleHBs
YWluIGEgbGl0dGxlIG1vcmUgZGV0YWlsPwo+IFRoZSBhYm92ZSBjb21tZW50IGJsb2NrIHVzZXMg
Ym90aCBDIC8qICovIGFuZCBDKysgLy8gc3R5bGUgY29tbWVudHMsCj4gcGxlYXNlIG1ha2UgaXQg
anVzdCB1c2UgdGhlIEMrKyBzdHlsZS4KCgpTdXJlLCB3aWxsIGRvIGluIHRoZSBuZXh0IHZlcnNp
b24uCgoKPj4+PiArc3RhdGljIGlycXJldHVybl90IGluZ2VuaWNfc2ZjX2lycV9oYW5kbGVyKGlu
dCBpcnEsIHZvaWQgKmRhdGEpCj4+Pj4gK3sKPj4+PiArCXN0cnVjdCBpbmdlbmljX3NmYyAqc2Zj
ID0gZGF0YTsKPj4+PiArCj4+Pj4gKwl3cml0ZWwoMHgxZiwgc2ZjLT5iYXNlICsgU0ZDX1JFR19J
TlRDKTsKPj4+PiArCj4+Pj4gKwljb21wbGV0ZSgmc2ZjLT5jb21wbGV0aW9uKTsKPj4+PiArCj4+
Pj4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4+Pj4gK30KPj4+IFRoaXMgZG9lc24ndCBwYXkgYW55
IGF0dGVudGlvbiB0byBhbnkgc3RhdHVzIHJlZ2lzdGVycyBpbiB0aGUgY2hpcCBzbwo+Pj4gd29u
J3Qgd29yayBpZiB0aGUgaW50ZXJydXB0IGlzIHNoYXJlZCBhbmQgd29uJ3Qgbm90aWNlIGFueSBl
cnJvciByZXBvcnRzCj4+PiBmcm9tIHRoZSBkZXZpY2UuLi4KPj4gVGhpcyBpbnRlcnJ1cHQgaXMg
ZXhjbHVzaXZlbHkgb3duZWQgYnkgU0ZDLCBkbyB3ZSBzdGlsbAo+PiBuZWVkIHRvIHBlcmZvcm0g
dGhlIG9wZXJhdGlvbiB5b3Ugc2FpZD8gSSBoYXZlbid0IGRvbmUKPj4gdGhlc2Ugb3BlcmF0aW9u
cyBiZWZvcmUgYmVjYXVzZSBJIHdhbnQgdG8gbWluaW1pemUgdGhlCj4+IG92ZXJoZWFkIGFuZCBh
dm9pZCBhZmZlY3RpbmcgcGVyZm9ybWFuY2UuCj4gRXZlbiBpZiB0aGUgZGV2aWNlIGlzIG5vdCBz
aGFyZWQgaXMgdGhlcmUgbm8gcG9zc2liaWxpdHkgdGhhdCB0aGUKPiBkZXZpY2UgY2FuIHJlcG9y
dCBhbiB1bmV4cGVjdGVkIGludGVycnVwdCBzdGF0dXM/ICBJdCdzIG5vdCBqdXN0Cj4gdGhlIHNo
YXJpbmcgY2FzZSwgaXQncyBhbHNvIHRoZSBmYWN0IHRoYXQgaXQgbG9va3MgbGlrZSB0aGVyZSdz
IGEKPiBzdGF0dXMgYmVpbmcgcmVwb3J0ZWQgYnV0IHdlJ3JlIG5vdCBjaGVja2luZyBpdCBzbyBp
ZiBhbnl0aGluZwo+IGdvZXMgd3JvbmcgdGhlbiB3ZSdyZSBsZXNzIGxpa2VseSB0byBub3RpY2Uu
ICBJJ2Qgd29ycnkgYWJvdXQKPiBkYXRhIGNvcnJ1cHRpb24uCgoKU3VyZSwgSSB3aWxsIGNoYW5n
ZSB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uCgoKVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMhCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
