Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49775C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 12:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD042067D
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 12:20:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GoWHGDeC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="Aln5j9ss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FD042067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=apncq4+qQRIG2nYo6KiBz4DhwFIK4LlNZ7XABJBG0RA=; b=GoWHGDeCXczka7QMyCdmBfTAq
	84Rs5YRfCDjfmQjskSt7UQGCn37sgOTQUIeynH2EnbQOlHMKg0bXxbTysqAy+cX9PMqICEZqACJab
	gn6xTKkzczyuXKq1jjDof0QLG1r+4pAK+r4yDySoS//WJH9roPhvCSYHtjGbqFgVyQzb08gl4LxGZ
	hW0uLwFmUW5PEEF01nikuhzqFMZm0VJfu3V1ko3uLOsFqgfajwQjc1QRkb2yjDZi/uFUR9xwSg1uR
	k9iJmCYhviCtlWN3rO6CJAk/YY6R7BgBdpGAeXMgakhOUheYBf85c6mtZTEUAxPq8xl/bYbFSB95W
	eMkOaXJaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jael9-000190-WE; Mon, 18 May 2020 12:20:44 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jael6-00018M-Vz
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 12:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2878; q=dns/txt; s=axis-central1;
 t=1589804441; x=1621340441;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hsjoZSGVBBSQ6dxES8PLVMw2/DZUi6rnX9M2z6t7koU=;
 b=Aln5j9ssGHYCdUx9LESCD6d2Sco9YHKmQ4CWd8ly6zDa7T86PNmLb2d4
 Wf/wwapiS5s9MJecEeDlU7Ml6CTVgYn+krNAMbJTMI0SB1oHeBZ8rBLVe
 Iuzbljf7x6dbv5YGINff9KIMutNqtIcb7KEK3m5Peb/rautQtdXxcadUO
 +Dj3K118t+SK5PebD/PKQNn9CfVuVyJxBkrZQS+CAdsB9evLSAuIUzgaZ
 OOSVHvre4CpWn/pBEZ4oeMG1Hq8JJ0r7ucCjpuae2F8T78vgeTVj/QLTX
 4sA6t5jpi/GuIc33UAbKccBwxKiiAkiHqFZDaJts65BXSg6/7mR1KZgqN A==;
IronPort-SDR: 9o4WAoVlhYPwZZlWPVLEJHYRfXm5How83056sLSFcj/trfX8PQpwiPE0OZYMGjPrFpCtZt2bDW
 mDjYgeXQxc43SMlWjNB1uNHzxhFCP5vdsiST4PV3rOs1scc0XD60n3LuE+q/SkZs9hXg1r+8Hn
 izwb30ICKDqhIEuEcN4n1ePkvLp3vCNSIJtIbV/eWZ1L7Dus2RY5xxWnWel+FNXgwmS15SQUlw
 6wz3n3C1Hoixm6HTzuoE+fIPBNBFrEg0Eocm4MFmjUd+MQ4dN72L2Tac/yuq7u9qCcOFrBw5bh
 VQ0=
X-IronPort-AV: E=Sophos;i="5.73,407,1583190000"; 
   d="scan'208";a="8586221"
Subject: Re: [PATCH] ubi: Select fastmap anchor PEBs considering wear level
 rules
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200113145622.18357-1-arne.edholm@axis.com>
 <CAFLxGvzEHdxDKfNnDxMXAd0Fct2Yo1+sJDmKfT8eUwUDukRYXg@mail.gmail.com>
 <6b360811-a227-c32f-f9a5-660bea4861c3@axis.com>
 <24ef4730-83e4-ff91-21e8-739153a44a8e@axis.com>
 <CAFLxGvwNxNkwdiovrWQzDfPNr9t2WnXU2VNyNs5caFNZ1WsySQ@mail.gmail.com>
 <CAFLxGvyTnsk_dGdozQp5OYYyhJCiAD4Yxiy19=-05jRX1oU=Tg@mail.gmail.com>
 <CAFLxGvzyVcjLEw8dboAPT9EnHSV9uHnEsnv2QXA04PKme8ydwQ@mail.gmail.com>
From: Arne Edholm <arne.edholm@axis.com>
Message-ID: <242b60d9-6584-a9df-6010-b3f9353e94f1@axis.com>
Date: Mon, 18 May 2020 14:20:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzyVcjLEw8dboAPT9EnHSV9uHnEsnv2QXA04PKme8ydwQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX07.axis.com (10.0.15.177)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_052041_560997_C19D7508 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: kernel <kernel@axis.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNS8xNy8yMCAxMTozMyBQTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IE9uIFRodSwg
QXByIDMwLCAyMDIwIGF0IDQ6MzUgUE0gUmljaGFyZCBXZWluYmVyZ2VyCj4gPHJpY2hhcmQud2Vp
bmJlcmdlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0
IDQ6MjkgUE0gUmljaGFyZCBXZWluYmVyZ2VyCj4gPiA8cmljaGFyZC53ZWluYmVyZ2VyQGdtYWls
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDEwOjM0IEFN
IEFybmUgRWRob2xtIAo+IDxhcm5lLmVkaG9sbUBheGlzLmNvbT4gd3JvdGU6Cj4gPiA+ID4gQXJl
IHlvdSBzYXRpc2ZpZWQgd2l0aCBteSBhbnN3ZXJzIG9yIGFyZSB0aGVyZSBhZGRpdGlvbmFsCj4g
PiA+ID4gaW5mb3JtYXRpb24vY2hhbmdlcyBuZWVkZWQ/Cj4gPiA+Cj4gPiA+IFllcy4gSW4gdGhl
IG1lYW53aGlsZSBJIGRpZCBtb3JlIHRlc3RpbmcgYW5kIHdpdGggeW91ciBjaGFuZ2VzIHRoZQo+
ID4gPiBhbmNob3IgUEVCIHNlbGVjdGlvbgo+ID4gPiBpcyAqbXVjaCogYmV0dGVyLiBUZXN0aW5n
IHRvb2sgc29tZSB0aW1lIGFuZCB0aGVuIEkgc2NoZWR1bGVkIGF3YXkgdG8KPiA+ID4gb3RoZXIg
c3R1ZmYuLi4KPiA+ID4gQ3JpdGljYWwgd29ya2xvYWRzIGFyZSB0aGVzZSB3aGVyZSBhIGZhc3Rt
YXAgaXMgbm90IHdyaXR0ZW4gZHVlIHRvCj4gPiA+IGhlYXZ5IHdyaXRlIGxvYWQsCj4gPiA+IGJ1
dCBvdGhlciBldmVudHMgbGlrZSB2b2x1bWUgY2hhbmdlL2NyZWF0aW9uLgo+ID4gPgo+ID4gPiBB
IGdvb2QgcmVwcm9kdWNlciBzZWVtcyBzb21ldGhpbmcgc3R1cGlkIGxpa2UgdGhhdDoKPiA+ID4g
Zm9yIGkgaW4gYHNlcSAxMDAwYCA7IGRvIHViaW1rdm9sIC1OIHRlc3QgLW0gL2Rldi91YmkwID4v
ZGV2L251bGwgJiYKPiA+ID4gdWJpcm12b2wgL2Rldi91YmkwIC1uIDAgOyBkb25lCj4gPiA+IFdl
YXJsZXZlbGluZyB0aHJlc2hvbGQgaXMgNTAsIGJ0dy4KPiA+ID4KPiA+ID4gV2l0aG91dCB5b3Vy
IHBhdGNoLCB0aGUgZXJhc2UgY291bnRlciBvZiB0aGUgZmlyc3QgNjQgUEVCczoKPiA+ID4gNMKg
wqDCoCA0wqDCoMKgIDTCoMKgwqAgNMKgwqDCoCA0wqDCoMKgIDTCoMKgwqAgNMKgwqDCoCA0Cj4g
PiA+IDTCoMKgwqAgNMKgwqDCoCA0wqDCoMKgIDTCoMKgwqAgNMKgwqDCoCA0wqDCoMKgIDTCoMKg
wqAgNAo+ID4gPiA0wqDCoMKgIDTCoMKgwqAgNMKgwqDCoCA0wqDCoMKgIDTCoMKgwqAgNMKgwqDC
oCA0wqDCoMKgIDQKPiA+ID4gNMKgwqDCoCA0wqDCoMKgIDTCoMKgwqAgNMKgwqDCoCA0wqDCoMKg
IDTCoMKgwqAgNMKgwqDCoCA0Cj4gPiA+IDTCoMKgwqAgNMKgwqDCoCA0wqDCoMKgIDTCoMKgwqAg
NMKgwqDCoCA0wqDCoMKgIDTCoMKgwqAgNAo+ID4gPiA0wqDCoMKgIDTCoMKgwqAgNMKgwqDCoCA0
wqDCoMKgIDTCoMKgwqAgNMKgwqDCoCAyMsKgwqAgNAo+ID4gPiA0wqDCoMKgIDE5wqDCoCA0wqDC
oMKgIDTCoMKgwqAgNMKgwqDCoCA0wqDCoMKgIDTCoMKgwqAgNAo+ID4gPiA0wqDCoMKgIDTCoMKg
wqAgNMKgwqDCoCA0wqDCoMKgIDjCoMKgwqAgOTA4wqAgOTA2wqAgMQo+ID4gPgo+ID4gPiBBbmQg
d2l0aCB5b3VyIHBhdGNoOgo+ID4gPiA5NcKgwqAgOTXCoMKgIDk1wqDCoCA5NcKgwqAgOTXCoMKg
IDk1wqDCoCA5NcKgwqAgOTUKPiA+ID4gOTXCoMKgIDk1wqDCoCA5NcKgwqAgOTXCoMKgIDk1wqDC
oCA5NcKgwqAgOTXCoMKgIDk1Cj4gPiA+IDk1wqDCoCA5NcKgwqAgOTXCoMKgIDk1wqDCoCA5NcKg
wqAgOTXCoMKgIDk1wqDCoCA5NQo+ID4gPiA5NcKgwqAgOTXCoMKgIDk1wqDCoCA5NcKgwqAgOTXC
oMKgIDk1wqDCoCA5NcKgwqAgOTUKPiA+ID4gOTXCoMKgIDk1wqDCoCA5NcKgwqAgOTXCoMKgIDk1
wqDCoCA5NcKgwqAgOTXCoMKgIDk1Cj4gPiA+IDk1wqDCoCA5NcKgwqAgOTXCoMKgIDk1wqDCoCA5
NcKgwqAgOTXCoMKgIDk1wqDCoCA5NQo+ID4gPiA5NcKgwqAgOTXCoMKgIDk1wqDCoCA5NMKgwqAg
OTTCoMKgIDk0wqDCoCA5NMKgwqAgOTQKPiA+ID4gOTTCoMKgIDk0wqDCoCA5NMKgwqAgOTTCoMKg
IDk0wqDCoCA5NMKgwqAgOTTCoMKgIDk1Cj4gPgo+ID4gV2hpbGUgb2JzZXJ2aW5nIG15IG93biBt
YWlsIG9uIHRoZSBtYWlsaW5nIGxpc3QgSSBkaXNjb3ZlcmVkIHNvbWV0aGluZwo+ID4gSSBkaWRu
J3Qgbm90aWNlCj4gPiBsYXN0IHRpbWUgb24gbXkgdGVybWluYWwuCj4gPiBJZiB3ZSBzdW1tYXJp
emUgYWxsIG51bWJlcnMgaW4gdGhlIHNxdWFyZXMgaXQgc2hvdWxkIGJlIG1vcmUgb3IgbGVzcyAK
PiAyMDAwLgo+ID4gYmVjYXVzZSB0aGUgdGVzdCB0cmlnZ2VyZWQgMjAwMCBmYXN0bWFwIHdyaXRl
cy4KPiA+IEJ1dCA5NSB0aW1lcyA2NCBpcyBtdWNoIG1vcmUgdGhhbiAyMDAwLgo+ID4KPiA+IFlv
dXIgcGF0Y2ggcHJvZHVjZXMgYWxtb3N0IGEgcGVyZmVjdCBkaXN0cmlidXRpb24sIHRoZSBvdmVy
YWxsIGVyYXNlIAo+IGNvdW50Cj4gPiBpcyB0aHJlZSB0aW1lcyBhcyBtdWNoIGFzIGl0IGlzIGV4
cGVjdGVkLgo+ID4gSG1tbS4KPgo+IEkgZGlkIG1vcmUgdGVzdHMgYW5kIGNhbiBubyBsb25nZXIg
cmVwcm9kdWNlIHRoZSBwcm9ibGVtIHdpdGggdG9vIG11Y2gKPiB3ZWFyLWxldmVsaW5nLgo+IE1h
eWJlIG15IGluaXRpYWwgdGVzdHMgd2VyZSB3b25reS4gU28sIHBhdGNoIGxvb2tzIGdvb2QsIHJl
c3VsdHMgdG9vLgo+IExldCdzIG1lcmdlIGl0IHdpdGggNS44LiA6LSkKPgpUaGFuayB5b3UgUmlj
aGFyZC4gSSBoYXZlIGFsc28gYmVlbiB0cnlpbmcgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUgCndp
dGhvdXQgc3VjY2Vzcy4KCi9Bcm5lCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
