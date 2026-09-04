Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC5EC624D3
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/isG3Wxodo1kQ4wwkZ2sZ59vly2An0KdMbqdh3yafs=; b=oVRnSUB9vQptyn
	lbNHBjFm9BhaXr4T1/JKVCPCFdC6Xp0IqV0WUffSMUKa2zlZeaFD4aiGjO3d0FjIwBJqFJi8zrjiy
	+hgvQZ8accVq55ALLIwc8/x4UT3f2OMSXNO6206b1vZKx/L/UCoMApq5XoDIbJVh68yH2uZJg4uAX
	EAOFwNS3RgDPzntxxsv1Cge0+YsuHoAgfE+t0uvefce5Og8y8BhWNIX3Y6ryWy36dulXGHu0toOJU
	dLkBTe3gEfzviq9BQNF+HXAT+9YkxXrFClcFUPnMKoSX31Refpjjun0WRwX5JKS4tFsIWSkejK27R
	x28QgHawlXfiG9F0C9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLc-00000002ynB-2brK;
	Fri, 04 Sep 2026 18:09:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLa-00000002ylS-13SR
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B6D644E41521;
	Fri,  4 Sep 2026 18:09:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 834516057F;
	Fri,  4 Sep 2026 18:09:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E8F111C78158;
	Fri,  4 Sep 2026 20:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MOVPy3AgFrv9YPxzdSMscEhii/3DK/sQJymlGxte/xY=;
	b=RqviBPBR/oDEpRKg1xTzhc1idFKhKBgX3wMGDVFSlIjM2rEmI/KeZfCDj4xprblmP74mF9
	GD9i31Rs0Zvyzf/QKvRt50j9cKd+oCr1x4qSFFSE1f0XpzzO2dSD71Lv6Bt/qCQaC1wtSE
	4cTl+T6AxpfE8ysAil9NoRcO27PWgCmKrxrlfsq7eXMNY3/IlR2tN+tR/0mfvxCp1u+ClS
	GElgmH01J9QnIxorethRywY9KlbRNcIWVcMrOa26agNx2HImcnrbhKgXU8jFgJPSJTm25z
	y2PasYzVplJvjHcVCKLlY7sxWtoIv2LkKDyR8FpMK2Zr343NdmWHluxVJx/ucA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>
In-Reply-To: <20260817-w25n04lw-v4-1-1b19c2a629e5@atmark-techno.com>
References: <20260817-w25n04lw-v4-1-1b19c2a629e5@atmark-techno.com>
Subject: Re: [PATCH v4] mtd: spinand: winbond: add support for W25N04LW
Message-Id: <178854533780.1533016.9237523207335099293.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:08:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110906_433896_2E78093A 
X-CRM114-Status: UNSURE (   7.99  )
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

T24gTW9uLCAxNyBBdWcgMjAyNiAwNToyOToxNyArMDAwMCwgRG9taW5pcXVlIE1hcnRpbmV0IHdy
b3RlOgo+IEFkZCBzdXBwb3J0IGZvciBXaW5ib25kIFcyNU4wNExXIDRHYml0IFNQSS1OQU5EOgo+
ID4gMS44ViA0Ry1iaXQKPiA+IFJhdyBzZXJpYWwgU0xDIE5BTkQgZmxhc2ggbWVtb3J5Cj4gPiBE
dWFsL1F1YWQgU1BJIHdpdGggMTA0TUh6Cj4gPiBidWZmZXIgcmVhZCwgY29udGludW91cyByZWFk
ICYgc2VxdWVudGlhbCByZWFkCj4gCj4gSGlnaGxpZ2h0cyBjb3BpZWQgZnJvbSBkYXRhc2hlZXQ6
Cj4g4oCTIFBhZ2Ugc2l6ZTogNCwzNTIgQnl0ZXMgKDQwOTYgKyAyNTYgQnl0ZXMpCj4g4oCTIEJs
b2NrIHNpemU6IDY0IHBhZ2VzICgyNTZLICsgMTZLIEJ5dGVzKQo+IC0gQnVpbHQtaW4gOC1CaXQg
RUNDIGZvciBtZW1vcnkgYXJyYXkKPiDigJMgRUNDIHN0YXR1cyBiaXRzIGluZGljYXRlIEVDQyBy
ZXN1bHRzCj4g4oCTIEJhZCBCbG9jayBNYW5hZ2VtZW50IGFuZCBMVVQgYWNjZXNzCj4g4oCTIFNv
ZnR3YXJlIGFuZCBIYXJkd2FyZSBXcml0ZS1Qcm90ZWN0Cj4g4oCTIFBvd2VyIFN1cHBseSBMb2Nr
LURvd24gYW5kIE9UUCBwcm90ZWN0aW9uCj4g4oCTIFVuaXF1ZSBJRCBhbmQgUGFyYW1ldGVyIHBh
Z2UKPiDigJMgVGVuIDRLQiBPVFAgcGFnZXMgcGVyIGRpZQo+IOKAkyBSZWFkIExldmVsIFNldHRp
bmcgZm9yIFJlYWQgUmV0cnkKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5r
cyEKClsxLzFdIG10ZDogc3BpbmFuZDogd2luYm9uZDogYWRkIHN1cHBvcnQgZm9yIFcyNU4wNExX
CiAgICAgIGNvbW1pdDogZWE2MDk0NjlhM2UzN2ZjNzMxNjM2YzdiZTZiYzNlODk4M2IyMDcwYgoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
