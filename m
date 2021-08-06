Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6500EC4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E88860F22
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E88860F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jiOHPXtCL8TVYA3k8rK+sW4a/bSC+E8GSLHDFxZYZ8=; b=WSppB5FiXD1JvX
	rDCQHrbsKXDlLXYWLs7XLrq5Sdi0Ko3L4jFmvOs/TmRH8EjUnlgizLUxuuY56GcTQjpRyZed8xX4N
	eEZqpj96hS1yySh/aRV7J4UYN8VWDjQCupcGR+Z1Npln95m/bAh6wP64aMFjeMyn4dSgrHcak/je+
	FkCCvEe3eIg1wjQBIHUpYA4D0fKO50/ZHxve6u3FBmTlhVx09haMH/f5S7AD/awuRJRN1ZTVXeLY7
	g2Lo2YwuF5+3v94WMYEO5K8Jr6bVDV9m8lq9WyHV6RaeQvTFwgf2ZtrrmMZI9QQxLCw11WmbVI4k0
	8HkDq7igBp+3gWWzFMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC63S-00DPYm-F5; Fri, 06 Aug 2021 20:02:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC63O-00DPVd-JY
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 20:02:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 93C98C0002;
 Fri,  6 Aug 2021 20:02:43 +0000 (UTC)
Date: Fri, 6 Aug 2021 22:02:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: spinand: core: Properly fill the OOB area.
Message-ID: <20210806220242.4b83237d@xps13>
In-Reply-To: <20210617110842.2358461-1-daniel@0x0f.com>
References: <20210617110842.2358461-1-daniel@0x0f.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_130250_831725_87F5D600 
X-CRM114-Status: GOOD (  18.21  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBUaHUs
IDE3IEp1biAyMDIxIDIwOjA4OjQyCiswOTAwOgoKPiBUaGUgY29tbWVudCBpbiBzcGluYW5kX3dy
aXRlX3RvX2NhY2hlX29wKCkgc2F5cyB0aGF0Cj4gc3BpbmFuZF9vbmRpZV9lY2NfcHJlcGFyZV9p
b19yZXEoKSBzaG91bGQgMHhmZiBmaWxsIHRoZSBPT0IKPiBhcmVhIGJ1dCBpdCBkb2Vzbid0Lgo+
IAo+IFRoaXMgY2F1c2VzIHRoZSBPT0IgYXJlYSB0byBnZXQgZmlsbGVkIHdpdGggemVyb3MKPiBh
bmQgYW55dGltZSB0aGUgZmlyc3QgcGFnZSBpbiBhIGJsb2NrIHRoZSBiYWQgYmxvY2sgbWFya2Vy
Cj4gaXMgY2xlYXJlZCBhbmQgaXQgYmVjb21lcyBhIGJhZCBibG9jayBvbiB0aGUgbmV4dCBib290
Lgo+IAo+IFRoaXMgd2FzIG9ic2VydmVkIG9uIExvbmdzeXMgRk9SU0VFIGJyYW5kZWQgcGFydHMg
YW5kCj4gbWlnaHQgYmUgc3BlY2lmaWMgdG8gdGhlc2UgcGFydHMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPgoKVGhpcyBjaGFuZ2UgbG9va3MgZmlu
ZSwgSSdsbCB1c2Ugc3BpbmFuZC0+b29iYnVmIGluc3RlYWQgb2YgZGF0YWJ1ZiArCm9mZnNldCAo
d2lsbCB1cGRhdGUgd2hlbiBhcHBseWluZykuCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+IGluZGV4IDZmMmQzOWY5YmIwNi4uZjFjNzZmYTBlMjIwIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+IEBAIC0yODEsNiArMjgxLDkgQEAgc3RhdGljIGludCBzcGluYW5kX29u
ZGllX2VjY19wcmVwYXJlX2lvX3JlcShzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQsCj4gIAlzdHJ1
Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBuYW5kX3RvX3NwaW5hbmQobmFuZCk7Cj4gIAli
b29sIGVuYWJsZSA9IChyZXEtPm1vZGUgIT0gTVREX09QU19SQVcpOwo+ICAKPiArCW1lbXNldChz
cGluYW5kLT5kYXRhYnVmICsgbmFuZGRldl9wYWdlX3NpemUobmFuZCksCj4gKwkJCTB4ZmYsIG5h
bmRkZXZfcGVyX3BhZ2Vfb29ic2l6ZShuYW5kKSk7Cj4gKwo+ICAJLyogT25seSBlbmFibGUgb3Ig
ZGlzYWJsZSB0aGUgZW5naW5lICovCj4gIAlyZXR1cm4gc3BpbmFuZF9lY2NfZW5hYmxlKHNwaW5h
bmQsIGVuYWJsZSk7Cj4gIH0KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
