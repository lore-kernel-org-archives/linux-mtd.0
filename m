Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44192EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xd//FJl3ep4UbKYKhMpovf93UCfAX3ZkYJamjYuJG0Y=; b=xeT5R2lLn9BoQ0
	0/2xjYr6ePQZF4fIZXM/eCv8o54LkcoJWZZckEvSvfpxsCQYQ9cus61ek8uvjjk8568cALefz+g4G
	epdsXhKTBa0W4DqZwk3jja9oLxc5i6f/A5v/qxT3y7mZgOMQWD1cLdJl2o5rwm9GK1J7+tJQUdunY
	4F2Xoumr59oLaYmdkeD30Udc050eRt+h+XoQn8L/+2AbVVB2gZMf22UNVAu+oNepALkH2dp2foM/S
	O5fkYdJaxsLn4R/c0dJ6Ham7mflEHL+GI1sg6WVMqcsk/Kc8xnc3pPpvDpevbicgyVC/8MTBJY4Im
	7cpOlEluPx/vSUwEDx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQg-007r5w-1B;
	Mon, 19 Jun 2023 08:40:06 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQb-007r0K-2H
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:40:04 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687163997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hGb2YZ7DaDL82YmuUT/WVIu7xKhRQVFAm/pL2eduPw=;
	b=VTjogFZjdH83/EgvzlAURJbe5U4opCDZXfAjG+RP12Ss1LtyML8r1j5kYZlLP7M96bokyI
	gvIarwBzRUHKqM/5HxHhq1EQq0yHPazePDmcuG6IJmjy/Px3x0QUR/8aG+Ie6pTZqAOicq
	ohvXgW0h8kX0vz5Ui0HW1Opm/7T4bEg/suLpHno103O52/VKtICpPFJelSLmCYM9gDMBLs
	9JV3EbP+5yumSvra+NLC+WGDX2SpoEbTlM4zh4huqlcdJTBdhnMiydgJmyHzL7EA6mPk5A
	9ySqONX4x4aUcPxzEq1wcHsDPqhKsvhchbWsdwUTelFQ1wFx5k6xVP3BQ3mQ1w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37A4BC000B;
	Mon, 19 Jun 2023 08:39:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: add support for the Sandisk SDTNQGAMA chip
Date: Mon, 19 Jun 2023 10:39:55 +0200
Message-Id: <20230619083955.2940578-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <98811c98-4681-6ddc-8287-bd9b77559c51@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a6a8a1e16c14b5c93bec202ba2f1c8d7c9173571'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_014001_896229_C067744B 
X-CRM114-Status: UNSURE (   6.51  )
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

T24gVHVlLCAyMDIzLTA2LTEzIGF0IDIxOjIxOjA2IFVUQywgSm9oYW4gSm9ua2VyIHdyb3RlOgo+
IFNhbmRpc2sgU0RUTlFHQU1BIGlzIGEgOEdCIHNpemUsIDMuM1YgOCBiaXQgY2hpcCB3aXRoIDE2
S0IgcGFnZSBzaXplLAo+IDFLQiB3cml0ZSBzaXplIGFuZCA0MCBiaXQgZWNjIHN1cHBvcnQKPiAK
PiBDby1kZXZlbG9wZWQtYnk6IFBhd2XFgiBKYXJvc3ogPHBhd2VsamFyb3N6MzY5MUBnbWFpbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEphcm9zeiA8cGF3ZWxqYXJvc3ozNjkxQGdtYWls
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29tPgoK
QXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
