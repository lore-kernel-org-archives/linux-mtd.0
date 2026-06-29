Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F101C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nLwOxUjo6k2hsJ3F3pqD0FssW3A8kuJ8QQFis+EAXQ=; b=OB1w8QN3DwRjXm
	0eP/OvY6A5C07wp84PT4ey7AavzLqD2RJinriKeyzmVOx4LrytzefB7fxztUxt/XQI9nDoY+dcIKK
	rnHmeT4AFJZtvU3Zbi9z7vFNwxh1SRes+S/ocNTHhHdnA8iCoywMia2s4pZdaLGvq8fK+avyJHd5F
	v4GB6+LsK4p0TNbhM0dBXYEZnBcRMA6oSwpuJXSK/NfiZ7wk4PHwunpG4ZVAV8bnzBF/4agmkay7v
	6OD+VyfHn8KPt9qcrqYXZAaqVhJ9b+pwDGVhbi2ZW6HG0PU9ttWT9UobTdvLlewKAGzEthPVRFfZj
	lCtVl6LnUjO9iw4rLS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDb-0000000EuxU-0eVz;
	Mon, 29 Jun 2026 14:44:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDX-0000000EuwX-3yYr
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:44:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 365EF4E407AD;
	Mon, 29 Jun 2026 14:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B0705FF96;
	Mon, 29 Jun 2026 14:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 786F1106F17BD;
	Mon, 29 Jun 2026 16:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9xEdcc/LdUJN7jh7ua9bgISAowV++o8aw3xEPs/KTI=;
	b=Wrl7bogCLMRPcAij8ab1sSn3PfLpgoTfC8u0uq6QFdZ3hG/o/xyzS7bD8UUSkftmu3xTGM
	ARfZdyr3P6BQXLAzKuJs9dc/AvOTneHGr8oa4aSw8tp+ViyS7Ml4Zoj9IpihXCBLS1DvM6
	MNdDRKaPvJIiDq2D0h6rs2PM8/jbGdLuUGv5igsYGn2jwbhpOymYmwnjCvSEBUXMDTrDZh
	VEBrv2r3o5lwxl1JzU6lDdn391dP3kztVmjtm5PbSE5le5SRA3bdNO7at+rVvYV8pVDVnq
	8XBaHgh0f6fxzLrNeUqq1DKk5KOSgPHFRFXKCDPegbwIuFJWUVXALfFpU7os1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com
In-Reply-To: <20260616101439.1489392-1-harshit.m.mogalapalli@oracle.com>
References: <20260616101439.1489392-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy()
Message-Id: <178274424738.260178.14667978462837066418.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:44:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074412_126896_536F36D1 
X-CRM114-Status: UNSURE (   5.59  )
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

T24gVHVlLCAxNiBKdW4gMjAyNiAwMzoxNDozOSAtMDcwMCwgSGFyc2hpdCBNb2dhbGFwYWxsaSB3
cm90ZToKPiBtdGRfY29uY2F0X2Rlc3Ryb3koKSBmcmVlcyBpdGVtLT5jb25jYXQgc28gY2FsbGlu
Zwo+IG10ZF92aXJ0X2NvbmNhdF9wdXRfbXRkX2RldmljZXMoaXRlbS0+Y29uY2F0KSBhZnRlciB0
aGF0IGxlYWRzIHRvIGEKPiB1c2UtYWZ0ZXItZnJlZS4KPiAKPiBGaXggaXQgYnkgbW92aW5nIG10
ZF92aXJ0X2NvbmNhdF9wdXRfbXRkX2RldmljZXMoKSBiZWZvcmUKPiBtdGRfY29uY2F0X2Rlc3Ry
b3koKS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10
ZDogdmlydF9jb25jYXQ6IGZpeCB1c2UtYWZ0ZXItZnJlZSBpbiBtdGRfdmlydF9jb25jYXRfZGVz
dHJveSgpCiAgICAgIGNvbW1pdDogNGI0NWQ3ODM2Yjk1MjZiODc3NmFmNWYyOTIxOTYxNWJlOTQx
NzIzMAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
