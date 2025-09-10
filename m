Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CCCCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFmlYjhJAW7Wt5OV5OI32wJeFOCAZcDzwWnkA0tBMUk=; b=oFBvXZb5bMlKut
	QHdz2nSnDEbhmY6MCn6RnUg+YozUUe0dVrp68DSwsUqHpXNoit7EmKdWg8I6hP9HkhuVwPNg5zr1f
	c/T9QjYbNYw9jis4I1h75sqT+G9gTYvwg58cjQVuTaf4akv/ITBr+EOC5zWVye/Zf0J9rU5YscpW3
	HYSn5fNia5ioMJzUtdaYNewApwvoB5g+Dy4Ez33HUlMorsVn0n24Tls3YnDo1y92fdaNydXRhlg9B
	DNZENtKrAci7t8ves4BLJQceBMD8NNbqGsn+RDwnRlk3uAuh+JrJW0k1Y/ITtG8HxnoMaRTx9nuVv
	rQ+n20fENsKeriR9aVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN2Q-0000000FE8K-32nM;
	Wed, 10 Sep 2025 15:47:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN2N-0000000FE7K-3Efs
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 15:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 739314077C;
	Wed, 10 Sep 2025 15:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9B1C4CEEB;
	Wed, 10 Sep 2025 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757519231;
	bh=zPReTXflXBPzw5VwRrJw3Ig5hE9s1WaT/ImdUx9Y8Y8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HEevM1LTBogJIWSRK/LsqAmSm35+OTSBH14vKybYxUS5kpz/bWNHz4MZbX1ocoXUC
	 Ux+9A+ycM4kNhmmO2/zxOdtZddkmi2go/H1hfbsi1q9jbMusDph/O1p0aPApazowoS
	 jJD60sNq8y0U80xAETj3j2sG4WcE2yo5e+mtimKMxeKkde7xeZDBlPFLDfAg99v8Rv
	 wXCwBlnap0jB95exo0TBE3Vp97f17y7Kq1oTkqgVo77VS5SNAnU6f7AIi0eI5nbNNk
	 El884DtqqOjMtXl6SaWlS2UUJ+RyQxHF/R55XadlRm8Y/uzxR+LrbBOF+X505fAM+4
	 haDVLR5kN2/Xw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Kang.Kerry =?utf-8?B?5bq35a6H6Imv?= TAO <kang.kerry@inventec.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd: spi-nor: Add Winbond w25q512jvdtr
In-Reply-To: <CAG2w3Fsj6q8buVE+cXSuoTZj9gEP29u+mh6Xm3ryBqAxxRsQyg@mail.gmail.com>
References: <CAG2w3Fsj6q8buVE+cXSuoTZj9gEP29u+mh6Xm3ryBqAxxRsQyg@mail.gmail.com>
Date: Wed, 10 Sep 2025 17:47:09 +0200
Message-ID: <mafs0cy7yjon6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084711_830381_0FB7F180 
X-CRM114-Status: GOOD (  18.66  )
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

SGksCgpPbiBXZWQsIFNlcCAxMCAyMDI1LCBLYW5nLktlcnJ5IOW6t+Wuh+iJryBUQU8gd3JvdGU6
Cgo+IFNpbWlsYXIgdG8gdGhlIG90aGVyIG9uZXMsIGRpZmZlcmVudCBzaXplLiBUaGUgIkpWLURU
UiIgc3VmZml4IGlzIGluCj4gdGhlIGRhdGFzaGVldCwgSSBoYXZlbid0IHNlZW4gbWVudGlvbnMg
b2YgYSBkaWZmZXJlbnQgb25lLgo+Cj4gVGhlIGRhdGFzaGVldCBpbmRpY2F0ZXMgRFVBTCBhbmQg
UVVBRCBhcmUgc3VwcG9ydGVkLgo+Cj4gaHR0cHM6Ly93d3cud2luYm9uZC5jb20vcmVzb3VyY2Ut
ZmlsZXMvVzI1UTUxMkpWJTIwRFRSJTIwUmV2RCUyMDA2MjkyMDIwJTIwMTMzLnBkZgoKVGhlIGZs
YXNoIHNlZW1zIHRvIGhhdmUgU0ZEUC4gSSBkb24ndCB0aGluayB5b3UgbmVlZCBhbiBlbnRyeSBo
ZXJlIGF0CmFsbC4gVGhlIGdlbmVyaWMgU0ZEUC1iYXNlZCBkcml2ZXIgc2hvdWxkIGJlIGVub3Vn
aCBmb3IgeW91LiBKdXN0IGFkZAp0aGUgamVkZWMsc3BpLW5vciBub2RlIHRvIHlvdXIgZGV2aWNl
IHRyZWUuIFRyeSB0aGF0IG91dCBhbmQgb25seSBhZGQKdGhlIGVudHJ5IGlmIHNvbWV0aGluZyBp
c24ndCB3b3JraW5nLCBhbmQgdGhhdCB3aXRoIGV4cGxhbmF0aW9ucyBhbmQKZml4ZXMgdG8gdGhl
IHByb2JsZW1zLgoKPgo+IFNpZ25lZC1vZmYtYnk6IEthbmcuS2VycnkgPGthbmcua2VycnlAaW52
ZW50ZWMuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+Cj4gLS0tCj4KPiBUaGlzIG1vZGlmaWNhdGlv
biBpcyBhZGQgQklPUyBXMjVRNTEySlYtRFRSIGNoaXAgdG8gd2luYm9uZCBsaXN0Cj4KPiAtLS0K
PiAgZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9y
L3dpbmJvbmQuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4gaW5kZXggOGQwYTAw
ZDY5ZTEyLi42Y2U1ZjcwYmMxMWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci93
aW5ib25kLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+IEBAIC0xNDYs
NiArMTQ2LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyB3aW5ib25kX25vcl9w
YXJ0c1tdID0gewo+ICAgLm5hbWUgPSAidzI1cTUxMmp2cSIsCj4gICAuc2l6ZSA9IFNaXzY0TSwK
PiAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05P
Ul9RVUFEX1JFQUQsCj4gKyB9LCB7Cj4gKyAuaWQgPSBTTk9SX0lEKDB4ZWYsIDB4NzAsIDB4MjAp
LAo+ICsgLm5hbWUgPSAidzI1cTUxMmp2ZHRyIiwKPiArIC5zemllID0gU1pfNjRNLAo+ICsgLm5v
X3NmZHBfZmxhZ3MgPSBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURf
UkVBRCwKPiAgIH0sIHsKPiAgIC5pZCA9IFNOT1JfSUQoMHhlZiwgMHg1MCwgMHgxMiksCj4gICAu
bmFtZSA9ICJ3MjVxMjBidyIsCj4gLS0KPiAyLjQzLjAKPgoKPgoKLS0gClJlZ2FyZHMsClByYXR5
dXNoIFlhZGF2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
