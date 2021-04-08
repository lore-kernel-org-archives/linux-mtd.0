Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6DCC433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 07:07:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439CE61157
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 07:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 439CE61157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TVm0ayt6w/J19Xyx4PCXwSVZb2V+ZdukG5zbUtE50ig=; b=Ygc2FJ3xmuCd20wpsUHv43KPd
	frxbQ7C9imJLy9qIWFd8hoFg68Yl78af1G1xDlwkoZBGXW10veH+i1rlClpN+WWqReNpUyTTTVc0i
	E/TOhzo66s1PUz/bgVTX13dGXCz9wP25VMKQDjk1z2w3pxRwkPg/3Oc6mrI+3pQJFCIeIZ6i+rkiU
	gCk2ndWRrAZ+qbS0reD+37dOOdBFdphhcy2Xfpv730o1wHyserQVqW0PqrStP0it6DL5T+BPlzADA
	n4DeJ9OJUGrouQCZvBjCa7MMRPeHRoMY7S1Wk2Ou3t+y+gaLFAWSljYruLBm7LfWnWtLRLQF4q9EY
	f699+U1zQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUOkS-0079Hg-Lr; Thu, 08 Apr 2021 07:06:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUOkO-0079Gd-By
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 07:06:39 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 39717FF807;
 Thu,  8 Apr 2021 07:06:33 +0000 (UTC)
Date: Thu, 8 Apr 2021 09:06:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, richard@nod.at,
 vigneshr@ti.com
Subject: Re: [PATCH] mtd: add OTP (one-time-programmable) erase ioctl
Message-ID: <20210408090632.62fb6dbc@xps13>
In-Reply-To: <904d986fbd6f718cf8b7b9fc54b339d4@walle.cc>
References: <20210303201819.2752-1-michael@walle.cc>
 <c8f6bd61-528e-0353-aa23-aaec2be2b3ff@microchip.com>
 <904d986fbd6f718cf8b7b9fc54b339d4@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_080636_723560_6489E666 
X-CRM114-Status: GOOD (  15.72  )
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

SGVsbG8sCgpNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3cm90ZSBvbiBUaHUsIDA4
IEFwciAyMDIxIDA4OjU1OjQyCiswMjAwOgoKPiBIaSBUdWRvciwKPiAKPiBBbSAyMDIxLTA0LTA4
IDA3OjUxLCBzY2hyaWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPiA+IFdvdWxkIHlv
dSBwbGVhc2UgcmVzZW5kIHRoaXMgcGF0Y2gsIHRvZ2V0aGVyIHdpdGggdGhlIG10ZC11dGlscwo+
ID4gYW5kIHRoZSBTUEkgTk9SIHBhdGNoIGluIGEgc2luZ2xlIHBhdGNoIHNldD8gWW91J2xsIGhl
bHAgdXMgYWxsCj4gPiBoYXZpbmcgYWxsIGluIGEgc2luZ2xlIHBsYWNlLiAgCj4gCj4gVGhpcyBo
YXMgYWxyZWFkeSBiZWVuIHBpY2tlZC11cDoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0L2NvbW1pdC8/aD1tdGQvbmV4dCZpZD1l
M2MxZjFjOTJkNmVkZTNjZmEwOWQ2YTEwM2QzZDFjMWVmNjQ1ZTM1Cj4gCj4gQWx0aG91Z2gsIEkg
ZGlkbid0IHJlY2VpdmUgYW4gZW1haWwgbm90aWNlLgo+IAo+IC1taWNoYWVsCgpTb21ldGltZXMg
dGhlIG5vdGlmaWNhdGlvbnMgYXJlIG5vdCB0cmlnZ2VyZWQgd2hlbiB0aGVyZSBpcyBhIGNvbmZs
aWN0CndoZW4gYXBwbHlpbmcgdGhlIHBhdGNoIGZyb20gcGF0Y2h3b3JrIGRpcmVjdGx5LiBJIHVz
dWFsbHkgYW5zd2VyCm1hbnVhbGx5IGluIHRoaXMgY2FzZSBidXQgSSBtaWdodCBoYXZlIGZvcmdv
dHRlbi4KCkFib3V0IHRoZSBwYXRjaCwgSSBmZWx0IGl0IHdhcyBnb29kIGVub3VnaCBmb3IgbWVy
Z2luZywgYW5kIEkgd2FudCB0bwphdm9pZCBhcHBseWluZyBzdWNoIHBhdGNoZXMgcmlnaHQgYmVm
b3JlIGZyZWV6aW5nIG91ciBicmFuY2hlcy4gSGVuY2UsCkkgdGVuZCB0byBiZSBtb3JlIGFnZ3Jl
c3NpdmUgZWFybGllciBpbiB0aGUgcmVsZWFzZSBjeWNsZXMgYmVjYXVzZSBJCmhhdGUgd2hlbiBt
eSBwYXRjaGVzIGdldCBkZWxheWVkIGluZmluaXRlbHkuIFRoZSBvdGhlciBzaWRlIGlzIGEgbW9y
ZQpjYXJlZnVsIGFwcHJvYWNoIHdoZW4gLXJjNiBnZXRzIHRhZ2dlZCBzbyB0aGF0IEkgY2FuIGRy
b3AgYW55dGhpbmcgd2hpY2gKd291bGQgYmUgY3JhemlseSBicm9rZW4gYmVmb3JlIG91ciAtbmV4
dCBicmFuY2hlcyBhcmUgc3RhbGxlZCwgbGVhZGluZwpmb3IgYW4gdXNlbGVzcyBwdWJsaWMgcmV2
ZXJ0LiBPZiBjb3Vyc2UsIEkgYW0gZnVsbHkgb3BlbiB0byByZW1vdmluZwp0aGlzIHBhdGNoIGZy
b20gLW5leHQgaWYgeW91IGV2ZXIgZmVlbCBpdCB3YXMgdG9vIGVhcmx5IGFuZCB3aWxsCmhhcHBp
bHkgZ2V0IHJpZCBvZiBpdCBmb3IgdGhpcyByZWxlYXNlOiB3ZSBjYW4gbW92ZSB0aGUgcGF0Y2gg
Zm9yIHRoZQpuZXh0IHJlbGVhc2UgaWYgeW91IGFncmVlIG9uIHRoaXMgKGVzcGVjaWFsbHkgc2lu
Y2UgaXQgdG91Y2hlcyB0aGUKQUJJKS4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
