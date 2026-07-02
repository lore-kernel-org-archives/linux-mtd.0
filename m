Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45224C43327
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 05:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1lq9ullhb2QQN8O0WKguvBtZvYlMw+NE660f1n9GqVQ=; b=k/RuD/idXX1R369p5ag9vPUbDV
	Mge4F4ihGnXI88Tq+CYO227I47gNxNP56rN4zgyBlDkJhDvinEE3fOc7Ky63GvXgsIP5WLjp+7N7a
	A5twkXUobKgQd69F5NlFr/WVQadaUbDKrpGfcUUYgOirR+nHIIPDwt/ZctbINzHycCcl+3K2uEicS
	xQGZb4V/WnmeSUdRdigtXhQWKOCbEM9bJK1/CCEiFTvMZItspKrb1eI+GrxF9UGUzJG0DjA0TxamC
	JiUpQ9jMIU91RnilJvzojh9GQdCq9q/RT2B3XLmyXY5EWCOfH65SCOJDRBFM3y898fkc9yO6R2zw9
	t2QrcipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfA99-00000003bao-3PQQ;
	Thu, 02 Jul 2026 05:39:35 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfA96-00000003baS-0Xxv
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 05:39:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 398D8FB320;
	Thu,  2 Jul 2026 07:39:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id k-fFA6pOdMFv; Thu,  2 Jul 2026 07:39:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C72C29CF2B;
	Thu,  2 Jul 2026 07:39:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pAp5O9xOri5n; Thu,  2 Jul 2026 07:39:18 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8E25A2A87F7;
	Thu,  2 Jul 2026 07:39:18 +0200 (CEST)
Date: Thu, 2 Jul 2026 07:39:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, 
	Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	pratyush <pratyush@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Michael Walle <mwalle@kernel.org>, 
	Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
Message-ID: <490633873.5619.1782970758317.JavaMail.zimbra@nod.at>
In-Reply-To: <e946b3c6-304a-4015-a144-285e7f2f4e6a@alliedtelesis.co.nz>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com> <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz> <490fc98b2996487fba3abd62176bb1dd@infineon.com> <8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz> <99731a393e5649e692afe57f59d5926b@infineon.com> <e946b3c6-304a-4015-a144-285e7f2f4e6a@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF151 (Linux)/8.8.12_GA_3809)
Thread-Topic: Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT support"
Thread-Index: AQHdBRJ8+HvBPYSwmEi4Lf0sk+8LHLZV9jcAgADe8oCAAER1AIAAEDcAgACAk4CAAQSDAIAAFjqAgAAHAgDqoturHg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_223932_343415_EC4B6183 
X-CRM114-Status: UNSURE (   9.31  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzIFBhY2toYW0iIDxD
aHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+Cj4+PiBPbiBXZWQsIDIwMjYtMDctMDEg
YXQgMDk6NDkgKzAwMDAsIFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20gd3JvdGU6Cj4+Pj4g
SSBkaWRuJ3QgbWVhbiBhbnkga2VybmVsIGZlYXR1cmVzLCBidXQgd2UgY2FuIGR1bXAgdG1wZnMg
Y29udGVudHMKPj4+PiBmcm9tL3RvIEZSQU0gY2hpcCAoZXhwb3NlZCBhcyBOVk1FTSBkZXZpY2Up
IGJ5ICdkZCcuIERvZXNuJ3QgaXQgbWVldAo+Pj4+IHlvdXIgc3lzdGVtJ3MgcmVxdWlyZW1lbnQ/
Cj4+PiBEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZSBjcmVhdGluZyBhIHRtcGZzIGFuZCB0aGVu
IHNheSwgdXNpbmcgYHRhcmAKPj4+IGFuZCBjb3B5aW5nIHRoZSBkYXRhIHRvIG52bWVtIHdpdGgg
ZGQgYW5kIHJlc3RvcmluZyB0aGlzIGRhdGEgYXQgYm9vdD8KPj4gWWVzLCBJIG1lYW50IHNvbWV0
aGluZyBsaWtlIHRoYXQgKHNvcnJ5LCBteSBjb21tZW50IHdhcyBzdGlsbCBub3QgY2xlYXIpLgo+
PiBIb3BlIHRoYXQncyB3b3J0aCBjb25zaWRlcmluZy4KPiAKPiBJdCB3b24ndCBxdWl0ZSB3b3Jr
LiBCZWNhdXNlIHdlIGhhdmUgcmVxdWlyZW1lbnRzIGludm9sdmluZyBlbnN1cmluZwo+IHdoZW4g
YSBmaWxlIGlzIGVyYXNlZCBpdCBpcyBnb25lIEFTQVAgKGkuZS4gc2hyZWQpLiBJdCdzIGFsbCBh
IGJpdCBvZgo+IHNlY3VyaXR5IHRoZWF0ZXIgYmVjYXVzZSBpbiByZWFsaXR5IHRoZSBzYWZlc3Qg
dGhpbmcgd291bGQgYmUgdG8ga2VlcAo+IHN1Y2ggc2VjcmV0cyBpbiBhIFRQTSBvciBwcm90ZWN0
ZWQgd2l0aCBhIGtleSBzdG9yZWQgaW4gYSBUUE0uCgpEbyB5b3UgcmVhbGx5IG5lZWQgKFBPU0lY
KSBmaWxlIHN5c3RlbSBzZW1hbnRpY3M/CllvdSBjb3VsZCBwYXJ0aXRpb24gdGhlIEZSQU0gaW50
byBjZWxscyBhbmQgdGhlbiB3b3JrIHdpdGggdGhlbS4KZS5nLiBKdXN0IGRkIGludG8gaXQgYW5k
IGVyYXNlIGl0IHdoZW4gbmVlZGVkLi4uCk1heWJlIHRoZSBOVk1FTSBjZWxscyBtZWNoYW5pc20g
bmVlZHMgc29tZSBwb2xpc2hpbmcgYnV0IHRoaXMgc291bmRzCnJlYXNvbmFibGUgdG8gbWUuCgpU
aGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
