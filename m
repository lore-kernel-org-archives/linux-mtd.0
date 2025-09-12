Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACC1CAC582
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Sep 2025 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=y1Pdw2GYGnSyHjqUN+4+QcrkwJQGlg1xIZZnYy/srmA=; b=iV/48NYfCSDk33pjXU4c55x+Hl
	oC45mMUHddfsjv7EA/vNs8Is99nnMZG7WHEsajmXkofuPcy6j39BCkmqTt2cqiaUnP3hTRI6+fJI5
	Mspn/C1SsOBald2HnHjPS6H8gfEbW2iA71gbmyuGrcAd1V+VMkEADzSgVbp4+5DY4BTWBGRJoJUP0
	Kj5N5Vq8cn9cjtpBCG79XakuogZTVnxY48xu/Cw257RYThEK5KZxIa497yYdyoD8lHWI0berUTnL+
	my1DNEPiD9zDNxerXO2qoZTxhhSAXWwKiqxwja6mgczJD2Of/GikkW8mOKfQ+xinvD7HE34vSNufi
	fJlIMkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyf8-00000007lqL-3tKg;
	Fri, 12 Sep 2025 07:57:42 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyf6-00000007llc-0sc0
	for linux-mtd@lists.infradead.org;
	Fri, 12 Sep 2025 07:57:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 199A02C14AD;
	Fri, 12 Sep 2025 09:57:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id M83sCyoVSc9o; Fri, 12 Sep 2025 09:57:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B59F92C14B1;
	Fri, 12 Sep 2025 09:57:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mvoMTFhVDM1w; Fri, 12 Sep 2025 09:57:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8E2C22C14AD;
	Fri, 12 Sep 2025 09:57:28 +0200 (CEST)
Date: Fri, 12 Sep 2025 09:57:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, leoyu <leoyu@mxic.com.tw>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Message-ID: <1899901955.27456.1757663848457.JavaMail.zimbra@nod.at>
In-Reply-To: <CAAyq3SZT67uwggdNX99qEc4bwSkUw2U=sCc6mon064D=f7oH=w@mail.gmail.com>
References: <20250812051949.983040-1-linchengming884@gmail.com> <152133202.103367.1754981828821.JavaMail.zimbra@nod.at> <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com> <608935583.115196.1755171013804.JavaMail.zimbra@nod.at> <CAAyq3SZT67uwggdNX99qEc4bwSkUw2U=sCc6mon064D=f7oH=w@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: skip programming unused bits in ubi headers
Thread-Index: FR1UTwWJsSzQA+5g+AzaxW1MoRcCZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_005740_390822_CA0FEA9A 
X-CRM114-Status: UNSURE (   8.12  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNoZW5nIE1pbmcgTGluIiA8
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4KPj4gVGhhdCdzIHRoZSBjcnVjaWFsIHF1ZXN0aW9u
LiBJcyB0aGlzIHRydWUgZm9yIGFsbCBOQU5EIGNoaXBzPwo+PiBEbyBhdm9pZCBsYXJnZXIgd3Jp
dGVzIG9mIDB4RkYgcGF0dGVybnMgZmlsZSBzeXN0ZW1zIHN1Y2ggYXMgVUJJRlMKPj4gYWxzbyB1
c2UgY29tcHJlc3Npb24gYSBsb3QuCj4+IEF0IGxlYXN0IHRoYXQncyB3aGF0IEkgaGF2ZSBiZWVu
IHRvbGQgd2hlbiBJIGFza2VkIDEwKyB5ZWFycyBhZ28KPj4gaG93IFVCSSB3b3Jrcy4KPiAKPiBZ
b3UgYXJlIGNvcnJlY3QgdGhhdCB0aGVyZSBpcyBhbiBpc3N1ZSB3aGVuIGJsYW5rIGRhdGEgcGFn
ZXMgYXJlIHJlcGVhdGVkbHkKPiBlcmFzZWQuIFRoaXMgY2FuIGxlYWQgdG8gY2VsbHMgZW50ZXJp
bmcgYSB0b28gZGVlcCBWVCBzdGF0ZSwgd2hpY2ggbWF5Cj4gY2F1c2UgcHJvZ3JhbSBmYWlsdXJl
cyBpbiBzdWJzZXF1ZW50IG9wZXJhdGlvbnMuCj4gCj4gVG8gYWRkcmVzcyB0aGlzLCBuZXdlciBO
QU5EIGdlbmVyYXRpb25zIHR5cGljYWxseSBwZXJmb3JtIGEgcHJlLXByb2dyYW0KPiBzdGVwIGJl
Zm9yZSBleGVjdXRpbmcgdGhlIGFjdHVhbCBlcmFzZS4gVGhpcyBrZWVwcyB0aGUgVlQgZGlzdHJp
YnV0aW9uIGZyb20KPiBnb2luZyB0b28gZGVlcCwgdGhlcmVieSBhdm9pZGluZyB0aGUgYmxhbmst
cGFnZSBkZWdyYWRhdGlvbiBwcm9ibGVtLgo+IFN1Y2ggcHJlLVBHTSB0ZWNobmlxdWVzIGhhdmUg
YmVlbiB3aWRlbHkgYWRvcHRlZCBmb3Igcm91Z2hseSB0aGUgcGFzdAo+IDEw4oCTMTUgeWVhcnMu
Cj4gCj4gQWRkaXRpb25hbGx5LCBKRVNEMjItQTExN0UgKHBhZ2UgNiwgc2VjdGlvbiA0LjEuMi4x
KSBzcGVjaWZpZXMgZXhhbXBsZXMgb2YKPiBhY2NlcHRhYmxlIGRhdGEgcGF0dGVybnMsIGluY2x1
ZGluZyBzb2xpZC1wcm9ncmFtbWVkLCBjaGVja2VyYm9hcmQvaW52ZXJzZS0KPiBjaGVja2VyYm9h
cmQsIGFuZCBjaGVja2VyYm9hcmQtd2l0aC1maWxsIHBhdHRlcm5zLiBBY2NvcmRpbmcgdG8KPiBx
dWFsaWZpY2F0aW9uIGtub3dsZWRnZSBiYXNlcywgdXNpbmcgMHgwMCBjYW4gc29tZXRpbWVzIHRy
aWdnZXIgc3BlY2lhbAo+IGZhaWx1cmUgbW9kZXMsIHdoZXJlYXMgd3JpdGluZyAweEZGIGlzIG1v
cmUgcm9idXN0Lgo+IAo+IEFkZGl0aW9uYWxseSwgdGhlIEtpb3hpYSBUQzU4TlZHMVMzSFRBMDAg
ZGF0YXNoZWV0IChwYWdlIDYzKSBhbHNvIG5vdGVzCj4gdGhhdCBjb250aW51b3VzIHByb2dyYW0v
ZXJhc2UgY3ljbGluZyB3aXRoIGEgaGlnaCBwZXJjZW50YWdlIG9mIOKAmDAnCj4gYml0cyBpbiB0
aGUgZGF0YSBwYXR0ZXJuIGNhbiBhY2NlbGVyYXRlIGJsb2NrIGVuZHVyYW5jZSBkZWdyYWRhdGlv
bi4KPiBUaGlzIGZ1cnRoZXIgc3VwcG9ydHMgYXZvaWRpbmcgbGFyZ2UgMHgwMCBwYXR0ZXJucy4K
ClRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGFuc3dlciEKU28sIHllcyBsZXQncyBhcHBseSB0aGlz
IGNoYW5nZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
