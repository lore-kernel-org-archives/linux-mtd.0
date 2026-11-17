Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3684606BD22
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UooS5QoQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T8RtQEgD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CGqt9m+ia7rDPrGLK6fkqLEr6LFc61V7E5vxrzMKH3Y=; b=UooS5QoQZBND5WqppPNdZajYh2
	T7jQwlpYMxqjm6wUDNGA6l+sGWgKIN0+FTmuOVFkLUvAemg8DhW92+12uqz4rh01myrszolTs14J9
	hiEhSEXY/W/TQhK2xSWxfmUudZZgU8vGpy8/unTCTiPdC725py2qVmbERQagQc89nvHF8j58yYlJ9
	DoE4eDSQmLFC9SI/2Nc8j8NAcXNKRd/HOsssaRBFJ++9apnzY0DOximYOJZ+LWm/06SyI1Jc6GmOn
	ICVxNzKD9ucO94NJKfIwOeUdDEO9iA4AJF3zH3nNOqPA+He3b9FJqipudaUG/FXWDj985ptnpzSnf
	PUt9AyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJwK-000000064fo-3RFx;
	Tue, 17 Nov 2026 14:13:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJwH-000000064fF-3oO1
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:13:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3D771C4EDBD;
	Tue, 17 Nov 2026 14:13:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4FE45FC81;
	Tue, 17 Nov 2026 14:13:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C008411BC0024;
	Tue, 17 Nov 2026 15:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794924813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XnDg3LSvvLKOhODP50y+bXUFTm0xPYEfsjQv/OxLyvY=;
	b=T8RtQEgDk82tB+T2G8WcDM83qbuxQWJx50BVnv5ZQSuXl8L3T+hASktHtCiSVsWRwsRvne
	08/HM2XY+9JfRhDzrK4adoxW/gZ2cOcEg5ycMusHDq62o1vSWPPkMevMd+H6PzgV09rbqo
	Wv1vzevpnUlPkR9m8wjg6K8ac6TPgzAQrRhY+GCDAie0a03yg9L29AbsFSIj+h8yv0VtYH
	hThFiJGiXDewVXgYOPX7+SoinmumDzsWHRk8zTmP0aBNWvOjcmk5o1S25Vtj9yvRSEV3Ac
	TIkIjlLdLXWTYCwQ7gm/DZG2g9tIEspLPORS9mwLwOG8P6eo9MOlcytVEnU/kQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank.Li@oss.nxp.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frank Li <Frank.Li@nxp.com>,  Alok Tiwari
 <alok.a.tiwari@oracle.com>,  Runyu Xiao <runyu.xiao@seu.edu.cn>,  Chen Ni
 <nichen@iscas.ac.cn>,  Kees Cook <kees+treewide@kernel.org>,  Hemanth
 Selam <hemanth.selam@gmail.com>,  linux-mtd@lists.infradead.org (open
 list:CADENCE NAND DRIVER),  linux-kernel@vger.kernel.org (open list),
  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API functions
In-Reply-To: <20261111202502.3860647-1-Frank.Li@oss.nxp.com> (Frank Li's
	message of "Wed, 11 Nov 2026 15:24:45 -0500")
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 15:13:25 +0100
Message-ID: <87bj7nlf5m.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_061338_111070_4E3F0A9E 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTEvMjAyNiBhdCAxNToyNDo0NSAtMDUsIEZyYW5rLkxpQG9zcy5ueHAuY29tIHdyb3Rl
OgoKPiBGcm9tOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPgo+IFVzZSBkbWFlbmdpbmVf
Z2V0X2RtYV9kZXZpY2UoKSBpbnN0ZWFkIG9mIGRpcmVjdGx5IGFjY2Vzc2luZyBjaGFuLT5kZXZp
Y2UKPiBhbmQgdXNlIGRtYWVuZ2luZV9wcmVwX2RtYV9tZW1jcHkoKSBpbnN0ZWFkIG9mIGNhbGxp
bmcgdGhlIGZ1bmN0aW9uIHBvaW50ZXIKPiBkaXJlY3RseS4gVGhpcyBmb2xsb3dzIHRoZSBkbWFl
bmdpbmUgQVBJIGNvbnZlbnRpb24gb2YgdXNpbmcgYWNjZXNzb3IKPiBoZWxwZXJzIHRvIGRlY291
cGxlIGRyaXZlcnMgZnJvbSBpbnRlcm5hbCBkbWFlbmdpbmUgc3RydWN0dXJlcy4KPgo+IEFmZmVj
dHMgY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIgYW5kIGZzbWNfbmFuZCBkcml2ZXJzLgo+Cj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UgYW5kIHByZXBhcmUgdG8gbW92ZSBzdHJ1Y3QgZG1hX2RldmljZSB0
byBwcml2YXRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+
CgpJIHdpbGwgZml4IHRoZSBzdWJqZWN0IHdoZW4gYXBwbHlpbmcgKG5hbmQ6IHJhdzogLT4gcmF3
bmFuZDopCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
