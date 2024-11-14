Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46905D6A226
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+198FL1Be/ExJTsH5i5FlPMwEccfcL6tJwfGKKBMsIw=; b=WGQenCTN89tNCUEUejFg1fVSxe
	bqAXOD9AYz1Sx4+g9M/fAaJcK4dykZexssCrd+FD4DPxg5EkJukr41O2t0r7DZEJnlhqRD/3p9Phs
	ht97ap8SFPfAFlVqQsVPeiZ/x6xy7XhwLT+Ig4DwM1E5r63OFG4R6vHrCBjNXEDHMfl6F+VVtghgq
	kRaed+3mw2N24cL9fHTQQJWYcAA1fhJ64npHtcaYuLC5PG8oyAKWwtqc+Kf6TT/REze1ZTTfJaZ8d
	SLNiCG62n0Dw9SXF2rTYV1vTcILMlYW5Cf8nacUh1v5eLuhy6ezaRVkt2jvmXVj7UPIVgpdfZjBN+
	m9eDdGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBevG-00000000Wp2-144J;
	Thu, 14 Nov 2024 18:50:30 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBevD-00000000WoC-0yCy
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 18:50:28 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 76D282BFA23;
	Thu, 14 Nov 2024 19:50:23 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 7SZ4TXLpgSXq; Thu, 14 Nov 2024 19:50:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 28F8C2BFA25;
	Thu, 14 Nov 2024 19:50:22 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LUbgmOJuIdBO; Thu, 14 Nov 2024 19:50:22 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 03A792BFA23;
	Thu, 14 Nov 2024 19:50:21 +0100 (CET)
Date: Thu, 14 Nov 2024 19:50:21 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Rickard X Andersson <rickard.andersson@axis.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <66292421.21714319.1731610221872.JavaMail.zimbra@nod.at>
In-Reply-To: <fde85cfc-8b66-37fd-3884-ad4d65930378@huawei.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com> <1034679385.201190.1730925253564.JavaMail.zimbra@nod.at> <fde85cfc-8b66-37fd-3884-ad4d65930378@huawei.com>
Subject: Re: [PATCH v3 01/10] ubi: Expose mean erase counter in sysfs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Expose mean erase counter in sysfs
Thread-Index: IMsn5HP73s0NthJyE9zmcR04lT3+Hw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_105027_416663_9CE60E00 
X-CRM114-Status: UNSURE (   4.44  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
IlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4KPiBDQzog
ImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgInJpY2thcmQzMTQg
YW5kZXJzc29uIiA8cmlja2FyZDMxNC5hbmRlcnNzb25AZ21haWwuY29tPiwgImtlcm5lbCIKPiA8
a2VybmVsQGF4aXMuY29tPgo+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCA3LiBOb3ZlbWJlciAyMDI0
IDAyOjM5OjQ1Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCB2MyAwMS8xMF0gdWJpOiBFeHBvc2UgbWVh
biBlcmFzZSBjb3VudGVyIGluIHN5c2ZzCgo+IOWcqCAyMDI0LzExLzcgNDozNCwgUmljaGFyZCBX
ZWluYmVyZ2VyIOWGmemBkzoKPj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4g
Vm9uOiAiUmlja2FyZCBYIEFuZGVyc3NvbiIgPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+
Pj4gVGhlcmUgZXhpc3RzIG1vcmUgZGV0YWlsZWQgaW5mbyBpbiBkZWJ1Z2ZzLCBidXQgdGhpcyBp
bmZvcm1hdGlvbiBpcwo+Pj4gb25seSBhdmFpbGFibGUgZm9yIGRlYnVnIGJ1aWxkcy4KPj4gCj4+
IElmIHRoZSBkZXRhaWxlZCBpbmZvIGlzIHVzZWZ1bCBmb3IgcmVndWxhciB1c2Vyc3BhY2Ugd2Ug
Y2FuIGFsc28gdGhpbmsKPj4gb2YgYWRkaW5nIGEgbm9uLWRlYnVnZnMgaW50ZXJmYWNlIGZvciBp
dC4KPj4gRS5nLiBhbiBpb2N0bCgpIHRoYXQgcmV0dXJucyB0aGlzIGRhdGEgaW4gYmluYXJ5IGZv
cm0uCj4gCj4gVGhpcyBtZXRob2Qgc291bmRzIGJldHRlci4KClJpY2thcmQsIHdoYXQgZG8geW91
IHRoaW5rIGFib3V0IHRoaXMgb3B0aW9uPwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
