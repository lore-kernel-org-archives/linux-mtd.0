Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5111EC6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aDLIMkqMmukc6jtddeaPcniaRwjzNoG0RTZUUPm/ink=; b=pgfedWtF3wCwvzRl9ESg5XHraV
	6fuJ80B5kyvIEtDVXzWzHEP73Y8NvoQr9HQXn0zH/5h01MUepE1UtB1u+Hkx1AZVqNBOzlH0OlxXl
	WQqyhzkQzOPEQCV/99w6e7Ou2CRqot1edUimVmMP/dT/EDuJ6LykVvJjKKEVfSUj3RP9AMG8cjuxS
	kunFkOfnrnjL4Y53EuTi1jvjOQZBZI4oCEPj5pib9Nqp39VRSVSlAcfV/ZY92rM37+NYLEzmUteNi
	xvJ3yRpOMm/V29PZya5pOrpA9qnh4UpEorxUdzUib0BgDLlRuEKERPyx0pKWrbmpk301sVaqg8Iu6
	y3eHHPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1r0-00GlNA-2M;
	Wed, 22 Mar 2023 17:02:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1qs-00GlJh-1M
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 17:02:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D421F6431C2E;
	Wed, 22 Mar 2023 18:02:11 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 5O8DagyRu-Wg; Wed, 22 Mar 2023 18:02:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3A19E61989EA;
	Wed, 22 Mar 2023 18:02:11 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YVeIiaZh7mZI; Wed, 22 Mar 2023 18:02:11 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1710761989E6;
	Wed, 22 Mar 2023 18:02:11 +0100 (CET)
Date: Wed, 22 Mar 2023 18:02:10 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Yangtao Li <frank.li@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <462173384.277322.1679504530972.JavaMail.zimbra@nod.at>
In-Reply-To: <20230322165905.55389-4-frank.li@vivo.com>
References: <20230322165905.55389-1-frank.li@vivo.com> <20230322165905.55389-4-frank.li@vivo.com>
Subject: Re: [PATCH v3 05/10] ubifs: convert to kobject_del_and_put()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: convert to kobject_del_and_put()
Thread-Index: gpQy2dclbZOSlO48/BHuEnRTh4PO1A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_100218_627019_09ED2186 
X-CRM114-Status: UNSURE (   8.92  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIllhbmd0YW8gTGkiIDxmcmFu
ay5saUB2aXZvLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBDQzogIllh
bmd0YW8gTGkiIDxmcmFuay5saUB2aXZvLmNvbT4sICJHcmVnIEtyb2FoLUhhcnRtYW4iIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4sICJSYWZhZWwgSi4gV3lzb2NraSIKPiA8cmFmYWVsQGtl
cm5lbC5vcmc+LCAiRGFtaWVuIExlIE1vYWwiIDxkYW1pZW4ubGVtb2FsQG9wZW5zb3VyY2Uud2Rj
LmNvbT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sCj4gImxp
bnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IE1p
dHR3b2NoLCAyMi4gTcOkcnogMjAyMyAxNzo1OTowMAo+IEJldHJlZmY6IFtQQVRDSCB2MyAwNS8x
MF0gdWJpZnM6IGNvbnZlcnQgdG8ga29iamVjdF9kZWxfYW5kX3B1dCgpCgo+IFVzZSBrb2JqZWN0
X2RlbF9hbmRfcHV0KCkgdG8gc2ltcGxpZnkgY29kZS4KPiAKPiBDYzogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogIlJhZmFlbCBKLiBXeXNvY2tp
IiA8cmFmYWVsQGtlcm5lbC5vcmc+Cj4gQ2M6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2Fs
QG9wZW5zb3VyY2Uud2RjLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5s
aUB2aXZvLmNvbT4KPiAtLS0KPiBmcy91Ymlmcy9zeXNmcy5jIHwgMyArLS0KPiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Zz
L3ViaWZzL3N5c2ZzLmMgYi9mcy91Ymlmcy9zeXNmcy5jCj4gaW5kZXggMWM5NTgxNDhiYjg3Li45
NTcxNzE4ZTYxYTkgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvc3lzZnMuYwo+ICsrKyBiL2ZzL3Vi
aWZzL3N5c2ZzLmMKPiBAQCAtMTMwLDggKzEzMCw3IEBAIGludCB1Ymlmc19zeXNmc19yZWdpc3Rl
cihzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAKPiB2b2lkIHViaWZzX3N5c2ZzX3VucmVnaXN0ZXIo
c3RydWN0IHViaWZzX2luZm8gKmMpCj4gewo+IC0Ja29iamVjdF9kZWwoJmMtPmtvYmopOwo+IC0J
a29iamVjdF9wdXQoJmMtPmtvYmopOwo+ICsJa29iamVjdF9kZWxfYW5kX3B1dCgmYy0+a29iaik7
Cj4gCXdhaXRfZm9yX2NvbXBsZXRpb24oJmMtPmtvYmpfdW5yZWdpc3Rlcik7CgpBY2tlZC1ieTog
UmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
