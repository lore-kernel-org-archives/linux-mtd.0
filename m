Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C01C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 09:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D630C2082C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 09:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sq9cqOlk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D630C2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/lvc3CW2sA43D6qM1eGsRv5+DZDdyNs1IgoVB8j/ts=; b=Sq9cqOlkNkgLXw
	1+v2qJM5liUEQkaSFrt2wGheGYcFnQ2GPHtllSh5sAukO9ralTFz+RtZ6u0LIPB3OFlu+XQv8WSaH
	BDPWVLYBoqciKt2qPK1qwvSgSJKCNTbxWEHS/zXYdDON34dFB5BChYrbOFil3NF4lWIkuur1CNO5O
	4Kp++QUsNZYPfmoojdZN2fDEUVZ0gCktwlAZllnpp0tDuMcc1qAl7iNhwq5XhNAWNpwbBs+SXYNru
	+Ie030wJwWCirOJl2t6JHDseXAarZ/bRVRDXTEvqq/ztg70wri8Lx3gb30vuU3V0sgtJgw+oJv5eU
	VLQyFY9c6F+sXhoKt0yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBFPG-00077B-Ec; Tue, 02 Apr 2019 09:08:34 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBFPD-00076s-AR
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 09:08:33 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5C1C44002C;
 Tue,  2 Apr 2019 09:08:27 +0000 (UTC)
Date: Tue, 2 Apr 2019 11:08:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: MTD Git repository is hosted on
 kernel.org
Message-ID: <20190402110826.738329f4@xps13>
In-Reply-To: <20190401150938.10607-2-miquel.raynal@bootlin.com>
References: <20190401150938.10607-1-miquel.raynal@bootlin.com>
 <20190401150938.10607-2-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_020831_513130_78A19139 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBNb24sICAxIEFwciAyMDE5CjE3OjA5OjM4ICswMjAwOgoKPiBCZWNhdXNlIG9mIHRoZSBzbG93
bmVzcyBvZiB0aGUgaW5mcmFkZWFkLm9yZyBzZXJ2ZXIsIExpbnVzIHJlcXVlc3RlZAo+IHRoYXQg
d2Ugc2VuZCBoaW0gUFJzIGZyb20gYW5vdGhlciBkb21haW4uIFdlIG1vdmVkIG91ciBHaXQgcmVw
b3NpdG9yeQo+IHRvIGtlcm5lbC5vcmcgYW5kIG1haW50YWluIHRoZSBmb2xsb3dpbmcgYnJhbmNo
ZXM6Cj4gKiBGaXhlcyBiYXNlZCBvbiB0aGUgbGFzdCAtcmM6IG10ZC9maXhlcywgbmFuZC9maXhl
cywgc3BpLW5vci9maXhlcy4KPiAqIE5leHQgYnJhbmNoIGJhc2VkIHVzdWFsbHkgb24gLXJjMTog
bXRkL25leHQsIG5hbmQvbmV4dCwgc3BpLW5vci9uZXh0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIE1BSU5UQUlO
RVJTIHwgMTIgKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKPiBpbmRleCAzODM5MTVkNjlhNTEuLjQ1YjRkNGFkNTkwNyAxMDA2NDQKPiAtLS0gYS9NQUlO
VEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTEwMDA0LDggKzEwMDA0LDggQEAgTToJ
VmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+ICBMOglsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+ICBXOglodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRlYWQub3Jn
Lwo+ICBROglodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlz
dC8KPiAtVDoJZ2l0IGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL2xpbnV4LW10ZC5naXQgbWFzdGVy
Cj4gLVQ6CWdpdCBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1tdGQuZ2l0IG10ZC9uZXh0
Cj4gK1Q6CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bXRkL2xpbnV4LmdpdCBtdGQvZml4ZXMKPiArVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0Cj4gIFM6CU1haW50
YWluZWQKPiAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC8KPiAgRjoJ
ZHJpdmVycy9tdGQvCj4gQEAgLTEwNjE3LDggKzEwNjE3LDggQEAgUjoJUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4KPiAgTDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiAgVzoJaHR0cDovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy8KPiAgUToJaHR0cDovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvCj4gLVQ6CWdpdCBnaXQ6
Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1tdGQuZ2l0IG5hbmQvZml4ZXMKPiAtVDoJZ2l0IGdp
dDovL2dpdC5pbmZyYWRlYWQub3JnL2xpbnV4LW10ZC5naXQgbmFuZC9uZXh0Cj4gK1Q6CWdpdCBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4Lmdp
dCBuYW5kL2ZpeGVzCj4gK1Q6CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQKPiAgUzoJTWFpbnRhaW5lZAo+ICBG
Oglkcml2ZXJzL210ZC9uYW5kLwo+ICBGOglpbmNsdWRlL2xpbnV4L210ZC8qbmFuZCouaAo+IEBA
IC0xNDYwMyw4ICsxNDYwMyw4IEBAIE06CVR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWlj
cm9jaGlwLmNvbT4KPiAgTDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAgVzoJaHR0
cDovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy8KPiAgUToJaHR0cDovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvCj4gLVQ6CWdpdCBnaXQ6Ly9naXQuaW5m
cmFkZWFkLm9yZy9saW51eC1tdGQuZ2l0IHNwaS1ub3IvZml4ZXMKPiAtVDoJZ2l0IGdpdDovL2dp
dC5pbmZyYWRlYWQub3JnL2xpbnV4LW10ZC5naXQgc3BpLW5vci9uZXh0Cj4gK1Q6CWdpdCBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBz
cGktbm9yL2ZpeGVzCj4gK1Q6CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBzcGktbm9yL25leHQKPiAgUzoJTWFpbnRhaW5lZAo+
ICBGOglkcml2ZXJzL210ZC9zcGktbm9yLwo+ICBGOglpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9y
LmgKCkFjdHVhbGx5IHRoZSBuYW5kL2ZpeGVzIGFuZCBzcGktbm9yL2ZpeGVzIGJyYW5jaGVzIGFy
ZSBub3QgZ29pbmcgdG8gYmUKdXNlZCBhbnltb3JlLCBzbyBsZXQncyBkcm9wIHRoZW0uCgpNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
