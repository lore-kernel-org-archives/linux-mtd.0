Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA606C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EA32070D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="acPLqG0z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n0dhRKy9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EA32070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVBcS1JwrRuL8SJueypGqqNSdjpknBfV9IVMBAYtl3M=; b=acPLqG0zKB8q3v
	CfRoZOLFNES/CvDk818HABDrDnVRveAOKJhNEDwRWxOfUmymM4nEtEiBe94HQ+itGGTWTWgPrFcIw
	Ff5K/NcQTHG6PNymb1UPAEh58asl9YlCVevvt2YjNQ77uCtewOwuaWJIMd7OY6GvguUEbG6Heqdi2
	xAhMWqxMtpeltdzsginS/l1iYlJSd6/EdYzvfIJaZZBIt14z95w+M9lZTS0mQSqIqUu7wnMhpQjqO
	Hynq2n57DqxIi/FP1GZLzir0Dw2RjwNrkxnMyVtMeRXc6uXZrmeWJNeSUe+WoEebeoRNJJXWy81JL
	BK3diGx1aKnJB3dBF/8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBEeq-0003JI-CR; Tue, 02 Apr 2019 08:20:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEeh-0003BB-Gd; Tue, 02 Apr 2019 08:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DeyUlCcDwYaVZN1BRMGUNCsxfTctQTOTDouFB5GNkNA=; b=n0dhRKy9OFppVHTOriLwaTzi3z
 uq502SnqIt6RYGL6ZWqpEziJQfT3NEgqeoNjldqTLAWVAQ/Yx2OMMJWoSV/q9D9OWb1eVac4MQG4Y
 tfnIyzTlx5xTrER3K4+UYSWMpqAkRe2MA4ExUgSVO3L4lRPykC3hFarm1JGtbgG5gDMj0StFF3Mbg
 56q0NroNduzGyPEO5a3Un3ePM6tbhe1KhE0aEaLmBsO7cPyzSt9vTC/flm8dbKfv47x+lKJLfdVK1
 sJC4udDOOqGMrJTPw2jbIrhpUWplYF5EonnWkybzRuAFAv57pKpblfvXrHR70AmnIspCw/ywz2kYQ
 KFCjUK/w==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEed-0000jw-LS; Tue, 02 Apr 2019 08:20:25 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 72C53C0010;
 Tue,  2 Apr 2019 08:19:53 +0000 (UTC)
Date: Tue, 2 Apr 2019 10:19:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/4] ARM: dts: sunxi: Remove useless address and size cells
Message-ID: <20190402101952.657ee274@xps13>
In-Reply-To: <8774db23f87fe401f8ac7b775decba3cde2a56ea.1554153146.git-series.maxime.ripard@bootlin.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <8774db23f87fe401f8ac7b775decba3cde2a56ea.1554153146.git-series.maxime.ripard@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_092023_819975_AFB5F051 
X-CRM114-Status: GOOD (  13.28  )
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
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLAoKTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3Jv
dGUgb24gTW9uLCAgMSBBcHIgMjAxOQoyMzoxMzo1NiArMDIwMDoKCj4gVGhlIE5BTkQgY2hpcHMg
aW4gb3VyIERUcyBoYXZlIGFkZHJlc3MgYW5kIHNpemUgY2VsbHMsIGV2ZW4gdGhvdWdoIHRoZXkK
PiBkb24ndCBoYXZlIGFueSBjaGlsZCBub2Rlcy4gUmVtb3ZlIHRoZW0uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiAtLS0KPiAg
YXJjaC9hcm0vYm9vdC9kdHMvc3VuNWktZ3I4LWNoaXAtcHJvLmR0cyAgICAgICAgICAgICB8IDIg
LS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LW5pbnRlbmRvLW5lcy1jbGFzc2ljLmR0
cyB8IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW41aS1ncjgtY2hpcC1wcm8uZHRzIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3VuNWktZ3I4LWNoaXAtcHJvLmR0cwo+IGluZGV4IDUzM2E0ZWNjMDVlMi4uYTMy
Y2RlM2UzMmViIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjVpLWdyOC1jaGlw
LXByby5kdHMKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdW41aS1ncjgtY2hpcC1wcm8uZHRz
Cj4gQEAgLTEzMyw4ICsxMzMsNiBAQAo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICAKPiAgCW5hbmRA
MCB7Cj4gLQkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gLQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4g
IAkJcmVnID0gPDA+Owo+ICAJCWFsbHdpbm5lcixyYiA9IDwwPjsKPiAgCQluYW5kLWVjYy1tb2Rl
ID0gImh3IjsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LW5pbnRl
bmRvLW5lcy1jbGFzc2ljLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1uaW50ZW5k
by1uZXMtY2xhc3NpYy5kdHMKPiBpbmRleCAzMmNmMWFiMzNhYWIuLjI0NmRlYzU4NDZhNCAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yMTYtbmludGVuZG8tbmVzLWNsYXNz
aWMuZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LW5pbnRlbmRvLW5lcy1j
bGFzc2ljLmR0cwo+IEBAIC0zNCw4ICszNCw2IEBACj4gIAo+ICAJLyogMkdiIE1hY3Jvbml4IE1Y
MzBMRjJHMThBQyAoM1YpICovCj4gIAluYW5kQDAgewo+IC0JCSNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+IC0JCSNzaXplLWNlbGxzID0gPDE+Owo+ICAJCXJlZyA9IDwwPjsKPiAgCQlhbGx3aW5uZXIs
cmIgPSA8MD47Cj4gIAkJbmFuZC1lY2MtbW9kZSA9ICJodyI7CgoKUmV2aWV3ZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
