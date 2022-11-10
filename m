Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C8C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTwU8cjiJb3MCiGclMIbDS0h6wRKdqXLJKtfLs6OOK8=; b=LrQ4+huJlXjxru
	sIs8xUOMg01pLCEdDmrFDugwsgDw3TdttXNnK18EFtqB0Wk5Bla4lCjrI8ty39+Unn8ZJTqIyRvgT
	g1gST0zQD2DvhbvFKutCM/84FY3kFRPlM9KRSi3RiY8VgVCDdXE5Dwjb0SVkK+oGbvq9Os2ap/Bkz
	ph+dUgqsUTk3GJRNQXq94BHWy1pCc1Ew5SxElqvWUry5cEdPh3y3C1boo/UIm7f1Py2xttK2oS2cV
	xXwEBePnjhW0thXZtUXc7/kImVOLUTytPuHuUp9q+jZqc3aVThLf/PofRREdcNQaLmt3JKly01eOH
	6IROuF+cWH3sbPOZf6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otBMI-007erx-VB; Thu, 10 Nov 2022 17:28:59 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otBMF-007elo-BM
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 17:28:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7597960004;
	Thu, 10 Nov 2022 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668101331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=14K4vkigpc+r6ifepskjAS5nboNCAI5rkQqWrxZ4Kk4=;
	b=Nch2Lks2ASc+gcIGppOjqGRMldcSbvpuknlEY5fSStadYxm83tItBCL7GZd5OhSmPthfBI
	9kOsD73/MAttirUbNSLg1CnPnINrWyF350weJQrjSRuHBGhy5a99LKRoMJF3ia2bLbI8L5
	qcPShugX1vcYVz5l5LkTilgkNvZSnYGTjJJ8rOB0Kij/6dtlM/LGURVi2Y6hPvIlqbSsAJ
	euFWoMT4ywWmPO2VY+yGzUNO59I/OpHp3ehrcm7JjxJwSbCl76uPspXNkcrYmCZzvGq9rV
	C/zbmU349Z+6vcXWt0/9FetXgSHRG/ukAafFTKFNSNbbjha3XKBjuunQyn/Xqg==
Date: Thu, 10 Nov 2022 18:28:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/17] dt-bindings: mtd: nvmem-cells: Fix example
Message-ID: <20221110182848.492e4a6f@xps-13>
In-Reply-To: <20221110165906.GA241353-robh@kernel.org>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
	<20221104164718.1290859-14-miquel.raynal@bootlin.com>
	<20221110165906.GA241353-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_092855_741629_C7B1018E 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFRodSwgMTAgTm92IDIwMjIgMTA6NTk6
MDYgLTA2MDA6Cgo+IE9uIEZyaSwgTm92IDA0LCAyMDIyIGF0IDA1OjQ3OjE0UE0gKzAxMDAsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBUaGVyZSBpcyBubyBzdWNoIHRoaW5nIGFzIGEgInJhbmdl
cyIgcHJvcGVydHkgd2l0aGluIGFuIG52bWVtLWNlbGxzCj4gPiBub2RlLiBUaGVyZSBpcyBubyB1
c2Ugb2YgaXQsIGl0IGlzIGFueXdheSBub3QgcGljdHVyZWQgYW55d2hlcmUgdGhhdAo+ID4gdGhp
cyBpcyB2YWxpZCwgc28gZHJvcCBpdCBmcm9tIHRoZSBleGFtcGxlLiAgCj4gCj4gRm9yIGEgbWVt
b3J5IG1hcHBlZCBkZXZpY2Ugc3VjaCBhcyBwYXJhbGxlbCBOT1IgZmxhc2guIEl0IHdvdWxkIGJl
IAo+IHBlcmZlY3RseSBmaW5lIHRvIHRyYW5zbGF0ZSBhIG52bWVtIGNlbGwgJ3JlZycgYWRkcmVz
cyB0byBhIENQVSBhZGRyZXNzLiAKPiBJZiB0aGUgcGFydGl0aW9ucyBhcmUgbm90IG1lbW9yeSBt
YXBwZWQsIHRoZW4gaXQncyBhIGdyYXkgYXJlYS4gV2hldGhlciAKPiBpdCBtYWtlcyBzZW5zZSB0
byB0cmFuc2xhdGUganVzdCB0byBqdXN0IHRoZSBhYnNvbHV0ZSBvZmZzZXQgb2YgdGhlIAo+IGZs
YXNoIGRldmljZSwgbWF5YmUgb3IgbWF5YmUgbm90LiBBdCBhIG1pbmltdW0sICdyYW5nZXMnIGp1
c3QgbWVhbnMgCj4gY2FuIHRyYW5zbGF0ZSB0byB0aGUgcGFyZW50IGFkZHJlc3Mgc3BhY2UuIFRo
ZSBMaW51eCBEVCB0cmFuc2xhdGUgY29kZSAKPiBvbmx5IHN1cHBvcnRzIHRoZSBmdWxsIHRyYW5z
bGF0aW9uIHRvIENQVSBhZGRyZXNzZXMsIGJ1dCB0aGVuIGl0IG1haW5seSAKPiBqdXN0IHN1cHBv
cnRzIGNyZWF0aW5nIHJlc291cmNlcy4KCkFoIG9rLCBJIG1pc3NlZCB0aGlzIHBvc3NpYmlsaXR5
IGluZGVlZCwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCgpTbyBJIGFncmVlIHRoZSBjb21t
aXQgbG9nIGlzIHdyb25nLCBidXQgSSBndWVzcyB0aGUgY2hhbmdlIGl0c2VsZgppcyBmaW5lIGJl
Y2F1c2UgdGhlIHByb3BlcnR5IHNob3VsZCBiZSBkZWNsYXJlZC9hdXRob3JpemVkIGluIHRoZQpz
Y2hlbWEuIFNvIGhlcmUgd2UgaGF2ZSB0d28gb3B0aW9uczoKMS0gRG9jdW1lbnQgdGhlIHByb3Bl
cnR5CjItIERyb3AgdGhlIHByb3BlcnR5IGZyb20gdGhlIGV4YW1wbGUKCkFzIHdlIGN1cnJlbnRs
eSBoYXZlIG5vIHVzZXIgdXBzdHJlYW0gb2YgdGhpcyBwcm9wZXJ0eSBJIHdvdWxkIGFyZ3VlIHdl
CmNhbiBrZWVwIGRyb3BwaW5nICdyYW5nZXMnIGZyb20gdGhlIGV4YW1wbGUsIGtub3dpbmcgb2Yg
Y291cnNlIHRoYXQKc29tZW9uZSBtaWdodCBjb21lIHVwIHNvbWUgZGF5IGFuZCBkb2N1bWVudCBp
dCBwcm9wZXJseSBpZiBpdCBpcwpuZWVkZWQuIEluIHRoaXMgY2FzZSBJIHdvdWxkIHVwZGF0ZSB0
aGUgY29tbWl0IG1lc3NhZ2UgdG86CgoJZHQtYmluZGluZ3M6IG10ZDogbnZtZW0tY2VsbHM6IERy
b3AgcmFuZ2UgcHJvcGVydHkgZnJvbSBleGFtcGxlCgoJTWVtb3J5IG1hcHBlZCBkZXZpY2VzIHN1
Y2ggYXMgcGFyYWxsZWwgTk9SIGZsYXNoIGNvdWxkIG1ha2UgdXNlCglvZiB0aGUgJ3Jhbmdlcycg
cHJvcGVydHkgdG8gdHJhbnNsYXRlIGEgbnZtZW0gJ3JlZycgY2VsbAoJYWRkcmVzcyB0byBhIENQ
VSBhZGRyZXNzIGJ1dCBpbiBwcmFjdGljZSB0aGVyZSBpcyBubyB1cHN0cmVhbQoJdXNlciBub3Ig
YW55IGRlY2xhcmF0aW9uIG9mIHRoaXMgcHJvcGVydHkgYmVpbmcgdmFsaWQgaW4gdGhpcwoJY2Fz
ZS4KCglJbiBvcmRlciB0byBhdm9pZCB3YXJuaW5ncyB3aGVuIGNvbnN0cmFpbmluZyBhIGJpdCBt
b3JlIHRoZQoJc2NoZW1hLCBsZXQncyBkcm9wIHRoZSBwcm9wZXJ0eSBmcm9tIHRoZSBleGFtcGxl
LCBrbm93aW5nIHRoYXQKCXNvbWVvbmUgbWlnaHQgYWN0dWFsbHkgcHJvcGVybHkgZGVmaW5lIGl0
IHNvbWUgZGF5LgoKV291bGQgeW91IGFncmVlIHdpdGggdGhpcyBjaGFuZ2U/CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
