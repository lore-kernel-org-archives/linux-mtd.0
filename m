Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FAEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83LrovcFTowIV6Sa+1VyumXZwBdk6qgabcbVCQgyVWI=; b=Y9QBB9dQLCWWfU
	qH3vRp1FIPAecyPlPp+vcs5oLWmQ8qPSI9Jlu8nA9seYuiL203S6kRXz6eeg+CDwM/oQVBJZDdxjB
	USehzsEorO6MqIrKueK6j/W5TJZ237UjRFd0zSWpWu+ZporPLEjGVWIhsYAjV58meCNDQy0zSFbqy
	55LmdJPzD8sLQzY2tQHnTZf/H2Bc/KrJ68gccxU7cDJ1ksqCttmR4aRsGWvsAexpT+zqKyDZIcwJD
	kUVL8+GOxgUvImHjpayNHFxQuXU0ql+nmHWMHF6C9wGWdtPiRWFM0AZ4aixYxWcPnabUn5131bBdN
	XcFo3qvxMi3PLjdPxi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpvx-007ifI-QH; Mon, 11 Apr 2022 09:02:05 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuZ-007hdN-Ph; Mon, 11 Apr 2022 09:00:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74E3E10000F;
 Mon, 11 Apr 2022 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649667636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1b/5r0hiBwYr4bmOdiIkgr/ZliNLKoDFGo5f0X63v8=;
 b=No6A7EikmV/wH3y1TzfZiAGtZX8l7LnFQ25DnT4l1NiYchK/kTAM9lUyQTmi1sD/upFNl4
 k9fsqf+A1aaiA6jNsQJTGLq6KFLmt5XQlm8wYoAD+us6GezgudMNpXmkDCJvXmptL34wLM
 DMLYzItwmerLMkSXTtcs3DMqDyR+5x0RHQr7ChBiRAZgaRAJx45bxzx45uNVr0yi30H6Ng
 fq/5Qq84mJTF/AJ8FDawWCeInwy5WcrvoEd04lrgI46M1/UF2FA7y47V1/SY7vAWz5IlOn
 Q16zBvoqebQg1hAMSd98KPgXhCOO4TxNDrHVRR0MdQnXrRck3+tfGWItuz5uMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?utf-8?b?UmFmYcWCIE1p?= =?utf-8?b?xYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] mtd: call of_platform_populate() for MTD partitions
Date: Mon, 11 Apr 2022 11:00:32 +0200
Message-Id: <20220411090032.10999-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220406143225.28107-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'68471517e883902cdff6ea399d043b17f803b1a8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020040_018310_54DFB10B 
X-CRM114-Status: UNSURE (   9.20  )
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

T24gV2VkLCAyMDIyLTA0LTA2IGF0IDE0OjMyOjI0IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFVudGlsIHRoaXMgY2hhbmdlIE1URCBzdWJzeXN0ZW0gc3VwcG9ydGVkIGhhbmRs
aW5nIHBhcnRpdGlvbnMgb25seSB3aXRoCj4gTVREIHBhcnRpdGlvbnMgcGFyc2Vycy4gVGhhdCdz
IGEgc3BlY2lmaWMgLyBsaW1pdGVkIEFQSSBkZXNpZ25lZCBhcm91bmQKPiBwYXJ0aXRpb25zLgo+
IAo+IFNvbWUgTVREIHBhcnRpdGlvbnMgbWF5IGhvd2V2ZXIgcmVxdWlyZSBkaWZmZXJlbnQgaGFu
ZGxpbmcuIFRoZXkgbWF5Cj4gY29udGFpbiBzcGVjaWZpYyBkYXRhIHRoYXQgbmVlZHMgdG8gYmUg
cGFyc2VkIGFuZCBzb21laG93IGV4dHJhY3RlZC4gRm9yCj4gdGhhdCBwdXJwb3NlIE1URCBzdWJz
eXN0ZW0gc2hvdWxkIGFsbG93IGJpbmRpbmcgb2Ygc3RhbmRhcmQgcGxhdGZvcm0KPiBkcml2ZXJz
Lgo+IAo+IEFuIGV4YW1wbGUgY2FuIGJlIFUtQm9vdCAoc3ViKXBhcnRpdGlvbiB3aXRoIGVudmly
b25tZW50IHZhcmlhYmxlcy4KPiBUaGVyZSBleGlzdCBhICJ1LWJvb3QsZW52IiBEVCBiaW5kaW5n
IGZvciBNVEQgKHN1YilwYXJ0aXRpb24gdGhhdAo+IHJlcXVpcmVzIGFuIE5WTUVNIGRyaXZlci4K
PiAKPiBSZWY6IDVkYjFjMmRiYzA0YyAoImR0LWJpbmRpbmdzOiBudm1lbTogYWRkIFUtQm9vdCBl
bnZpcm9ubWVudCB2YXJpYWJsZXMgYmluZGluZyIpCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0aGFu
a3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
