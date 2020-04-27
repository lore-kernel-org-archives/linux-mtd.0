Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EB5C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7457520775
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jjij93H0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7457520775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTGVh8ivpAxqsXd5nZXeQh0go3QEQ7BRbgKobDhVQlQ=; b=Jjij93H0x/ZAuc
	fhQ2TzCGIoYghh5okot69XqwJDOt26GncSzz76BZMIHs7xH6s5BV4NYYnFIerAnyTtNlW03Fp5hOD
	CBWAecjBTTAn5465P8Fd7O1aC2BH6ULPR2PWCCovLp9KaL75t03De+CCd1C9INR0dx0Y64QPkc9P/
	mlXsCr55fguf8aGzaJ8MNDF3f1KeiW/AiWyX21+pe2H/tA3ARpyzkJgZd7oJmUfP+UuTmZKnsNXtL
	V2ViynnQjFDYkoSD/h/q0p1dfpY9u40H4BBdMmnLJoZZOQq1k8igbsG7Qf0FwG83voenctrpmHyh8
	PaDwMrHoyexa8aLYaIlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9EF-0007FS-5P; Mon, 27 Apr 2020 19:15:43 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9EC-0007EQ-M9
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:15:42 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 81C58C0006;
 Mon, 27 Apr 2020 19:15:36 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:15:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 2/3] mtd: lpddr: Replace printk with pr_notice
Message-ID: <20200427211534.01b57587@xps13>
In-Reply-To: <67c4b34d-019d-e4c9-ebd2-3a8477470048@embeddedor.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
 <c9684a22b661fdeff9efcd5b18be01653911fc89.1588013366.git.gustavo@embeddedor.com>
 <d036dbad02241fdeb0a6400896f73ff11e98e53b.camel@perches.com>
 <67c4b34d-019d-e4c9-ebd2-3a8477470048@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_121540_852935_9160D419 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: Joe Perches <joe@perches.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gTW9uLCAyNyBBcHIKMjAyMCAxNDoxMDozNiAtMDUwMDoKCj4gT24gNC8yNy8y
MCAxNDowMSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiBPbiBNb24sIDIwMjAtMDQtMjcgYXQgMTQ6
MDMgLTA1MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6ICAKPiA+PiBwcl9ub3RpY2UgaXMg
cHJlZmVycmVkIG92ZXIgcHJpbnRrLiAgCj4gPiAKPiA+IFNvIGlzIGNvYWxlc2NpbmcgZm9ybWF0
cwo+ID4gCj4gPiA/IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9wZm93LmggYi9pbmNs
dWRlL2xpbnV4L210ZC9wZm93LmgKPiA+IFtdICAKPiA+PiBAQCAtMTI3LDMxICsxMjcsMzEgQEAg
c3RhdGljIGlubGluZSB2b2lkIHByaW50X2Ryc19lcnJvcih1bnNpZ25lZCBkc3IpCj4gPj4gIAlp
bnQgcHJvZ19zdGF0dXMgPSAoZHNyICYgRFNSX1JQUykgPj4gODsKPiA+PiAgCj4gPj4gIAlpZiAo
IShkc3IgJiBEU1JfQVZBSUxBQkxFKSkKPiA+PiAtCQlwcmludGsoS0VSTl9OT1RJQ0UiRFNSLjE1
OiAoMCkgRGV2aWNlIG5vdCBBdmFpbGFibGVcbiIpOwo+ID4+ICsJCXByX25vdGljZSgiRFNSLjE1
OiAoMCkgRGV2aWNlIG5vdCBBdmFpbGFibGVcbiIpOwo+ID4+ICAJaWYgKChwcm9nX3N0YXR1cyAm
IDB4MDMpID09IDB4MDMpCj4gPj4gLQkJcHJpbnRrKEtFUk5fTk9USUNFIkRTUi45LDg6ICgxMSkg
QXR0ZW1wdCB0byBwcm9ncmFtIGludmFsaWQgIgo+ID4+ICsJCXByX25vdGljZSgiRFNSLjksODog
KDExKSBBdHRlbXB0IHRvIHByb2dyYW0gaW52YWxpZCAiCj4gPj4gIAkJCQkJCSJoYWxmIHdpdGgg
NDFoIGNvbW1hbmRcbiIpOyAgCj4gPiAKPiA+IAkJcHJfbm90aWNlKCJEU1IuOSw4OiAoMTEpIEF0
dGVtcHQgdG8gcHJvZ3JhbSBpbnZhbGlkIGhhbGYgd2l0aCA0MWggY29tbWFuZFxuIik7Cj4gPiAg
IAo+IAo+IEkgZGlkbid0IHdhbnQgdG8gbWVzcyB3aXRoIHRoZSByZXN0IG9mIGZvcm1hdCwgYmVj
YXVzZSBzb21lIG1haW50YWluZXJzCj4gZG9uJ3QgbGlrZSB0aGF0LiBJZiBNaXF1ZWwgaXMgT0sg
d2l0aCB0aGF0LCBJIGNhbiBmaXggdGhhdCB1cCwgdG9vLgo+IAo+IFRoYW5rcwo+IC0tCj4gR3Vz
dGF2bwoKSSdtIGZpbmUgd2l0aCBpdCBpbiB0aGlzIGNhc2UsIGp1c3QgbWVudGlvbiBpdCBpbiB0
aGUgY29tbWl0IGxvZywKcGxlYXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
