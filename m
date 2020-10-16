Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548EEC433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 12:06:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF762083B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 12:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F6cxsFFD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF762083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HwxsPZqVTMuqqf/cmO1UdrW0I7POT2kCHMd5NL4JZDY=; b=F6cxsFFDRtLZNLdsQiuZEpBig
	fqxQJ6sRVQ609zQIa1D/IRqvkkNGrKnRx1tkBxQTByqrC/HTmfUifiBaa5vJY1Du9kOZcEaqM7enu
	35+m3D+fX24U1v1MhSLY/ZsJt/3Io0lfUhJaRVgGr73jfe3Xnzjnkld/cVAM/0uA5pz+/RmE3FzxL
	4lax+bXuv43XwoPS/+f5QQuoEDc4hvGIQ4wO8u29UynyG89Ox4E2ivFzirh2NF7b7E0Y1V5sauW1B
	1iyXtkVrzBgwf/wOwVbuWHiS5CvJMYs1ltMJZlTbHZe0sL5CLqOf9E7/jrA613hgd009hiJHKSVRi
	eASR519wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTOUS-0008Cy-9l; Fri, 16 Oct 2020 12:05:44 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTOUP-0008CI-HU
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 12:05:42 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A79741BF20D;
 Fri, 16 Oct 2020 12:05:36 +0000 (UTC)
Date: Fri, 16 Oct 2020 14:05:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
Message-ID: <20201016140535.23cb3619@xps13>
In-Reply-To: <CAOMZO5DR6rgqJwTGU7-9gFMPXqmFgq4cfpNQhFi-EE1cBSad3A@mail.gmail.com>
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <CAOMZO5BoLnbY=Y54SFYF+J2kbGyioHTZg=h_kw_JNXr_28ZOuA@mail.gmail.com>
 <CAOMZO5DR6rgqJwTGU7-9gFMPXqmFgq4cfpNQhFi-EE1cBSad3A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_080541_680429_DF06665C 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIEZy
aSwgMTYgT2N0IDIwMjAgMDg6NDU6MDgKLTAzMDA6Cgo+IEhpIE1pcXVlbCBhbmQgSGFuLAo+IAo+
IE9uIEZyaSwgT2N0IDE2LCAyMDIwIGF0IDg6MzIgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToKPiAKPiA+IFRoZSBMUzEwNDNBIHVzZXMgYSBkaWZmZXJlbnQgTkFO
RCBjb250cm9sbGVyIGFuZCBpdHMgZHJpdmVyIGlzCj4gPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9m
c2xfaWZjX25hbmQuYyAgCj4gCj4gU2hvdWxkIHdlIGZvbGxvdyB0aGUgc2FtZSBpZGVhIGhlcmUg
YW5kIG1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0bwo+IGZzbF9pZmNfYXR0YWNoX2NoaXAo
KT8KPiAKPiBEb2VzIHRoaXMgcGF0Y2ggaGVscD8KPiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcv
eHdIS1hGbXUKCkRlZmluaXRlbHksIHllcyEKCkkgZ3Vlc3MgSSB3aWxsIGhhdmUgdG8gZml4IGFs
bCB0aGUgZHJpdmVycyBkb2luZyBwYXJ0IG9mIHRoZSBFQ0MKaW5pdGlhbGl6YXRpb24gaW4gdGhl
aXIgcHJvYmUgZnVuY3Rpb24gd2l0aCB0aGUgc2FtZSBsb2dpYy4gSG9wZWZ1bGx5CnRoZXJlIGFy
ZSBub3Qgc28gbWFueS4uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
