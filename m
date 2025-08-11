Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B221C87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9C4GH3l1whXwnAYf7znSqn0g7UewrXA1fXQVr9IOMz0=; b=iZ8o7+YUCssTEj
	6LEExvBOlD9q7KK7sKmHPWf1vqTPhr+ArYQ7EP5j1s4NB0k146Jd5/cy1CfYiKio/gFF+hE0XIphT
	tV3BWwk4i8gRDkiZioRjIFz3uQXodjTPIj7pSXwL1E276ua+WpWkt3N1KjBF28q1sSj/3D0jVS8gZ
	zzLIcqYX3v62uXVPjNU4RgZDZa08dW4KOkNwwjkb/wN1WZINMkI4gNV+NDaokbCSuvkJxQ9Eee42n
	15oBqSzvdk4tBFLuTphd7Z8gkvySDPS2jnUnDjW+CNbAqdCs2CKEPmKhNYzpqHEV/iys8YYxS35Ws
	qemoWp2LBeZhZKyuxcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulM9W-00000006c92-31O5;
	Mon, 11 Aug 2025 06:37:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulM9U-00000006c8f-1C8V
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 06:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04D235C5BBC
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 06:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0107C4CEF7
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 06:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754894218;
	bh=TAkKb+GwzMVZEi3A6tp7zglmhPEKp9E9776BvdS2RkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EO/VIzJkanp53gB3fy90v9P9a9lc3ybLWhQoKtbQ0l8tYAkJn70bvY9DEdI+mlVOQ
	 9f40eDKq5osoHg+Co04YHithvcRtMsDsy82pK+9BF0w26FjTSZagzaGfh/CHs+dc1E
	 P2Aunmfk0bwdGoBLM65S7YEHwFD4W/tLKtggH2bV8TeGQKhvtuOdQnWu1Df/pCO35M
	 YO+4K9jvLLbYeibYEaZO46dnBxnNXw7YvhmSovbloeXBJcfdN+TC8iaIYGm4Cmi9GF
	 c4IJbOpXndxAqAU4TssXZRpAS74bKcBcoCzngYt25+gvWPTySY90PdLSAScHTESsV9
	 DqMUzSBipOhAA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61813e2fc73so2302967a12.0
        for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2025 23:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDt2iREkVZDcLjLVePXiMOYV7obskAa68Z37EIZwmuTACsRwlk11wwRAXX7Mmy9ASNG5EFtvXMDt8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwycHj1Qe5QISo9T60U8uHa3muG5FdZ2n2W5YV9Ht4iHE3gaP7C
	h2pxWn7Naqi+508/knwLhj3oWU6pE/czGhupqsJeU5eB3P8xIfKFfIM/fbTmU732aiqWFUQTNAD
	md/4sKOhhA/oBJUjHbR0PWS3RVpqK9UI=
X-Google-Smtp-Source: AGHT+IH+K+psA1IClURB1rkm9587M1kJsBTT4nC9DIShwJ+z9EKZ/x4f8CpP9bm6bTiA0ekm74ibs0RbSFElzSLbGjg=
X-Received: by 2002:a05:6402:2801:b0:617:d155:bc94 with SMTP id
 4fb4d7f45d1cf-617e2e80dd9mr11588787a12.30.1754894217160; Sun, 10 Aug 2025
 23:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
In-Reply-To: <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Aug 2025 14:36:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
X-Gm-Features: Ac12FXzwE_q2FIPFkdw9NNfcXNZKdKVnCriK7o66Fy-FNERs2XMBw-uOH0VYEz0
Message-ID: <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_233700_406003_3798FAE8 
X-CRM114-Status: GOOD (  22.95  )
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

SGksIEJpbmJpbiwKCk9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDI6MDLigK9QTSBCaW5iaW4gWmhv
dSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4KPiBUaGUgc2Vjb25kIHN0ZXAgaW4g
cHJlcGFyaW5nIHRvIGFkZCBMb29uZ3Nvbi0ySyBzdXBwb3J0IGlzIHRvIGNoYW5nZSB0aGUKPiBu
YW1lcyBvZiB0aGUgZHJpdmVyIGZpbGVzIGFuZCBLY29uZmlnIG9wdGlvbnMgZnJvbSBMb29uZ3Nv
bjEtc3BlY2lmaWMgdG8KPiBMb29uZ3Nvbi1nZW5lcmljLgpJcyBpdCBwb3NzaWJsZSB0byBtZXJn
ZSB0aGUgZmlyc3QgdHdvIHBhdGNoZXM/IElmIG5vdCwgaXQgaXMgYmV0dGVyIHRvCnVzZSBsb29u
Z3NvbjEgcmF0aGVyIHRoYW4gbG9vbmdzb24gaW4gdGhlIHN1YmplY3QgbGluZSBvZiB0aGlzIHBh
dGNoLgoKSHVhY2FpCgo+Cj4gU2lnbmVkLW9mZi1ieTogQmluYmluIFpob3UgPHpob3ViaW5iaW5A
bG9vbmdzb24uY24+Cj4gLS0tCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrLS0tCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQo+ICAuLi5vbmdzb24xLW5hbmQtY29udHJvbGxlci5jID0+IGxvb25nc29uLW5hbmQtY29u
dHJvbGxlci5jfSB8IDAKPiAgNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gIHJlbmFtZSBkcml2ZXJzL210ZC9uYW5kL3Jhdy97bG9vbmdzb24xLW5hbmQt
Y29udHJvbGxlci5jID0+IGxvb25nc29uLW5hbmQtY29udHJvbGxlci5jfSAoMTAwJSkKPgo+IGRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggNGJhYzRlYTIxYjY0
Li5jYzUwMjU4MmM5ZjEgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJ
TkVSUwo+IEBAIC0xNjcyMiw3ICsxNjcyMiw3IEBAIEY6ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzLyovbG9vbmdzb24sbHMxKi55YW1sCj4gIEY6ICAgICBhcmNoL21pcHMv
aW5jbHVkZS9hc20vbWFjaC1sb29uZ3NvbjMyLwo+ICBGOiAgICAgYXJjaC9taXBzL2xvb25nc29u
MzIvCj4gIEY6ICAgICBkcml2ZXJzLyovKmxvb25nc29uMSoKPiAtRjogICAgIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2xvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIuYwo+ICtGOiAgICAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMKPiAgRjogICAgIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uMS5jCj4gIEY6ICAgICBz
b3VuZC9zb2MvbG9vbmdzb24vbG9vbmdzb24xX2FjOTcuYwo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L0tjb25maWcgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4g
aW5kZXggNGI5OWQ5YzQyMmMzLi5kOWUzZjEzNjY2YWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcK
PiBAQCAtNDYyLDEyICs0NjIsMTIgQEAgY29uZmlnIE1URF9OQU5EX05VVk9UT05fTUEzNQo+ICAg
ICAgICAgICBFbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBOQU5EIGNvbnRyb2xsZXIgZm91bmQgb24K
PiAgICAgICAgICAgdGhlIE51dm90b24gTUEzNSBzZXJpZXMgU29Dcy4KPgo+IC1jb25maWcgTVRE
X05BTkRfTE9PTkdTT04xCj4gLSAgICAgICB0cmlzdGF0ZSAiTG9vbmdzb24xIE5BTkQgY29udHJv
bGxlciIKPiArY29uZmlnIE1URF9OQU5EX0xPT05HU09OCj4gKyAgICAgICB0cmlzdGF0ZSAiTG9v
bmdzb24gTkFORCBjb250cm9sbGVyIgo+ICAgICAgICAgZGVwZW5kcyBvbiBMT09OR1NPTjFfQVBC
X0RNQSB8fCBDT01QSUxFX1RFU1QKPiAgICAgICAgIHNlbGVjdCBSRUdNQVBfTU1JTwo+ICAgICAg
ICAgaGVscAo+IC0gICAgICAgICBFbmFibGVzIHN1cHBvcnQgZm9yIE5BTkQgY29udHJvbGxlciBv
biBMb29uZ3NvbjEgU29Dcy4KPiArICAgICAgICAgRW5hYmxlcyBzdXBwb3J0IGZvciBOQU5EIGNv
bnRyb2xsZXIgb24gTG9vbmdzb24gZmFtaWx5IGNoaXBzLgo+Cj4gIGNvbW1lbnQgIk1pc2MiCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9NYWtlZmlsZQo+IGluZGV4IDcxMWQwNDNhZDRmOC4uYzE4MmI5NzAzYTllIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUKPiBAQCAtNTksNyArNTksNyBAQCBvYmotJChDT05GSUdf
TVREX05BTkRfUk9DS0NISVApICAgICAgICAgICAgICAgKz0gcm9ja2NoaXAtbmFuZC1jb250cm9s
bGVyLm8KPiAgb2JqLSQoQ09ORklHX01URF9OQU5EX1BMMzVYKSAgICAgICAgICAgKz0gcGwzNXgt
bmFuZC1jb250cm9sbGVyLm8KPiAgb2JqLSQoQ09ORklHX01URF9OQU5EX1JFTkVTQVMpICAgICAg
ICAgKz0gcmVuZXNhcy1uYW5kLWNvbnRyb2xsZXIubwo+ICBvYmotJChDT05GSUdfTVREX05BTkRf
TlVWT1RPTl9NQTM1KSAgICArPSBudXZvdG9uLW1hMzVkMS1uYW5kLWNvbnRyb2xsZXIubwo+IC1v
YmotJChDT05GSUdfTVREX05BTkRfTE9PTkdTT04xKSAgICAgICArPSBsb29uZ3NvbjEtbmFuZC1j
b250cm9sbGVyLm8KPiArb2JqLSQoQ09ORklHX01URF9OQU5EX0xPT05HU09OKSAgICAgICAgICAg
ICAgICArPSBsb29uZ3Nvbi1uYW5kLWNvbnRyb2xsZXIubwo+Cj4gIG5hbmQtb2JqcyA6PSBuYW5k
X2Jhc2UubyBuYW5kX2xlZ2FjeS5vIG5hbmRfYmJ0Lm8gbmFuZF90aW1pbmdzLm8gbmFuZF9pZHMu
bwo+ICBuYW5kLW9ianMgKz0gbmFuZF9vbmZpLm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMKPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiBy
ZW5hbWUgZnJvbSBkcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3NvbjEtbmFuZC1jb250cm9sbGVy
LmMKPiByZW5hbWUgdG8gZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9s
bGVyLmMKPiAtLQo+IDIuNDcuMwo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
