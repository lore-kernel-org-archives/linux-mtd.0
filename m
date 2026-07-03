Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4377AC43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 05:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YUudvY/ReATYpAGAfmOcemQhgPAuvFaOc+zWlp2lKyo=; b=0YJ5PkKfwbaIRVW1MgmuNQ7JyL
	tr2yfUQ5xzqdtnB/876kPPXqVSiHEGrqPO+ntINR3xjnvYtFmiA5i3YQ8KpCUnJqvYrRJAQWM4jpT
	kMrsrRh+U4bpaRYZfpnibaWbA2clXCmsxDWBpVXDpQwlwwW8Fxe/4fL6+O6ZH9O81rIvx/St1Um2h
	JL4CRHpn5VOpldEk7McsLCjnGuNNGpGgGSPnWOy+q1LMy16akAV+UX4lu5DFEXE4f7P1MJ0iHRozK
	eehpnngXMH+autr275140rJKZ8DvtzFh46JyXxgs4fwPPxIgh70EqivSI7T80GrY3ZQ0xidPDgrJQ
	+aKVYMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWj5-000000066Vq-2iTf;
	Fri, 03 Jul 2026 05:46:11 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWj3-000000066V5-0a8b
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 05:46:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B664C2A87F7;
	Fri,  3 Jul 2026 07:45:58 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8xxTYfod0syk; Fri,  3 Jul 2026 07:45:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 27014FB322;
	Fri,  3 Jul 2026 07:45:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0dtgxY-WTfaK; Fri,  3 Jul 2026 07:45:57 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0557FD5C97;
	Fri,  3 Jul 2026 07:45:57 +0200 (CEST)
Date: Fri, 3 Jul 2026 07:45:56 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, 
	pratyush <pratyush@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>, 
	Michael Walle <mwalle@kernel.org>
Message-ID: <183302295.10735.1783057556804.JavaMail.zimbra@nod.at>
In-Reply-To: <a86e2233c6ea01b1dcefb8c7f7f582725a25b5e5.camel@alliedtelesis.co.nz>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com> <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz> <490fc98b2996487fba3abd62176bb1dd@infineon.com> <8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz> <99731a393e5649e692afe57f59d5926b@infineon.com> <e946b3c6-304a-4015-a144-285e7f2f4e6a@alliedtelesis.co.nz> <490633873.5619.1782970758317.JavaMail.zimbra@nod.at> <a86e2233c6ea01b1dcefb8c7f7f582725a25b5e5.camel@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF151 (Linux)/8.8.12_GA_3809)
Thread-Topic: Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT support"
Thread-Index: AQHdBRJ8+HvBPYSwmEi4Lf0sk+8LHLZV9jcAgADe8oCAAER1AIAAEDcAgACAk4CAAQSDAIAAFjqAgAAHAgDqoturHpVef02A8b9b3lU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_224609_328840_F68590E7 
X-CRM114-Status: GOOD (  11.85  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJvbmFuIERhbHRvbiIgPFJv
bmFuLkRhbHRvbkBhbGxpZWR0ZWxlc2lzLmNvLm56Pgo+IE9uIFRodSwgMjAyNi0wNy0wMiBhdCAw
NzozOSArMDIwMCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+PiBEbyB5b3UgcmVhbGx5IG5l
ZWQgKFBPU0lYKSBmaWxlIHN5c3RlbSBzZW1hbnRpY3M/Cj4+IFlvdSBjb3VsZCBwYXJ0aXRpb24g
dGhlIEZSQU0gaW50byBjZWxscyBhbmQgdGhlbiB3b3JrIHdpdGggdGhlbS4KPj4gZS5nLiBKdXN0
IGRkIGludG8gaXQgYW5kIGVyYXNlIGl0IHdoZW4gbmVlZGVkLi4uCj4+IE1heWJlIHRoZSBOVk1F
TSBjZWxscyBtZWNoYW5pc20gbmVlZHMgc29tZSBwb2xpc2hpbmcgYnV0IHRoaXMgc291bmRzCj4+
IHJlYXNvbmFibGUgdG8gbWUuCj4gCj4gWWVzLCB0aGF0IGNvdWxkIHdvcmsgZm9yIHNlY3JldHMg
c3RvcmFnZS4gSG93ZXZlciB3ZSBhbHNvIHN0b3JlCj4gcGVyc2lzdGVudCBsb2dzIGFuZCBESENQ
IGxlYXNlcyBvbiB0aGlzIGZsYXNoIHRvIG1pbmltaXplIHJlYWQvd3JpdGVzCj4gb24gdGhlIG1h
aW4gZmxhc2gsIGFuZCB0aGlzIGRhdGEgaXMgc3RvcmVkIGFzIGZpbGVzIG9mIHZhcnlpbmcgbGVu
Z3Rocy4KPiBBIGZpbGVzeXN0ZW0gcHJvdmlkZXMgdGhlIG1vc3Qgc3RyYWlnaHRmb3J3YXJkIHdh
eSBvZiBzdG9yaW5nIHRoaXMgZGF0YQo+IGZvciB1cy4KCkJ1dCB0aGUgc3RvcmFnZSAoRlJBTSkg
eW91IGNob3NlIGlzIG5vdCBzdWl0YWJsZSBmb3IgYW55IHJlYWwgZmlsZXN5c3RlbS4KSW4gYSBw
cmV2aW91cyBtYWlsIHlvdSBzYWlkIHlvdSB1c2UgZXh0MiBvbiBpdC4KSSBoYXZlIGEgaGFyZCB0
aW1lIHRvIHNlZSBob3cgdXNpbmcgZXh0MiBvbiB0b3Agb2YgbXRkYmxvY2sgb24gYW4gRlJBTQpk
b2VzIG5vdCBlbmQgaW4gYSBkaXNhc3Rlci4KCj4gVGhhdCdzIG5vdCB0byBzYXkgd2UgY291bGRu
J3QgZGV2ZWxvcCBzb21lIHN5c3RlbSBvZiB1c2luZyB0aGUgbnZtZW0KPiBkZXZpY2UgYXMgYSBi
YWNrZW5kIGZvciB0aGlzIGRhdGEuIFRoaXMgbWF5IGJlIHNvbWV0aGluZyB3ZSBsb29rIGF0IGlu
Cj4gdGhlIGZ1dHVyZS4KCk1heWJlIEZVU0UgY2FuIGhlbHAgd2l0aCBidWlsZGluZyBhIHN1cGVy
IHNpbXBsZSBmaWxlc3lzdGVtIHdoaWNoIHByb3ZpZGVzCmp1c3QgZW5vdWdoIHRvIGZ1bGZpbGwg
eW91ciB1c2UgY2FzZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
