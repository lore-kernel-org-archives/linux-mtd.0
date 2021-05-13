Return-Path: <SRS0=otIu=KI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8EDC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 13 May 2021 06:46:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB2C61433
	for <linux-mtd@archiver.kernel.org>; Thu, 13 May 2021 06:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB2C61433
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1tWEjvwuPs+2T8SOaSp5EBqCjdNg0YuqaA9Yuu2s0c4=; b=Yec7okGyIBqGQ2tMNeQqPgG5B
	xb5SgqqDjuYh1zLHDQhyOQxMlalh1run8R8VBGcrkRIiTcr95MIfpxizRNm92qf/UbZ+v5fYT9SXB
	NJxo/YE0hjWCgwrWE85mNAkbJeSaoJRvzC0iV1aKj/rv2TBLCg0ZWg6FPpYY0KZmbGPyZNuNojats
	/vD2sK5PlIF+GLSgd4jV1W/E8y9xthgR9r33hR5S5kJA6V1x8g/0AcnihVa2fTOoeb5JW7tdzB3V4
	8+RT5523xL26+WQ0rdPLM2nsssJ34amy0Xyw7IuZrFoFEPHrKalDPsqoKGSQ/aQlSmiA5/Cn5w8ps
	JlXW5tyrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh56H-004wU3-3a; Thu, 13 May 2021 06:45:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh56F-004wTu-GR
 for linux-mtd@desiato.infradead.org; Thu, 13 May 2021 06:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=OCmbCiwDmiOymU9SqcxTs+ZRGerlHCo/Z9EQe/46bE4=; b=nSvJPYo6TrAlFGxoMm+wJiSJYI
 sNtojcCAcoE8Eya4R4YPB0JlVOwFvUaiajx//KN2GB3CZPbWk9l84bQ+K3sivFkdGOb7a8S/bv416
 chl5SGAJLzHsf1IxmLzl5+wOGyrQglf0GAvc+GMBsqzSV5mwFaYM9XjQCzX99wFw1vMKIn7E4BjbB
 ybVHpP/0g/x3WF2iQsqFnTQV4Slzd0KVxyxHDyOQMUY1R1+Lg1QTTF06eSUOdCDLStBukgHoSlsay
 qT5OQczQ0Eb+PJQMPYbrOyM1Dtw/WU9vqYlGbOBjDD2MXaXcxRfPsS3e+dlChpBgCXIy8litJWDkB
 4GqT2lYg==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh56C-00B3Lx-3l
 for linux-mtd@lists.infradead.org; Thu, 13 May 2021 06:45:34 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0FED220004;
 Thu, 13 May 2021 06:45:24 +0000 (UTC)
Date: Thu, 13 May 2021 08:45:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ycllin@mxic.com.tw
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/2] Fix double counting of S/W ECC engines' ECC stat
Message-ID: <20210513084523.41d1cdd6@xps13>
In-Reply-To: <OFAD6CC9BD.1F0CDB53-ON482586D4.000A51D2-482586D4.000BFF66@mxic.com.tw>
References: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>
 <20210511105319.0c077fd5@xps13>
 <OFAD6CC9BD.1F0CDB53-ON482586D4.000A51D2-482586D4.000BFF66@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_234532_329875_37312B56 
X-CRM114-Status: GOOD (  19.08  )
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

SGkgWW91Q2hpbmcsCgp5Y2xsaW5AbXhpYy5jb20udHcgd3JvdGUgb24gVGh1LCAxMyBNYXkgMjAy
MSAxMDoxMTowMiArMDgwMDoKCj4gPiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+ICAgCj4gPGRlbGV0ZWQ+Cj4gPiAKPiA+IEdvb2QgY2F0Y2ghCj4gPiAKPiA+IEhv
d2V2ZXIgSSBkb24ndCB0aGluayB0aGUgY3VycmVudCBmaXggaXMgdmFsaWQgYmVjYXVzZSB0aGVz
ZSBlbmdpbmVzCj4gPiBhcmUgbWVhbnQgdG8gYmUgdXNlZCBieSB0aGUgcmF3IE5BTkQgY29yZSBh
cyB3ZWxsLCBJIHByb3Bvc2Ugc29tZXRoaW5nCj4gPiBsaWtlIHRoZSBiZWxvdywgY2FuIHlvdSBw
bGVhc2UgdGVsbCBtZSBpZiBpdCB3b3JrcyBhcyBleHBlY3RlZD8gKG5vdAo+ID4gZXZlbiBidWls
ZCB0ZXN0ZWQpCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwKPiA+IAo+ID4gICAKPiA8ZGVs
ZXRlZD4KPiAKPiBUaGFua3MgZm9yIHlvdXIgd29yay4KPiAKPiBJIHRlc3RlZCB0aGUgdHdvIHBh
dGNoZXMoeW91cnMgYW5kIG1pbmUpIHNlcGFyYXRlbHkgaW4gb3VyIGVudmlyb25tZW50OiAKPiAx
KSBNWElDIE5GQygmcmF3IE5BTkQpLDIpIE1YSUMgU1BJIGhvc3QoJlNQSS1OQU5EKSB3aXRoIFMv
VyBCQ0ggZW5naW5lLiAKPiBCb3RoIHBhdGNoZXMgYXJlIHZhbGlkKHVzaW5nIG5hbmR0ZXN0L25h
bmRiaXRlcnJzLCB2YWx1ZXMgb2YgZWNjX3N0YXRzIGFyZSAKPiBub3JtYWwpLgo+IAo+IFRoaXMg
c2VlbXMgdG8gYmUgYmVjYXVzZSB0aGUgZnVuY3Rpb24obmFuZF9lY2Nfc3dfYmNoX2ZpbmlzaF9p
b19yZXEoKSAKPiBpbiBlY2Mtc3ctYmNoLmMpIHRoYXQgd291bGQgaW5jcmVhc2UgdGhlIGVjY19z
dGF0cyBjb3VudGVyIGlzIG5vdCB1c2VkIAo+IGluIHRoZSByYXcgTkFORCB3b3JsZC4gQW0gSSBt
aXN1bmRlcnN0YW5kaW5nIG9yIGlzIGl0IHBsYXRmb3JtIGRlcGVuZGVuY3k/CgpJIGRvbid0IHRo
aW5rIGl0IGNhbiBiZSBjYWxsZWQgYSBwbGF0Zm9ybSBkZXBlbmRlbmN5LCBpdCdzIG1vcmUgbGlr
ZQpsZWdhY3kgZnJvbSB0aGUgcmF3IE5BTkQgd29ybGQgd2hpY2ggbWFrZXMgdGhlIHVzZSBvZiB0
aGUgZ2VuZXJpYyBFQ0MKZnJhbWV3b3JrIGhhcmQgYW5kIHRodXMgaXMgbGltaXRlZCB0byBhIGdp
dmVuIHNldCBvZiBmdW5jdGlvbnMuCgo+IEJUVywgSSB0aGluayB5b3VyIG1vZGlmaWNhdGlvbiBz
aG91bGQgYmUgbW9yZSBpbiBsaW5lIHdpdGggdGhlIGRlc2lnbiAKPiBzcGlyaXQgCj4gb2YgZ2Vu
ZXJpYyBFQ0MgZW5naW5lIGZyYW1ld29yay4KClllcywgaWRlYWxseSByYXcgTkFORCBzaG91bGQg
ZnVsbHkgY29tcGx5IHRvIHRoaXMgZnJhbWV3b3JrIGJ1dCB0aGlzCndvdWxkIHJlcXVpcmUgYSBo
dW5kcmVkIGRheXMgb2Ygd29yayBhbmQgZG96ZW5zIG9mIGF2YWlsYWJsZSBib2FyZHMgdG8KdGVz
dC4gRHVyaW5nIHRoZSBwYXN0IDIwIHllYXJzIHBlb3BsZSBhc3N1bWVkIE5BTkQgY29udHJvbGxl
ciBhbmQgRUNDCmVuZ2luZSB3ZXJlIGEgc2luZ2xlIGVudGl0eSB3aGljaCBtYWtlcyB0aGUgdXNl
IG9mIHRoZSBnZW5lcmljIEVDQwpmcmFtZXdvcmsgaGFyZCB0byBpbXBsZW1lbnRlZCBpbiB0aGUg
cmF3IE5BTkQuIFNvIEkgZGVjaWRlZCBub3QgdG8gcHV0CmFsbCBteSBlbmVyZ3kgdGhlcmUgaW4g
b3JkZXIgdG8gZmlyc3QgZ2V0IHRoaXMgZnJhbWV3b3JrIGF2YWlsYWJsZSB0bwpTUEktTkFORCBk
ZXZpY2VzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
