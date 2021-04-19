Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C70BC43461
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 07:33:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E596102A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 07:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E596102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i/XsCKKS3RLDzfvl3dUs6G6sIsARW6E4mVfUfUgv+Mk=; b=f+eNGqArc56hMIxrdaSwW6O4Y
	IAWx937HJytZRzJjYnEgvQTwz/GyO0BK+x1sWgfKc7Vd92uVrfRALFi6WAv+0LmK6O7couD661XN+
	tDudoJiX+rj/UXQjwa91ia0YS1TRdT2JYkhLbHZ402H71pdQD5AQlIBcttq/YChj1kieL/GiBAnHz
	IlRuj/4tu1RJDZJiPOV24JKLLSnPC6Ylp0V+Pchj3ov/h61Nah7oFqSxctdWHMXdr044q6gdgnA2q
	vaT4C/eNbpxTva26sP+RlRimgvmcYkqcxIkDfA2gJJgsaS6fXWs2KfETr3WPr0GkIXknIoFi4c5Nr
	pQ58FSxwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOP2-009LHn-O9; Mon, 19 Apr 2021 07:33:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOOq-009LGB-AM
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 07:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=/UvrTCtjmW8PaARbHKywK7FA1aCiA1jdAIQPfqS/HWE=; b=1UU/hw/twksO4bHS0Ermuiikgb
 SuEcF8u052ye6cDi/SsXWr8EStNhXbkoaWayepLzPEGgNy3gwE8XXXtoinjHYYsjEuaPtEGEMsRrX
 J6B7rVUxRgxw0o+G8TDbRW1yP8u2x9TXUTE5CR2sQmej1pgAIVptfLbARP/B9GHlW9gxcH+xpl+Lp
 +Raac5xsF6zT93suO0rskh19LdqToSvH76aXtQJQ7XU8IEDrrNutdYqaDdoJztwvP+AHDmHVj/2yu
 GjLFfIJIWVPe8cWlec9kqyrG3iNZmmnU4jhFf2wF6dm3oFfqTn3i1qj5EdzDrq3IPxRA1vw79Xr7S
 pOTLBtcA==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOOn-00B8Jb-2R
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 07:32:51 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3CD20C000F;
 Mon, 19 Apr 2021 07:32:45 +0000 (UTC)
Date: Mon, 19 Apr 2021 09:32:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, u-boot@lists.denx.de
Subject: Re: gpmi-nand ecc
Message-ID: <20210419093244.1f27cb48@xps13>
In-Reply-To: <a066668f-852e-b3fe-0e91-23f0187d6c20@geanix.com>
References: <a066668f-852e-b3fe-0e91-23f0187d6c20@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003249_267576_870F77D0 
X-CRM114-Status: GOOD (  16.69  )
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

SGkgU2VhbiwKCisgdS1ib290IE1MCgpTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+IHdy
b3RlIG9uIFdlZCwgMTQgQXByIDIwMjEgMTU6MTM6MzkKKzAyMDA6Cgo+IEhpLAo+IAo+IEkgaGF2
ZSB0d28gYm9hcmRzIHdpdGggYSBpTVg2VUxMIFNvQyBvbmUgYXR0YWNoZWQgdG8gYSBNaWNyb24g
TkFORCBmbGFzaCAoTVQyOUY0RzA4QUJBRkFXUCkgYW5kIG9uZSBhIFRvc2hpYmEgKFRDNThCVkcy
UzBIVEFJMCkuCj4gCj4gQWZ0ZXIgdXBkYXRpbmcgdGhlIGJvYXJkcyBmcm9tIHUtYm9vdCAyMDE4
LjA3IC0+IDIwMjAuMDEsIHRoZSBNaWNyb24gZml0dGVkIGJvYXJkcyBpcyBoYXZpbmcgRUNDIHBy
b2JsZW1zKGluIHUtYm9vdCkuCj4gVS1ib290IDIwMTguMDcgc2VsZWN0cyBlY2Nfc3RyZW5ndGgg
dG8gMTguCj4gVS1ib290IDIwMjAuMDEgc2VsZWN0cyBlY2Nfc3RyZW5ndGggdG8gOCwgYnV0IGlm
IEkgaGFyZGNvZGUgdS1ib290IHRvIHJ1biB0aGUgbXhzX25hbmRfbGVnYWN5X2NhbGNfZWNjX2xh
eW91dCgpIGl0IHNlbGVjdHMgMTggYml0cy4KPiAKPiBUaGUgVG9zaGliYSBib2FyZHMgYWx3YXlz
IHNlbGVjdHMgOCBiaXQgZWNjX3N0cmVuZ3RoIHNvIHRoZXkgaGF2ZSBubyBpc3N1ZXMuCj4gCj4g
VGhlIGtlcm5lbCBkcml2ZXIgKGdwbWktbmFuZC5jKSBzZWVtcyB0byBhbHNvIHVzZSB0aGUgbGVn
YWN5IG1ldGhvZCAoUmVzdWx0aW5nIDE4IGJpdHMgaW4gZWNjIHN0cmVuZ3RoIGZvciB0aGUgTWlj
cm9uIE5BTkQpLgo+IEluIGNvbW1vbl9uZmNfc2V0X2dlb21ldHJ5KCk6IEJvdGggY2hpcC0+ZWNj
LnN0cmVuZ3RoIGFuZCBjaGlwLT5lY2Muc2l6ZSBhcmUgMC4KPiAKPiBJIHdvdWxkIGV4cGVjdCBl
Y2Muc3RyZW5ndGggdG8gYmUgc2V0IHRvIDgsIGVhcmxpZXIgYnV0IGNhbm5vdCBmaW5kIHRoZSBz
cG90IHdoZXJlIGl0IHNob3VsZCBiZSBzZXQuCj4gSXMgdGhlIGdwbWktbmFuZCBkcml2ZXIgbWlz
c2luZyBhIGNhbGwgdG8gbmFuZF9lY2NfY2hvb3NlX2NvbmYoKT8KPiBNYXliZSB3ZSBuZWVkIGEg
bGVnYWN5IG9wdGlvbiBmb3IgdGhlIGtlcm5lbCBsaWtlIHUtYm9vdC4KPiAKPiBXZSBoYXZlICsx
MEsgYm9hcmRzIGRlcGxveWVkIHNvIGl0J3Mgbm90IHNvIGVhc3kgdG8gc3dpdGNoIGZyb20gMTgg
LT4gOCBiaXRzLgo+IEkgY2FuIGV4cGxpY2l0IGZpeCB0aGlzIGluIFUtYm9vdCBieSBmb3JjaW5n
IHRoZSBsZWdhY3kgbW9kZSB2aWEgYSBkdCBmbGFnLCBidXQgdGhlIGd1dCBmZWVsaW5nIHNheXMg
dGhpcyB3aWxsIGNvbWUgYmFjayB0byBoYXVudCB1cyA6KQo+IAo+IC9TZWFuCgpJIGhvbmVzdGx5
IGRvbid0IGtub3cgYWJvdXQgc3VjaCBpc3N1ZSBvbiBVLUJvb3Qgc2lkZSwgbWF5YmUgeW91IGNh
bgp0cnkgdG8gYmUgbW9yZSBzcGVjaWZpYyBvbiB3aGF0IGNvbW1pdCBicm9rZSB0aGUgbG9naWMg
Zm9yIHlvdSBhcyB0aGVyZQphcmUgbm90IHNvIG1hbnkgb2YgdGhlbSBiZXR3ZWVuIHRoZSB0d28g
dmVyc2lvbnM6CgokIGdpdCBsIHYyMDE4LjA3Li52MjAyMC4wMSAtLSBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9teHNfbmFuZC5jIAoxZWI2OWFlNDk4NSBjb21tb246IE1vdmUgQVJNIGNhY2hlIG9wZXJh
dGlvbnMgb3V0IG9mIGNvbW1vbi5oCjlhYjVmMjIxYTVlIG5hbmQ6IG14c19uYW5kOiBhZGQgQVBJ
IGZvciBzd2l0Y2hpbmcgZGlmZmVyZW50IEJDSCBsYXlvdXRzCjFkNDNlMjRiOTQ2IGkuTVg2OiBu
YW5kOiBhZGQgbmFuZGJjYiBjb21tYW5kIGZvciBpbXgKMTAwMTUwMjU0NWYgQ09ORklHX1NQTF9T
WVNfW0RJXUNBQ0hFX09GRjogYWRkCjA0NTY4YmQwYjZkIE1URDogbmFuZDogbXhzX25hbmQ6IEFs
bG93IGRyaXZlciB0byBhdXRvIHNldHVwIEVDQyBpbiBTUEwKNTY0NWRmOWUwMGEgTVREOiBOQU5E
OiBteHNfbmFuZF9pbml0X2RtYTogTWFrZSBteHNfbmFuZF9pbml0X2RtYSBzdGF0aWMKNWFlNTg1
YmEzYTggTVREOiBteHNfbmFuZDogRml4IEJDSCByZWFkIHRpbWVvdXQgZXJyb3Igb24gYm9hcmRz
IHJlcXVpcmluZyBFQ0MKYTQzMGZhMDZhNGEgbXRkOiBtb3ZlIE5BTkQgZmlsZXMgaW50byBhIHJh
dy8gc3ViZGlyZWN0b3J5CgpHb29kIGx1Y2sgd2l0aCB5b3VyIGRlYnVnZ2luZywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
