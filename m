Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6236C27C7A
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXnEQN5HcD0ce2cTKXdpfnT0dW59Qyn6Z+W+QGU7uqQ=; b=wrDyjL6XkmFFoC
	uMYdmjCtU/4wl+XnAa5QSfY+aK4n1425V3i3XcJl52i9bQn4kPV5Ugs0pJ8pX1Pt/l013eDwotE/x
	Pj2SSqt0D52Kjd6PWe6FvpiMVsg5uDsrPIsLY7kUpkahmUngR5a1g4YQ6Luwk0qurQbmMgE+cVzF4
	T7D/2aJ4D0r3NNMGHWP4sxb+lnCksCuEKCcgyEcgzTXtykhmSVa2x7ustJqdC6KeNjRVhy0f/HNv4
	IF+79iR8S/tt6Ei0FWn6jCrkU9vfLKBrrko9KN+myomqWGgVJ3JiJW8S1Yan+IYJIC+y7VNgyW7WR
	7CIAqmijggwic4nGB2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXpX-005lX5-2i;
	Thu, 17 Aug 2023 07:54:07 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXpV-005lWU-08
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 07:54:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 364C920002;
	Thu, 17 Aug 2023 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692258836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9kGc2RBhJekPhE/ZBHeqd32/8mqgllFPcSU0IIs0Fk=;
	b=Yh09kVWnWuZjri18++nuXRkaOqk7DFLkpWQCoa7qYIGIjbpgKtn1y16DPiOaMeRKVsPtpw
	/mkar4X5B6MmQXVlvLp1j23dYyxxRvQUxedEMN0GIXCIJ8RdPaz8kkM1a2k1sDrOxZnpCS
	4ohDk32g9y+KtLbv+Xj5W/Ew6ibG3DEZjEYvEF0bIjl2WZj9pfwQ6mwni4jVHq3Y6oQIZ7
	xu4KO/dQi+urjpXULhsU4hOThSBJYohYmPmAGgmrj+yelimnHUxUucoNIQjcdcpBjbU9oX
	JBRS/Jx01GiojJnGYlkyQn7ETH3f5RrJ+2jaiZkcMPCyR6YqBEym+SItuyrshw==
Date: Thu, 17 Aug 2023 09:53:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Martin Kurbanov <mmkurbanov@sberdevices.ru>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@sberdevices.ru
Subject: Re: [PATCH v1] mtd: spinand: micron: correct parameters
Message-ID: <20230817095354.3df2f7f9@xps-13>
In-Reply-To: <53a4fe26-3a6a-47ce-8532-be60da674aca@kontron.de>
References: <20230815161024.810729-1-mmkurbanov@sberdevices.ru>
	<0f54b3dd-1fce-4f81-8652-d50fe1bb3873@kontron.de>
	<b619ef58-06c3-c61a-bb0f-ba243a4a2ade@sberdevices.ru>
	<53a4fe26-3a6a-47ce-8532-be60da674aca@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_005405_377846_DF706E43 
X-CRM114-Status: GOOD (  29.31  )
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

SGkgRnJpZWRlciwKCmZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZSB3cm90ZSBvbiBXZWQsIDE2
IEF1ZyAyMDIzIDE3OjM1OjU2ICswMjAwOgoKPiBPbiAxNi4wOC4yMyAxNzoyOCwgTWFydGluIEt1
cmJhbm92IHdyb3RlOgo+ID4gSGkgRnJpZWRlci4KPiA+IAo+ID4gT24gMTYuMDguMjAyMyAxMDoy
MSwgRnJpZWRlciBTY2hyZW1wZiB3cm90ZTogIAo+ID4+IEknbSBva2F5IHdpdGggMS4gYW5kIHdp
dGggYWRqdXN0aW5nIHJlZ2lvbi0+b2Zmc2V0IHRvIDQuIEJ1dCBJIGRvbid0Cj4gPj4gcmVhbGx5
IGdldCB3aHkgd2Ugd2FudCB0byByZXN0cmljdCB0aGUgZnJlZSBvb2IgZGF0YSB0byB0aGUKPiA+
PiBub24tRUNDLXByb3RlY3RlZCBhcmVhIG9ubHkuIElzIHRoaXMgc3BlY2lmaWMgdG8gTWljcm9u
PyBPdGhlciBTUEkgTkFORAo+ID4+IGRyaXZlcnMgYWxzbyBzcHJlYWQgdGhlIGZyZWUgYXJlYSBv
dmVyIGJvdGgsIHRoZSBFQ0MtcHJvdGVjdGVkIGFuZCB0aGUKPiA+PiBub24tcHJvdGVjdGVkIGJ5
dGVzLiBXaHkgZG8gaXQgZGlmZmVyZW50bHkgaGVyZT8gIAo+ID4gCj4gPiBXZSBlbmNvdW50ZXJl
ZCBhIHByb2JsZW0gd2l0aCB0aGUgSkZGUzIgZmlsZSBzeXN0ZW06IEpGRlMyIG1hcmtzIGVyYXNl
ZAo+ID4gYmxvY2tzIHdpdGggYSBtYXJrZXIgdG8gYXZvaWQgcmUtZXJhc2luZyB0aGVtLiBUbyBk
byB0aGlzLCBpdCB3cml0ZXMKPiA+IGEgc3BlY2lhbCBtYXJrZXIgKGNsZWFubWFya2VyKSBpbiB0
aGUgZnJlZSBPT0IgYXJlYS4gQW5kIGlmIHRoaXMgT09CCj4gPiBhcmVhIGlzIHByb3RlY3RlZCBi
eSBFQ0MsIHRoZSBFQ0Mgd2lsbCBiZSB3cml0dGVuLiBIb3dldmVyLCBkdXJpbmcKPiA+IHRoZSBu
ZXh0IHdyaXRlIHRvIHRoZSBtYWluIGFyZWEgb2YgdGhlIHNhbWUgYmxvY2ssIHRoZSBFQ0Mgd2ls
bCBiZQo+ID4gaW5jb3JyZWN0IGJlY2F1c2UgaXQncyBuZWNlc3NhcnkgdG8gcHJvZ3JhbSBib3Ro
IHRoZSBtYWluIGFyZWEgYW5kCj4gPiB0aGUgT09CIGFyZWEgYXQgb25lIHByb2dyYW1taW5nIHRp
bWUsIHNvIHRoYXQgdGhlIEVDQyBwYXJpdHkgY29kZSBjYW4KPiA+IGJlIGNhbGN1bGF0ZWQgcHJv
cGVybHkuIE90aGVyIFNQSSBOQU5EIGZsYXNoIGFsc28gc3VzY2VwdGlibGUgdG8KPiA+IHRoaXMg
cHJvYmxlbS4gIAo+IAo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBBcyB0aGlzIGlzIGEg
Z2VuZXJpYyBpc3N1ZSwgd2UgbmVlZCB0byBmaXgKPiBpdCBpbiB0aGUgY29yZSBhbmQgbm90IGlu
IHRoZSBNaWNyb24gZHJpdmVyLgoKSXQncyBub3QgdGhlIGZpcnN0IHRpbWUgd2UgZmFjZSB0aGlz
IGlzc3VlIGFuZCB0aGUgZmlyc3QgYXBwcm9hY2ggd2UKdXNlZCB3YXMgdG8gImZpeCIgdGhlIE9P
QiBsYXlvdXQgdG8gaW5jbHVkZSBhbGwgZnJlZSBieXRlcyAobm90IG9ubHkKcHJvdGVjdGVkIGJ5
dGVzKSwgd2hpY2ggaGFkIHRoZSBuaWNlIHNpZGUtZWZmZWN0IG9mIGFsbG93aW5nIHRvIHdyaXRl
CnRoZSBjbGVhbm1hcmtlciBpbiBhbiBFQ0MtZnJlZSBhcmVhIGFuZCBhbGxvdyB0aGF0IGNoaXAg
dG8gYmUgdXNlZCB3aXRoCkpGRlMyLiBUaGlzIGlzIGluZGVlZCBub3QgYSBwcm9wZXIgc29sdXRp
b24gYW5kIEkgYWdyZWUgd2Ugc2hvdWxkIGhhdmUKYSBzeXN0ZW0td2lkZSBzb2x1dGlvbi4KCj4g
QWxzbyBJIHdvbmRlciBpZiBKRkZTMiBzaG91bGQgaW5zdGVhZCB3cml0ZSB0aGUgY2xlYW5tYXJr
ZXIgd2l0aCBFQ0MKPiBiZWluZyB0dXJuZWQgb2YgZXhwbGljaXRseS4KClRoZSByZWFsIHF1ZXN0
aW9uIGlzLCB3aHkgd291bGQgeW91IHN0aWxsIHdhbnQgdG8gdXNlIEpGRlMyIG9uClNQSS1OQU5E
PyBVQkkgaXMgbWVhbnQgZm9yIHRoYXQuIEpGRlMyIHdhcyBkZXNpZ25lZCB3aXRoIE5PUnMgaW4g
bWluZCwKaXQgY2FuIGJlIHVzZWQgb24gc21hbGwgTkFORCBjaGlwcyBiZWNhdXNlIFVCSSBpcyBh
IGJpdCBnbHV0dG9uIHdydCwKYnV0IEkgZG91YnQgd2Ugc3RpbGwgaGF2ZSAic21hbGwiIFNQSS1O
QU5EcyBvbiB0aGUgbWFya2V0IHdoaWNoIHJlcXVpcmUKSkZGUzIgYW55bW9yZS4gRG8gd2U/CgpB
bnlob3csIGlmIHBlb3BsZSB3YW50IEpGRlMyIG9uIE5BTkRzLCBJIGFncmVlIHdlIHNob3VsZCBt
YXliZSBjaGFuZ2UKaG93IEpGRlMyIHdvcmtzIGFuZCBmb3JjZSByYXcgYWNjZXNzZXMgd2hlbiBp
dCBjb21lcyB0byB3cml0aW5nIHRoZQpjbGVhbm1hcmtlciwgYmVjYXVzZSB0aGVyZSBpcyBubyBr
bm93bGVkZ2Ugb2Ygd2hhdCBpcyBFQ0MgcHJvdGVjdGVkIG9yCm5vdCBpbiB0aGUgY3VycmVudCBP
T0IgbGF5b3V0cy4gSSBob3dldmVyIGhhdmUgbm8gaWRlYSBvZiB0aGUgcG9zc2libGUKc2lkZS1l
ZmZlY3RzLCBJJ3ZlIG5ldmVyIGxvb2tlZCBpbnRvIEpGRlMyIHNvIGRlZXBseS4KCj4gSSBkb24n
dCBrbm93IGVub3VnaCBhYm91dCBOQU5EIGFuZCBKRkZTMiB0byBwb2ludCBvdXQgYSBjb3JyZWN0
IGZpeCwgYnV0Cj4gSSBob3BlIE1pcXVlbCBhbmQgUmljaGFyZCBoYXZlIHNvbWUgaWRlYXMuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
