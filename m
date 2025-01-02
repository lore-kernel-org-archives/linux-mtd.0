Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8165E7718B
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2025 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJefwHMtCEnKfYCP/dy1Xft0ySQGaabEAosCTZYDyMM=; b=YNVwdQ5YHQZzGJ
	n+dLtr/6iLPTvn8mwkxk/EHkg0297IjZLFHuBzKGVRDDexdHzQLIsxKyg+n+oJ9GmXn2rvRqh7Ov8
	C+oj0+feYFeepGih9Dxutb6AtzNa27hkKs3RQTmvsQ1dxa90HlBG+07NgInqJCcf+/3sd9MF13zVS
	ArzRCvSk7CVtCZD+wXEgqHVohHyUyrskbE0S1EVWyExtCWT76KeK0T3M7Mr+NNg7CVxliSaxaYwWg
	R0chiz9GLGuf+heAJJR5OtHCNRociWFQ2kPwrj3yxSf9Ywq5WFo2n34M6Pb0rlINL49QtQCmopiiM
	2+2pXBie3/DAnQ0mLnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIad-0000000AAgG-2onN;
	Thu, 02 Jan 2025 10:38:07 +0000
Received: from smtp-71.smtpout.orange.fr ([80.12.242.71] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIaP-0000000AAcI-16nB
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jan 2025 10:37:54 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id TIaFtIJGgv8EoTIaIt1ist; Thu, 02 Jan 2025 11:37:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735814271;
	bh=m/vUJhwL3JxwUo9JiXO0sjdvNVj8XBjdzWqYRllhLR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dIXJVMNqq2vQdKxSShJ3XE73jU+NJYue5WSoFot2vxnAIvl/OAvSWYFIyuylv7Xn6
	 9I+1v0l+Q8QXa9FUOIYVPv1lVx+nsVt5dei4EbqvImJI/XGYiXu9ynhGwRlMb+rmrI
	 Q4YngEkt1472DxfR3U/twcs41hySJ7aDW6SRd95TlKI7lu11u3Y5G6fSn8+Q5rPjKw
	 sloXDRXlfRIWJRqiVdYsQkfeWPt7J9MXXqsLbcifBYC1IVh++C8u62Bv2W1uBoywYC
	 b3D9W/Dv7y3TCVVYlpf3GwG3759hHvsHnsKoy6R3KGfRvv9hnIQvPyjVy0Gs/S7X34
	 aoSUOLWg53DkQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 02 Jan 2025 11:37:51 +0100
X-ME-IP: 90.11.132.44
Message-ID: <022418c7-f2b2-47b7-9b61-da3f4b7dffab@wanadoo.fr>
Date: Thu, 2 Jan 2025 11:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] mtd: intel-dg: implement region enumeration
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tomas Winkler <tomasw@gmail.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-4-alexander.usyskin@intel.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250101153925.865703-4-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_023753_439155_4CBF6D8A 
X-CRM114-Status: GOOD (  10.70  )
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

TGUgMDEvMDEvMjAyNSDDoCAxNjozOSwgQWxleGFuZGVyIFVzeXNraW4gYSDDqWNyaXTCoDoKPiBJ
biBpbnRlbC1kZywgdGhlcmUgaXMgbm8gYWNjZXNzIHRvIHRoZSBzcGkgY29udHJvbGxlciwKPiB0
aGUgaW5mb3JtYXRpb24gaXMgZXh0cmFjdGVkIGZyb20gdGhlIGRlc2NyaXB0b3IgcmVnaW9uLgo+
IAo+IENDOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KPiBSZXZp
ZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+IEFja2VkLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IENvLWRldmVsb3Bl
ZC1ieTogVG9tYXMgV2lua2xlciA8dG9tYXN3QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBU
b21hcyBXaW5rbGVyIDx0b21hc3dAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+CgouLi4KCj4gQEAgLTg5LDYg
KzI4MSwxMyBAQCBzdGF0aWMgaW50IGludGVsX2RnX210ZF9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5
X2RldmljZSAqYXV4X2RldiwKPiAgIAkJZ290byBlcnI7Cj4gICAJfQo+ICAgCj4gKwlyZXQgPSBp
bnRlbF9kZ19udm1faW5pdChudm0sIGRldmljZSk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWRl
dl9lcnIoZGV2aWNlLCAiY2Fubm90IGluaXRpYWxpemUgbnZtXG4iKTsKPiArCQlyZXQgPSAtRU5P
REVWOwoKV2h5IHNldHRpbmcgdG8gLUVOT0RFVj8KCj4gKwkJZ290byBlcnI7Cj4gKwl9Cj4gKwo+
ICAgCWRldl9zZXRfZHJ2ZGF0YSgmYXV4X2Rldi0+ZGV2LCBudm0pOwo+ICAgCj4gICAJcmV0dXJu
IDA7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
