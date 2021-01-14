Return-Path: <SRS0=+zBv=GR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A282EC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 16:43:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA3423B1C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 16:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA3423B1C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HvrHikAr8Ci0AkNh3MaSAb7AmtEZLJsK8pjZFWJ5Mwc=; b=GSfIdZcokVlj9MaPL277mSY3i
	ozUf5CuqxtxomR+VEFekj78fBTldQbnOHiXDDncKyFVJ5YzAWp86TQkAl1gjI1gY9IupKBUg9FuZv
	BJAG4Ml7K8jhfv4tOeJavLLmTtw5BLiTujF3YIxP2Ww4ahCK6tUgLZ7GqpkWCu72bEO3AGzyRf4eO
	RBxdvNb4iXrRYzCvIoQA4h2X3RX6luSMbhbGjQLzMKJFwMcWNyt72Llcx7vm9HpckhAKROBoCz6ev
	Q/dd3d+fKe58Mmc24jqT8euSv3XTNmZaPEe8fSyrxpFce7egjtWImbYzzopRCetCWCgHwDTKAIGqh
	K/CefLwtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l05i8-0003Qc-Nq; Thu, 14 Jan 2021 16:43:00 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l05i6-0003Pw-6B
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2021 16:42:59 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C36E6E0013;
 Thu, 14 Jan 2021 16:42:55 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:42:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH V3] mtd: rawnand: qcom: update last code word register
Message-ID: <20210114174254.55bd0083@xps13>
In-Reply-To: <20210114163154.GA76759@thinkpad>
References: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
 <20210114165325.3d510355@xps13> <20210114163154.GA76759@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_114258_330933_62FA009C 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: Md Sadre Alam <mdalam@codeaurora.org>, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFRodSwKMTQgSmFuIDIwMjEgMjI6MDE6NTQgKzA1MzA6
Cgo+IE9uIFRodSwgSmFuIDE0LCAyMDIxIGF0IDA0OjUzOjI1UE0gKzAxMDAsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIZWxsbywKPiA+IAo+ID4gTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVh
dXJvcmEub3JnPiB3cm90ZSBvbiBTdW4sIDEwIEphbiAyMDIxCj4gPiAwOTozMTo0NSArMDUzMDoK
PiA+ICAgCj4gPiA+IEZyb20gUVBJQyB2ZXJzaW9uIDIuMCBvbndhcmRzIG5ldyByZWdpc3RlciBn
b3QgYWRkZWQgdG8gIAo+ID4gCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEK
PiA+ICAgCj4gPiA+IHJlYWQgbGFzdCBjb2Rld29yZC4gVGhpcyBjaGFuZ2Ugd2lsbCB1cGRhdGUg
dGhlIHNhbWUuICAKPiA+IAo+ID4gICAgICAgIHRoZT8gICAgICAgICAgIF5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eCj4gPiAgICAgICAgICAgICAgICAgICAgICAgUGxlYXNlIHJld29y
ZCB0aGlzIHNlbnRlbmNlLgo+ID4gICAKPiA+ID4gRm9yIGZpcnN0IHRocmVlIGNvZGUgd29yZCBS
RUFEX0xPQ0FUSU9OX24gcmVnaXN0ZXIgd2lsbCBiZQo+ID4gPiB1c2UuRm9yIGxhc3QgY29kZSB3
b3JkIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJlZ2lzdGVyIHdpbGwgYmUKPiA+ID4gdXNlLiAg
Cj4gPiAKPiA+ICJGb3IgdGhlIGZpcnN0IHRocmVlIGNvZGV3b3JkcywgUkVBRF9MT0NBVElPTl9u
IHJlZ2lzdGVycyB3aWxsIGJlIHVzZWQuCj4gPiBUaGUgbGFzdCBjb2Rld29yZCByZWdpc3RlciB3
aWxsIGJlIGFjY2Vzc2VkIHRocm91Z2gKPiA+IFJFQURfTE9DQVRJT05fTEFTVF9DV19uLiIKPiA+
IAo+ID4gQWxzbywgcGxlYXNlIHNwZWNpZnkgd2hhdCB0aGVzZSByZWdpc3RlcnMgc3RvcmUuCj4g
PiAgIAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9y
YS5vcmc+ICAKPiA+IAo+ID4gQ291bGQgc29tZW9uZSBwbGVhc2UgdGVzdCB0aGlzIHBhdGNoPwo+
ID4gICAKPiAKPiBUaGlzIGlzIG9uIG15IFRPRE8gbGlzdC4gV2lsbCBnZXQgYmFjayB0byBpdCBv
bmNlIEknbSBiYWNrIGZyb20gaG9saWRheXMKPiBvciBzb29uZXIgaWYgSSBmaW5kIHNvbWUgdGlt
ZSBpbiB0aGUgbWlkZGxlLgoKTm8gaHVycnksIEkgYmVsaWV2ZSB0aGlzIHBhdGNoIHN0aWxsIG5l
ZWRzIGEgbGl0dGxlIGJpdCBvZiBlZmZvcnQgYmVmb3JlCmJlaW5nIHJlYWR5IGZvciB1cHN0cmVh
bWluZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
