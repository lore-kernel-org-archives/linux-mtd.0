Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6901C4453C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jc04sssNsfI2lQEYzPutpoFzFGCt2e6YCxIAKSAIymA=; b=4MzD2TbN+2G3mf
	OMSccDn+kF3AhGFh6gujNo6aVL8JKQfBTNlRd0+Jq7Tx9ictVXwjSpIVDyeWde7fp26epiK+SbOvf
	SCrut49mylex+EnvU/heSl5CrfkreJOvNMTaZzIdbb7Rlymd8iYtuuOAziSSRIMA7NSi2Cee4eP0F
	6Bp+On9FKgqf2XlzHEQT+reTK0SAPFtyud72amW7O5jU+tEE/RAP+oBxWm2FDXnijQiDDA3RQEyV9
	FeA88rJJl2AWPUO5Uwg0m/hR2ooJgD2x7Alw1f8yxblEj22dxY7mN+kT5Jg04IBu5o4ly8Qec2cTc
	JXV+0WAi8AFua8P11NHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYQz-0000000C5wp-2Hpa;
	Wed, 22 Jul 2026 15:00:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYQj-0000000C5pj-4AiY
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 15:00:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C0504E40ED6;
	Wed, 22 Jul 2026 15:00:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3098560388;
	Wed, 22 Jul 2026 15:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00E7811BD1E93;
	Wed, 22 Jul 2026 17:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784732413; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E9jxUvFbMtaDWA3lrKzi8PhcSsFSPCrspXZjFxfbJpA=;
	b=cYeiGCVhS5wYenf5domvS5iXPMS8LKhh4KXCu4S+fGuLEW29TyqJwIEkgjXPU8qMZc7E8i
	gC9+RNitmNw781+T5/vJh8rWk7yuTV11OQT+Z+a+r3psCsupTatBjAi+MFICen38DMiFdF
	io2IspbRrt/ltDqbAwv8iysDOQ2aQcbXJVYzJtxIu1gPD2MHmbAGoXuyvjVQf+Hz23y/tx
	YG8RV+F9MR90E0zaoYJOjg4mnF2e1heXG2pQdgrd2463gcO5rDAyhlEcTLgKDhDTt66+dB
	ae5rPyRFJ4LHOa3R0obQUoZXfvXrIfbvOsckse49DIRQ0ezYk0wvI1+qC3F0Kg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/30] mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking
 information
In-Reply-To: <DJRK05XL4ONU.MM3VQ61CQJ6I@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 16:21:54 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-11-87e5d3122244@bootlin.com>
	<DJRK05XL4ONU.MM3VQ61CQJ6I@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 17:00:08 +0200
Message-ID: <87ldb3hxxj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_080018_174593_389DB856 
X-CRM114-Status: UNSURE (   7.16  )
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

Cj4gVGhlIG9yaWdpbmFsIFcyNVEzMiBkb2Vzbid0IGhhdmUgdGhlIENNUCBiaXQuCgpJIGRpZG4n
dCBmb3VuZCBhbnkgZGF0YXNoZWV0IHdpdGhvdXQgdGhlIENNUCBiaXQsIGJ1dCBub3cgdGhhdCBJ
IGtub3cKdGhlc2UgY2hpcHMgaGFkIGEgbmV3IGJhdGNoICh3aXRoIG1hbmRhdG9yeSBTRkRQIHN1
cHBvcnQpIHN0YXJ0aW5nIGZyb20KMjAxNiwgd2hlcmVhcyB0aGUgZGF0YXNoZWV0cyBJIGxvb2tl
ZCBhdCB3ZXJlIGZyb20gMjAxNywgaXQgaXMgcG9zc2libGUKdGhhdCBJIGNvdWxkbid0IGZpbmQg
YW4gb2xkIGVub3VnaCBvbmUuCgpXaGljaCBicmluZ3MgbWUgdG8gYSBtb3JlIGltcG9ydGFudCBx
dWVzdGlvbjogY2FuIHdlIGFueXdheSBlbmFibGUgQ01QCmFueXdheT8gSSBjb250cmlidXRlZCBz
ZXZlcmFsIHBhdGNoZXMgZm9yIHRoYXQgYWxyZWFkeSAobWVyZ2VkKS4gSSBndWVzcwppZiB0aGUg
Q01QIGJpdCBpcyBub3QgcHJlc2VudCwgdGhlIG9sZCBzb2Z0d2FyZSBkb2VzIG5vdCB1c2UgaXQu
IElmIGl0CnRyaWVzIHRvIHVzZSBpdCwgbm9ybWFsbHkgdGhlIHZlcmlmaWNhdGlvbiBzaG91bGQg
ZmFpbC4KClRoYW5rcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
