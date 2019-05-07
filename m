Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D544C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:49:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CF820B7C
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqsgxAox"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CF820B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjDHtKGcpGBAairYVuai9WGrWYbfw2BybhJPkeTE1nI=; b=IqsgxAoxYBX/wx
	xWgOUnV4T3dBCGaDYiqalmMfcCjcofQJlQrk5pbnquJDsIOUSk3fR5O/KehblOU8PJs00zZidrNTC
	JSD53Hc6fkL31DVsL8ikJHHP08GkdsEMOjZ8WfTaerMDOAWxJbwrSKxphyk9NNEo1G+/JT3AADqUW
	H5s7td/0gALQw3SJphlHYgDZYMXMPK5m3jz8BQnsJX0jLG3WsCji7i2LSbogwwJszz3aqePpFyuCq
	YptklsarsZ9DtAzi+4c1ZMrssaXebB8KlG7ZKSkFEOk2aV5zTYp6ALt03onWeFLPctX10K9qEkdXk
	0ynmJi8ga36j5rhIQ07w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO2LB-0004KS-7r; Tue, 07 May 2019 15:49:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO2L7-0004K8-8G
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 15:49:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 58C0B608F446;
 Tue,  7 May 2019 17:49:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8Su0dz-W26oG; Tue,  7 May 2019 17:49:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0322C6083105;
 Tue,  7 May 2019 17:49:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 31Kf02fmxQu5; Tue,  7 May 2019 17:49:05 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C33C26083104;
 Tue,  7 May 2019 17:49:05 +0200 (CEST)
Date: Tue, 7 May 2019 17:49:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <785015370.48464.1557244145722.JavaMail.zimbra@nod.at>
In-Reply-To: <3034821c-3cd0-b0c5-a6fd-548fd87486a4@embeddedor.com>
References: <20190208180202.GA16603@embeddedor>
 <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
 <71df15e7-af2e-0326-78fe-0271a1e240fe@embeddedor.com>
 <20190415104458.7faeec57@xps13>
 <ee1f8c4a-92b0-db9d-6110-3acadeb9e457@embeddedor.com>
 <20190416192408.0e321563@xps13>
 <8df20a3a-3068-1fb7-0421-e6c417550125@embeddedor.com>
 <3034821c-3cd0-b0c5-a6fd-548fd87486a4@embeddedor.com>
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: cfi_util: mark expected switch fall-throughs
Thread-Index: c1PkOuWOdQy8fEL4I6CUz4FzFPRcPA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_084909_587848_3D4C2DE7 
X-CRM114-Status: GOOD (  15.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Kees Cook <keescook@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkd1c3Rhdm8gQS4gUi4gU2ls
dmEiIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ0M6ICJEYXZpZCBXb29kaG91c2UiIDxkd213MkBpbmZy
YWRlYWQub3JnPiwgIkJyaWFuIE5vcnJpcyIgPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4s
ICJCb3JpcyBCcmV6aWxsb24iCj4gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4sICJNYXJlayBWYXN1
dCIgPG1hcmVrLnZhc3V0QGdtYWlsLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAi
bGludXgtbXRkIgo+IDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJu
ZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgIktlZXMgQ29vayIgPGtlZXNjb29r
QGNocm9taXVtLm9yZz4KPiBHZXNlbmRldDogRGllbnN0YWcsIDcuIE1haSAyMDE5IDE2OjU0OjEy
Cj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gbXRkOiBjZmlfdXRpbDogbWFyayBleHBlY3RlZCBzd2l0
Y2ggZmFsbC10aHJvdWdocwoKPiBIaSBhbGwsCj4gCj4gVGhhbmtzIGEgbG90IGZvciB0aGlzLCBS
aWNoYXJkOgo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L210ZC9saW51eC5naXQvbG9nLz9oPW10ZCUyRm5leHQmcXQ9Z3JlcCZxPWZhbGwtdGhyb3Vn
aAo+IAo+IFRoZXJlIGFyZSBvbmx5IHR3byBvZiB0aGVzZSB3YXJuaW5ncyBsZWZ0IHRvIGJlIGFk
ZHJlc3NlZCBpbgo+IE1URFsxXToKPiAKPiAgICAgICAgPiBAQCAtMzI4MCwxMiArMzI4MCwxNCBA
QCBzdGF0aWMgdm9pZCBvbmVuYW5kX2NoZWNrX2ZlYXR1cmVzKHN0cnVjdCBtdGRfaW5mbyAqbXRk
KQo+ICAgICAgICA+ICAgICAgICAgICAgICAgICAgICAgICBpZiAoKHRoaXMtPnZlcnNpb25faWQg
JiAweGYpID09IDB4ZSkKPiAgICAgICAgPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTX05PUF8xOwo+ICAgICAgICA+ICAgICAgICAgICAg
ICAgfQo+ICAgICAgICA+ICsgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4gICAgICAg
ID4KPiAgICAgICAgPiAgICAgICBjYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMkdiOgo+ICAg
ICAgICA+ICAgICAgICAgICAgICAgLyogMkdiIEREUCBkb2VzIG5vdCBoYXZlIDIgcGxhbmUgKi8K
PiAgICAgICAgPiAgICAgICAgICAgICAgIGlmICghT05FTkFORF9JU19ERFAodGhpcykpCj4gICAg
ICAgID4gICAgICAgICAgICAgICAgICAgICAgIHRoaXMtPm9wdGlvbnMgfD0gT05FTkFORF9IQVNf
MlBMQU5FOwo+ICAgICAgICA+ICAgICAgICAgICAgICAgdGhpcy0+b3B0aW9ucyB8PSBPTkVOQU5E
X0hBU19VTkxPQ0tfQUxMOwo+ICAgICAgICA+ICsgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdo
ICovCj4gCj4gICAgICAgIFRoaXMgbG9va3Mgc3RyYW5nZS4KPiAKPiAgICAgICAgSW4gT05FTkFO
RF9ERVZJQ0VfREVOU0lUWV8yR2I6Cj4gICAgICAgIE9ORU5BTkRfSEFTX1VOTE9DS19BTEwgaXMg
c2V0IHVuY29uZGl0aW9uYWxseS4KPiAKPiAgICAgICAgQnV0IHRoZW4sIHVuZGVyIE9ORU5BTkRf
REVWSUNFX0RFTlNJVFlfMUdiLCB0aGUgc2FtZSBvcHRpb24gaXMgc2V0IG9ubHkKPiAgICAgICAg
aWYgcHJvY2VzcyBpcyBldmFsdWF0ZWQgdG8gdHJ1ZS4KPiAKPiAgICAgICAgU2FtZSBwcm9ibGVt
IHdpdGggT05FTkFORF9IQVNfMlBMQU5FOgo+ICAgICAgICAtIGl0IGlzIHNldCBpbiBPTkVOQU5E
X0RFVklDRV9ERU5TSVRZXzRHYiBvbmx5IGlmIE9ORU5BTkRfSVNfRERQKCkKPiAgICAgICAgLSBp
dCBpcyB1bnNldCBpbiBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzJHYiBvbmx5IGlmICFPTkVOQU5E
X0lTX0REUCgpCj4gCj4gICAgICAgIE1heWJlIHRoaXMgcG9ydGlvbiBzaG91bGQgYmUgcmV3b3Jr
ZWQgYmVjYXVzZSBJIGFtIHVuc3VyZSBpZiB0aGlzIGlzIGEKPiAgICAgICAgbWlzc2luZyBmYWxs
IHRocm91Z2ggb3IgYSBidWcuCj4gCj4gCj4gVGhhbmtzCj4gLS0KPiBHdXN0YXZvCj4gCj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMDM2MjUxLwoKRGlkIHdl
IG1pc3MgdGhpcyBwYXRjaD8gQUZBSUNUIGl0IGlzIGluIC1uZXh0IHRvby4KClRoYW5rcywKLy9y
aWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
