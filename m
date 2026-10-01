Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF33DCA5FD6
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQeLmAFSkmXz1MgONdbwurlBFMmQxaK+bI3WNExoTFE=; b=Ub+cYZUBYkCMY5
	dl+bpIw2zV5tARIpQ/x8dUx5T0suDwpXur8jTOj62oaAPftIF1CQs6tzBqTRE6iW6edkZhOzWtB50
	lkT+sPIm06HT3XyhQobt2TMgHlJr2I7Vy1yaj/KH9mFMhhBARlXjTLUGFyQO0DKwZDK9X++5BhMCj
	lHfxSrV00gG2lQBDZVEPfzyncnQCNMRzxQqrJaRI4aAU8lC3zHMGT4xRzKUzxcPLVGnLkTnuq0yJj
	lI0MU1+XnO5n+9UKDWhsunDPkoTkuLCC7GgY+Q81wjuZZ4nCS1A3KLsofwMk9CBQ93dplmedza7mE
	wnYzooFoL1g/veHJILwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJpC-00000009kJO-38wK;
	Thu, 01 Oct 2026 16:40:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJp8-00000009kGw-31oU
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 16:40:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3EB551A18B7;
	Thu,  1 Oct 2026 16:39:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A7836035C;
	Thu,  1 Oct 2026 16:39:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D8161032813A;
	Thu,  1 Oct 2026 18:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790872795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zqO9wZAcpr/Xip1m0ECW+JKX9OkInYFz8R6jGpSZpwc=;
	b=ZUWSwCH5hIeRSW7iJp9LnRx2eQDRD3Pe7PvVf9XdlfTJcI6x3efnRyLVl0HbRxMAr+Eire
	372cp3SSp/9MJ4MqhrNjQrN/acJcaWJQEeKMF154bO8xwXZnzVqqVSCvG9EPofv7JRjo1S
	Ghb0hKezKZsTSbg+MhGwkm+v56UMSz2zVy9nsE22oqqhrQ0b09Bx9KNLydaJIe4B/ecG5Z
	b0b2o9/e1t2zY8N6wpOlW/QWLnlbi8loSAuFizHeYVSA1VddXNS4BB09dG+vVVwOU4TtNN
	r+WBC7sXq735w3W29MIbyh3Zh06u4Us1g2/DJ7vrYatZDu0iXKNZ3TW9Gywbpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K
 <s-k6@ti.com>
Subject: Re: [PATCH 0/4] spi: spi-mem/mtd: spinand: Prevent SPI NAND
 continuous reads on am65/am62
In-Reply-To: <38290328-a562-4813-a9e0-2fafaa3874c7@sirena.org.uk> (Mark
	Brown's message of "Mon, 28 Sep 2026 16:08:47 +0100")
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
	<878qa7dzke.fsf@bootlin.com> <87mrt177km.fsf@bootlin.com>
	<38290328-a562-4813-a9e0-2fafaa3874c7@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 01 Oct 2026 18:39:48 +0200
Message-ID: <87cxttml2j.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_093958_898312_400F6E6B 
X-CRM114-Status: UNSURE (   8.61  )
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

SGkgTWFyaywKCj4+IEl0IHNlZW1zIGxpa2UgdGhlIHNwaSBiaXRzIGhhdmUgbm90IGJlZW4gYXBw
bGllZCwgY2FuIHlvdSBjaGVjayBpZiB5b3UKPj4gY2FuIHN0aWxsIGFwcGx5IHRoZW0/IFdpdGhv
dXQgdGhlc2UsIHBlb3BsZSB1c2luZyB0aGlzIGNvbnRyb2xsZXIgd2l0aAo+PiBjb250aW51b3Vz
IHJlYWQgY2FwYWJsZSBkZXZpY2VzIG1heSBvYnNlcnZlIHNwdXJpb3VzIGlzc3VlcyBoYXJkIHRv
Cj4+IGRlYnVnIChkdWUgdG8gdGhlIENTIHBvc3NpYmx5IG5vdCBiZWluZyBrZXB0IGFzc2VydGVk
IGR1cmluZyBsb25nIHJlYWRzLAo+PiBsZWFkaW5nIHRvIHRoZSBjb250aW51b3VzIHJlYWQgYmVp
bmcgY2FuY2VsbGVkIGJ5IHRoZSBTUEkgTkFORCkuCj4KPiBObywgdGhleSBkb24ndCBhcHBseSB0
byBldmVuIHY3LjMtcmMxLiAgSSBkaWRuJ3Qgc2VlIHRoZSBpbW11dGFibGUKPiBicmFuY2ggbWVu
dGlvbmVkIGluOgo+Cj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xRnlMeEV3V3FORnpY
QHNpcmVuYS5jby51awo+Cj4geWV0PwoKSW4gdGhlb3J5IHlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIHJlcXVlc3QgdG8gbWVyZ2UKdGhlIGltbXV0YWJsZSBtdGQvc3BpLW1lbS1jb250LXJlYWQt
Zm9yLTcuMiB0YWcgc29tZSB0aW1lIGFnbzoKClN1YmplY3Q6IFtHSVQgUFVMTF0gc3BpLW5hbmQv
c3BpLW1lbSBjaGFuZ2VzIGZvciA3LjIKRGF0ZTogVHVlLCAwNSBNYXkgMjAyNiAxNzoxNzo0MiAr
MDIwMAoKQnV0IHRoYXQncyBub3QgYSBiaWcgZGVhbCwgSSB3aWxsIHJlYmFzZSB0aGUgcmVtYWlu
aW5nIFNQSSBhbmQgcmVzZW5kIDspCgpUaGFua3MhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
