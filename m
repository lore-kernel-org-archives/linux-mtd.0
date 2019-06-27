Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7593C48BD9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 17:27:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EB4D2064A
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 17:27:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQxCSZcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RShiO4aS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EB4D2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvcDqDvJrY/G8ds8nuh0BRCP3kHILkEM9MMjGZoBNUg=; b=sQxCSZccjQ66hm
	ig3UuTqHyBJHsyKg0u3jBTo0D7nFQeQEW3ZP/oJbvFd/LcEtW6FgVgqpyOtVLAWwDkX3qtHkvSe4g
	cJ6krv4gfKNCUjw75h/ye3jI1H59YgLl9Blig4U7Tg5WFKRuHKa1aM9yad/1oI4lvWVkjml1uXV5l
	a4yneRSB0XlJwX82uO+bmWF4yTaOVckKCFMQJTxEQ2ULL4knFcxnrNmBja3bPn8ccAa3am2uUA0n4
	qB3VCKziXW6eMz4LEjnGDkeLFlx9n800LReLoSPhqrrlzp7IP3SybZVplnj2BLRcfU+csWzwBnnNW
	nPIZSsOBiiLUD0H/W/2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgYAp-0006T8-Bd; Thu, 27 Jun 2019 17:27:03 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgYAn-0006SH-G7
 for linux-mtd@bombadil.infradead.org; Thu, 27 Jun 2019 17:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JfhU4Xt4+sxfjUEDv7fX3mm3BmsgCtwDCgV3ZstzC2I=; b=RShiO4aSpyAX7Tf2Fe26PBl227
 9GRxvo9UvBzXRAG/N5cVAf4wFCzFUWcU1MnuUsrb8465KTqdhT+8lCscZ4j2M9gclDPO4OwlqHCZ6
 TJ6NXs8UfjqoL990xcpz+wITxJh01CHgG4dtRpjSWxj1Fm+YeTYnldtkh+PEUQz7WfIBREGjv/BiD
 g8k8dmmJxE/Y1zBGIJFsbssjX7hyexru3mBRwUMxUtg5dYyEmUMleH7O2o3r0NFshxoUrqnMRnWW1
 /Iw1+tD4s6ivj3T12OcUhpWlCZOW4Ku0Iu4WlHkYyMp65YTfZdiRPJ43bvCzRf/Bk21MDX/+qVccL
 DxgOP5OA==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgYAj-0001pL-I7
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 17:26:59 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A5B4D200004;
 Thu, 27 Jun 2019 17:26:12 +0000 (UTC)
Date: Thu, 27 Jun 2019 19:26:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Message-ID: <20190627192609.0965f6d5@xps13>
In-Reply-To: <1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
 <1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, anders.roxell@linaro.org, vigneshr@ti.com,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, broonie@kernel.org, linux-kernel@vger.kernel.org,
 stefan@agner.ch, paul@crapouillou.net, marek.vasut@gmail.com,
 paul.burton@mips.com, liang.yang@amlogic.com, linux-mtd@lists.infradead.org,
 christophe.kerello@st.com, lee.jones@linaro.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
VHVlLCAyNSBKdW4gMjAxOSAxNDoxMDo1NgorMDgwMDoKCj4gRG9jdW1lbnQgdGhlIGJpbmRpbmdz
IHVzZWQgYnkgdGhlIE1hY3Jvbml4IHJhdyBOQU5EIGNvbnRyb2xsZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWFzb24gWWFuZyA8bWFzb25jY3lhbmdAbXhpYy5jb20udHc+Cj4gLS0tCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGljLW5hbmQudHh0ICAgICAgICAgIHwgMjYgKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9t
eGljLW5hbmQudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvbXhpYy1uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbXhpYy1uYW5kLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMC4uM2QxOThlNAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL214aWMtbmFuZC50eHQKPiBAQCAtMCwwICsxLDI2IEBACj4gK01h
Y3Jvbml4IFJhdyBOQU5EIENvbnRyb2xsZXIgRGV2aWNlIFRyZWUgQmluZGluZ3MKPiArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsKPiArUmVxdWly
ZWQgcHJvcGVydGllczoKPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgIm14aWMscmF3LW5hbmQt
Y3RsciIKCkkgd291bGQgcHJlZmVyICJtYWNyb25peCxuYW5kLWNvbnRyb2xsZXIiCgo+ICstIHJl
Zzogc2hvdWxkIGNvbnRhaW4gMSBlbnRyaWUgZm9yIHRoZSByZWdpc3RlcnMKCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVudHJ5Cgo+ICstIHJlZy1uYW1lczogc2hvdWxkIGNvbnRhaW4gInJl
Z3MiCgpOb3Qgc3VyZSB5b3UgbmVlZCB0aGF0PwoKPiArLSBpbnRlcnJ1cHRzOiBpbnRlcnJ1cHQg
bGluZSBjb25uZWN0ZWQgdG8gdGhpcyBOQU5EIGNvbnRyb2xsZXIKPiArLSBjbG9jay1uYW1lczog
c2hvdWxkIGNvbnRhaW4gInBzX2NsayIsICJzZW5kX2NsayIgYW5kICJzZW5kX2RseV9jbGsiCj4g
Ky0gY2xvY2tzOiBzaG91bGQgY29udGFpbiAzIGVudHJpZXMgZm9yIHRoZSAicHNfY2xrIiwgInNl
bmRfY2xrIiBhbmQKPiArCSAic2VuZF9kbHlfY2xrIiBjbG9ja3MKCnMvZW50cmllcy9waGFuZGxl
cy8gPwoKPiArCj4gK0V4YW1wbGU6Cj4gKwo+ICsJbmFuZDogbXhpYy1uZmNANDNjMzAwMDAgewo+
ICsJCWNvbXBhdGlibGUgPSAibXhpYyxyYXctbmFuZC1jdGxyIjsKPiArCQlyZWcgPSA8MHg0M2Mz
MDAwMCAweDEwMDAwPjsKPiArCQlyZWctbmFtZXMgPSAicmVncyI7Cj4gKwkJY2xvY2tzID0gPCZj
bGt3aXphcmQgMD4sIDwmY2xrd2l6YXJkIDE+LCA8JmNsa2MgMTU+Owo+ICsJCWNsb2NrLW5hbWVz
ID0gInNlbmRfY2xrIiwgInNlbmRfZGx5X2NsayIsICJwc19jbGsiOwo+ICsKPiArCQluYW5kLWVj
Yy1tb2RlID0gInNvZnQiOwo+ICsJCW5hbmQtZWNjLWFsZ28gPSAiYmNoIjsKPiArCQluYW5kLWVj
Yy1zdGVwLXNpemUgPSA8NTEyPjsKPiArCQluYW5kLWVjYy1zdHJlbmd0aCA9IDw4PjsKClRoZSBs
YXN0IDQgbGluZXMgYXJlIHByb2JhYmx5IG5vdCBuZWVkZWQuCgo+ICsJfTsKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
