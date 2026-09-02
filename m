Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0AAC624D3
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=reUyRTN7+LEFtD8MVLEs0jlGE975WYhP56Q/1N4rpeA=; b=vRPUiwqskOM7/z
	Q7bI5JPm+zAXomBItdXqxvCO1O2sSvCpKa6RN6wFF72A/ysmDslQ1cDrtXNphVmJTCYiLRgZPFwtq
	NevlJYvW0omj7g54ICq0rkwdJhNwnfFwT5mNW8cBYfS/VijEI+2nIQGgkiMxGsezSFsZRTciFNEjV
	Q+Ho6D65kjEwUqOGFNYvOluFk4IiiOVaBzfHlfM3tUGjZ2DljOhNCyzGsPtNSmPEWfdiUCegyZfmN
	u0qKwCUOX1gSwxfJbJmRg9aKu8fXX8LIIii2uK60l5tM7gg++gXXz8Rp/E2hMD0yKUAf8hwtb1+Gk
	vyqQhR+vf7RTuEWVWE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mGn-0000000F0uJ-0G1C;
	Wed, 02 Sep 2026 14:48:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mGj-0000000F0sy-2ERI
	for linux-mtd@lists.infradead.org;
	Wed, 02 Sep 2026 14:48:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C72AC1A195E;
	Wed,  2 Sep 2026 14:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 906B96053C;
	Wed,  2 Sep 2026 14:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3940111C792AB;
	Wed,  2 Sep 2026 16:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788360524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kKyP0KBxakTaDA9ZOZgXWO84xJnxt16TUKmmMmMWZ5o=;
	b=cFage9wxV+lKQQXdLrZPivLydFioAXSPdrLl0Pf+32Fetbt/c5BEtAhB+vPCCYWgMVmI8A
	PLatga4yHA5lIzIKK7WujwrK+Fj3zEZLkcQDRumqloRMOonQf7JFjEULM1Gcyo6di/x7KC
	wnESG53ex/2gbearIlyjse8Gdygg7vf7+32f+yLOEUIkBOX7mIAach54O8aqrkr1xJPdao
	DmYyisTQ3WnBZDubMVgixx4ijrWmhrBQWd3VslYqgJrIVC1iQMzxocwI2nKc4gmPv0pcyv
	S7DJFHF6+lH8ge3Cmkm5eVfhiXq4KY0Tvjg1f8ntvIp+T4Rxo0Gri5CmyltJ2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <corbet@lwn.net>,  <skhan@linuxfoundation.org>,  <STLin2@winbond.com>,
  <hsinyi@chromium.org>,  <thomas.petazzoni@bootlin.com>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 13/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-Q/N
In-Reply-To: <4d7597839fc542ea846fe0ddb3eb6683@infineon.com> (Takahiro
	Kuwano's message of "Thu, 20 Aug 2026 06:15:08 +0000")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
	<4d7597839fc542ea846fe0ddb3eb6683@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 16:48:38 +0200
Message-ID: <87se3r7lq1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_074853_714461_49B269CC 
X-CRM114-Status: UNSURE (   7.96  )
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

T24gMjAvMDgvMjAyNiBhdCAwNjoxNTowOCBHTVQsIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24u
Y29tPiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+Cj4+IFRoZXJlIGlzIGFuIElEIGNvbGxpc2lvbiB3
aXRoIHRoZSBjaGlwIG9mIHNhbWUgZGVuc2l0eSBmcm9tIHRoZSBKVgo+PiBmYW1pbHkuIEJvdGgg
Y2hpcHMgYXJlIHZlcnkgc2ltaWxhciBpbiBwcmFjdGljZSwgaXQgaXMgbW9zdGx5IGEgbWF0dGVy
Cj4+IG9mIGVsZWN0cmljYWwgZGlmZmVyZW5jZXMgKG1vc3RseSBwb3dlciBjb25zdW1wdGlvbiBi
ZWluZyBsb3dlcikuCj4+IAo+PiBBcyBhIHNpZ25pZmljYW50IGRpZmZlcmVuY2UsIFJWIGNoaXBz
IGlkZW50aWZ5IHRoZW1zZWx2ZXMgYXMgc3VwcG9ydGluZwo+PiB0aGUgbmV3IFNGRFAgKHJldiBG
KSBmaWVsZCB3aGljaCBmb3JjZXMgYW4gYWx0ZXJuYXRlIHdyaXRlIFNSMgo+PiBvcGNvZGUgKDB4
MzEpLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPj4gLS0tCj4+ICsgY2F0IC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaTAuMC9z
cGktbm9yL2plZGVjX2lkCj4+IGVmNDAyMAo+Cj4gZWY0MDIxPwo+IEkgdGhpbmsgeW91IGNvcGll
ZCB3cm9uZyBsb2cgKHRoaXMgbG9va3Mgc2FtZSBhcyBwYXRjaCAjMTIpLgoKQ29ycmVjdCEgSSBq
dXN0IG1hZGUgYSBuZXcgYWNxdWlzaXRpb24gYW5kIGZpeGVkIHRoZSBsb2dzLgoKVGhhbmtzIQpN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
