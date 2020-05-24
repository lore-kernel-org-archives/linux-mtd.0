Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38151C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE21A2073B
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:33:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LaamunaA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE21A2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VuBnAlJo9BlalTh2HBXxlbbU/wjrrKBzYAJJJXnsAU=; b=LaamunaAZHE3H7
	Ca7tKPHpeyC9jd9WOXtEa/A1I/kOpdnxr0O+32W6dVlkAwR0+m0PonSHqR5y5Ee1EPpS7oiyRb12r
	leXiOTSAeuRDwqf4uGd5F630OPUOD6FxPbPWDLqqB+qocMUF0Q+rfJ1701tnkiEw74aTQDmtWKzx/
	CnfPMQsm3Yg4fY9IVqvlgdzdn3WLmtEExzkunKN5R/tAFQ6U3jKol3+TNF6DuqaGVyr7K0AMEJ/Pt
	6s7Hj+X+KYkweMR53KhmdEQtg6r+V6gGXhbzkDvVRqstL5r4bbPtXX9atlQMhthOWpyYfgVRwM90b
	Qmb8stJoSqdBpK8NcSbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcwNV-0006xo-30; Sun, 24 May 2020 19:33:45 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcwHh-0007v9-Dy
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 19:27:47 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1F098240003;
 Sun, 24 May 2020 19:27:41 +0000 (UTC)
Date: Sun, 24 May 2020 21:27:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Message-ID: <20200524212740.08c2810f@xps13>
In-Reply-To: <20200524192550.4559-1-miquel.raynal@bootlin.com>
References: <20200522121524.4161539-5-noltari@gmail.com>
 <20200524192550.4559-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_122745_624892_F20A5061 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFN1biwg
MjQgTWF5IDIwMjAKMjE6MjU6NTAgKzAyMDA6Cgo+IE9uIEZyaSwgMjAyMC0wNS0yMiBhdCAxMjox
NToyMyBVVEMsID0/dXRmLTg/cT89QzM9ODFsdmFyb19GZXJuPUMzPUExbmRlel9Sb2phcz89IHdy
b3RlOgo+ID4gQWRkZWQgYnJjbSxicmNtbmFuZC12Mi4xIGFuZCBicmNtLGJyY21uYW5kLXYyLjIg
YXMgcG9zc2libGUgY29tcGF0aWJsZQo+ID4gc3RyaW5ncyB0byBzdXBwb3J0IGJyY21uYW5kIGNv
bnRyb2xsZXJzIHYyLjEgYW5kIHYyLjIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8g
RmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4gPiBBY2tlZC1ieTogRmxvcmlh
biBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+ICAKPiAKPiBBcHBsaWVkIHRvIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQg
bmFuZC9uZXh0LCB0aGFua3MuCgpGWUkgSSB1cGRhdGVkIHRoZSBjb21taXQgbG9nOgpzL2R0OiBi
aW5kaW5nczovZHQtYmluZGluZ3M6IG10ZDovCnMvQWRkZWQvQWRkLwoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
