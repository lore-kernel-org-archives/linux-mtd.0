Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FE9EE20A6
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qShJno0EEwKs0OGq91rYbZ/oIQh8LzgS/bkvWrqaH+g=; b=20KI5K6+81nt9P
	CBP/GPgFPWBz3eZypAaIPdH/WoQCdcWLSwnZB49NM6XWanQHepKripWNdKyM2T6SF7PSI0F64BJR0
	Rcr+T8TKhAYi93BqsQ6aFSXAP109xcxAbugOJdPLGcGdrzBBqyELGRBuqlMz07tJem/lMy3RyseQn
	uJDFydJ42w7vrnpu6L3h2n75vt4MU9nchKQgdrT1U1V8Bs7Jp8Rl+BHq5PMT/JhvfZL3uoOm9m/vn
	lkSAcs0tPwj/TC1fcGXFTwXMmyTjOGb7twHzlS+wnHQKRQeZabZBYZ/1/HXe+GZJpKrSfWsbCTmP2
	k2lB3Q7sM0BkKgoxmbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMjA-0000000BR3V-14zJ;
	Fri, 06 Feb 2026 14:22:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMj6-0000000BR35-2kqT
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 14:22:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4479C1A2C58;
	Fri,  6 Feb 2026 14:22:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 153CC60729;
	Fri,  6 Feb 2026 14:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2190119D1ECE;
	Fri,  6 Feb 2026 15:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770387743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o62dTIOfNtsiqRyjq85WvcyZ9UgquQxyQ2UwWd4KYSA=;
	b=j0uDo9CvvBYNQEJ4GtYdy665+SekrmHe/8xUmWBFDkfgL1xUV31Pas8jyIkEJD6BLFgPrR
	zbjRNXZD1u0miM41aTGHTOtFiWbJ9DfLS0gbHzHyWyVuEsJKxl5WHP1dQSswb5OZItWL3M
	JCG6MFLWFHvpkHIEEw6neBSLrdvQuOtrpQIjzlvpRwUDjm0aUiB8Q1xk950GORRCSaKIGI
	bEKO9G0RFVRuem2DWfTW/5KXviCb7k57qA/RtiLCXv6ngN65h9dLHVCPtBCGvf0XuCznqx
	55j3dMYgQam0Z6DdtHfTtvo5VaU3nhZ4/q0Xr+4s8zBQgTtkcEIQMDcAnQyIiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
In-Reply-To: <2vxzy0l6x8kp.fsf@kernel.org> (Pratyush Yadav's message of "Fri,
	06 Feb 2026 15:14:46 +0100")
References: <aYXu7uqMQdZRMmQF@stanley.mountain> <2vxzy0l6x8kp.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 06 Feb 2026 15:22:19 +0100
Message-ID: <87y0l6dk9w.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_062228_850732_F097F89D 
X-CRM114-Status: UNSURE (   8.14  )
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

SGVsbG8sCgpPbiAwNi8wMi8yMDI2IGF0IDE1OjE0OjQ2ICswMSwgUHJhdHl1c2ggWWFkYXYgPHBy
YXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIEZlYiAwNiAyMDI2LCBEYW4gQ2Fy
cGVudGVyIHdyb3RlOgo+Cj4+IFRoaXMgd2FzIGNvbnZlcnRlZCB0byBhIF9zY29wZWQoKSBsb29w
IGJ1dCB0aGlzIG9mX25vZGVfcHV0KCkgd2FzCj4+IGFjY2lkZW50YWxseSBsZWZ0IGJlaGluZCB3
aGljaCBpcyBhIGRvdWJsZSBmcmVlLgo+Pgo+PiBGaXhlczogYWE4Y2I3MmMyMDE4ICgibXRkOiBz
cGktbm9yOiBoaXNpLXNmYzogU2ltcGxpZnkgd2l0aCBzY29wZWQgZm9yIGVhY2ggT0YgY2hpbGQg
bG9vcCIpCj4+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGlu
YXJvLm9yZz4KPgo+IFJldmlld2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVs
Lm9yZz4KPgo+IE1pcXVlbCwgc2luY2UgeW91IHRvb2sgdGhlIG9yaWdpbmFsIHBhdGNoIHRocm91
Z2ggdGhlIE5BTkQgdHJlZSwgY2FuIHlvdQo+IHBsZWFzZSB0YWtlIHRoaXMgb25lIHRvbz8KClll
cyBJIHdpbGwsIHRoYW5rcyEKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
