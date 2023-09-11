Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458BCEE57DF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a7I+WCo0Ocg5GsoFcDPV2x2JZG4zWXipsr3UHboCYQM=; b=4qYuQ/SthZMOqgjIhWMW4oA3WW
	PsT6L7E1UKdMlEjUy7dRklV26q5pwl03qmC3vsv8uy3GziySAqguxK0AR7LcyT/7bPnQ3PQPgb2Kv
	ZqQTTnubypdbHQGeTzzsIqPG+jiGRZYf2Q8KkhjpDH86SdDWgJXj/5axny1ZNnf47wLzASyc/3TDT
	6xbmEG1tAHw5qmc0XeJ47DOIlZkBlW7fwZ6FhcHa3EVKTLQpvKR7sP0K5XiNZVkzDzGIJS5WrxGBX
	Xz5f11g+WzsurR/SpInlNGa8UhiXwOCXEPbp2IjphAtCZqLW3g4hg8bVn/q7wS6CSsENDFvoiVF+X
	yPXFTu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmIy-001B42-2b;
	Mon, 11 Sep 2023 19:10:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmIv-001B1s-2z
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 19:10:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 616D0635DB56;
	Mon, 11 Sep 2023 21:10:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id BhVzL38_nvWl; Mon, 11 Sep 2023 21:10:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 68B35635DB5A;
	Mon, 11 Sep 2023 21:10:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id am1q5NFYuOSv; Mon, 11 Sep 2023 21:10:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3DA8F635DB56;
	Mon, 11 Sep 2023 21:10:28 +0200 (CEST)
Date: Mon, 11 Sep 2023 21:10:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, robh <robh@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	devicetree <devicetree@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1097004835.16854.1694459428036.JavaMail.zimbra@nod.at>
In-Reply-To: <ZP9kJYHMFwZ8GFnA@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org> <a640bb10e6fbaeef96efdb9e8b666ca39e993589.1691717480.git.daniel@makrotopia.org> <169263908218.2000617.16931192155432403196.robh@kernel.org> <ZP9kJYHMFwZ8GFnA@makrotopia.org>
Subject: Re: [PATCH v4 1/8] dt-bindings: mtd: add basic bindings for UBI
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: dt-bindings: mtd: add basic bindings for UBI
Thread-Index: LBx3qjf2tbmBuBCvCWOgaQQSzR540w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_121038_114607_FE9FF3DB 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBbjogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnPgo+IENDOiAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+LCAicm9iaCIgPHJvYmhAa2VybmVsLm9yZz4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmln
bmVzaHJAdGkuY29tPiwgIlJhbmR5Cj4gRHVubGFwIiA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiwg
Ik1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxy
aWNoYXJkQG5vZC5hdD4sICJkZXZpY2V0cmVlIgo+IDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zz4sICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8u
b3JnPiwgIkNvbm9yIERvb2xleSIKPiA8Y29ub3IrZHRAa2VybmVsLm9yZz4sICJSb2IgSGVycmlu
ZyIgPHJvYmgrZHRAa2VybmVsLm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnPgo+IEdlc2VuZGV0OiBNb250YWcsIDExLiBTZXB0ZW1iZXIgMjAyMyAyMTow
MTo1Nwo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjQgMS84XSBkdC1iaW5kaW5nczogbXRkOiBhZGQg
YmFzaWMgYmluZGluZ3MgZm9yIFVCSQoKPiBPbiBNb24sIEF1ZyAyMSwgMjAyMyBhdCAxMjozMToy
MlBNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24gRnJpLCAxMSBBdWcgMjAyMyAwMjoz
NjozNyArMDEwMCwgRGFuaWVsIEdvbGxlIHdyb3RlOgo+PiA+IEFkZCBiYXNpYyBiaW5kaW5ncyBm
b3IgVUJJIGRldmljZXMgYW5kIHZvbHVtZXMuCj4+ID4gCj4+IFJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+PiAKPiAKPiBQYXRjaCAzIC0gNyBoYXZlIHByZXZpb3Vz
bHkgYmVlbiBkaXNjdXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdCwgcGF0Y2gKPiAxIGFuZCAyIGhh
dmUgYmVlbiByZXZpZXdlZCBieSBSb2IsIHBhdGNoIDggKCJtdGQ6IHViaTogcHJvdmlkZSBOVk1F
TQo+IGxheWVyIG92ZXIgVUJJIHZvbHVtZXMiKSBzdGlsbCBuZWVkcyByZXZpZXcuCj4gCj4gSXMg
dGhlcmUgYW55dGhpbmcgSSBjYW4gZG8gZnJvbSBteSBlbmQgdG8gaGF2ZSB0aGlzIHNlcmllcyBt
b3ZpbmcKPiBmb3J3YXJkPwo+IAo+IFBhdGNod29yazogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9MzY4MzQ3CgpJdCBpcyBvbiBteSBy
ZXZpZXcgVE9ETy4KClRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSwKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
