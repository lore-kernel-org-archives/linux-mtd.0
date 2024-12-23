Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5CAE7718B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2024 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAepcyQ8Z0ciivySOs2EasykR5nxEfCvQyBdec52yTI=; b=kvrosbk8zQFY+w
	IvM+otPoJPb2sVQ826Hiu6YVeoXig9c42qR1bz3Sdf6THMfN3NgffBYiwChtWAwYYMq4HJJZ8wUNJ
	um56N+J+IFfJwahm8UlW2Xg3Dljtlb/DRTcmv9arVzOf1w16gaY/7us/JBzaEWXSNT8JWQAWPCDsc
	lJQXnsMhvWZckDyMixSh7cbSZ7M+hBZ/Hs02TeTIJ5MWjoebyIZHuqOyKif4rf246Ak0fTeXSsouQ
	Lu6QDGLwcDYlKIDKcP4b5xVCDgDQQ72vcqSYjVY7nGCtTJ4xrR7MFWbt0SnKjG2hw5xHF+XqcTLZD
	2d2VK+SocSHEsjsFZJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPntR-0000000Abr9-26Nr;
	Mon, 23 Dec 2024 19:15:05 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPntO-0000000AbqZ-3NSi
	for linux-mtd@lists.infradead.org;
	Mon, 23 Dec 2024 19:15:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1421C20003;
	Mon, 23 Dec 2024 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734981299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIeJWXZlfXZpFSIC+Ak+j2IOuvjq9EfINowGfwcIn9g=;
	b=Lb+mzfiKlKygiX60rPfm1+kW4cS17UC/FiL6RPAs7xgtZM7dRqNLtNP4f+z+vLPnU8UStE
	rvyPZ2C6ebwe8be1HRCJ9dduz7Kppxq4D+66mFvWDCxzkwwcnIS6Qg5CohEO+s/PqRLaB2
	n2KuVAP7e32xeShRm/U8OI0XiYQb7/RyvSHf4tMUsB4hwS17m4pZcVU/o2bg5ZsPYtVe4j
	OCF75MzC/Jv9feaPWPJX3ID1DwXmJxxjR2ggu8L54cB8Nq5LBLFNkZS09mwULTAKG7x660
	PtPqLx3AtQQk5/Z8MIQ0BNNDokBKgg7SMSOq0juxQR6F/SK4fnAVbSEb5dVujQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, <robh@kernel.org>,
  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,  <andersson@kernel.org>,
  <konradybcio@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <manivannan.sadhasivam@linaro.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <quic_srichara@quicinc.com>,  <quic_varada@quicinc.com>
Subject: Re: [PATCH v14 0/8] Add QPIC SPI NAND driver
In-Reply-To: <87mshe58gq.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 02
	Dec 2024 17:57:09 +0100")
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
	<87mshe58gq.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 20:14:56 +0100
Message-ID: <87o712qki7.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_111502_993381_B8B55C66 
X-CRM114-Status: UNSURE (   9.69  )
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

SGkgTWFyaywKCj4+IHYxNDoKPj4gICogVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+PiAgKiBGaXgg
c3BlbGxpbmcgbWlzdGFrZQo+PiAgKiBSZW1vdmUgImlubGluZSIgZnJvbSBtdWx0aXBsZSBBUElz
IGZyb20gcWNvbV9uYW5kYy5jIGZpbGUKPj4gICogTW92ZSAnfCcgaW4gcWNvbV9wYXJhbV9wYWdl
X3R5cGVfZXhlYygpIEFQSXMgYXQgdGhlIGVuZCBvZiBsaW5lCj4KPiBJIGd1ZXNzIGl0IGlzIG5v
dyB0aW1lIHRvIG1vdmUgb24sIEkgY2FuIGFwcGx5IHBhdGNoZXMgMi01IGFuZCBzaGFyZSBhbgo+
IGltbXV0YWJsZSB0YWcuCgpEbyB5b3Ugd2FudCBhbiBpbW11dGFibGUgdGFnIG9yIHdpbGwgeW91
IHdhaXQgdGhlIG5leHQgY3ljbGUgdG8gYXBwbHkKdGhlIHNwaSBwYXRjaGVzPwoKVGhhbmtzLApN
aXF1w6hsCgo+IEhvd2V2ZXIsIGR1ZSB0byB0aGUgZnJlcXVlbnQgaW5jb25zaXN0ZW5jaWVzIG9i
c2VydmVkCj4gZHVyaW5nIHRoZSBsaWZldGltZSBvZiB0aGlzIHBhdGNoc2V0LCB3ZSBtaWdodCBi
ZSBzbGlnaHRseSBtb3JlCj4gY29uc2VydmF0aXZlIHRoYW4gdXN1YWwgYW5kIHNwbGl0IHRoZSBw
YXRjaGVzIG92ZXIgdHdvIGtlcm5lbAo+IHJlbGVhc2VzLiBJIGZlYXIgdGhlcmUgbWlnaHQgYmUg
YW5ub3lpbmcgZml4ZXMgb24gdGhlIG10ZCBzaWRlIG5lZWRlZAo+IGJlY2F1c2Ugb2Ygc29tZSBz
aWRlIGVmZmVjdHMuIFdpdGhvdXQgdGhlc2UsIHRoZSBzcGkgdHJlZSBtaWdodCBoYXZlCj4gYnJv
a2VuIHFjb20gc3VwcG9ydCBmb3Igc2V2ZXJhbCB3ZWVrcy4gV2hhdCBkbyB5b3UgdGhpbms/Cj4K
PiBDaGVlcnMsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
