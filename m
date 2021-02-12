Return-Path: <SRS0=iZ7+=HO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8E0C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 14:13:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F9964E6C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 14:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F9964E6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qZLiYLfGp4exn2fruDXikCZzcr7VbzYmz5phBwbaAMo=; b=PQN8AbHhPvb+VeQFOLjbGcZAU
	B/Kr0NDaU6bC9r0NYe/vvBuYVtypz2WQn3I908ns5HzK5QlpoF4zPAEEFAG5xmbNeK0BKcaGvcoRR
	tS3zbRqyWoEA+1pITYOgffnS2bl2XTe0s1OmH2B1Grmj3+RbuFZ4gHrJcDBBY4VmeDqZB+KgSFsvG
	EqTuitMk7CZtlOOMLUBX05AMzb86o0tbuTi1gs0zkTUd3ROeUW4BJBHMxejt8s2r/Ed5sCZnBXW64
	G4xiXkX4jVefy8tH1dxrKT3Lx+cbANQrRbaV6Tm2SrXLlXe7JQtmhY0+/argm+SQDlLsf+ZNxbeTq
	mynkx73zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAZBW-00021O-9v; Fri, 12 Feb 2021 14:12:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAZBI-00020a-BV
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2021 14:12:25 +0000
X-Originating-IP: 90.89.99.36
Received: from xps13 (lfbn-tou-1-1536-36.w90-89.abo.wanadoo.fr [90.89.99.36])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0E61420011;
 Fri, 12 Feb 2021 14:12:17 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:12:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] mtd: physmap: physmap-bt1-rom: Fix unintentional stack
 access
Message-ID: <20210212151216.31a09ad1@xps13>
In-Reply-To: <20210212104022.GA242669@embeddedor>
References: <20210212104022.GA242669@embeddedor>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_091224_521967_B3DA16F0 
X-CRM114-Status: GOOD (  19.62  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3Jn
PiB3cm90ZSBvbiBGcmksIDEyIEZlYiAyMDIxCjA0OjQwOjIyIC0wNjAwOgoKPiBDYXN0ICZkYXRh
IHRvIChjaGFyICopIGluIG9yZGVyIHRvIGF2b2lkIHVuaW50ZW50aW9uYWxseSBhY2Nlc3NpbmcK
PiB0aGUgc3RhY2suCj4gCj4gTm90aWNlIHRoYXQgZGF0YSBpcyBvZiB0eXBlIHUzMiwgc28gYW55
IGluY3JlbWVudCB0byAmZGF0YQo+IHdpbGwgYmUgaW4gdGhlIG9yZGVyIG9mIDQtYnl0ZSBjaHVu
a3MsIGFuZCB0aGlzIHBpZWNlIG9mIGNvZGUKPiBpcyBhY3R1YWxseSBpbnRlbmRlZCB0byBiZSBh
IGJ5dGUgb2Zmc2V0LgoKSSBkb24ndCBoYXZlIHRoZSBzYW1lIHJlYWRpbmcuIEkgZG9uJ3Qgc2F5
IHRoYXQgQ292ZXJpdHkgcmVwb3J0IGlzCndyb25nLCBidXQgbGV0J3MgZGlzY3VzcyB0aGlzIGEg
Yml0IGZ1cnRoZXIuCgpHaXZlbiB0aGF0ICZkYXRhIGlzIG9mIHR5cGUgdTMyICosIHlvdSBzYXkg
dGhhdCAiJmRhdGEgKyBzaGlmdCIKcHJvZHVjZXMgaW5jcmVtZW50cyBvZiA0LWJ5dGVzLCBpZS4g
d2Ugd291bGQgYWNjZXNzICImZGF0YSArIDQgKgpzaGlmdCI/IEJlY2F1c2UgSSBkb24ndCB0aGlu
ayB0aGlzIGlzIHRoZSBjYXNlIChhZ2FpbiwgSSBtYXkgYmUgd3JvbmcpLgoKSSdtIHN1cmUgdGhp
cyB3b3VsZCBiZSB0aGUgY2FzZSBpZiB3ZSBkZXJlZmVyZW5jZWQgZGF0YSBsaWtlCmRhdGFbc2hp
ZnRdIHRob3VnaCwgYnV0IGluIHRoaXMgY2FzZSBJIGRvbid0IHNlZSB3aGF0IHRoaXMgY2FzdCBp
cwpmaXhpbmcuIENhbiB5b3UgZW5saWdodGVuIG1lPwoKQ291bGQgdGhlIG91dC1vZi1ib3VuZHMg
d2FybmluZyBjb21lIGZyb20gdGhlIGZhY3QgdGhhdCBzaGlmdAptaWdodCBiZSBiaWdnZXIgdGhh
biB0aGUgZGF0YSBhcnJheSBzcHJlYWQ/Cgo+IEZpeGVzOiBiM2U3OWU3NjgyZTAgKCJtdGQ6IHBo
eXNtYXA6IEFkZCBCYWlrYWwtVDEgcGh5c2ljYWxseSBtYXBwZWQgUk9NIHN1cHBvcnQiKQo+IEFk
ZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTQ5Nzc2NSAoIk91dC1vZi1ib3VuZHMgYWNjZXNzIikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4g
U2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbWFwcy9w
aHlzbWFwLWJ0MS1yb20uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL21hcHMvcGh5c21h
cC1idDEtcm9tLmMgYi9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtYnQxLXJvbS5jCj4gaW5kZXgg
YTM1NDUwMDAyMjg0Li41ODc4MmNmYWY3MWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbWFw
cy9waHlzbWFwLWJ0MS1yb20uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1idDEt
cm9tLmMKPiBAQCAtNzksNyArNzksNyBAQCBzdGF0aWMgdm9pZCBfX3hpcHJhbSBidDFfcm9tX21h
cF9jb3B5X2Zyb20oc3RydWN0IG1hcF9pbmZvICptYXAsCj4gIAlpZiAoc2hpZnQpIHsKPiAgCQlj
aHVuayA9IG1pbl90KHNzaXplX3QsIDQgLSBzaGlmdCwgbGVuKTsKPiAgCQlkYXRhID0gcmVhZGxf
cmVsYXhlZChzcmMgLSBzaGlmdCk7Cj4gLQkJbWVtY3B5KHRvLCAmZGF0YSArIHNoaWZ0LCBjaHVu
ayk7Cj4gKwkJbWVtY3B5KHRvLCAoY2hhciAqKSZkYXRhICsgc2hpZnQsIGNodW5rKTsKPiAgCQlz
cmMgKz0gY2h1bms7Cj4gIAkJdG8gKz0gY2h1bms7Cj4gIAkJbGVuIC09IGNodW5rOwoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
