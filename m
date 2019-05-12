Return-Path: <SRS0=9VLx=TM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E69C04A6B
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 13:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB143216C4
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 13:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OTrepqpM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AYklfwok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB143216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcRhPiZIbb5lCjFiFstvhp2dvuvPTQyEwQ94jhKT/uo=; b=OTrepqpMAq2zAR
	amh1VfVqSo4+j2pjHUYiLXlSZqOUwWT0A2mCHoRi0+lvNyQthgVBoP9+lSVZ2wjf22YVFU2hictOx
	De3LfBr9Qu+u9+hDThWonmFV4uHlUylKKiedNrAbd7a5ZZxwt/yF1Y87UDoPnX0EzHqvr9YGrIDN+
	VpmnxfFHBSu4XrVkjSGiARuxDyEUY+Zyfceg3A2yJpVN7wZWB4NxnsYwrT2jHVFjotM711EEU6xHg
	6eu1a9cqYlsMNmzgnQPE1VTAH3Jlg7/SmuVmESa6E57Z3MZ24TJVC5AFVWNtkvMA4TPP2cYmYAO/B
	sek0vxIHdXVYnaodub3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPoSy-0008Rs-2H; Sun, 12 May 2019 13:24:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPoSw-0008Rm-Cy
 for linux-mtd@bombadil.infradead.org; Sun, 12 May 2019 13:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4q+dL/p0wJxc7xbyzJnmLt94dkjlVzlOKRpHgzUfH80=; b=AYklfwokqH2TOEeFlls/3F3w7O
 1tg1LRAw0IXCA45fLjtDLroQ8blb6QrRHXrohZafmBjBQqUMygM8sVymTY30ZKVmTFKznrsN+aBOw
 WVAJH5vXJx1Zmoi8JByok9MJnb3Xd2x3gzR8Y+6hf9GaCgePa7orF+3oM8gZeviNk+4T1oIyKeJSO
 ABE3SCnACyx/Tb2sEY2BzFMDYM4K4RjYAGZb80ikQSPO1/nGhuUe9/s61yRdqURsRJ2wS7nUf1tEp
 NRyf74TAfz6wvHCHEqDJ0K9ampfj+sNeiQG04S/vxo2w7DTHuLxk/8kg8vknfOFbG+M294AnR+2Zl
 xl0FDq/Q==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPoSs-0007la-RS
 for linux-mtd@lists.infradead.org; Sun, 12 May 2019 13:24:32 +0000
Received: from xps13 (unknown [109.190.253.16])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id CBA23200009;
 Sun, 12 May 2019 13:23:49 +0000 (UTC)
Date: Sun, 12 May 2019 15:23:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3 4/4] dt-bindings: mfd: Document Macronix MX25F0A
 controller bindings
Message-ID: <20190512152328.49576a0f@xps13>
In-Reply-To: <1555320234-15802-5-git-send-email-masonccyang@mxic.com.tw>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-5-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_142430_910264_DF435D81 
X-CRM114-Status: GOOD (  17.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 juliensu@mxic.com.tw, bbrezillon@kernel.org, marcel.ziswiler@toradex.com,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, geert@linux-m68k.org, stefan@agner.ch,
 linux-mtd@lists.infradead.org, richard@nod.at, liang.yang@amlogic.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
TW9uLCAxNSBBcHIgMjAxOSAxNzoyMzo1NAorMDgwMDoKCj4gRG9jdW1lbnQgdGhlIGJpbmRpbmdz
IHVzZWQgYnkgdGhlIE1hY3Jvbml4IE1YMjVGMEEgTUZEIGNvbnRyb2xsZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWFzb24gWWFuZyA8bWFzb25jY3lhbmdAbXhpYy5jb20udHc+Cj4gLS0tCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9teGljLW14MjVmMGEudHh0ICAgICAgIHwgNTEgKysr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC9teGljLW14MjVmMGEudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvbXhpYy1teDI1ZjBhLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvbXhpYy1teDI1ZjBhLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMC4uN2YzZTBmOAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL214aWMtbXgyNWYwYS50eHQKPiBAQCAtMCww
ICsxLDUxIEBACj4gK01hY3Jvbml4IE1YMjVGMEEgTXVsdGlGdW5jdGlvbiBEZXZpY2UgVHJlZSBC
aW5kaW5ncwo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gKwo+ICtNWDI1RjBBIGlzIGEgTXVsdGlGdW5jdGlvbiBEZXZpY2Ugd2l0aCBTUEkg
YW5kIHJhdyBOQU5ELCB3aGljaAo+ICtzdXBwb3J0cyBlaXRoZXIgc3BpIGhvc3QgY29udHJvbGxl
ciBvciByYXcgbmFuZCBjb250cm9sbGVyLgoKQWNyb255bXMgaW4gcGxhaW4gRW5nbGlzaCBzaG91
bGQgYmUgaW4gdXBwZXIgY2FzZS4KCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNv
bXBhdGlibGU6IHNob3VsZCBiZSAibXhpYyxteDI1ZjBhIgo+ICstICNhZGRyZXNzLWNlbGxzOiBz
aG91bGQgYmUgMQo+ICstICNzaXplLWNlbGxzOiBzaG91bGQgYmUgMAo+ICstIHJlZzogc2hvdWxk
IGNvbnRhaW4gMiBlbnRyaWVzLCBvbmUgZm9yIHRoZSByZWdpc3RlcnMgYW5kIG9uZSBmb3IgdGhl
IGRpcmVjdAo+ICsgICAgICAgbWFwcGluZyBhcmVhIGluIFNQSSBtb2RlLgo+ICstIHJlZy1uYW1l
czogc2hvdWxkIGNvbnRhaW4gInJlZ3MiIGFuZCAiZGlybWFwIgo+ICstIGludGVycnVwdHM6IGlu
dGVycnVwdCBsaW5lIGNvbm5lY3RlZCB0byB0aGlzIE1GRCBjb250cm9sbGVyCj4gKy0gU1BJIGNv
bnRyb2xsZXIgZHJpdmVyOgo+ICsJCS0gY2xvY2stbmFtZXM6IHNob3VsZCBjb250YWluICJwc19j
bGsiLCAic2VuZF9jbGsiIGFuZAo+ICsJCQkgICAgICAgInNlbmRfZGx5X2NsayIKPiArCQktIGNs
b2Nrczogc2hvdWxkIGNvbnRhaW4gMyBlbnRyaWVzIGZvciB0aGUgInBzX2NsayIsICJzZW5kX2Ns
ayIKPiArCQkJICBhbmQgInNlbmRfZGx5X2NsayIgY2xvY2tzCj4gKwo+ICstIFJhdyBuYW5kIGNv
bnRyb2xsZXIgZHJpdmVyLgo+ICsJCS0gbmFuZC1lY2MtbW9kZSA9ICJzb2Z0IjsKPiArCQktIG5h
bmQtZWNjLWFsZ28gPSAiYmNoIjsKPiArCj4gK0V4YW1wbGU6Cj4gKwo+ICsJbXhpYzogbXgyNWYw
YUA0M2MzMDAwMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJteGljLG14MjVmMGEiOwo+ICsJCXJlZyA9
IDwweDQzYzMwMDAwIDB4MTAwMDA+LCA8MHhhMDAwMDAwMCAweDQwMDAwMDA+Owo+ICsJCXJlZy1u
YW1lcyA9ICJyZWdzIiwgImRpcm1hcCI7Cj4gKwo+ICsJCS8qIHNwaSAqLwo+ICsJCWNsb2NrcyA9
IDwmY2xrd2l6YXJkIDA+LCA8JmNsa3dpemFyZCAxPiwgPCZjbGtjIDE1PjsKPiArCQljbG9jay1u
YW1lcyA9ICJzZW5kX2NsayIsICJzZW5kX2RseV9jbGsiLCAicHNfY2xrIjsKPiArCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiArCj4gKwkJZmxhc2hAMCB7
Cj4gKwkJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4gKwkJCXJlZyA9IDwwPjsKPiAr
CQkJc3BpLW1heC1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ICsJCQlzcGktdHgtYnVzLXdpZHRo
ID0gPDQ+Owo+ICsJCQlzcGktcngtYnVzLXdpZHRoID0gPDQ+Owo+ICsJCX07Cj4gKwo+ICsJCS8q
IG5hbmQgKi8KPiArCQluYW5kLWVjYy1tb2RlID0gInNvZnQiOwo+ICsJCW5hbmQtZWNjLWFsZ28g
PSAiYmNoIjsKPiArCQluYW5kLWVjYy1zdGVwLXNpemUgPSA8NTEyPjsKPiArCQluYW5kLWVjYy1z
dHJlbmd0aCA9IDw4PjsKCkFueSByZWFzb24gdG8gZW5mb3JjZSA1MTJCLzhiIGNvcnJlY3Rpb24/
IFdoeSBub3QgbGV0dGluZyB0aGUgY29yZQpjaG9vc2UgZm9yIHlvdSBkZXBlbmRpbmcgb24gdGhl
IE5BTkQgY2hpcCdzIHJlcXVpcmVtZW50cz8KCgpBbnl3YXksIEkgdGhpbmsgeW91IGNhbiBoYXZl
IG9ubHkgb25lIG9yIHRoZSBvdGhlciAoTkFORCBvciBTUEkpLCBub3QKYm90aCwgYW5kIHlvdSBw
cm9iYWJseSBzaG91bGQgaGF2ZSBhIGNvbXBhdGlibGUgb3IgYSBwcm9wZXJ0eSB0byB0ZWxsCnRo
ZSBrZXJuZWwgd2hpY2ggb25lIHlvdSBhcmUgdXNpbmcsIHJpZ2h0PwoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
