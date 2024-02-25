Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECFCC47DD9
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Feb 2024 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8rGEHMDT3kI/5HVmRKIMrndjA7MVs8MlwWwvDbVq3ss=; b=Mxl7GT5+oFQdY5acIKS4n1XQfa
	TLUBo3NLjZwXF6edSBzQN0eHES53Y5Yrid0z74A2bTCbtfifoVHDPfpTPcy0x/i7bSGa8scxPJyxf
	ija3xxkeZ+BPL8oko3MHsIUAvRJuDGuSMQaee4iuLy2o1QJ2gij5wTAx2Z5aWxQTH/GVOnZa4fJwy
	dOwZBYy14VJ8QlLFN/kKA6jIXodwc1CcCKj8moixHIpT1jY8nOs70uz+V8NbPKfsti1tIUKEdgenS
	9npx1FSAY5zikb734oIHyPjfc1yTNJVhWbECbHbbfHQ0j6SqGiDIQ9jmgRkzLIhjG4wQZZOlE32Wf
	FE1WV7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reMku-0000000FpOC-26OI;
	Sun, 25 Feb 2024 22:13:56 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reMkq-0000000FpN1-35AO
	for linux-mtd@lists.infradead.org;
	Sun, 25 Feb 2024 22:13:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 842D06340E18;
	Sun, 25 Feb 2024 23:13:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id atEeRX66JKN9; Sun, 25 Feb 2024 23:13:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 356C763434FE;
	Sun, 25 Feb 2024 23:13:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sQRS8scFEMay; Sun, 25 Feb 2024 23:13:51 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 19B5F6340E18;
	Sun, 25 Feb 2024 23:13:51 +0100 (CET)
Date: Sun, 25 Feb 2024 23:13:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1250860844.98494.1708899231067.JavaMail.zimbra@nod.at>
In-Reply-To: <625776491.56064.1708030469766.JavaMail.zimbra@nod.at>
References: <20240120230824.2619716-1-willy@infradead.org> <Zc54F3q6O1gYiMA4@casper.infradead.org> <625776491.56064.1708030469766.JavaMail.zimbra@nod.at>
Subject: Re: [PATCH 00/15] ubifs folio conversion
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs folio conversion
Thread-Index: abpGAu6gZm6xIHnvBkhcr716Rf5v6V+MRegm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_141352_941127_6A33FFC8 
X-CRM114-Status: UNSURE (   5.46  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1h
aWwgLS0tLS0KPj4gVm9uOiAiTWF0dGhldyBXaWxjb3giIDx3aWxseUBpbmZyYWRlYWQub3JnPgo+
PiBPbiBTYXQsIEphbiAyMCwgMjAyNCBhdCAxMTowODowOFBNICswMDAwLCBNYXR0aGV3IFdpbGNv
eCAoT3JhY2xlKSB3cm90ZToKPj4+IFRoaXMgcGF0Y2hzZXQgY29udmVydHMgdWJpZnMgdG8gdXNl
IGZvbGlvcyB0aHJvdWdob3V0LiAgSSBtYWRlIHNvbWUKPj4+IGF0dGVtcHQgdG8gc3VwcG9ydCBs
YXJnZSBmb2xpb3MsIGJ1dCBtb3JlIHdvcmsgZGVmaW5pdGVseSBuZWVkcyB0byBiZQo+Pj4gZG9u
ZSBiZWZvcmUgaXQgY2FuIGJlIGVuYWJsZWQuICBJdCdzIG5vdCBjbGVhciB0byBtZSB3aGV0aGVy
IGl0J3Mgd29ydGgKPj4+IGRvaW5nLCBzbyBJJ3ZlIGxlZnQgdGhhdCBmb3IgeW91IDstKQo+PiAK
Pj4gSXQncyBiZWVuIGZvdXIgd2Vla3MgLi4uIGRvIEkgbmVlZCB0byBkbyBhbnl0aGluZyB0byBt
YWtlIHN1cmUgdGhpcyBoaXRzCj4+IHRoZSBuZXh0IG1lcmdlIHdpbmRvdz8KPiAKPiBOb3BlLCBJ
J2xsIGFkZCBpdCB0byB1Ymlmcy9uZXh0IHNvb24uIDotKQoKSSdtIG5vdCBzdXJlIHdoZXRoZXIg
eW91J3JlIGNoZWNraW5nIHRoZSBNVEQgcGF0Y2h3b3JrIHN0YXR1cy4KU28sIHBhdGNoZXMgYXBw
bGllZC4gOikKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
