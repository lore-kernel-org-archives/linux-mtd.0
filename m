Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBEDC04E87
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:45:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E303E21479
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9vfW9GI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E303E21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4ot+JAEnj/VVLSgfXs4+doBTfGgLmZQks+9/k1Ekwg=; b=k9vfW9GIIdf4n6
	a159UEK2BLE4SgijC3gVbrra7CckpkZ2Kfjo2gX2RPdeiJ4J7ZMUXZAXyVedXTHVNIMJ4IGppco7p
	NGd5icJ9WVUaxZQ7M8830onpMa3prJSsfVhkYNOxg4IZ182gFLVBi84wXO2oXku82OHjYQ0Et3nLA
	nq8TRUu1Caj/01E/wSbc88O/ciAt40NmKadT/dPCQ/T6R6Lh7SDedqClL7FgZrqEOY3cmnq+rlut7
	Cm24sQ1kpQ3iwEK/QkGNQel0LOGqboK+P1EOX+JKSMipGkJkdCX5TRcqys6A9GR0tjtlW1Dmgicrb
	xLOO9JCO4j6cQN4m3YJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hShfq-0005CG-6R; Mon, 20 May 2019 12:45:50 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShfn-0005Bb-4s
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 12:45:48 +0000
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6AD63100003;
 Mon, 20 May 2019 12:45:43 +0000 (UTC)
Date: Mon, 20 May 2019 14:45:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: brcmnand: Make nand-ecc-strength
 and nand-ecc-step-size optional
Message-ID: <20190520144542.05d10e4b@xps13>
In-Reply-To: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
References: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_054547_336544_D36D56F4 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gRnJp
LCAxNyBNYXkgMjAxOSAxNDoyOTo1NAotMDQwMDoKCj4gbmFuZC1lY2Mtc3RyZW5ndGggYW5kIG5h
bmQtZWNjLXN0ZXAtc2l6ZSBjYW4gYmUgbWFkZSBvcHRpb25hbCBhcwo+IGJyY21hbmFuZCBkcml2
ZXIgY2FuIHN1cHBvcnQgdXNpbmcgdGhlIG5hbmRfYmFzZSBkcml2ZXIgZGV0ZWN0ZWQKCiAgICAg
IF4gdHlwbyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmF3IE5BTkQgbGF5ZXIKCj4gdmFs
dWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29t
Pgo+IC0tLQoKV2l0aCB0aGlzIGFkZHJlc3NlZDoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnR4dCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnR4dAo+IGlu
ZGV4IGJjZGExZGYuLjI5ZmVhYmEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKPiBAQCAtMTAxLDEwICsx
MDEsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbnVtYmVyIChlLmcuLCAwLCAxLCAyLCBldGMuKQo+ICAtICNhZGRyZXNzLWNlbGxzICAg
ICAgICAgICAgOiBzZWUgcGFydGl0aW9uLnR4dAo+ICAtICNzaXplLWNlbGxzICAgICAgICAgICAg
ICAgOiBzZWUgcGFydGl0aW9uLnR4dAo+IC0tIG5hbmQtZWNjLXN0cmVuZ3RoICAgICAgICAgOiBz
ZWUgbmFuZC50eHQKPiAtLSBuYW5kLWVjYy1zdGVwLXNpemUgICAgICAgIDogbXVzdCBiZSA1MTIg
b3IgMTAyNC4gU2VlIG5hbmQudHh0Cj4gIAo+ICBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIG5h
bmQtZWNjLXN0cmVuZ3RoICAgICAgICAgOiBzZWUgbmFuZC50eHQKPiArLSBuYW5kLWVjYy1zdGVw
LXNpemUgICAgICAgIDogbXVzdCBiZSA1MTIgb3IgMTAyNC4gU2VlIG5hbmQudHh0Cj4gIC0gbmFu
ZC1vbi1mbGFzaC1iYnQgICAgICAgICA6IGJvb2xlYW4sIHRvIGVuYWJsZSB0aGUgb24tZmxhc2gg
QkJUIGZvciB0aGlzCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoaXAtc2VsZWN0
LiBTZWUgbmFuZC50eHQKPiAgLSBicmNtLG5hbmQtb29iLXNlY3Rvci1zaXplIDogaW50ZWdlciwg
dG8gZGVub3RlIHRoZSBzcGFyZSBhcmVhIHNlY3RvciBzaXplCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
