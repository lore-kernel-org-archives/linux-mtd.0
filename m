Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43202CD6E44
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbBnm+NT5MOO+ViyreFey9imSwApzLnllGZ+x6ciFLk=; b=fZZi/FdM0fNRdW
	FB+XcOgWoEiLiH9rzsPQkp2NaSblKkfpnG8R93NUgbK93JMQ/m9V/rjAM8X1YHmh/K6fR1nL7ejVp
	lADE2n+Rg9QSMqVGgnFwHyJ9RFKUn9/buzFSVrjn7wOQb+VU+VZd7s/QYWi6R/fsqG9bdxTSBP2sX
	zjMHzz5VGt8qPiKrhACp51LJ/M0RnD2XaDHxngYoZcNX64i0kl1z0L8xccvSEZn8Ckfkq7YHTtMHR
	K/vJ/lH0kayLPLNuLEXB5313cQbsImOIRo1JlF+CmGtcPz3vJbpCsZkYZDReLPAjJ/gEoD/HxBM0S
	BtN/zg6IxU6JIQkvlyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAHx-00000003bdN-1KIj;
	Wed, 27 May 2026 09:10:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAHq-00000003bbV-3gqD
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:10:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C1E74E42D65
	for <linux-mtd@lists.infradead.org>; Wed, 27 May 2026 09:10:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AF1E601A1;
	Wed, 27 May 2026 09:10:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABFAF10888BDC;
	Wed, 27 May 2026 11:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779873048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0VFSCjnRlda22B1SRgGJJdCZhhm3V9AMj+EJNXVn1u0=;
	b=t7IkMvMOZwTkFNbQamA6Je6jR7RCS/TtMi0rE7Oh+IrV+j78eAtGnQium5U7de1FWj6gYf
	MbWfLyf6IsyhZ5kgfy5wt1Onfb3g+ixaQSezlVDx0VgUM/AnG8Yrog2gWPdM0KkK7GvX0c
	bw0D1qB3h3Qm+M0/GAy/dik8f2UG3XRQkACVM+/z5NChEgvdqDrm2JhH3Vnp3v6kXAFbLA
	IkzMtXzjhs/iyRVnh9sU38cfQ2rwOrfB0YzOiin5+qocb6kyRps0zIJxO/+yzle2pWACnk
	8Y0CmOaH4y36zbKAlp+GmpZiAEwXM4WDS5jx7dPVVoTb3W9YUCgLfWNd1zUsEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260526-fix-pl35x-probe-v1-1-3baad4f527f2@bootlin.com>
References: <20260526-fix-pl35x-probe-v1-1-3baad4f527f2@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: pl353: fix probe resource allocation
Message-Id: <177987304762.3986809.7897694507848304230.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:10:47 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_021052_891261_9242F881 
X-CRM114-Status: UNSURE (   7.32  )
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

T24gVHVlLCAyNiBNYXkgMjAyNiAwOToxMDowMCArMDIwMCwgQmFzdGllbiBDdXJ1dGNoZXQgd3Jv
dGU6Cj4gRHVyaW5nIHByb2JlKCksIHRoZSBkZXZtX2lvcmVtYXAoKSBpcyBjYWxsZWQgd2l0aCB0
aGUgcGFyZW50IGRldmljZQo+IGluc3RlYWQgb2YgdGhlIGN1cnJlbnQgb25lLiBTbyB3aGVuIHRo
ZSBtb2R1bGUgaXMgdW5sb2FkZWQsIHRoZSByZWdpc3Rlcgo+IGFyZWEgaXNuJ3QgcmVsZWFzZWQu
Cj4gCj4gVGFyZ2V0IHRoZSBwbDM1eCBkZXZpY2UgaW4gdGhlIGRldm1faW9yZW1hcCgpIGluc3Rl
YWQgb2YgaXRzIHBhcmVudC4KPiAKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRo
YW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogcGwzNTM6IGZpeCBwcm9iZSByZXNvdXJjZSBhbGxv
Y2F0aW9uCiAgICAgIGNvbW1pdDogMTllZDExYWVlOTY2ZDkxYmVlYmRlZjlkMzJjZTkyNjQ3NDg3
MmY3OQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
