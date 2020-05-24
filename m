Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17055C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E8032075F
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ny2Uy0PB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E8032075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpUeY+hgrp69ihZdNsr3U6HDm1WIgmvky+fYxjHcTtU=; b=ny2Uy0PBnoXWIi
	wybYODcjXn2T6rm1Hb9fBkO1LobZqlT82/W0wp1oGqhek9ftaKVzm7PY6dFk/rHwtQMYpwDuQIync
	TvSJFfigBwrG7DDmaIS33Gm5AemtRowjaUVaMd0D1wBZnnIGi3hOfei04VJMlYSxcVWHzQJO8/IXp
	Fo6NmCSNixoVw5UKXOpxcB40gx2P7WaV6I3g2NSLZ1CpQSx8isxHSF2oi4e7E0TARMekttZQO6BkL
	uaPhFmbpCKHh/gaBSwfGLldYqhHltGrwT+GwErjw7ts6xD5l1bt1s4AySztKKFAHhj0eOJ1L8jNCI
	iDPyAN3oTzdzjY+o+eSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcwGa-000771-JQ; Sun, 24 May 2020 19:26:36 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcw7N-00023R-Bu
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 19:17:06 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 29EA3240002;
 Sun, 24 May 2020 19:16:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4] mtd: rawnand: brcmnand: correctly verify erased pages
Date: Sun, 24 May 2020 21:16:58 +0200
Message-Id: <20200524191658.29742-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512082451.771212-1-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: dcb351c03f2fa6a599de1061b174167e03ee312b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_121705_545778_31747490 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

T24gVHVlLCAyMDIwLTA1LTEyIGF0IDA4OjI0OjUxIFVUQywgPT91dGYtOD9xPz1DMz04MWx2YXJv
X0Zlcm49QzM9QTFuZGV6X1JvamFzPz0gd3JvdGU6Cj4gVGhlIGN1cnJlbnQgY29kZSBjaGVja3Mg
dGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2VkLgo+IFRoaXMgaXMgYSBwcm9ibGVtIHdo
ZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRlZCB0byB0aGUgT09CLCBzaW5jZSBpdCB3aWxs
Cj4gZmFpbCBkdWUgdG8gdGhlIHVzYWJsZSBPT0IgYnl0ZXMgbm90IGJlaW5nIDB4ZmYuCj4gQ29y
cmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCBkYXRhIGFuZCBFQ0MgYnl0ZXMgYXJlbid0
IDB4ZmYuCj4gCj4gRml4ZXM6IDAyYjg4ZWVhOWY5YyAoIm10ZDogYnJjbW5hbmQ6IEFkZCBjaGVj
ayBmb3IgZXJhc2VkIHBhZ2UgYml0ZmxpcHMiKQo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVy
bsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9u
ZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
