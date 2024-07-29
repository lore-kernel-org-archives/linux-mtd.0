Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C39C3DA61
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2024 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmKalzcBur1w1uhru/q0dhDDxqjmf1o8Zz26tkbHZ1k=; b=rNnYBpi+hmq1rJ
	r8pm4ImnXUCNPUzJC4e34IXkIsaz+DHnuBVoRVv4qs5HWfB4lJLwQL4jFV2qNs1GSqY1a3H7AtI3J
	6BDUaSg1yG1fDYuP7ybyN891RIk6v74M1lPUFJGMX5FdJBW0ismA8Zf4ZNX6ZE+2OSVq8hTYd42xH
	+jjyDg03PCSpIgOoaGCzQy/JN5we/vGGnH9akpLb5dvQtsOCf0SUGHcPCFaV9q112cSZS9GUwAH/n
	Ezq2hUMLg0xtPJiuFnqz+itt+lj2EiJEO9F+WXVpw2jNc9IbkDuyW+J8vFMETYyCU4SyJ5psKBAzC
	oygIzlTQwk4uJCot6efA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSnO-0000000Bvte-2lWq;
	Mon, 29 Jul 2024 16:00:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRmu-0000000Bl72-0dc5
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jul 2024 14:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33C8FCE0B81;
	Mon, 29 Jul 2024 14:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3683DC32786;
	Mon, 29 Jul 2024 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722264945;
	bh=l/1GqXYGzcJhXc0sYSrfsq2Iy6WJe4nNPGoPHeBpm0k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aJuDukL156iN3Ke2uJenSPPbfdL4svs0vx/6nOvFHXvaxspckME+4KwEDlogI9ieB
	 UYFcJx+wZ92CH2GegVwShojz5JgdaWDY83Z2FI/wVW9d6K97vjVBqPenPAp8Q6Pzx2
	 DNw+1yXsI6E4LjwfWWG74rDiZc5gSU96lj7K/Iva2loAuUPiIo2ulI5lwAYIZKyULc
	 ZH8sJVScQOust4zpOaIMmtwaG0vZAqL9BCdOMUoDbxkIg6MdbBYMQUfDQ0Uw6usxsK
	 Yix7K0Q9pSKsuiUUusN+eaMFHn6wNtk3B7SYMs5mxAr+RNFkzqHi0exzQQg3+W0VeV
	 covHpwxZrgj4A==
From: Pratyush Yadav <pratyush@kernel.org>
To: =?utf-8?Q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
Cc: <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Tudor Ambarus" <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: sst: Factor out common write operation to
 `sst_nor_write_data()`
In-Reply-To: <20240710091401.1282824-1-csokas.bence@prolan.hu>
 (=?utf-8?B?IkNzw7Nrw6FzLA==?=
	Bence"'s message of "Wed, 10 Jul 2024 11:14:01 +0200")
References: <20240710091401.1282824-1-csokas.bence@prolan.hu>
Date: Mon, 29 Jul 2024 16:55:43 +0200
Message-ID: <mafs07cd42qog.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_075548_564320_FFD5A3FB 
X-CRM114-Status: GOOD (  24.01  )
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

SGksCgpPbiBXZWQsIEp1bCAxMCAyMDI0LCBDc8Oza8OhcywgQmVuY2Ugd3JvdGU6Cgo+IFdyaXRp
bmcgdG8gdGhlIEZsYXNoIGluIGBzc3Rfbm9yX3dyaXRlKClgIGlzIGEgMy1zdGVwIHByb2Nlc3M6
Cj4gZmlyc3QgYW4gb3B0aW9uYWwgb25lLWJ5dGUgd3JpdGUgdG8gZ2V0IDItYnl0ZS1hbGlnbmVk
LCB0aGVuIHRoZQo+IGJ1bGsgb2YgdGhlIGRhdGEgaXMgd3JpdHRlbiBvdXQgaW4gdmVuZG9yLXNw
ZWNpZmljIDItYnl0ZSB3cml0ZXMuCj4gRmluYWxseSwgaWYgdGhlcmUncyBhIGJ5dGUgbGVmdCBv
dmVyLCBhbm90aGVyIG9uZS1ieXRlIHdyaXRlLgo+IFRoaXMgd2FzIGltcGxlbWVudGVkIDMgdGlt
ZXMgaW4gdGhlIGJvZHkgb2YgYHNzdF9ub3Jfd3JpdGUoKWAuCj4gVG8gcmVkdWNlIGNvZGUgZHVw
bGljYXRpb24sIGZhY3RvciBvdXQgdGhlc2Ugc3ViLXN0ZXBzIHRvIHRoZWlyCj4gb3duIGZ1bmN0
aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ3PDs2vDoXMsIEJlbmNlIDxjc29rYXMuYmVuY2VAcHJv
bGFuLmh1PgoKQXBwbGllZCB0byBzcGktbm9yL25leHQsIHRoYW5rcyEKCkZZSSwgSSBzcG90dGVk
IGEgY291cGxlIHNtYWxsIGlzc3VlcyBhbmQgZml4ZWQgdGhlbSB1cCB3aGVuIGFwcGx5aW5nLgpT
ZWUgYmVsb3cuLi4KCj4gLS0tCj4KPiBOb3RlczoKPiAgICAgUkZDOiBJJ20gdGhpbmtpbmcgb2Yg
cmVtb3ZpbmcgU1BJTk9SX09QX0JQIGluIGZhdm9yIG9mCj4gICAgIFNQSU5PUl9PUF9QUCAodGhl
eSBoYXZlIHRoZSBzYW1lIHZhbHVlKS4gU1BJTk9SX09QX1BQCj4gICAgIGlzIHRoZSAic3RhbmRh
cmQiIG5hbWUgZm9yIHRoZSBlbGVtZW50YXJ5IHVuaXQtc2l6ZWQKPiAgICAgKDEgYnl0ZSwgaW4g
dGhlIGNhc2Ugb2YgTk9SKSB3cml0ZSBvcGVyYXRpb24uIEkgZmluZCBpdAo+ICAgICBjb25mdXNp
bmcgdG8gaGF2ZSB0d28gbmFtZXMgZm9yIHRoZSBzYW1lIG9wZXJhdGlvbiwKPiAgICAgc28gaW4g
YSBmb2xsb3d1cCBJIHBsYW4gdG8gcmVtb3ZlIHRoZSB2ZW5kb3Itc3BlY2lmaWMKPiAgICAgbmFt
ZSBpbiBmYXZvciBvZiB0aGUgc3RhbmRhcmQgb25lLgo+Cj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
c3N0LmMgfCAzOSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3Nz
dC5jCj4gaW5kZXggMTgwYjczOTA2OTBjLi5mZWM3MTY4OWU2NDQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvc3BpLW5vci9zc3QuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMK
PiBAQCAtMTY3LDYgKzE2NywyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3N0
X25vcl9wYXJ0c1tdID0gewo+ICAJfQo+ICB9Owo+ICAKPiArc3RhdGljIGludCBzc3Rfbm9yX3dy
aXRlX2RhdGEoc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IHRvLCBzaXplX3QgbGVuLAo+ICsJ
CQljb25zdCB1X2NoYXIgKmJ1ZikKCldoaXRlc3BhY2UgaXNzdWUsIGNoZWNrcGF0Y2ggY29tcGxh
aW5zIG9uIHRoaXMuIEl0IHNob3VsZCBiZSBhbGlnbmVkCndpdGggdGhlIG9wZW5pbmcgcGFyZW50
aGVzaXMgYWJvdmUuCgo+ICt7Cj4gKwl1OCBvcCA9IChsZW4gPT0gMSkgPyBTUElOT1JfT1BfQlAg
OiBTUElOT1JfT1BfQUFJX1dQOwo+ICsJaW50IHJldDsKPiArCj4gKwlub3ItPnByb2dyYW1fb3Bj
b2RlID0gb3A7Cj4gKwlyZXQgPSBzcGlfbm9yX3dyaXRlX2RhdGEobm9yLCB0bywgMSwgYnVmKTsK
PiArCWlmIChyZXQgPCAwKQo+ICsJCXJldHVybiByZXQ7Cj4gKwlXQVJOKHJldCAhPSBsZW4sICJX
aGlsZSB3cml0aW5nICVpIGJ5dGUgd3JpdHRlbiAlaSBieXRlc1xuIiwgbGVuLCByZXQpOwoKSSBn
ZXQgYSBidWlsZCB3YXJuaW5nIGJlY2F1c2Ugb2YgaW5jb3JyZWN0IGZvcm1hdCBzcGVjaWZpZXIu
IFNob3VsZCB1c2UKJXp1IHNpbmNlIGxlbiBpcyBzaXplX3QuCgo+ICsKPiArCXJldHVybiBzcGlf
bm9yX3dhaXRfdGlsbF9yZWFkeShub3IpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHNzdF9ub3Jf
d3JpdGUoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90IGxlbiwKPiAgCQkJ
IHNpemVfdCAqcmV0bGVuLCBjb25zdCB1X2NoYXIgKmJ1ZikKPiAgewpbLi4uXQoKLS0gClJlZ2Fy
ZHMsClByYXR5dXNoIFlhZGF2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
