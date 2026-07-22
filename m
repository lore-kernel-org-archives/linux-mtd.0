Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED43C44539
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HqRcsJyHqj7z1Zp7jmVIlwDvq8I/YjNSqkvdyLlnl8=; b=xYVKg5AfN7bCk5
	8vwQR/ULjYeGm5HZKG+piXOE3R9DOBqELjNhmJkksTJjCnFQxa14PNUrxVTthPKIyssLr06rB8shg
	k5kNYFZKqpXqtLj4e1tH2mYPJjxAFRI8sAnhHr/9NubwujvP/Tak+INExmJSJxqZv1A1IpU4/PLT3
	AIop42JpTyDhnLkVz8IgUA3aLKhg7bx/iCyyJrVskBTAriX3CRX6a8ijFBKqU7DUMv7VuTTd2qWQz
	GqsCL+MphCmpB16FFKrEH/rIlTcSyUJvPk/a/qDpa9PmqIlq4GKIQUx032dGm2OGDckdjQYisIjt1
	PxgUZ0G19IAEtkiUA1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWVD-0000000BoP8-1THR;
	Wed, 22 Jul 2026 12:56:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWVA-0000000BoO8-3qRL
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 12:56:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 81AF81A1159;
	Wed, 22 Jul 2026 12:56:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 562CB60388;
	Wed, 22 Jul 2026 12:56:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AEB011BD3B59;
	Wed, 22 Jul 2026 14:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725001; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ulq1BAsh4vcS9IgVnh9uk0btSVio2++zWwkHAVFyhNQ=;
	b=KVUh2rsYXVJ8RUy/2o0vSko+utGIJMbHMA+3jEzihmJfOLzkPJ4xhYkTxKYvzGFwi1l3+6
	SP6Ig+fTDRp7VLGaZW28qDnUjblhF0Srz5Dw5YN1LkbE6raNJNOI5TqD+UqjgGvlP0AZWP
	AZkBJx2oIr2fPJfFgR+sRQrhJVTFzEutajERjHBDtXdGhNJgwiyE3WqPGn1Ybomke4xK4p
	+prFsZ1qYEQX6/KYGjpgFxgrIPSO19qja5oDRBBqJieN++OqSgvL67ieC8/I8iwD7sdN0Y
	ld1B9e+0c9Rr3F+BUv8marqOhQvwPENoPyXzCSNLLw3Z5hIlVz3qsXS6hFWFyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name entry
In-Reply-To: <DJRJJB4NEUEP.168MF88DBSFDF@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 15:59:53 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com>
	<DJRJJB4NEUEP.168MF88DBSFDF@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 14:56:39 +0200
Message-ID: <8733xbji7s.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_055645_097868_0604FDDA 
X-CRM114-Status: GOOD (  11.86  )
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

T24gMDYvMDcvMjAyNiBhdCAxNTo1OTo1MyArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmkgTWF5IDI5LCAyMDI2IGF0IDU6MjIgUE0gQ0VTVCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4gVGhpcyBpcyBhIGxlZ2FjeSBmaWVsZCwgaXQgaXMgb2Z0
ZW4gaW5jb3JyZWN0bHkgZmlsbGVkIGFuZCB3aWxsIHNvb24KPj4gYmVjb21lIHZlcnkgaW5jb3Jy
ZWN0IGR1ZSB0byBJRHMgYmVpbmcgcmV1c2VkLgo+Cj4gQW5kIEkgdGhvdWdodCB3aW5ib25kIGlz
IGRvaW5nIGJldHRlci4uLiBTbyBpZiB5b3UgaGF2ZSBhIGNvbnRhY3QKPiB0aGVyZSwgcGxlYXNl
IHN1Z2dlc3QgdGhleSBhcmUgcHV0dGluZyBhIHRhYmxlIHdpdGggYSB1bmlxdWUKPiBpZGVudGlm
aWVyIHBlciBjaGlwIHRoZXJlLiBTbyB3ZSBjYW4gdXNlIHRoYXQgdG8gZG8gZml4dXBzLgoKWWVz
LCB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IGhhcyBiZWVuIHJhaXNlZCwgSSBjYW4gY29uZmlybS4g
V2UgZm91bmQgYQp3YXkgdGhyb3VnaCB0aGUgU0ZEUCBkYXRhIHRvIHJlbGlhYmx5IGlkZW50aWZ5
IHdoaWNoIGNoaXAgaXQgaXMgc2luY2UKdGhlIFNGRFAgdmVyc2lvbiBoYXMgYmVlbiByZWxpYWJs
eSB1cGRhdGVkIG92ZXIgdGltZSAoc2VlIHRoZSBSViBhbmQgUFcKYWRkaXRpb24gcGF0Y2hlcyku
Cgo+PiBSZXBsYWNlIHRoZSBuYW1lcyB3aXRoIGEgY29tbWVudCBhYm92ZSB0aGUgZW50cnkgd2l0
aCB0aGUgbmV3bHkgaW5zdGF0ZWQKPj4gbmFtaW5nIHNjaGVtZSB0byBpbmRpY2F0ZSB3aGF0IGNo
aXBzIGFyZSBjb3ZlcmVkIGJ5IGVhY2ggZW50cnkuCj4KPiBUaGlzIGlzIGV4cG9ydGVkIHZpYSBz
eXNmcywgc28gdGhpcyBjb3VsZCBiZSBhIHJlZ3Jlc3Npb24uCj4KPiBOb3Qgc3VyZS4uCgpZZXMs
IGJ1dCB0aGUgbmFtZXMgYXJlIHRvdGFsbHkgd3JvbmcuIEFuZCBiZWNvbWUgZXZlbiB3cm9uZ2Vy
IHdpdGggdGhlCmFkZGl0aW9uIG9mIHRoZSBSViwgUFcsIGV0YyBmYW1pbGllcy4gSSB3YXMgYWxy
ZWFkeSBhc2tlZCB0byBub3QgcHV0IGEKbmFtZSBvbiB0aGUgbmV3IGFkZGl0aW9ucywgSSBiZWxp
ZXZlIHdlIHNob3VsZCBkcm9wIHRob3NlIGZpZWxkcywgdGhleQphcmUgdmVyeSBtaXNsZWFkaW5n
LiBTbyB3aGF0IGlzIHlvdXIgZmluYWwgcG9zaXRpb24/IFByYXR5dXNoIGFueQpmZWVkYmFjaz8g
SSBjYW4ga2VlcCB0aGUgb2xkIG5hbWVzLCBidXQsIHdlbGwsIHlvdSBrbm93IG15IHBvc2l0aW9u
LAp0aGV5IGFyZSB3cm9uZyBhbmQgb2xkLgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgYnkgdGhl
IHdheSEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
