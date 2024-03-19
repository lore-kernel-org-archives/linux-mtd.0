Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE76C54E71
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0DCJFM3J3e6M13tzdKIxHubHQVoBJ4aKvK9jWvi2GIY=; b=HEmSO8YJR/ijQa1KA9nF20KLfd
	sCZBVmhAy7MlJEyQHFgtId/vWM0G8zUtJEjKN4Oahw7LV1h98p1+tueCJW8N6C6O+dATUVF2zpY+S
	Tjaa3tN3plBAH+gx5p1iUxAdlDpVCfam3MmCGxRhMY3/UdH/1xwlUHJ1uqiiamXDYMNEVcTPP9Hf+
	1SK6JDHMJAT2t3Kjqrbbtb35VHCLgG7k+GhPADS+sZ1dv+miUnnf7MWZrQIP5Soykd4kxRihGvn5W
	8s77cxTFin+/ghHKB9y/W85U8ZpAWGtnOYJsG3faiO6vqUgLlq+nV5i//OomPlCGThAmdhBSn2GC2
	nbaSWdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhzP-0000000ESvY-2xtp;
	Tue, 19 Mar 2024 22:31:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhzM-0000000ESuc-3Q0W
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 22:31:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5CB9D62E1A81;
	Tue, 19 Mar 2024 23:31:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id buCitthY5iPP; Tue, 19 Mar 2024 23:31:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A8F1762348AD;
	Tue, 19 Mar 2024 23:31:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qcuwPV9gpYre; Tue, 19 Mar 2024 23:31:18 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7BE7E6450958;
	Tue, 19 Mar 2024 23:31:18 +0100 (CET)
Date: Tue, 19 Mar 2024 23:31:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	david oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <1196553263.78350.1710887478387.JavaMail.zimbra@nod.at>
In-Reply-To: <Ze5uUyUuEDBM3p43@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org> <82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org> <20240219120156.383a1427@xps-13> <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at> <ZdvV1KABu_UCSL7B@makrotopia.org> <1754825522.38834.1710105437883.JavaMail.zimbra@nod.at> <Ze5uUyUuEDBM3p43@makrotopia.org>
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: provide NVMEM layer over UBI volumes
Thread-Index: ULk91lSCNuYw1pJMwwbTh6ecFyLSEA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_153121_027642_5BC91D39 
X-CRM114-Status: GOOD (  13.51  )
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
bmllbEBtYWtyb3RvcGlhLm9yZz4KPj4gQlRXOiBJcyB0aGVyZSBhIG5pY2Ugd2F5IHRvIHRlc3Qg
dGhpcyB3aXRoIG5hbmRzaW0gaW4gcWVtdT8KPj4gSSdkIGxvdmUgYmVpbmcgYWJsZSB0byB0ZXN0
IGFsbCB1YmkgYXR0YWNoIGNvZGUgcGF0aHMgb24gbXkgdGVzdCBzZXR1cC4KPiAKPiBGcm9tIHdo
YXQgSSBjYW4gdGVsbCAnbmFuZHNpbScgZG9lc24ndCBoYXZlIGEgd2F5IHRvIGJlIGRlZmluZWQg
aW4KPiBEZXZpY2UgVHJlZSwgbWFraW5nIGl0IHVuc3VpdGFibGUgdG8gdGVzdCB0aGUgYXR0YWNo
bWVudCBvZiBVQkkgaW4KPiB0aGlzIHdheS4KPiAKPiBIb3dldmVyLCBRRU1VIGRvZXMgc3VwcG9y
dCBlbXVsYXRpbmcgVEkgT01BUCdzIE9uZU5BTkQgY29udHJvbGxlciwgZWcuCj4gYXMgcGFydCBv
ZiB0aGUgTm9raWEgTjgxMCBoYXJkd2FyZSBzdXBwb3J0ZWQgYnkgcWVtdS1zeXN0ZW0tYXJtLCBz
ZWUKPiAKPiBodHRwczovL3d3dy5xZW11Lm9yZy9kb2NzL21hc3Rlci9zeXN0ZW0vYXJtL25zZXJp
ZXMuaHRtbAo+IAo+IFNvIHdlIGNvdWxkIHVzZSB0aGF0IGFuZCBtb2RpZnkgdGhlIGRldmljZSB0
cmVlIGluIExpbnV4IHRvIGhhdmUgYSBNVEQKPiBwYXJ0aXRpb24gZm9yIFVCSSBhbmQgJ2NvbXBh
dGlibGUgPSAibGludXgsdWJpIjsnIHNldCB0aGVyZWluOgo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3RpL29tYXAvb21hcDI0MjAtbjh4MC1jb21tb24uZHRzaSNuODQKPiAK
PiBJZiB5b3UgbGlrZSBJIGNhbiBwcmVwYXJlIHN1Y2ggYSB0ZXN0IHNldHVwLgoKVGhpcyB3b3Vs
ZCBiZSBncmVhdCEKCj4gSXMgdGhlcmUgYSByZXBvc2l0b3J5IGZvciBNVEQvVUJJIHRlc3RzIHRv
IGJlIHJ1biBvbiBRRU1VIHdoaWNoIEkgc2hvdWxkCj4gY29udHJpYnV0ZSB0aGlzIHRvPwoKVUJJ
IHRlc3RzIHJlc2lkZSBpbiB0aGUgbXRkLXV0aWxzIHJlcG9zaXRvcnkuCmh0dHA6Ly9naXQuaW5m
cmFkZWFkLm9yZy8/cD1tdGQtdXRpbHMuZ2l0O2E9dHJlZTtmPXRlc3RzL3ViaS10ZXN0cztoPTIw
ZmQ2YTA0M2VlYjk2YTgxNzM2ZGQwNzg4NWY3NGU0ZTBiYjBjYzA7aGI9SEVBRAoKTWF5YmUgeW91
IGNhbiBwcm92aWRlIGEgc21hbGwgc2hlbGwgc2NyaXB0IHdoaWNoIGNvbmZpZ3VyZXMgcWVtdT8K
SXQgZG9lc24ndCBoYXZlIHRvIGJlIGZhbmN5LCBqdXN0IHNvbWV0aGluZyBEYXZpZCBvciBJIGNh
biB1c2UgYXMgc3RhcmluZyBwb2ludC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
