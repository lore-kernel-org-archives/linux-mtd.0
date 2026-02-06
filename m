Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23496EE20A0
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0XMX8/VwpidyKl0WicS3mhcUdKoKqlo+LVt6H5oHhs=; b=QfA3WlbywhP18Y
	SNEQ4f0xgTlt6DDymi6wJmCX+SWeAA/4m1jaKpL5qDpYvlWtsmXX2FLIY/fc9I5uFJ7mVapc1FaOu
	VYwciC5Fa1GeV9/6F6gEUbcr5XBgW+aHUUtGg1NjX6fgImmY4mrbAsrig/lP1B/6ItytuCwiilDZ0
	e4eutKc+xR6Pc123/56BXXMBTjz4svcodBCeoRNd0QKeGbHACLMOmniR7X3dUNK0H4tzHAe1aJjyF
	r6tgG1xcUqioQ9/rJVCs6Fhm8oiTbb3FsX8iBT+iwB5aEqYmar85f1lU1E6S4uaXYr44x9q8daKnK
	PKXBIZA+cv0Sp4a1TQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM2e-0000000BNCV-2R3J;
	Fri, 06 Feb 2026 13:38:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM2b-0000000BNC2-0wpY
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 13:38:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9F144E42443
	for <linux-mtd@lists.infradead.org>; Fri,  6 Feb 2026 13:38:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD5B160729;
	Fri,  6 Feb 2026 13:38:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09D7F119D1DAE;
	Fri,  6 Feb 2026 14:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770385107; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lipAt5kzjzkzhGp2+Izk54wzvESiJnYnM8EzuXTAYHA=;
	b=tIUkYjxMO5fqyQiUgNzrwnY6Ck0bNFWM2+qQN113NDh73M38HdBvWPQ4eZW6sntyFeZCWC
	b263EUdu/drhvVZne48wa+J/f2V+NAByiiPKf6lGulJLo7qrvZEGuR6FLHaHiZXN3bHIzJ
	0fllKMfKRM25LNC8E04SZSF+JQ0IO9sWjwM5gsv+wRbmtN4RKECTRsSR4zmj0h5apKwLQQ
	EfHIHplImQiUEGu7tIHDmX+9omKW4ZGCmfiILbRtljhdq1cNsEcHl9V/s0QB+mcuBA143Q
	JFe748JKVhUYDGTh2Wfp//Bf2x7hApPbwNaQdMBhlRWVF5mAOzuRW2Vs0/ZAqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
 chengminglin@mxic.com.tw, mmkurbanov@salutedevices.com, 
 mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20260206083752.268838-1-quic_mdalam@quicinc.com>
References: <20260206083752.268838-1-quic_mdalam@quicinc.com>
Subject: Re: [PATCH] mtd: spinand: fix NULL pointer dereference in
 spinand_support_vendor_ops()
Message-Id: <177038510238.1182336.10818314123558864993.b4-ty@bootlin.com>
Date: Fri, 06 Feb 2026 14:38:22 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_053833_429001_E814F0FF 
X-CRM114-Status: UNSURE (   5.85  )
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

T24gRnJpLCAwNiBGZWIgMjAyNiAxNDowNzo1MiArMDUzMCwgTWQgU2FkcmUgQWxhbSB3cm90ZToK
PiBUaGUgc3BpbmFuZF9zdXBwb3J0X3ZlbmRvcl9vcHMoKSBoZWxwZXIgdW5jb25kaXRpb25hbGx5
IGRlcmVmZXJlbmNlcwo+IGluZm8tPnZlbmRvcl9vcHMuIEZvciBjaGlwcyB0aGF0IGRvIG5vdCBk
ZWZpbmUgdmVuZG9yX29wcywgdGhpcyBwb2ludGVyCj4gaXMgTlVMTCwgbGVhZGluZyB0byBhIGtl
cm5lbCBwYW5pYyBkdXJpbmcgcHJvYmU6Cj4gCj4gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcwo+IDAwMDAwMDAwMDAwMDAw
MDgKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDog
c3BpbmFuZDogZml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBzcGluYW5kX3N1cHBvcnRf
dmVuZG9yX29wcygpCiAgICAgIGNvbW1pdDogZTgyMjY5ZTdjYjkzYTJkMzMzNjg0MThiZTRlZTU2
MDE1YjRhZGMyNwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
