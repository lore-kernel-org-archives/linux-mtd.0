Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06987C77B75
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1/S/4TuJZN7sZkRmxo0iOFDt495xTRV9cuJezzK5m4=; b=kDTTmJceh2MTmz
	A6r1jEOO8kakqfJ8OimW/eu7CpGBEWPf2Xd4F8apwJd2gp0hdyPrF0uD0EgNHnnYSgPzM1eGvzH9s
	4StNpyWXhVA46HIRipEZ6hEfsSg7i1uEcessw02SUmLSVmpDC+opxrQQO47dRah5jHnoD4zyYsF3z
	3TCazdiFICEHPFDL7h9fgMBeTsA3njAvgk7D7tJmjxlYVgqEP+MOjCqILdbliWgXR1aUaeGH3Oveg
	I9Vxifuaa1/1WnQXw8KY9H+w0AkgdOZpRoRB4otAxUH0R7AoFjuWwPFPgir+pskXWXiDjxN2kJXic
	r+GPFALWl4siE8m6r0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10vg-005kjZ-0F;
	Mon, 22 May 2023 08:30:08 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10vZ-005ki6-27
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 08:30:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6680A1BF216;
	Mon, 22 May 2023 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684744197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5Fe74h5JTNsqGr8I0pihoWU3MQrRGJcpIZ7H5+Yuaw=;
	b=a8a4j4Clxo8d5bzikhJNekIR81/QiEf//S8c/8AmZB6aQokS0b8929x+y91azAmh5XfwvZ
	f3RlZcqPlv/ikgmwXlenr/lzRTdukZD4ZAkpR3s0YYn4fsSvMdCW4pKdFUxfwy4LnheIMG
	uOB+oS8lZTSGn09/jDUf+znTBJgsIE23Xxf2hDxlpko0+ulyFgi8mOa6LskWvTOOVULL2M
	dAnzBhi/H+9UEjtpkv+fq91qe+WnntNkHvxOJa2j0anFyIvLEGi6CzYpVQEtqJ+K5n32gT
	B0nr3CkhV/71lnXQ6RO/jnQqcp4V0NqfEE3Xd79lqBSKe3llkhYpHXD4FGXRZQ==
Date: Mon, 22 May 2023 10:29:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: richard@nod.at, todd.e.brandt@intel.com, vigneshr@ti.com,
 pratyush@kernel.org, michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 bagasdotme@gmail.com, regressions@lists.linux.dev, joneslee@google.com,
 Todd Brandt <todd.e.brandt@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic
 flashes
Message-ID: <20230522102953.2fdf2b02@xps-13>
In-Reply-To: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
References: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_013001_959220_EF431337 
X-CRM114-Status: GOOD (  22.85  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVGh1LCAxOCBNYXkg
MjAyMyAwODo1NDo0MCArMDAwMDoKCj4gV2UgZmFpbGVkIHRvIGluaXRpYWxpemUgbl9iYW5rcyBm
b3Igc3BpLW5vci1nZW5lcmljIGZsYXNoZXMsIHdoaWNoCj4gY2F1c2VkIGEgZGV2aWRlIGJ5IHpl
cm8gd2hlbiBjb21wdXRpbmcgdGhlIGJhbmtfc2l6ZS4KPiAKPiBCeSBkZWZhdWx0IHdlIGNvbnNp
ZGVyIHRoYXQgYWxsIGNoaXBzIGhhdmUgYSBzaW5nbGUgYmFuay4gSW5pdGlhbGl6ZQo+IHRoZSBk
ZWZhdWx0IG51bWJlciBvZiBiYW5rcyBmb3Igc3BpLW5vci1nZW5lcmljIGZsYXNoZXMuIEV2ZW4g
aWYgdGhlCj4gYnVnIGlzIGZpeGVkIHdpdGggdGhpcyBzaW1wbGUgaW5pdGlhbGl6YXRpb24sIGNo
ZWNrIHRoZSBuX2JhbmtzIHZhbHVlCj4gYmVmb3JlIGRpdmlkaW5nIHNvIHRoYXQgd2UgbWFrZSBz
dXJlIHRoaXMga2luZCBvZiBidWcgd29uJ3Qgb2NjdXIgYWdhaW4KPiBpZiBzb21lIG90aGVyIHN0
cnVjdCBpbnN0YW5jZSBpcyBjcmVhdGVkIHVuaW5pdGlhbGl6ZWQuCj4gCj4gU3VnZ2VzdGVkLWJ5
OiBUb2RkIEJyYW5kdCA8dG9kZC5lLmJyYW5kdEBsaW51eC5pbnRlbC5jb20+Cj4gUmVwb3J0ZWQt
Ynk6IFRvZGQgQnJhbmR0IDx0b2RkLmUuYnJhbmR0QGxpbnV4LmludGVsLmNvbT4KPiBDbG9zZXM6
IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3NDQ4Cj4gRml4
ZXM6IDlkNmM1ZDY0ZjAyOCAoIm10ZDogc3BpLW5vcjogSW50cm9kdWNlIHRoZSBjb25jZXB0IG9m
IGJhbmsiKQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDUxNjIyNTEw
OC4yOTE5NC0xLXRvZGQuZS5icmFuZHRAaW50ZWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFR1ZG9y
IEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IGluZGV4IDBiYjBhZDE0YTJmYy4u
NWYyOWZhYzg2NjlhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4g
KysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBAQCAtMjAxOCw2ICsyMDE4LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX21hbnVmYWN0dXJlciAqbWFudWZhY3R1cmVyc1td
ID0gewo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHNwaV9ub3JfZ2VuZXJp
Y19mbGFzaCA9IHsKPiAgCS5uYW1lID0gInNwaS1ub3ItZ2VuZXJpYyIsCj4gKwkubl9iYW5rcyA9
IDEsCgpJIGRlZmluaXRlbHkgbWlzc2VkIHRoYXQgc3RydWN0dXJlLgoKPiAgCS8qCj4gIAkgKiBK
RVNEMjE2IHJldiBBIGRvZXNuJ3Qgc3BlY2lmeSB0aGUgcGFnZSBzaXplLCB0aGVyZWZvcmUgd2Ug
bmVlZCBhCj4gIAkgKiBzYW5lIGRlZmF1bHQuCj4gQEAgLTI5MjEsNyArMjkyMiw4IEBAIHN0YXRp
YyB2b2lkIHNwaV9ub3JfbGF0ZV9pbml0X3BhcmFtcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICAJ
aWYgKG5vci0+ZmxhZ3MgJiBTTk9SX0ZfSEFTX0xPQ0sgJiYgIW5vci0+cGFyYW1zLT5sb2NraW5n
X29wcykKPiAgCQlzcGlfbm9yX2luaXRfZGVmYXVsdF9sb2NraW5nX29wcyhub3IpOwo+ICAKPiAt
CW5vci0+cGFyYW1zLT5iYW5rX3NpemUgPSBkaXY2NF91NjQobm9yLT5wYXJhbXMtPnNpemUsIG5v
ci0+aW5mby0+bl9iYW5rcyk7Cj4gKwlpZiAobm9yLT5pbmZvLT5uX2JhbmtzID4gMSkKPiArCQlw
YXJhbXMtPmJhbmtfc2l6ZSA9IGRpdjY0X3U2NChwYXJhbXMtPnNpemUsIG5vci0+aW5mby0+bl9i
YW5rcyk7CgpJJ20gZmluZSB3aXRoIHRoZSBjaGVjayBhcyBpdCBpcyB3cml0dGVuIGJlY2F1c2Ug
aXQgYWxzbyBsb29rIGxpa2UgYW4Kb3B0aW1pemF0aW9uLCBidXQgYmFua19zaXplIHNob3VsZCBu
ZXZlciBiZSAwIG90aGVyd2lzZSBpdCdzIGEgcmVhbCBidWcKdGhhdCBtdXN0IGJlIGNhdGNoIGFu
ZCBmaXhlZC4gV2UgZG8gbm90IHdhbnQgdW5pbml0aWFsaXplZCBiYW5rX3NpemUncy4KCj4gIH0K
PiAgCj4gIC8qKgo+IEBAIC0yOTg3LDYgKzI5ODksNyBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX2lu
aXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0IHNwaV9ub3IgKm5vcikKPiAgCS8qIFNldCBTUEkgTk9S
IHNpemVzLiAqLwo+ICAJcGFyYW1zLT53cml0ZXNpemUgPSAxOwo+ICAJcGFyYW1zLT5zaXplID0g
KHU2NClpbmZvLT5zZWN0b3Jfc2l6ZSAqIGluZm8tPm5fc2VjdG9yczsKPiArCXBhcmFtcy0+YmFu
a19zaXplID0gcGFyYW1zLT5zaXplOwo+ICAJcGFyYW1zLT5wYWdlX3NpemUgPSBpbmZvLT5wYWdl
X3NpemU7CgpXZSBhY3R1YWxseSBkaXNjYXJkZWQgdGhhdCBsaW5lIGluIGEgcHJldmlvdXMgZGlz
Y3Vzc2lvbjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMwMzMxMTk0NjIw
LjgzOTg5OS0xLW1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20vVC8jbWNiNGY5MGY3Y2E0OGZmZTNk
OTgzOGIyYWM2Zjc0ZTQ0NDYwYzUxYmQKCkknbSBmaW5lIHRvIHJlLWFkZCBpdCB0aG91Z2gsIGl0
IGRvZXMgbm90IGh1cnQuCgo+ICAKPiAgCWlmICghKGluZm8tPmZsYWdzICYgU1BJX05PUl9OT19G
UikpIHsKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
