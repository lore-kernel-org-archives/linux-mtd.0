Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A827CCD6E5D
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 05:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/rTX6Jve7JcbEVFFB8c4EaQSCfDUzAWwOggC4CBmOY=; b=skHmNoYtJgOsqK
	zkCzQmUNL/4QHyw7QVwrua4UqA22xGsUcSl+oz3qxB57Aj0M2lEBEgQSZozBeT4R/teOnjSA8sw/F
	8SGKR7JUb+duSdDb1AQ7u60oVwGqaUgMS83CNIr/K1XbVhurL8ODoZGhYlwjVtyP0bNvrCQgioc0n
	yuvnUpcAYSRy52HkUMzUlg2vaoMSwOoH6cWE8q903snm+SqKbQI40TbND0qCP6Ad9F8hNGD5javrK
	u5NdIX1np6gNlyICVuUQ6REAnpd5XSHHH9XsbKCk990OcwqE6NjgwL+aWwnxVqPodHPobVDdGUPMn
	9qrGz+uGoUT6WjuuIMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMht-000000005Rv-0abc;
	Fri, 05 Jun 2026 05:02:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMhp-000000005RW-1lrh
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 05:02:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C3064E40760;
	Fri,  5 Jun 2026 05:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B3E75FED1;
	Fri,  5 Jun 2026 05:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3FEC106A1E99;
	Fri,  5 Jun 2026 07:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780635767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6Mhl8KmIdInKaC12+xQLU0FoCvJVhrND8e1AJkW4CRM=;
	b=uKs50B31sBCzyWVpMzKJFPUGvDS0f1FJ8ZJhPiYsQAMXy1l8UzmhpZnULJE99LP6tumWoY
	/MGJzzqg/HCsSoDtpa9RK8xx27kHE0mtxKkZg7NQkVLsprF9Y8bhTw8i9ng7NCk7KJj+eO
	Hb5o07bHxbqqZF2UHnbV1POvuRB79rWk70eLY9zulXepNTSsdlTdcVeMXkvwASs3MyyGhH
	46CGiTW9/snEeBC20MkYXfIWB1rHfRWxxC9ft2lhKyU15Xguc5+v6/qtaAQHjlbSR26qfV
	vU4Q8SEGmDSwdVCgLMZHnoeCSDogVPOPmj4upwXfuVRv2B/HWyyoRKbbzu6atg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add support for MX25L12833F and
 MX25L12845G
In-Reply-To: <20260605005720.1857413-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Fri, 5 Jun 2026 08:57:19 +0800")
References: <20260605005720.1857413-1-linchengming884@gmail.com>
	<20260605005720.1857413-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 05 Jun 2026 07:02:38 +0200
Message-ID: <87v7bxwpe9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_220253_635039_2DD63BF8 
X-CRM114-Status: UNSURE (   8.54  )
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

SGVsbG8gQ2hlbmcgTWluZywKCk9uIDA1LzA2LzIwMjYgYXQgMDg6NTc6MTkgKzA4LCBDaGVuZyBN
aW5nIExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IENoZW5n
IE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBBZGQgc3VwcG9ydCBmb3Ig
TWFjcm9uaXggTVgyNUwxMjgzM0YgYW5kIE1YMjVMMTI4NDVHIFNQSSBOT1IgZmxhc2hlcy4KPiBU
aGVzZSBwYXJ0cyBzaGFyZSB0aGUgc2FtZSBKRURFQyBJRCAoMHhjMiwgMHgyMCwgMHgxOCkgYXMg
dGhlIGxlZ2FjeQo+IE1YMjVMMTI4MDVELgo+Cj4gVGhlIG5ld2VyIGZsYXNoZXMgc3VwcG9ydCBT
RkRQIGFuZCAxLTQtNCBQYWdlIFByb2dyYW0gaW4gMy1ieXRlIGFkZHJlc3MKPiBtb2RlLCBidXQg
dGhpcyA0UFAgY2FwYWJpbGl0eSBpcyBub3QgZGVmaW5lZCBpbiB0aGVpciBTRkRQIHRhYmxlcy4K
PiBDb252ZXJzZWx5LCB0aGUgbGVnYWN5IE1YMjVMMTI4MDVEIGxhY2tzIFNGRFAgc3VwcG9ydCBl
bnRpcmVseSBhbmQgZG9lcwo+IG5vdCBzdXBwb3J0IDRQUC4KPgo+IFRvIHNhZmVseSBlbmFibGUg
NFBQIGZvciB0aGUgbmV3ZXIgZmxhc2hlcyB3aXRob3V0IGJyZWFraW5nIHRoZSBsZWdhY3kKPiBw
YXJ0LCBpbnRyb2R1Y2UgYSBwb3N0X2JmcHQgZml4dXAuIFNpbmNlIHRoZSBsZWdhY3kgTVgyNUwx
MjgwNUQgZG9lcwo+IG5vdCBzdXBwb3J0IFNGRFAsIGl0IGZhbGxzIGJhY2sgdG8gc3RhdGljIHBh
cmFtZXRlcnMgYW5kIHdpbGwgbmV2ZXIKPiBleGVjdXRlIHRoZSBwb3N0X2JmcHQgaG9vay4gVGhl
IG5ld2VyIGZsYXNoZXMgd2lsbCBzdWNjZXNzZnVsbHkgcGFyc2UKPiB0aGUgQkZQVCwgdHJpZ2dl
ciB0aGUgaG9vaywgYW5kIHNhZmVseSBhcHBlbmQgdGhlIFNOT1JfSFdDQVBTX1BQXzFfNF80Cj4g
Y2FwYWJpbGl0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmds
aW5AbXhpYy5jb20udHc+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
