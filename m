Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31070C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 13:41:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AFA56101C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 13:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AFA56101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9/gLQCU9EIY3fn1qxFDRxXR+EGUoThSZLKDlByiLvJI=; b=JCeXkAVWRI6GtjfKojDuE/HlR
	Sis1rKaxmNOcpQlDWCl1uzQMn3+LvhbKfNpPMcA0yufQuY3m1wsElq3U98n509nnwNJi6Zs8nhyZy
	zfNERfw//XO9Zh4WJAYF3aGg+ZUr91QQtHpk1HSAF55XF129SVCAvtfwf/xwqoqjxkEwdtx+6uWaG
	UHEsQwoaddk88941R19p6LSoG94VKOqWF9SD/q01he3T8mrhlGmDRu6JQ6tk1CDzcbImP38+5ctsO
	qPJ3o22IS1xpP65/Ym9Mmx2/imisZr3mRHZMM4wUIFFfrAJBk2GCkiVjF07ylTyQJIGfm+rSa0t7/
	vDo2/XAkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYU9G-00A1Cn-Pl; Mon, 19 Apr 2021 13:41:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYU9F-00A1Cf-4m
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 13:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=4mk+43zIBqlnGxve3H0iLW9QtmHiTu45SO6oz+lrIXo=; b=BQCLP7PYQlCgvz5Pe8LPDIxvZd
 dtKQyCz9eWrvXW518ecTQseOZkblg2LeVadMXkM1omdVMnX2pWtkJaawi2/T+L+kBOhLkpuTb8NJE
 gh+/RzoVf82u8MGkWgNNKFL4ftm8jU+2oz1afUqBv2NDEcHhlfxk4/uoDZn4tI0in51POJoUpzJgn
 3/ZYd4YlOEgtGi70thOUGSufd7Hpxgi/y52216CCWmQMde75kVlgc18OKZuBZIRAoiDGSq81YmXT1
 iWkrppBnQ4T2iHfBVbc0H99hLtuCm/a78DA9a+Dpo5ruBcb+sVcRJdSbx0MGaNFShBx5p7IBUIPvp
 I9hus1iQ==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYU99-00BPjJ-PA
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 13:41:07 +0000
X-Originating-IP: 92.184.110.210
Received: from xps13 (pop.92-184-110-210.mobile.abo.orange.fr [92.184.110.210])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 90C7E60017;
 Mon, 19 Apr 2021 13:40:58 +0000 (UTC)
Date: Mon, 19 Apr 2021 15:40:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Sascha Hauer
 <kernel@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>, Stefan
 Riedmueller <s.riedmueller@phytec.de>
Subject: Re: imx27: No space left to write bad block table
Message-ID: <20210419154056.505e5471@xps13>
In-Reply-To: <CAOMZO5C921yS9mVkTpTjwxapjKhr_FgSddYcYXA62LBVPoK=9g@mail.gmail.com>
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <CAOMZO5CS03F9dDeaUus4WRBv9z_1svx7BqHM=b6PkxeUthGdzQ@mail.gmail.com>
 <CAOMZO5C921yS9mVkTpTjwxapjKhr_FgSddYcYXA62LBVPoK=9g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_064103_977403_4B54494B 
X-CRM114-Status: GOOD (  16.41  )
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

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIE1v
biwgMTkgQXByIDIwMjEgMDk6NDg6MjAKLTAzMDA6Cgo+IE9uIE1vbiwgQXByIDE5LCAyMDIxIGF0
IDk6NDEgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiAKPiA+
IFRoaXMgY29tbWl0IGxhbmRlZCBpbiBsaW51eC1uZXh0IDIwMjEwMzI5LiBJIHdhcyBhYmxlIHRv
IGZpbmQgdGhlCj4gPiBrZXJuZWxjaSBsb2cgZm9yIHRoaXMgdmVyc2lvbiBhbmQgTkFORCBpcyBj
b3JyZWN0bHkgcHJvYmVkOgo+ID4gaHR0cHM6Ly9zdG9yYWdlLmtlcm5lbGNpLm9yZy9uZXh0L21h
c3Rlci9uZXh0LTIwMjEwMzI5L2FybS9pbXhfdjRfdjVfZGVmY29uZmlnL2djYy04L2xhYi1wZW5n
dXRyb25peC9iYXNlbGluZS1pbXgyNy1waHl0ZWMtcGh5Y2FyZC1zLXJkay5odG1sCj4gPgo+ID4g
VGhlIGZpcnN0IE5BTkQgZXJyb3Igc3RhcnRzIHdpdGggMjAyMTAzMzA6Cj4gPiBodHRwczovL3N0
b3JhZ2Uua2VybmVsY2kub3JnL25leHQvbWFzdGVyL25leHQtMjAyMTAzMzAvYXJtL2lteF92NF92
NV9kZWZjb25maWcvZ2NjLTgvbGFiLXBlbmd1dHJvbml4L2Jhc2VsaW5lLWlteDI3LXBoeXRlYy1w
aHljYXJkLXMtcmRrLmh0bWwgIAo+IAo+IGxpbnV4LW5leHQgMjAyMTAzMjkgaW50cm9kdWNlZCB0
aGUgZm9sbG93aW5nIGxvZ3MgdGhhdCB3ZXJlIG5vdAo+IHByZXNlbnQgcHJldmlvdXNseToKPiAK
PiBCYWQgYmxvY2sgdGFibGUgd3JpdHRlbiB0byAweDAwMDAwN2ZhMDAwMCwgdmVyc2lvbiAweDAx
Cj4gQmFkIGJsb2NrIHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMDdmODAwMDAsIHZlcnNpb24gMHgw
MQo+IAo+IE1heWJlIHRoaXMgbmV3ICd0d28gQmFkIGJsb2NrIHRhYmxlcycgd2lsbCBjb25mdXNl
IHRoZSBzdWJzZXF1ZW50IGJvb3RzPwoKSSBhbSBwcmV0dHkgc3VyZSBub3cgdGhlIGNvbW1pdCBJ
IHBvaW50ZWQgZWFybGllciB0b2RheSBpcyB0aGUgcm9vdApjYXVzZSAoYnV0IEkgZG9uJ3Qga25v
dyB3aHksIHlldCkuIFNvbWVob3cgaXQgc2tpcHMgdGhlIGJhZCBibG9jayB0YWJsZQp3aGljaCBp
cyBtb3JlIG9yIGxlc3MgZGVjbGFyZWQgbGlrZSBhIGJhZCBibG9jayBmcm9tIGEgJ2xvdyBsZXZl
bCcKcG9pbnQgb2YgdmlldyAoc28gdGhhdCB0aGUgdXNlciBjYW5ub3QgZXJhc2Uvb3ZlcndyaXRl
IGl0KS4gSGVyZSwKdGhlIGtlcm5lbCBkb2VzIG5vdCBmaW5kIHRoZSB2YWxpZCBCQlQuIEl0IHRo
ZW4gY3JlYXRlcyBhIG5ldyBjb3VwbGUgb2YKQkJULiBCdXQgZG9pbmcgc28gYXQgdGhlIG5leHQg
Ym9vdCwgdGhlIHJlY2VudGx5IGNyZWF0ZWQgQkJUIHdvbid0IGJlCmRldGVjdGVkIGFueW1vcmUu
Li4gdW50aWwgdGhlcmUgYXJlIG5vIG1vcmUgZnJlZSBibG9ja3MgcmVzZXJ2ZWQgZm9yCnRoYXQg
YW5kIHRoYXQncyB3aGVyZSB0aGUgcHJvYmUgZmFpbHMuCgpTbyB5ZXMsIHRoZSBOQU5EIGNvbnRy
b2xsZXIgZHJpdmVyIHByb2JlcyBjb3JyZWN0bHkgd2l0aCBuZXh0LTIwMjEwMzI5CmJ1dCBpbiBm
YWN0IHRoZSByZWFsIGJhZCBibG9jayB0YWJsZSBpcyBub3QgZm91bmQgYW5kIHRoaXMgaXMgdGhl
IHJvb3QKY2F1c2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
