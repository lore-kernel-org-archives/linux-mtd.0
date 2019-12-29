Return-Path: <SRS0=kin+=2T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBCDC2D0CE
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Dec 2019 18:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C39720748
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Dec 2019 18:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K28s9e3J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2wPksXbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C39720748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yY2lmddeWdVBJLa/cDChjmykrQmJs3b3HdRHRiKuCj0=; b=K28s9e3JLDr9QU
	oMreKOSfwIaOR0XGAsNLJR8HrdI+33RkhFJDa9mIshQYCytTAUNu6jy5NxBYvaLxT5K7KKpC4Gu+l
	QoT92Q+sFBXH/IsTETYATYq+R87MZqEJh8NmIYRafByf1IarmKEi5MzTy2/j+nAIneEqqPxZTK0Ed
	oMYsMkS0oIJS5otLPXUuNEbJeFYdEINwA6TD9scFTLm855zzJgFee5z8+TfFItswFn2EPr9nXMvHP
	vvtGlWumbSgtWcV4C1Sj7VFXYmGzbeQOqiq02aJ9m0rW+vnSHWPsQSwEs4q0F/cF66hB2ndIls2o5
	nSxcxjyjUwJ6HbOpDGMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ildR3-0001zn-Ms; Sun, 29 Dec 2019 18:37:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ildQP-0001Li-Q7; Sun, 29 Dec 2019 18:36:27 +0000
Received: from localhost.localdomain (unknown [194.230.155.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D70D2206DB;
 Sun, 29 Dec 2019 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577644584;
 bh=pSG4f8rUYFE6DclwpZXNN72lETzu7ybG9jDiwZbJeJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2wPksXbndVe8M28WmimRsuIFr0SfJlJCss8o2cHMbfGzL61HnQSeHg62gQjiWAW6a
 0gcj65IjrfLLM1RCBB/UQHNGTjlW9XvyT3lNta5AP6iVBXckD6STSRV2EvVWbDd/EX
 DgREFWPI8x3I3QW7rnmzCD+xR6Gsp+T7lUga4S/E=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mtd: onenand: samsung: Fix printing format for size_t on
 64-bit
Date: Sun, 29 Dec 2019 19:36:11 +0100
Message-Id: <20191229183612.22133-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229183612.22133-1-krzk@kernel.org>
References: <20191229183612.22133-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_103625_869184_2B93793B 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UHJpbnQgc2l6ZV90IGFzICV6dSB0byBmaXggLVdmb3JtYXQgd2FybmluZ3Mgd2hlbiBjb21waWxp
bmcgb24gNjQtYml0CnBsYXRmb3JtIChlLmcuIHdpdGggQ09NUElMRV9URVNUKToKCiAgICBkcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZ19tdGQuYzogSW4gZnVuY3Rpb24g4oCYczVwYzEx
MF9yZWFkX2J1ZmZlcnJhbeKAmToKICAgIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5n
X210ZC5jOjY2MToxNjogd2FybmluZzoKICAgICAgICBmb3JtYXQg4oCYJWTigJkgZXhwZWN0cyBh
cmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDMgaGFzIHR5cGUg4oCYc2l6
ZV90IHtha2EgbG9uZyB1bnNpZ25lZCBpbnR94oCZIFstV2Zvcm1hdD1dCiAgICAgICBkZXZfZXJy
KGRldiwgIkNvdWxkbid0IG1hcCBhICVkIGJ5dGUgYnVmZmVyIGZvciBETUFcbiIsIGNvdW50KTsK
ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZ19tdGQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nX210ZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVu
YW5kL3NhbXN1bmdfbXRkLmMKaW5kZXggNzA1MDFkMDMxZGI2Li40YTc4YzBhZWQ2ZGQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nX210ZC5jCisrKyBiL2RyaXZl
cnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nX210ZC5jCkBAIC02NTgsNyArNjU4LDcgQEAgc3Rh
dGljIGludCBzNXBjMTEwX3JlYWRfYnVmZmVycmFtKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQg
YXJlYSwKIAkJZG1hX2RzdCA9IGRtYV9tYXBfc2luZ2xlKGRldiwgYnVmLCBjb3VudCwgRE1BX0ZS
T01fREVWSUNFKTsKIAl9CiAJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgZG1hX2RzdCkpIHsK
LQkJZGV2X2VycihkZXYsICJDb3VsZG4ndCBtYXAgYSAlZCBieXRlIGJ1ZmZlciBmb3IgRE1BXG4i
LCBjb3VudCk7CisJCWRldl9lcnIoZGV2LCAiQ291bGRuJ3QgbWFwIGEgJXp1IGJ5dGUgYnVmZmVy
IGZvciBETUFcbiIsIGNvdW50KTsKIAkJZ290byBub3JtYWw7CiAJfQogCWVyciA9IHM1cGMxMTBf
ZG1hX29wcyhkbWFfZHN0LCBkbWFfc3JjLAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
