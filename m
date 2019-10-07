Return-Path: <SRS0=6eB4=YA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9589C4740A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FBCE20867
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XxSmUa1V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FBCE20867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDWr/WnUchRnSVsts79C5Sft+7NObA1kDkT7O0zL0ws=; b=XxSmUa1VadWi+z
	k3NBpr4Z5cFITAyowElavE1SbnzIh2za3Z55WssnGkp1swJmmmWbCJHW0DRMuiI9p9J5wiCSY/fi4
	Nml+I9bVcJ6E4Bzj+auHjObhr/meGsriW4lEpRhL5AbIDp6q7yv06vokbRPV2Zzy2hoRfzD4UbBac
	DsRkYcV7EyPfvk0XlxfSKzc1AMqofGjwiyQwHgnFWGtUwCrRRLFuXQncYFLc8UHJ79hYrItT2Lgzy
	tzeX1gzEni9VuzbCg4q7fMJzeu/Tj7BqAjB8ssxZLXWiUU8Lq5yIa3vZysKsVhtTpKuMTmVw2fFRi
	eZ6fjdVfiy2H6Rx1Wlig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHOdn-0007fn-05; Mon, 07 Oct 2019 08:45:15 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHOdj-0007f7-T4
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2019 08:45:13 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B1759E0011;
 Mon,  7 Oct 2019 08:45:02 +0000 (UTC)
Date: Mon, 7 Oct 2019 10:45:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH RFC 3/3] mtd: rawnand: Add support Macronix power down mode
Message-ID: <20191007104501.1b4ed8ed@xps13>
In-Reply-To: <1568793387-25199-3-git-send-email-masonccyang@mxic.com.tw>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
 <1568793387-25199-3-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_014512_211371_848A1158 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: juliensu@mxic.com.tw, vigneshr@ti.com, bbrezillon@kernel.org,
 marcel.ziswiler@toradex.com, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
V2VkLCAxOCBTZXAgMjAxOSAxNTo1NjoyNgorMDgwMDoKCj4gTWFjcm9uaXggQUQgc2VyaWVzIHN1
cHBvcnQgdXNpbmcgcG93ZXIgZG93biBjb21tYW5kIHRvCj4gZW50ZXIgYSBtaW5pbXVtIHBvd2Vy
IGNvbnN1bXB0aW9uIHN0YXRlLgo+IAo+IE1URCBkZWZhdWx0IF9zdXNwZW5kL19yZXN1bWUgZnVu
Y3Rpb24gcmVwbGFjZW1lbnQgYnkKPiBtYW51ZmFjdHVyZXIgcG9zdHBvbmVkIGluaXRpYWxpemF0
aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hc29uIFlhbmcgPG1hc29uY2N5YW5nQG14aWMuY29t
LnR3Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMgfCA3OCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDc3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9t
YWNyb25peC5jCj4gaW5kZXggOTkxYzYzNi4uOTlhN2IyZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX21hY3Jvbml4LmMKPiBAQCAtMTUsNiArMTUsOCBAQAo+ICAjZGVmaW5lIE1YSUNfQkxP
Q0tfUFJPVEVDVElPTl9BTExfTE9DSyAweDM4Cj4gICNkZWZpbmUgTVhJQ19CTE9DS19QUk9URUNU
SU9OX0FMTF9VTkxPQ0sgMHgwCj4gIAo+ICsjZGVmaW5lIE5BTkRfQ01EX1BPV0VSX0RPV04gMHhC
OQo+ICsKPiAgc3RydWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXggewo+ICAJdTggcmVzZXJ2
ZWQ7Cj4gIAl1OCByZWxpYWJpbGl0eV9mdW5jOwo+IEBAIC03OCw2ICs4MCwxMiBAQCBzdGF0aWMg
dm9pZCBtYWNyb25peF9uYW5kX29uZmlfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJ
CSJNWDMwVUY0RzI4QUMiLAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBu
YW5kX3Bvd2VyX2Rvd25bXSA9IHsKPiArCQkiTVgzMExGMUcyOEFEIiwKPiArCQkiTVgzMExGMkcy
OEFEIiwKPiArCQkiTVgzMExGNEcyOEFEIiwKPiArfTsKPiArCj4gIHN0YXRpYyB2b2lkIG1hY3Jv
bml4X25hbmRfZml4X2Jyb2tlbl9nZXRfdGltaW5ncyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+
ICB7Cj4gIAl1bnNpZ25lZCBpbnQgaTsKPiBAQCAtMTQ0LDggKzE1Miw2NCBAQCBzdGF0aWMgaW50
IG14aWNfbmFuZF91bmxvY2soc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZnMsIHVpbnQ2
NF90IGxlbikKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK2ludCBuYW5kX3Bvd2VyX2Rvd25f
b3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiArewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAo
bmFuZF9oYXNfZXhlY19vcChjaGlwKSkgewo+ICsJCXN0cnVjdCBuYW5kX29wX2luc3RyIGluc3Ry
c1tdID0gewo+ICsJCQlOQU5EX09QX0NNRChOQU5EX0NNRF9QT1dFUl9ET1dOLCAwKSwKPiArCQl9
Owo+ICsKPiArCQlzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gb3AgPSBOQU5EX09QRVJBVElPTihjaGlw
LT5jdXJfY3MsIGluc3Rycyk7Cj4gKwo+ICsJCXJldCA9IG5hbmRfZXhlY19vcChjaGlwLCAmb3Ap
Owo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwo+ICsJfSBlbHNlIHsKPiArCQlj
aGlwLT5sZWdhY3kuY21kZnVuYyhjaGlwLCBOQU5EX0NNRF9QT1dFUl9ET1dOLCAtMSwgLTEpOwo+
ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IG14aWNfbmFuZF9z
dXNwZW5kKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICt7Cj4gKwlzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwID0gbXRkX3RvX25hbmQobXRkKTsKPiArCj4gKwltdXRleF9sb2NrKCZjaGlwLT5sb2NrKTsK
PiArCj4gKwluYW5kX3NlbGVjdF90YXJnZXQoY2hpcCwgMCk7Cj4gKwluYW5kX3Bvd2VyX2Rvd25f
b3AoY2hpcCk7Cj4gKwluYW5kX2Rlc2VsZWN0X3RhcmdldChjaGlwKTsKPiArCj4gKwljaGlwLT5z
dXNwZW5kID0gMTsKPiArCW11dGV4X3VubG9jaygmY2hpcC0+bG9jayk7Cj4gKwo+ICsJcmV0dXJu
IDA7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIG14aWNfbmFuZF9yZXN1bWUoc3RydWN0IG10ZF9p
bmZvICptdGQpCj4gK3sKPiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBtdGRfdG9fbmFuZCht
dGQpOwo+ICsKPiArCW11dGV4X2xvY2soJmNoaXAtPmxvY2spOwo+ICsJLy8gdG9nZ2xlICNDUyBw
aW4gdG8gcmVzdW1lIE5BTkQgZGV2aWNlCgpDKysgc3R5bGUgY29tbWVudHMgYXJlIGZvcmJpZGRl
biBpbiBjb2RlLgoKPiArCW5hbmRfc2VsZWN0X3RhcmdldChjaGlwLCAwKTsKCk9uIHNldmVyYWwg
TkFORCBjb250cm9sbGVycyB0aGVyZSBpcyBubyB3YXkgdG8gYWN0IG9uIHRoZSBDUyBsaW5lCndp
dGhvdXQgYWN0dWFsbHkgd3JpdGluZyBieXRlcyB0byB0aGUgTkFORCBjaGlwLiBTbyBiYXNpY2Fs
bHkgdGhpcwppcyB2ZXJ5IGxpa2VseSB0byBub3Qgd29yay4KCj4gKwluZGVsYXkoMjApOwoKSXMg
dGhpcyBkZWxheSBrbm93biBzb21ld2hlcmU/IElzIHRoaXMgcHVyZWx5IGV4cGVyaW1lbnRhbD8K
Cj4gKwluYW5kX2Rlc2VsZWN0X3RhcmdldChjaGlwKTsKPiArCj4gKwlpZiAoY2hpcC0+c3VzcGVu
ZCkKPiArCQljaGlwLT5zdXNwZW5kZWQgPSAwOwo+ICsJZWxzZQo+ICsJCXByX2VycigiJXMgY2Fs
bCBmb3IgYSBjaGlwIHdoaWNoIGlzIG5vdCBpbiBzdXNwZW5kZWQgc3RhdGVcbiIsCj4gKwkJICAg
ICAgIF9fZnVuY19fKTsKPiArCW11dGV4X3VubG9jaygmY2hpcC0+bG9jayk7Cj4gK30KPiArCj4g
IC8qCj4gLSAqIE1hY3Jvbml4IEFDIHNlcmllcyBzdXBwb3J0IHVzaW5nIFNFVC9HRVRfRkVBVFVS
RVMgdG8gY2hhbmdlCj4gKyAqIE1hY3Jvbml4IEFDIGFuZCBBRCBzZXJpZXMgc3VwcG9ydCB1c2lu
ZyBTRVQvR0VUX0ZFQVRVUkVTIHRvIGNoYW5nZQo+ICAgKiBCbG9jayBQcm90ZWN0aW9uIGFuZCBV
bnByb3RlY3Rpb24uCj4gICAqCj4gICAqIE1URCBjYWxsLWJhY2sgZnVuY3Rpb24gcmVwbGFjZW1l
bnQgYnkgbWFudWZhY3R1cmVyIHBvc3Rwb25lZAo+IEBAIC0xNjMsNiArMjI3LDE4IEBAIHN0YXRp
YyB2b2lkIG1hY3Jvbml4X25hbmRfcG9zdF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4g
IAkJfQo+ICAJfQo+ICAKPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG5hbmRfcG93ZXJf
ZG93bik7IGkrKykgewo+ICsJCWlmICghc3RyY21wKG5hbmRfcG93ZXJfZG93bltpXSwgY2hpcC0+
cGFyYW1ldGVycy5tb2RlbCkpIHsKPiArCQkJYmxvY2twcm90ZWN0ZWQgPSAxOwo+ICsJCQlicmVh
azsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJaWYgKGkgPCBBUlJBWV9TSVpFKG5hbmRfcG93ZXJfZG93
bikpIHsKPiArCQltdGQtPl9zdXNwZW5kID0gbXhpY19uYW5kX3N1c3BlbmQ7Cj4gKwkJbXRkLT5f
cmVzdW1lID0gbXhpY19uYW5kX3Jlc3VtZTsKPiArCX0KPiArCj4gIAlpZiAoYmxvY2twcm90ZWN0
ZWQgJiYgY2hpcC0+cGFyYW1ldGVycy5zdXBwb3J0c19zZXRfZ2V0X2ZlYXR1cmVzKSB7Cj4gIAkJ
Yml0bWFwX3NldChjaGlwLT5wYXJhbWV0ZXJzLnNldF9mZWF0dXJlX2xpc3QsCj4gIAkJCSAgIE9O
RklfRkVBVFVSRV9BRERSX01YSUNfUFJPVEVDVElPTiwgMSk7CgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
