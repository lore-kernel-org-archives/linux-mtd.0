Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D88C3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 11:03:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EEE20673
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 11:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ptzkaDFk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EEE20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsMLUeNTClmq6JfrVBlhjWPBHBbe6FrhvSl5VdEgl7E=; b=ptzkaDFkx75fUF
	J0zqO6PfaSj6ijj+dy/vlQ0ODZqJCLeVkCIvcVXhyhFVBcBdBNa5Ud4GCET5LnIH+0aozDn4wJ3UK
	LIH7o80RFh5MG4PWvH0oAptBi3lfcufTe/iwRiz6Jl5IqBCFIGb41Y8RcRtoy9rxwEKHfNPZpd2QI
	w42qF51+lEP2bLD1YPyE+bKTho3zlSRHyKTvMV80utlzjmL3KJiBOkHdJ9m6UFrEHWKpxQmBxQgcR
	B6eQ7/Tg8vDr9x5mRir9jcxyOulMU2Lda8qi+Ak5pz9bEHJ55f8CuNcyAovS0MRTqA1KXK3BQxfii
	5tBJ1vRkK6PiwBKbwVVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Tpa-0005NM-Tr; Sat, 24 Aug 2019 11:03:38 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1TpX-0005N2-UV
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 11:03:37 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F1F5D1BF206;
 Sat, 24 Aug 2019 11:03:30 +0000 (UTC)
Date: Sat, 24 Aug 2019 13:03:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH] Add support for Macronix NAND randomizer
Message-ID: <20190824130329.68f310aa@xps13>
In-Reply-To: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
References: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_040336_134736_52BE9B9C 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: kstewart@linuxfoundation.org, vigneshr@ti.com, bbrezillon@kernel.org,
 juliensu@mxic.com.tw, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
VHVlLCAyMCBBdWcgMjAxOSAxMzo1Mzo0OAorMDgwMDoKCj4gTWFjcm9uaXggTkFORHMgc3VwcG9y
dCByYW5kb21pemVyIG9wZXJhdGlvbiBmb3IgdXNlciBkYXRhIHNjcmFtYmxlZCwKPiB3aGljaCBj
YW4gYmUgZW5hYmxlZCB3aXRoIGEgU0VUX0ZFQVRVUkUuCj4gCj4gVXNlciBkYXRhIHdyaXR0ZW4g
dG8gdGhlIE5BTkQgZGV2aWNlIHdpdGhvdXQgcmFuZG9taXplciBpcyBzdGlsbCByZWFkYWJsZQo+
IGFmdGVyIHJhbmRvbWl6ZXIgZnVuY3Rpb24gZW5hYmxlZC4KPiBUaGUgcGVuYWx0eSBvZiByYW5k
b21pemVyIGFyZSBOT1AgPSAxIGluc3RlYWQgb2YgTk9QID0gNCBhbmQgbW9yZSB0aW1lIHBlcmlv
ZAoKcGxlYXNlIGRvbid0IHVzZSAnTk9QJyBoZXJlLCB1c2UgJ3N1YnBhZ2UgYWNjZXNzZXMnIGlu
c3RlYWQsIG90aGVyd2lzZQpwZW9wbGUgbWlnaHQgbm90IHVuZGVyc3RhbmQgd2hhdCBpdCBtZWFu
cyB3aGlsZSBpdCBoYXMgYSByZWFsIGltcGFjdC4KCj4gaXMgbmVlZGVkIGluIHByb2dyYW0gb3Bl
cmF0aW9uIGFuZCBlbnRlcmluZyBkZWVwIHBvd2VyLWRvd24gbW9kZS4KPiBpLmUuLCB0UFJPRyAz
MDB1cyB0byAzNDB1cyhyYW5kb21pemVyIGVuYWJsZWQpCj4gCj4gSWYgc3VicGFnZSB3cml0ZSBu
b3QgYXZhaWxhYmxlIHdpdGggaGFyZHdhcmUgRUNDLCBmb3IgZXhhbXBsZSwKPiBOQU5EIGNoaXAg
b3B0aW9ucyBOQU5EX05PX1NVQlBBR0VfV1JJVEUgYmUgc2V0IGluIGRyaXZlciBhbmQKPiByYW5k
b21pemVyIGZ1bmN0aW9uIGlzIHJlY29tbWVuZGVkIGZvciBoaWdoLXJlbGlhYmlsaXR5Lgo+IERy
aXZlciBjaGVja3MgYnl0ZSAxNjcgb2YgVmVuZG9yIEJsb2NrcyBpbiBPTkZJIHBhcmFtZXRlciBw
YWdlIHRhYmxlCj4gdG8gc2VlIGlmIHRoaXMgaGlnaC1yZWxpYWJpbGl0eSBmdW5jdGlvbiBpcyBz
dXBwb3J0ZWQuCj4gCgpZb3UgZGlkIG5vdCBmbGFnZ2VkIHRoaXMgcGF0Y2ggYXMgYSB2MiBhbmQg
Zm9yZ290IGFib3V0IHRoZSBjaGFuZ2Vsb2cuCllvdSBkaWQgbm90IGxpc3RlbiB0byBvdXIgY29t
bWVudHMgaW4gdGhlIGxhc3QgdmVyc2lvbiBuZWl0aGVyLiBJIHdhcwpvcGVuIHRvIGEgc29sdXRp
b24gd2l0aCBhIHNwZWNpZmljIERUIHByb3BlcnR5IGZvciB3YXJuZWQgdXNlcnMgYnV0IEkKZG9u
J3Qgc2VlIGl0IGNvbWluZy4KIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
