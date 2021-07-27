Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7FEC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE2C61108
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFE2C61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cL/3w2ZUyvOt0ZiXWNM/vAM+6TT8kg9y4s36TlucKoI=; b=MD3G/vfOSJqyXF
	lD1EajrlV7xVLxsbpM1ttOG28lNEtH1wYhh9MKeI3vNCUAFOZVAKI7UfeoIKtZiGafG/UZJFrRPad
	bPhwLNfkNPKWcLEt39qkUnPIjy+ak0zgVB+88jwCjIbUXTS/G++DVcUf2Be8SDM4vXt2Zke7/YYY/
	PvOfSk7s5H+CJagDGWOpQqcE6VPdDyLNLeNiKuJ7GNmZqfgn+FqRdgC8OaBRMUVF6RpSUjnvTI0IH
	5mLKLsAJDAHaGfwKR4tQK95O/xw7NR21fzE8729pC4BIFHQ24ONv9uvZXtBTZd8Vvkt5f+Xw5sIhK
	hCqoVS7Ly6kRfiPn81Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Hdv-00Drzp-G0; Tue, 27 Jul 2021 07:36:47 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Go6-00Df7s-1w
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 06:43:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1AE7260003;
 Tue, 27 Jul 2021 06:43:09 +0000 (UTC)
Date: Tue, 27 Jul 2021 08:43:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Naga
 Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 linux-mtd@lists.infradead.org, Ralf Ramsauer
 <ralf.ramsauer@oth-regensburg.de>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair Miquel Raynal's email address
Message-ID: <20210727084309.01b52748@xps13>
In-Reply-To: <20210726144949.10439-1-lukas.bulwahn@gmail.com>
References: <20210726144949.10439-1-lukas.bulwahn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_234314_289518_F38A91ED 
X-CRM114-Status: GOOD (  14.41  )
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

SGkgTHVrYXMsCgpMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQGdtYWlsLmNvbT4gd3JvdGUg
b24gTW9uLCAyNiBKdWwgMjAyMQoxNjo0OTo0OSArMDIwMDoKCj4gQ29tbWl0IGQ3MGM2YjAyNjA2
OSAoIk1BSU5UQUlORVJTOiBBZGQgUEwzNTMgTkFORCBjb250cm9sbGVyIGVudHJ5IikgYW5kCj4g
Y29tbWl0IDgxM2Q1Mjc5OWFkMiAoIk1BSU5UQUlORVJTOiBBZGQgUEwzNTMgU01DIGVudHJ5Iikg
YWRkcyBNaXF1ZWwKPiBSYXluYWwgYXMgbWFpbnRhaW5lciB3aXRoIGFuIG9idmlvdXMgaW52YWxp
ZCBlbWFpbCBhZGRyZXNzLCB3aGljaCBjYW4gYmUKPiBlYXNpbHkgZml4ZWQuCj4gCj4gUmVwYWly
IHRoaXMgY29weS1hbmQtcGFzdGUgZXJyb3IgaW4gTWlxdWVsIFJheW5hbCdzIGVtYWlsIGFkZHJl
c3MuCgpTb21ldGltZXMgbXkgZmluZ2VycyBkb24ndCBmb2xsb3cgbXkgY29tbWFuZHMsIHN0cmFu
Z2UgdGhhdCBJIGRpZApub3Qgc3BvdCBpdCBlYXJsaWVyLiBJJ2xsIHRha2UgdGhpcyB0aHJvdWdo
IG15IHRyZWUuCgo+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5A
Z21haWwuY29tPgo+IC0tLQo+IE1pcXVlbCwgcGxlYXNlIHBpY2sgb3IgYWNrIHRoaXMgcGF0Y2gu
Cj4gS3J6eXN6dG9mLCBwbGVhc2UgcGljayB0aGlzIHBhdGNoIGlmIE1pcXVlbCBkb2VzIG5vdC4K
PiAKPiAgTUFJTlRBSU5FUlMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwo+IGluZGV4IGQ2OWIyZDQ2NDZiZS4uZjMxOTIyZDA1MDNhIDEwMDY0NAo+IC0tLSBh
L01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMTQ3Niw3ICsxNDc2LDcgQEAg
RjoJZHJpdmVycy9hbWJhLwo+ICBGOglpbmNsdWRlL2xpbnV4L2FtYmEvYnVzLmgKPiAgCj4gIEFS
TSBQUklNRUNFTEwgUEwzNVggTkFORCBDT05UUk9MTEVSIERSSVZFUgo+IC1NOglNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tQGJvb3RsaW4uY29tPgo+ICtNOglNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ICBNOglOYWdhIFN1cmVzaGt1bWFy
IFJlbGxpIDxuYWdhc3VyZUB4aWxpbnguY29tPgo+ICBMOglsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+ICBTOglNYWludGFpbmVkCj4gQEAgLTE0ODQsNyArMTQ4NCw3IEBAIEY6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1s
Cj4gIEY6CWRyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jCj4gIAo+
ICBBUk0gUFJJTUVDRUxMIFBMMzVYIFNNQyBEUklWRVIKPiAtTToJTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbUBib290bGluLmNvbT4KPiArTToJTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAgTToJTmFnYSBTdXJlc2hrdW1hciBSZWxsaSA8
bmFnYXN1cmVAeGlsaW54LmNvbT4KPiAgTDoJbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKPiAgUzoJTWFpbnRhaW5lZAoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
