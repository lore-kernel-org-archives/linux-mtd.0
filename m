Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98929C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 20:56:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C3864E02
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 20:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52C3864E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=akLRuOUxAQSJkhUa0IN610U2V5UNKW8/IzRt2QiiyUA=; b=EouPW/27Q7a0Xz8apJFF1jv9Z
	nKZP8XbIFc5IYvRsAS1mydo99InmiNfNpU56kNV2pXHx1HDOrwtikU/JIqDR70J2WKndbRDO0DcPI
	HLpAKvPqv8nqyrrymn8ogLY9bNiwTDM2sL/ySgKBHs2Y0Ew/LhoaRX/yWqjYoLDvJ2U386KDsmGOd
	S5nu/btyCklPjwFfJUqYhg3HLmM960lgJjYMyB5u59gQdCxp1WsCUvvIGL+RtTtgN4m+583+Q9Ckl
	XIjHgboVIHP644R0pZyFv+smtG12SrKNA4pMD8kCp1YdaYOadqDQKkDburCDcHt5LLuQ2dvxrwXN5
	aCd0oHlpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9wWj-0003z2-DZ; Wed, 10 Feb 2021 20:55:57 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9wWg-0003yN-Vv
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 20:55:56 +0000
X-Originating-IP: 90.2.4.167
Received: from xps13 (aputeaux-654-1-105-167.w90-2.abo.wanadoo.fr [90.2.4.167])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1883CFF803;
 Wed, 10 Feb 2021 20:55:49 +0000 (UTC)
Date: Wed, 10 Feb 2021 21:55:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
Message-ID: <20210210215548.40ce9ba5@xps13>
In-Reply-To: <1183985773.380599.1612956233979.JavaMail.zimbra@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
 <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
 <20210210121429.4fb5ecf3@xps13>
 <1183985773.380599.1612956233979.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_155555_130908_258439CD 
X-CRM114-Status: GOOD (  18.13  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlIG9u
IFdlZCwgMTAgRmViIDIwMjEgMTI6MjM6NTMKKzAxMDAgKENFVCk6Cgo+IE1pcXVlbCwKPiAKPiAt
LS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPj4gRG9lcyBpbi1iYW5kIGFuZCBPT0Ig
ZGF0YSBuZWVkIHRvIGJlIGhhbmRsZWQgdG9nZXRoZXI/ICAKPiA+IAo+ID4gU2hvcnQgYW5zd2Vy
OiB5ZXMuCj4gPiAgIAo+ID4+IElmIHNvLCB0aGVuIHR3byByZXF1ZXN0cyBpcyBub3QgYSBnb29k
IG9wdGlvbi4gIAo+ID4gCj4gPiBNb3JlIGRldGFpbGVkIGFuc3dlcjoKPiA+IAo+ID4gVGhlcmUg
aXMgYSB0eXBlIG9mIE1URCBkZXZpY2UgKE5BTkQgZGV2aWNlcykgd2hpY2ggYXJlIGNvbXBvc2Vk
LCBmb3IKPiA+IGVhY2ggcGFnZSwgb2YgWCBpbi1iYW5kIGJ5dGVzIHBsdXMgWSBvdXQtb2YtYmFu
ZCBtZXRhZGF0YSBieXRlcy4KPiA+IAo+ID4gQWNjZXNzaW5nIGVpdGhlciB0aGUgaW4tYmFuZCBk
YXRhLCBvciB0aGUgb3V0LW9mLWJhbmQgZGF0YSwgb3IgYm90aCBhdAo+ID4gdGhlIHNhbWUgdGlt
ZSBhcmUgYWxsIHZhbGlkIHVzZSBjYXNlcy4KPiA+IAo+ID4gKiBSZWFkIG9wZXJhdGlvbiBkZXRh
aWxzOgo+ID4gIEZyb20gYSBoYXJkd2FyZSBwb2ludCBvZiB2aWV3LCB0aGUgb3V0LW9mLWJhbmQg
ZGF0YSBpcyAoYWxtb3N0KQo+ID4gIGFsd2F5cyByZXRyaWV2ZWQgd2hlbiB0aGUgaW4tYmFuZCBk
YXRhIGlzIHJlYWQgYmVjYXVzZSBpdCBjb250YWlucwo+ID4gIG1ldGEtZGF0YSB1c2VkIHRvIGNv
cnJlY3QgZXZlbnR1YWwgYml0ZmxpcHMuIEluIHRoaXMgY2FzZSwgaWYgYm90aAo+ID4gIGFyZWFz
IGFyZSByZXF1ZXN0ZWQsIGl0IGlzIGhpZ2hseSBub24tZWZmaWNpZW50IHRvIGRvIHR3byByZXF1
ZXN0cywKPiA+ICB0aGF0J3Mgd2h5IHRoZSBNVEQgY29yZSBhbGxvd3MgdG8gZG8gYm90aCBhdCB0
aGUgc2FtZSB0aW1lLgo+ID4gKiBXcml0ZSBvcGVyYXRpb24gZGV0YWlsczoKPiA+ICBFdmVuIHdv
cnNlLCBpbiB0aGUgd3JpdGUgY2FzZSwgeW91ICptdXN0KiB3cml0ZSBib3RoIGF0IHRoZSBzYW1l
Cj4gPiAgdGltZS4gSXQgaXMgcGh5c2ljYWxseSBpbXBvc3NpYmxlIHRvIGRvIG9uZSBhZnRlciB0
aGUgb3RoZXIgKHN0aWxsCj4gPiAgd2l0aCBhY3R1YWwgaGFyZHdhcmUsIG9mIGNvdXJzZSkuCj4g
PiAKPiA+IFRoYXQgaXMgd2h5IGl0IGlzIHByZWZlcmFibGUgdGhhdCBNVVNFIHdpbGwgYmUgYWJs
ZSB0byBhY2Nlc3MgYm90aCBpbgo+ID4gYSBzaW5nbGUgcmVxdWVzdC4gIAo+IAo+IEJ5IHNpbmds
ZSByZXF1ZXN0IHdlIG1lYW50IEZVU0Ugb3AtY29kZXMuIFRoZSBOQU5EIHNpbXVsYXRvciBpbiBV
c2Vyc3BhY2UKPiB3aWxsIHNlZSBqdXN0IG9uZSBjYWxsLiBNeSBwbGFuIGlzIHRvIGFic3RyYWN0
IGl0IGluIGxpYmZ1c2UuCgpJZiBsaWJmdXNlIGFic3RyYWN0cyBpdCwgYXMgbG9uZyBhcyBNVEQg
b25seSBzZWVzIGEgc2luZ2xlIHJlcXVlc3QgSSdtCmZpbmUgOikKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
