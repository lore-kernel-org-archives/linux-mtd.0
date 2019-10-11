Return-Path: <SRS0=7oHA=YE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED47C47404
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 14:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EEBA214E0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 14:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVevmdkW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EEBA214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpKxkvysop1dzJ2DR0nJ7BQvB1McUymbXpX33xFpuoI=; b=oVevmdkWNU1QCR
	4NAMttDhoqnO8aZ19dl6o1C0CPBFiOFqTo488MoW3tnjxCy0JW670edFsgaoJBPLFCffl4Ntczw4i
	jy0rFk3By5ZVeWWqWLf19MiVV9NNxr5z77FhQd7xDYEiSbuLNxk408Xr0363fiS9Z2jlj0jrtAddW
	NA2/zZFzFIUWdVCgm2gwA68x+8WZI3i3Lnp85o1A1tqyAS8BeT8gtNXKJ8fWotktNxEj7WxoJWswn
	6/iU7emSqkNG2WFUak19QSQZ2eP8jRexBYtqoqF44Pf0PE7tc90b2wdP1bsXFM4aNZGbcsupoXK8a
	bNA7ZTClz4dVEIaaXxYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIvvD-0008Md-03; Fri, 11 Oct 2019 14:29:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIvv0-0008CJ-OQ; Fri, 11 Oct 2019 14:29:24 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 144832910C7;
 Fri, 11 Oct 2019 15:29:21 +0100 (BST)
Date: Fri, 11 Oct 2019 16:29:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 04/16] mtd: spi-nor: aspeed: Add read training
Message-ID: <20191011162919.77b05cf8@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <3244b1ce-587c-6f12-cc9c-7eee0354e76b@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-5-clg@kaod.org>
 <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
 <3244b1ce-587c-6f12-cc9c-7eee0354e76b@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191011_072922_925282_44BFB019 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Andrew Jeffery <andrew@aj.id.au>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMSBPY3QgMjAxOSAxNTo1NToyNSArMDIwMApDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToKCiAKPiA+IChob3cgY2FuIHlvdSBkZXRlcm1pbmUgaWYgdGltaW5n
cyBhcmUgZ29vZCB3aGVuIElPIHBpbnMgYWx3YXlzCj4gPiBzdGF5IGhpZ2gpLiBEb24ndCB3ZSBo
YXZlIGEgY29tbWFuZCB0aGF0IHJldHVybiBub24tZmYvbm9uLTAgZGF0YSB3aGlsZQo+ID4gc3Rp
bGwgYmVpbmcgcHJlZGljdGFibGUgYW5kIGltbXV0YWJsZT8gICAKPiAKPiBOb3QgdGhhdCBJIGtu
b3cgb2Ygb24gdGhlc2UgY29udHJvbGxlcnMuCgpJdCdzIG5vdCByZWFsbHkgYSBjb250cm9sbGVy
IHRoaW5nLCBtb3JlIGEgY2hpcCB0aGluZy4gVGhlIGlkZWFsCnNvbHV0aW9uIHdvdWxkIGJlIHRv
IGhhdmUgYSBsb29wYmFjayBtb2RlIG9yIGFuIGludGVybmFsIFNSQU0geW91IGNhbgp3cml0ZSB0
aGVuIHJlYWQgYmFjaywgYnV0IEFGQUlDVCBpdCBkb2Vzbid0IGV4aXN0cy4gVGhlcmUncyB0aGUg
U0ZEUAp0YWJsZSBhcyBWaWduZXNoIG1lbnRpb25lZCwgYnV0IHdlIGhhdmUgdGhlIGZvbGxvd2lu
ZyBwcm9ibGVtczoKCjEvIGl0IG1pZ2h0IGJlIHRvbyBzbWFsbCAoZGVmaW5pdGVseSA8IDE2aykK
Mi8gc29tZSBOT1JzIGRvbid0IHN1cHBvcnQgU0ZEUCAobWF5YmUgbm90IHRoZSBvbmVzIHdlIGNh
cmUgYWJvdXQKICAgdGhvdWdoKQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
