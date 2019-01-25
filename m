Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8911AC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 11:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5998E2184B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 11:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPwxcnD2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5998E2184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXzfLNYlIsDDF56Li86p1rA9iAfEDtK1bOrccC8dMZs=; b=VPwxcnD2VakPV3
	/cMm/QlB9Nh7bFPdkMBQamLT2+vN8oKmWJCLKmKcK08jpgmrqysfITnNo4VM/dhn9R3pKYuTSNWyN
	ozcpe24qh5oZl16K56Nr7lnBx1ECBCOPvUCye8bbVRGGu3V5npZshUA8sYbWVnc/r/q1vy6wmW0je
	i+T81oJ9jqNJDfoXNyBTwJwnkUl5/Xml+gbpBMpFj31OaeDIMOpsxlFgngMAq1WM7L7LXmtePv4Li
	Yn9QapcTSn7P44lJZ1jNdBF9OkwP6NEq0kzQrZf3j3Lb3NOB3g6Wt4G7q+SBHHuRkNvJpc//Bxzsw
	LEhCvAP3nb84uPwnH8tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmzMT-0003qK-EJ; Fri, 25 Jan 2019 11:09:25 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmzMP-0003px-RS
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 11:09:23 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 6B3D320798; Fri, 25 Jan 2019 12:09:20 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 21D52206A6;
 Fri, 25 Jan 2019 12:09:10 +0100 (CET)
Date: Fri, 25 Jan 2019 12:09:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: spinand: Handle the case where PROGRAM LOAD does
 not reset the cache
Message-ID: <20190125120910.59c33a4b@xps13>
In-Reply-To: <20190124173357.2a4d7f13@bbrezillon>
References: <20190124142007.11607-1-bbrezillon@kernel.org>
 <8f80c33f-b236-27e6-3d87-a8362ad41326@denx.de>
 <CAO1O6scZ12d-5rLnakDy0Wefg4fw=dGS3jPoJtqKztsdMrsjhw@mail.gmail.com>
 <20190124173357.2a4d7f13@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_030922_024790_85EA95D3 
X-CRM114-Status: GOOD (  14.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Stefan Roese <sr@denx.de>, Richard Weinberger <richard@nod.at>,
 Emil Lenngren <emil.lenngren@gmail.com>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUgb24g
VGh1LCAyNCBKYW4gMjAxOQoxNzozMzo1NyArMDEwMDoKCj4gT24gVGh1LCAyNCBKYW4gMjAxOSAx
NzoxNjozNyArMDEwMAo+IEVtaWwgTGVubmdyZW4gPGVtaWwubGVubmdyZW5AZ21haWwuY29tPiB3
cm90ZToKPiAKPiA+IEhpLAo+ID4gCj4gPiBEZW4gdG9ycyAyNCBqYW4uIDIwMTkga2wgMTY6Mjgg
c2tyZXYgU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPjogIAo+ID4gPgo+ID4gPiBPbiAyNC4wMS4x
OSAxNToyMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOiAgICAKPiA+ID4gPiBMb29rcyBsaWtlIFBS
T0dSQU0gTE9BRCAoQUtBIHdyaXRlIGNhY2hlKSBkb2VzIG5vdCBuZWNlc3NhcmlseSByZXNldAo+
ID4gPiA+IHRoZSBjYWNoZSBjb250ZW50IHRvIDB4RkYgKGRlcGVuZHMgb24gdmVuZG9yIGltcGxl
bWVudGF0aW9uKSwgc28gd2UKPiA+ID4gPiBtdXN0IGZpbGwgdGhlIHBhZ2UgY2FjaGUgZW50aXJl
bHkgZXZlbiBpZiB3ZSBvbmx5IHdhbnQgdG8gcHJvZ3JhbSB0aGUKPiA+ID4gPiBkYXRhIHBvcnRp
b24gb2YgdGhlIHBhZ2UsIG90aGVyd2lzZSB3ZSBtaWdodCBjb3JydXB0IHRoZSBCQk0gb3IgdXNl
cgo+ID4gPiA+IGRhdGEgcHJldmlvdXNseSBwcm9ncmFtbWVkIGluIE9PQiBhcmVhLgo+ID4gPiA+
Cj4gPiA+ID4gRml4ZXM6IDc1MjlkZjQ2NTI0OCAoIm10ZDogbmFuZDogQWRkIGNvcmUgaW5mcmFz
dHJ1Y3R1cmUgdG8gc3VwcG9ydCBTUEkgTkFORHMiKQo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBTdGVm
YW4gUm9lc2UgPHNyQGRlbnguZGU+Cj4gPiA+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJu
ZWwub3JnPiAgICAKPiA+ID4KPiA+ID4gV29ya3MgZmluZSAobGltaXRlZCB0ZXN0aW5nIG9ubHkg
eWV0KSwgc286Cj4gPiA+Cj4gPiA+IFRlc3RlZC1ieTogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRl
Pgo+ID4gPiBSZXZpZXdlZC1ieTogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPgo+ID4gPgo+ID4g
PiBUaGFua3MsCj4gPiA+IFN0ZWZhbgo+ID4gPiAgICAKPiA+IAo+ID4gQ2FuIHRoaXMgcXVpcmsg
YmUgbWFkZSB2ZW5kb3Igc3BlY2lmaWM/ICAKPiAKPiBXZSBjYW4gbWFrZSBpdCB2ZW5kb3Igc3Bl
Y2lmaWMsIGFzIGxvbmcgYXMgaXQncyBhbiBvcHQtaW4gdGhpbmcuIFRoaXMKPiB3YXksIHRoZSBk
ZWZhdWx0IGJlaGF2aW9yIGlzIHRoZSBzYWZlc3Qgb25lLCBhbmQgb25seSB3aGVuIHdlIGtub3cg
YQo+IGNoaXAgZG9lcyByZXNldCB0aGUgY2FjaGUgY29udGVudCBvbiBhIFBST0dSQU0gTE9BRCB0
aW1lIGNhbiB3ZSBhZGQgdGhpcwo+IGZsYWcuCgpJIGFtIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNo
LgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
