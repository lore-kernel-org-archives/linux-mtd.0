Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19128C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zulODGd+MEA0bQs9W5MNdfTaIzf/FVcthMkixRERQrs=; b=hTGwkWZas3PqQp
	63uNwKS6mcPG3pQcwSl5Pf8RgRD9LF0VNrzzM/ldpse2DLwoQU0+RqfWYTVmtUqa1HwSIonBKtS+K
	rJvXB/Ko20pOr/GXJcbu5pQdIEILAo4MsxH3VariU6jVl5yh2Gl3qtfh87dkvckDmVFjhSif/rztZ
	t2mRElxtEBhaDf8kAWxHagYtimdFJjOK+xdx3YVx1c5PvX7YmZq5+tG7kPX71NXUXoAfMCBGyIqFv
	37ghikYFvoKKIxz2WIvzuMhPDxSyrhcksIT9MD+nykRHKFxM39pODyF0Ct7EXx0zvULb+YY1q4902
	P9JHV6TMoBCLRZlNU0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os53W-00GDMQ-RY; Mon, 07 Nov 2022 16:33:02 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4sG-00G8FY-80
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:21:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E6226100003;
	Mon,  7 Nov 2022 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uM7yUcMPMv/XcX/VRgVf0/ong+TUvBCzIjxYj5ODl1c=;
	b=DSBoIoscOLGm/5JQpQAuvfXaAzQmvr+3/7BZWIusnsQ3lSbtwtmvA3P5fauEDCObVzG3xX
	rKiETGyFOZNdOxoq/Wpx11HKcPSYGTVGMmbxkehTJlK6BN8rPpZuORtEBT9sPjVe164wkO
	9T55roEOQ6fksJ0wLabZIxlGTKRt9fkbOSgMavGeurha2/HwO/xhZ20/9wsWRo/3ZU2bJv
	/fMFeJsSIqx03/JP+wpQXH3Y6VguSU2zwlZ6Pd2KZ0Pk13SfnO7BNEXVrByYKNP1KG5bbw
	4JNuysYhsL9WSH+jZuD4xKRKY1rFGKzoBeJ0scUl13PkFMoZH1+n8zkiEeAXyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 2/2] mtd: core: set ROOT_DEV for partitions marked as rootfs in DT
Date: Mon,  7 Nov 2022 17:21:17 +0100
Message-Id: <20221107162117.49006-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022211318.32009-2-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'26422ac78e9d8767bd4aabfbae616b15edbf6a1b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082124_458012_6D13DC65 
X-CRM114-Status: UNSURE (   9.58  )
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

T24gU2F0LCAyMDIyLTEwLTIyIGF0IDIxOjEzOjE4IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciAibGludXgscm9vdGZzIiBiaW5kaW5nIHRo
YXQgaXMgdXNlZCB0byBtYXJrIGZsYXNoCj4gcGFydGl0aW9uIGNvbnRhaW5pbmcgcm9vdGZzLiBJ
dCdzIHVzZWZ1bCBmb3IgZGV2aWNlcyB1c2luZyBkZXZpY2UgdHJlZQo+IHRoYXQgZG9uJ3QgaGF2
ZSBib290bG9hZGVyIHBhc3Npbmcgcm9vdCBpbmZvIGluIGNtZGxpbmUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQXBwbGllZCB0byBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0
IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
