Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BFFC61DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOc5skcj2T5x/ulFap4GaY90Qn3WBD9/yW1Rx938YLU=; b=coQrw5Dpy2FjJ3
	KZxSKd3YCmV6QV8iRN1iQOsTtKBh4TVlBwSJklyoxNmbdcVZAHmW340IEQy4DVNNz0axW2NowCU0L
	U80IIumrC6kxZISLaaTKs/cYXIXNkeT1Mqx2mNQuoSkmq+ur4NzsO4aLeCz3MRAozYv2StKoVgeB+
	oQk7omna6v+z5Ec7QQ0FXXb+tM/dnPc1NYZPsC7F8W3wv2CYFeI3qJPJUGVGqfzZ8lHpysqOASqRC
	fefKWTLUQIrCMNXmfaoNxIIC9+rlNnXQ6YgkIxKgCgIfmjr8OoATAHGlNkAeIfd7X8h7e7bBT8Fsr
	Ajff/4VxB+kW1+1+bLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x116N-00000009ILh-1RFq;
	Mon, 31 Aug 2026 12:27:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x116L-00000009IKZ-0EpW
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 12:27:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 975071A191E;
	Mon, 31 Aug 2026 12:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6913B60231;
	Mon, 31 Aug 2026 12:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A49C611C789BE;
	Mon, 31 Aug 2026 14:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788179218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BcAjF3TL+Ihb7EDrDh9V9JHpSYGBIqXKmJXpIHhW6Io=;
	b=eFdeS4u5Qpv2+IhaM3NQwDzKCfDcPJgJuCHBMMLv6fen2KWdTSxzcj6FIjp/DcPTx1zcxN
	t0vM9zW5Sjp2SoZaat0OBKpNHrjKEpfCZWDGqxA54hlj6fbTuMsNf9SH68Cj/xdH6893T4
	VQuOZ1Wu7Xooh4jtGyce2kwOhZb1IRwV/yGo1IdW7EQxB3J5S5R5G0IFlmhGzVO3LMGpI8
	DTnkQ1Ou9iJe/z/mSADPOzC0uc0rRMULdCkqWCwmDkQbWFYNJsEpO9in1/CyskFvGz4CVB
	DjAXBW153j13HbJ91kY0zA9TUKyvkbouk3bUEu4U1RQQffVisTdgYnvM74XOgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with
 more than 64 bytes of OOB
In-Reply-To: <20260831114000.1844796-2-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Mon, 31 Aug 2026 13:39:59 +0200")
References: <20260828085337.3916199-2-mehmet.fide@gmail.com>
	<87v78qbtqz.fsf@bootlin.com>
	<20260831114000.1844796-2-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 14:26:56 +0200
Message-ID: <87se3ua31r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_052701_238401_ABAF5E87 
X-CRM114-Status: GOOD (  18.86  )
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

T24gMzEvMDgvMjAyNiBhdCAxMzozOTo1OSArMDIsIE1laG1ldCBGaWRlIDxtZWhtZXQuZmlkZUBn
bWFpbC5jb20+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiB0aGFua3MgZm9yIHRoZSByZXZpZXcu
Cj4KPj4gU2luY2UgaXQgaXMgYSB0b3RhbCByZXdyaXRlIG9mIHRoZSBmb3JtZXIgYXBwcm9hY2gs
IHRoaXMgaXMgcHJvYmFibHkgYQo+PiBnb29kIGNhbmRpZGF0ZSBmb3IgYSBTdWdnZXN0ZWQtYnku
Cj4KPiBPZiBjb3Vyc2UsIEkgd2lsbCBhZGQgeW91ciBTdWdnZXN0ZWQtYnkgaW4gdjMuCj4KPj4g
PiArLyogVGhlIGNvbnRyb2xsZXIgdHJhbnNmZXJzIDY0IHNwYXJlIGJ5dGVzOyBsYXJnZXIgT09C
cyBrZWVwIHVzaW5nCj4+ID4gdGhlIGZpcnN0IDY0ICovCj4+Cj4+IElzIGl0IGEgcmVhbCBjb250
cm9sbGVyIGNvbnN0cmFpbnQ/IE9yIGlzIHRoaXMgYSBjb21wYXRpYmlsaXR5IGZpeCBvbmx5Pwo+
PiBJZiB0aGlzIGlzIGEgcmVhbCBjb25zdHJhaW50LCB5b3UgY2FuIGtlZXAgdGhlIGNvbW1lbnQs
IG90aGVyd2lzZSBJCj4+IHdvdWxkIGRyb3AgaXQuCj4KPiBDb21wYXRpYmlsaXR5IG9ubHksIHNv
IEkgd2lsbCBkcm9wIGl0LiBUaGUgU1JBTSByb3cgYnVmZmVyIHRha2VzIHVwIHRvCj4gMjQ4IHNw
YXJlIGJ5dGVzIGFuZCB0aGUgRUNDIGVuZ2luZSBjb21wdXRlcyBwYXJpdHkgZm9yIHdoYXRldmVy
IGxlbmd0aAo+IGlzIHRyYW5zZmVycmVkIC0gdGhhdCBpcyBleGFjdGx5IGhvdyB0aGUgYnVnIGJp
dGVzLCB0aGUgcGFyaXR5IG1vdmVzCj4gd2l0aCB0aGUgdHJhbnNmZXIgc2l6ZS4gVGhlIDY0IGlz
IHRoZSBvbi1mbGFzaCBmb3JtYXQgdGhhdCBVLUJvb3Qncwo+IGNvcHkgb2YgdGhpcyBkcml2ZXIg
YW5kIHRoZSBrZXJuZWxzIGJlZm9yZSBhN2FiMDg1ZDdjMTYgd3JvdGUsIGFuZCB0aGUKPiBleHBs
YW5hdGlvbiBiZWxvbmdzIGF0IHRoZSBvb2JsYXlvdXQsIHdoaWNoIGJyaW5ncyB1cyB0byB5b3Vy
IGxhc3QKPiBwb2ludC4KPgo+PiBObyBleHBsaWNpdCBpbmxpbmUgcGxlYXNlLgo+Cj4gRHJvcHBl
ZC4KPgo+PiBQbGVhc2UgbW9kaWZ5IHRoaXMgY29tbWVudCB0byBleHByZXNzIHdoeSB3ZSB1c2Ug
b3VyIG93biBsYXlvdXQgaGVyZS4KPgo+IFdpbGwgZG8uIFNvbWV0aGluZyBhbG9uZyB0aGUgbGlu
ZXMgb2Y6IHRoZSBjb3JlJ3MgbGFyZ2UgcGFnZSBsYXlvdXQsCj4gY29tcHV0ZWQgb3ZlciB0aGUg
Zmlyc3QgNjQgc3BhcmUgYnl0ZXMgaW5zdGVhZCBvZiB0aGUgd2hvbGUgT09CLCBzbyB0aGUKPiBF
Q0MgYnl0ZXMgc3RheSBhdCB0aGUgb2Zmc2V0cyB0aGUgZXN0YWJsaXNoZWQgb24tZmxhc2ggZm9y
bWF0IHVzZXMsCj4gd2hpbGUgbXRkLT5vb2JzaXplIGtlZXBzIHJlcG9ydGluZyB0aGUgY2hpcCdz
IHJlYWwgc3BhcmUgc2l6ZS4KCkkgd291bGQgaW5zdGVhZCB0YWxrIGFib3V0IHRoZSBmYWN0IHRo
YXQgd2l0aCA2NEIgT09CIGNoaXBzLCB0aGUgY29yZSdzCmxhcmdlIHBhZ2UgbGF5b3V0IHdhcyBt
YXRjaGluZyBVLUJvb3QsIGJ1dCBVLUJvb3QgYW5kIG9sZGVyIGtlcm5lbCB3aGVyZQpjbGFtcGlu
ZyB0aGUgT09CIHNpemUgdG8gNjQgaWYgdGhhdCBzaXplIHdhcyBiaWdnZXIuIE1vZGlmeWluZyB0
aGUgT09CCnNpemUgaXMgbm8gbG9uZ2VyIHBvc3NpYmxlICh3ZSBtdXN0IHJlc3BlY3QgdGhlIGFj
dHVhbCBjaGlwIGdlb21ldHJ5KQpidXQgdG8gYXZvaWQgYnJlYWtpbmcgZXhpc3Rpbmcgc2V0dXBz
LCB3ZSBuZWVkIG91ciBvd24gbGF5b3V0IHdoaWNoCm9ubHkgZXhwb3NlcyA2NCBieXRlcy4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
