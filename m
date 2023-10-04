Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643FEE8FDDD
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NUQv4Agv4rTLFTDxTz//1r5CvKjR2iq+nmn+vtS4qQ=; b=fq4pPs4DXISmzJ
	+tUWFXUdgwwb7B56U4BJvl4RsTkjoIJdhZeXAQLVHuEs0J82CEhRgB6ZTI9FFi2Io+E5Vz3xb5eYM
	8tuXWGDd2/3/SXFHL5JnEOkZ7QEL34BrbmYPR2HKiT7/mqeV8dquPJ5+7z0Xx7djsr1iRX87a3Qjy
	ysKq5TXWQtzp78+sP9MAIzi3fEPcjggcOWegVD50RAoBKXb+Dg+S/9txfiQQUvNG6hFehMQqz0gvV
	BFWfYatycZizidCHLjad9+NAxgZKSpDgCM19nLES1ynWqwzB1fCD+lrVIt0meIz4QbFPr44PVYRRo
	dG79SGNm7CX0MhZIKBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxat-00GveA-2Z;
	Wed, 04 Oct 2023 08:50:59 +0000
Received: from forward500b.mail.yandex.net ([178.154.239.144])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxap-00Gvav-28
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 08:50:58 +0000
Received: from mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1e27:0:640:d1a0:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTP id E40ED60023;
	Wed,  4 Oct 2023 11:50:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id foS3o8UBRW20-tUDXFYtQ;
	Wed, 04 Oct 2023 11:50:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1696409442; bh=zM+u3qsfoQEbvh3xE4dw9ke9cQVd58SQUi8UgEKL540=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=j29k4leNHx8a7qGM0ubzaPiVQuAmAsbzdHgOG4nNcVgBJPJVdkvSd8zpO2bSYgivC
	 aEtgw5L3pwqjc1rD6lij4Bf2M2CGpRkpX20fo0K3kEALq/DgKrZBbaTrQbGTWHJf6Q
	 e7R5layHB+C3xI8unwP07dGwn9Mdr+c6m4oPGvUU=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <c25184612d669dbb06f3d56239f2a9222b6acb70.camel@maquefel.me>
Subject: Re: [RFC PATCH v2] mtd: nand: add support for ts72xx
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Date: Wed, 04 Oct 2023 11:50:41 +0300
In-Reply-To: <20231004103911.2aa65354@xps-13>
References: <20231004082223.12762-1-nikita.shubin@maquefel.me>
	 <20231004103835.55cccdc6@xps-13> <20231004103911.2aa65354@xps-13>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_015055_876442_6AA61C21 
X-CRM114-Status: UNSURE (   9.91  )
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

SGkgTWlxdcOobC4KCk9uIFdlZCwgMjAyMy0xMC0wNCBhdCAxMDozOSArMDIwMCwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPiAKPiBtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29twqB3cm90ZSBvbiBXZWQs
IDQgT2N0IDIwMjMgMTA6Mzg6MzUgKzAyMDA6Cj4gCj4gPiBIaSBOaWtpdGEsCj4gPiAKPiA+IG5p
a2l0YS5zaHViaW5AbWFxdWVmZWwubWXCoHdyb3RlIG9uIFdlZCzCoCA0IE9jdCAyMDIzIDExOjIy
OjIzICswMzAwOgo+ID4gCj4gCj4gQlRXLCBzdWJqZWN0IHByZWZpeCBzaG91bGQgYmUgIm10ZDog
cmF3bmFuZDoiLgoKQWxsIGNvbW1lbnRzIGFja25vd2xlZGdlZCB0aGV5IHdpbGwgYmUgZml4ZWQg
aW4gc2VyaWVzLiAKCj4gCj4gPiA+IFRlY2hub2xvZ2ljIFN5c3RlbXMgaGFzIGl0J3Mgb3duIG5h
bmQgY29udHJvbGxlciBpbXBsZW1lbnRhdGlvbgo+ID4gPiBpbiBDUExELgo+ID4gPiAKPiA+ID4g
U2lnbmVkLW9mZi1ieTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4K
PiA+ID4gLS0tCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
