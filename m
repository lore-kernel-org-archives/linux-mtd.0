Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98F6C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:08:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D4A6196C
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25D4A6196C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ydu5vw0Uss1PdApCNiL/OEQgPDI1+hCFfqjLKusEzPQ=; b=YGlmaYyQ17KzBcRE9bKiuiCpI
	fCdib2a+xbAlnYAhPL2hdR8o6LuTWr/votyKss2ysUL1l6bV+E2zuvRrDmacNcie/Xn8jq4YIZULt
	NZglFxp7EVKEyr7v7ZpI8MTKvjmY1jGqEglJd2og1T9LIWhJoziC1RAONh/1JvBIdAJsDuI4RtBqf
	M/6UeDnSoxbDnCLTHqvrIbHSH4fWkzqtp5pDyLrpzYQuxSStHoAPuy6Bs10zTlhNHFv4zpYgvizty
	A7P+fqC+JDKtGVLyEjq3bsIh4xl9+x1hdjTl7TqqbuDQLpFbpXvJMSAGE9p5SpIdS9e+4BPOUgtUd
	YAK2M0epQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvLt-000quP-Jn; Mon, 29 Mar 2021 17:06:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoud-000ZWF-70
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=annmendBPJqTcIFtbIZLaoF6gqcUrLtAHZGAFKDW0Xo=; b=Vy8TO8+LYtlxsdVvlMITqCXqDj
 /NOZQGHDXHPJKkIes/AzWPobcFR2/oy6fd5gIYEXU5gumFj2GpJ0x9TVfCNKnocsXXbyp6w76o8K1
 P9Wime/vQrzfCOxMEobxx0SI+0KmF7/OfjLeJzhcIZc9hoEerTGJN+uAJtgXixucp6eRToui9D0Xe
 Fd1BG61qO9dt/6Zb6V7IgQSnoYDN8Dqs/uSE2AC+e0mcZdmv80DOd1ZP34UIWlyYRaf+t89R4RyL1
 80hiMCK6YFeG1mhj7yMD6edOqYXO+MhCHkBrJl/0ziMT2LxalA+q1kyurOKoeEwIqolBobU5GIhdI
 vrfijf1A==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZDF-000Kdp-GZ
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:28:43 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 105EEE0003;
 Sun, 28 Mar 2021 17:28:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Vivek Unune <npcomplete13@gmail.com>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: add binding for Linksys Northstar
 partitions
Date: Sun, 28 Mar 2021 19:28:09 +0200
Message-Id: <20210328172809.9774-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312134919.7767-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2fa7294175c76e1ec568aa75c1891fd908728c8d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_182836_018470_E4113C36 
X-CRM114-Status: UNSURE (   5.65  )
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

T24gRnJpLCAyMDIxLTAzLTEyIGF0IDEzOjQ5OjE4IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IExpbmtzeXMgb24gQnJvYWRjb20gTm9ydGhzdGFyIGRldmljZXMgdXNlcyBmaXhl
ZCBmbGFzaCBsYXlvdXQgd2l0aAo+IG11bHRpcGxlIGZpcm13YXJlIHBhcnRpdGlvbnMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKQXBwbGllZCB0byBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10
ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
