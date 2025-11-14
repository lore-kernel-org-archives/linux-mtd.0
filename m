Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC694CE8D68
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJheTrkiJvi0fW+yJb6QvgvxFV2Ug2t0DGAAJxL9arY=; b=rC6DCwtDdWQtdj
	HTYvBS3OWy5sVVHcaAykYZaL9PmKnFQjfPXRB3GLpDqusInZQ6xSA8gwrokTpWEk282KXc4j0TSEa
	Zrw7Kw2i+sY/LGDuV1U4STkYxa+sWbNkOWYhjjesWMoIbj+EIJU+hqfoPeScpCA6rS/OJFJ48kgD7
	9n7+FSTP2xwPAFW6JfC+KCMSab+B5bnp9hjeP0zDEO2P5a6EVyqxIXdG206qpf02oOWtp82L6LG5i
	PNltL98lBW+JL66yib/oh5hCAUuMyrqlB5YrXhweBAmQUI5UupSV4reqHqSdYo8OV4Mi4hPCCGA3k
	qtZJz/b5BBY0S29M4JRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy1p-0000000CueP-01PV;
	Fri, 14 Nov 2025 17:56:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy1j-0000000Cud8-2zTt
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:56:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 450191A1AAD;
	Fri, 14 Nov 2025 17:56:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F0D76060E;
	Fri, 14 Nov 2025 17:56:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 318A910371986;
	Fri, 14 Nov 2025 18:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SW2ZIM9oLxfFffo3rWzZoaXBX8dzI2c+UoXAbtyAfs0=;
	b=BVdnbfkMfsLefuj59s7ARxHyfXx7iE9qKZDtSnwmqVGb/ytHO9FBrictprEUZTi8Dq/NBZ
	W4sKxXjl30O0V6OVszvv/KXcPVd6Ew52/lIuFELEj/GJgH6NtX8bBKhCYxLJoMp/OysmiH
	e+TMT8gF1/fqTjefSc0gYWpwgJ6XO8iyeyFlGS3D/nnwb+Gv8RiL8rdzvYYOQ7UrIDs1E5
	ha/5n5wiji5A0mzS4gMVXWuL46nUR7ihoMLbABdtnyUbVhoOtQQ4RWcjbWmGyETvKTlzOK
	F0Hb2kIVMW9afUQGjXX1IsYD4n2biweiE8MyX2fP8DzUxw7oPgz22dGxnbJEXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <3f415ff1-834e-4544-a093-dcb4fd25d5c9@linux.dev> (Sean Anderson's
	message of "Thu, 13 Nov 2025 10:32:05 -0500")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
	<mafs0ecreontu.fsf@kernel.org>
	<4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
	<mafs05xcpo9sz.fsf@kernel.org>
	<26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
	<mafs0ikgnn07u.fsf@kernel.org>
	<d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
	<33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
	<92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
	<871pm3iegf.fsf@bootlin.com>
	<3f415ff1-834e-4544-a093-dcb4fd25d5c9@linux.dev>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 14 Nov 2025 18:55:59 +0100
Message-ID: <87ldk8fqhc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095603_884666_0AF82324 
X-CRM114-Status: GOOD (  19.57  )
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

SGVsbG8sCgo+PiBJIGFtIGFsc28gd29ya2luZyBvbiBsb2NraW5nIHRoZXNlIGRheXMsIGhhdmUg
eW91IGFscmVhZHkgc3RhcnRlZAo+PiB3cml0aW5nIGV4dHJhIFNQSSBOT1IgRG9jdW1lbnRhdGlv
bi9wcm9jZXNzIGJhc2VkIG9uIHRoaXMgdGhyZWFkPwo+Cj4gSSBoYXZlbid0IHN0YXJ0ZWQgd3Jp
dGluZyBhbnl0aGluZy4KPgo+PiBJIGFtIGFsc28gdHJ5aW5nIHRvIGNsYXJpZnkgd2hhdCBpcyBl
eHBlY3RlZCBhbmQgd2hhdCB0aGUgQVBJIHNvbWVob3cKPj4gZG9lcywgYXMgaXQgd2FzIG5vdCBm
dWxseSBjbGVhciBmb3IgbWUgYXQgZmlyc3Qgc2lnaHQuCj4KPiBJIGFncmVlLCBhcyB5b3UgY291
bGQgcHJvYmFibHkgaGF2ZSBmaWd1cmVkIG91dC4KPgo+Pj4gIyBmbGFzaF9sb2NrIC11IC9kZXYv
bXRkL2J5LW5hbWUvc3BpMC4xCj4+PiAjIHRlc3Qgc3BpMC4xIDY0Cj4+PiA4M2E4ZGM2MTI1ZWM5
NjcyZDE4ZjdmMThmOTJlMTZmODY3MzU0ZGJlOGUyZjNiMGFjYTUyYjlkMGFkN2Q4ZmZlICBzcGkw
LjEKPj4+IDgzYThkYzYxMjVlYzk2NzJkMThmN2YxOGY5MmUxNmY4NjczNTRkYmU4ZTJmM2IwYWNh
NTJiOWQwYWQ3ZDhmZmUgIC0KPj4+ICMgZmxhc2hfbG9jayAtbCAvZGV2L210ZC9ieS1uYW1lL3Nw
aTAuMSAkKCgxMDI0ICogNjQgKiAxMDI0KSkgMTAyNAo+Pj4gIyBmbGFzaF9sb2NrIC1pIC9kZXYv
bXRkL2J5LW5hbWUvc3BpMC4xIAo+Pj4gRGV2aWNlOiAvZGV2L210ZC9ieS1uYW1lL3NwaTAuMQo+
Pj4gU3RhcnQ6IDAKPj4+IExlbjogMHg4MDAwMDAwCj4+PiBMb2NrIHN0YXR1czogdW5sb2NrZWQg
PDw8PCBXcm9uZyEKPj4gCj4+IFRoaXMgaXNuJ3Qgd3JvbmcsIGV2ZW4gdGhvdWdoIGF0IGEgZmly
c3QgZ2xhbmNlIHRoZSBvdXRwdXQgaXMKPj4gbWlzbGVhZGluZy4gVGhlIEFQSSBhcHBhcmVudGx5
IGRvZXMgbm90IGdpdmVzIHlvdSBhbGwgdGhlCj4+IGxvY2tlZC91bmxvY2tlZCBzZWN0b3JzLCBp
dCBpcyB3YXkgbW9yZSBiYXNpYyB0aGFuIHRoYXQ6IGl0IHRlbGxzIHlvdQo+PiB3aGV0aGVyIHRo
ZSBmdWxsIHJhbmdlIHlvdSBhc2tlZCBmb3IgaXMgaW5kZWVkIGxvY2tlZC4KPgo+IFllYWgsIEkg
ZmlndXJlZCB0aGF0IG91dCBldmVudHVhbGx5Lgo+Cj4gQWN0dWFsbHksIHRoZSBtb3N0IHN1cnBy
aXNpbmcgdGhpbmcgdG8gbWUgaXMgdGhhdCB0aGUgbG9jay91bmxvY2sgQVBJcwo+IGFyZSBub3Qg
aW5jcmVtZW50YWwuIFRoYXQgaXMsIGlmIEkgaGF2ZSBhIGZsYXNoIG9mIDggc2Vjb25kcywgYW5k
Cj4gc2VjdG9ycyAwLTMgYXJlIGxvY2tlZCBhbmQgSSBsb2NrIHNlY3RvcnMgMC0xLCBpdCB3aWxs
IHNheSAid2VsbCwKPiBzZWN0b3JzIDItMyBzaG91bGQgYmUgdW5sb2NrZWQgbm93LCBidXQgd2Un
cmUgbm90IGFsbG93ZWQgdG8gdW5sb2NrCj4gZHVyaW5nIGEgbG9jayBvcGVyYXRpb24iIGFuZCBm
YWlsIHRvIGxvY2suIEkgd291bGQgaGF2ZSBleHBlY3RlZCBpdCB0bwo+IHNheSAic2VjdG9ycyAw
LTEgYXJlIGFscmVhZHkgbG9ja2VkIHNvIHdlIGRvbid0IG5lZWQgdG8gZG8gYW55dGhpbmciLgo+
IFRoZSBvbmx5IHdheSB0byBnbyBmcm9tIHNlY3RvcnMgMC0zIHRvIDAtMSBiZWluZyBsb2NrZWQg
aXMgdG8gaXNzdWUgYW4KPiAqdW5sb2NrKiBvbiBzZWN0b3JzIDItNy4KPgo+IENvbnZlcnNlbHks
IGlmIHdoYXQgeW91IHdhbnRlZCB0byBkbyB3YXMgZW5zdXJlIHNlY3RvcnMgMi0zIHdlcmUKPiB1
bmxvY2tlZCwgeW91IGNhbid0IGRvIHRoZSBuYWl2ZSB0aGluZyBhbmQgdW5sb2NrIHNlY3RvcnMg
Mi0zLCBzaW5jZQo+IHRoYXQgd2lsbCB0cnkgdG8gbG9jayBzZWN0b3JzIDAtMSBhbmQgNC03LCB0
aGUgbGF0dGVyIGJlaW5nIGRpc2FsbG93ZWQKPiBpbiBhbiB1bmxvY2sgb3BlcmF0aW9uLiBTbyB5
b3UgYWN0dWFsbHkgaGF2ZSB0byB1bmxvY2sgc2VjdG9ycyAyLTcuCj4KPiBBbmQga25vd2luZyB3
aGF0IHRvIGRvIGlzIGNvbXBsaWNhdGVkIGJ5IElTTE9DS0VEIG9ubHkgcmV0dXJuaW5nIGEKPiBi
b29sZWFuIGluc3RlYWQgb2YganVzdCB0ZWxsaW5nIHVzZXJzcGFjZSB3aGF0IHNlY3RvcnMgYXJl
IGxvY2tlZCAod2hpY2gKPiBtdXN0IGJlIGEgc21hbGwgZmluaXRlIHNldCBvZiByYW5nZXMgKHVz
dWFsbHkgb25lKSBvbiBhbGwgZmxhc2hlcyBJJ20KPiBmYW1pbGlhciB3aXRoKS4KCkkndmUgdHJp
ZWQgdG8gYWRkcmVzcyBtb3N0IG9mIHRoaXMsIHNlZToKCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC8yMDI1MTExNC13aW5ib25kLXY2LTE4LXJjMS1zcGktbm9yLXN3cC12
MS0wLTQ4N2JjNzEyOTkzMUBib290bGluLmNvbS9ULyNtYmFlOGI4NzQxODFlYjA0MDFiMzAxNDJm
NDIzYjczYjYzODlhMGM1NAoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
