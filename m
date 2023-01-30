Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62644C54EED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJ33OU/pR3hykAgXqMAfS0r1JUIlltkdvqhfFHPKED4=; b=JIZLZRCN4YIuk2
	MwqjVfmdf/OOqM7+kFkq5oCKjX0tPLuwLv7XaowGMyeA6dhmM44SWA4fIxb8ORNMBzJg5SQaTF4IC
	WkCXysfXMjdDLP6uz7j4bRgt7Y3qL3nvdHi+4uMizvS2lh3Lf6d7QzePWHV89tPZOidhN6wIdKY/6
	R20npH42giu2xGFmhQS6ukVY92zSEJwE/+4qDk9sxw3UQHir5JzLSBPyRCI0emtxlLdpOuaqy12xa
	mhxTHo3XfGPODFlhvu/zIA+P8GOPHhU4smTYC5dIsF1MD8lwSejEk9pRmOqm8nKarAIDUlrbJVgqp
	ewEEEFTP0W6TMhZ0lH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWrp-004CgF-81; Mon, 30 Jan 2023 16:18:49 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWr7-004Cer-73
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 16:18:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 17DCFE0002;
	Mon, 30 Jan 2023 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675095483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9C9XKsq4G9TEE6ECpYQNVDm/1QdaGmac9+pzUde+QwY=;
	b=k+163fDE42fBgy/O3JA7B4+6qeY8lmOVoZr+zl2HAYhgwoaidDbuGoBmuEWmvXgw3Fqetw
	L84u5iOkIvpcY8T6TSbdvx5E0MquMcBSPjDsXG2NnFNORKci3A87K0m/Go7RGhDTCHT/OU
	X2kJ5vJSNyJt1bsiLin/zvUYPLRSKynmW/1htCu9r9iTOnA5Hdxu1ReP/DZGBGxYuPXuf1
	4hZ96YOhPyXk275Dtiu+BXrLc6dZ7slyG9kn7D/JVX/YfXIa8M0wdFy4UzWk9Pn9WIQGnf
	FIE7XbC1mw9pd5IK3yNIgRI8xBSE0MxKtZsLjcOxbQ6k0jz9CUudxHPsx+c2IA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsl_elbc: Propagate HW ECC settings to HW
Date: Mon, 30 Jan 2023 17:18:00 +0100
Message-Id: <20230130161800.118128-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134111.32559-1-pali@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b56265257d38af5abf43bd5461ca166b401c35a5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_081805_410010_093FA417 
X-CRM114-Status: GOOD (  13.89  )
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

T24gU2F0LCAyMDIzLTAxLTI4IGF0IDEzOjQxOjExIFVUQywgPT91dGYtOD9xP1BhbGlfUm9oPUMz
PUExcj89IHdyb3RlOgo+IEl0IGlzIHBvc3NpYmxlIHRoYXQgY3VycmVudCBjaGlwLT5lY2MuZW5n
aW5lX3R5cGUgdmFsdWUgZG9lcyBub3QgbWF0Y2ggdG8KPiBjb25maWd1cmVkIEhXIHZhbHVlIChp
ZiBIVyBFQ0MgY2hlY2tpbmcgYW5kIGdlbmVyYXRpbmcgaXMgZW5hYmxlZCBvciBub3QpLgo+IAo+
IFRoaXMgY2FuIGhhcHBlbiB3aXRoIG9sZCBVLUJvb3QgYm9vdGxvYWRlciB2ZXJzaW9uIHdoaWNo
IGVpdGhlciBkb2VzIG5vdAo+IGluaXRpYWxpemUgTkFORCAoYW5kIGxldCBpdCBpbiBzb21lIGRl
ZmF1bHQgdW51c2FibGUgc3RhdGUpIG9yIGluaXRpYWxpemUKPiBOQU5EIHdpdGggZGlmZmVyZW50
IHBhcmFtZXRlcnMgdGhhbiB3aGF0IGlzIHNwZWNpZmllZCBpbiBrZXJuZWwgRFRTIGZpbGUuCj4g
Cj4gU28gaWYga2VybmVsIGNob3NlIHRvIHVzZSBzb21lIGNoaXAtPmVjYy5lbmdpbmVfdHlwZSBz
ZXR0aW5ncyAoZS5nLiBmcm9tCj4gRFRTIGZpbGUpIHRoZW4gZG8gbm90IGRlcGVuZCBvbiBib290
bG9hZGVyIEhXIGNvbmZpZ3VyYXRpb24gYW5kIGNvbmZpZ3VyZXMKPiBIVyBFQ0Mgc2V0dGluZ3Mg
YWNjb3JkaW5nIHRvIGNoaXAtPmVjYy5lbmdpbmVfdHlwZSB2YWx1ZS4KPiAKPiBCUl9ERUNDIG11
c3QgYmUgc2V0IHRvIEJSX0RFQ0NfQ0hLX0dFTiB3aGVuIEhXIGlzIGRvaW5nIEVDQyAoYm90aAo+
IGdlbmVyYXRpbmcgYW5kIGNoZWNraW5nKSwgb3IgdG8gQlJfREVDQ19PRkYgd2hlbiBIVyBpcyBu
b3QgZG9pbmcgRUNDLgo+IAo+IFRoaXMgY2hhbmdlIGZpeGVzIHVzYWdlIG9mIFNXIEVDQyBzdXBw
b3J0IGluIGNhc2UgYm9vdGxvYWRlciBleHBsaWNpdGx5Cj4gZW5hYmxlZCBIVyBFQ0Mgc3VwcG9y
dCBhbmQga2VybmVsIERUUyBmaWxlIGhhcyBzcGVjaWZpZWQgdG8gdXNlIFNXIEVDQy4KPiAoT2Yg
Y291cnNlIHRoaXMgd29ya3Mgb25seSBpbiBjYXNlIHdoZW4gTkFORCBpcyBub3QgYSBib290IGRl
dmljZSBhbmQgYm90aAo+IGJvb3Rsb2FkZXIgYW5kIGtlcm5lbCBhcmUgbG9hZGVkIGZyb20gZGlm
ZmVyZW50IGxvY2F0aW9uLCBlLmcuIEZMQVNIIE5PUi4pCj4gCj4gRml4ZXM6IGY2NDI0YzIyYWEz
NiAoIm10ZDogcmF3bmFuZDogZnNsX2VsYmM6IE1ha2UgU1cgRUNDIHdvcmsiKQo+IFNpZ25lZC1v
ZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFu
ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
