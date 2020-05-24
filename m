Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED518C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:33:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B234D2073B
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IZqkDXhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B234D2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSjPmeqI9+fCHsGMqOim2u93k9L/6pB67mkLMfjxPoI=; b=IZqkDXhyxGJrXK
	SBxtTT+OFAoZTQ09SA60vpxa+XpAodF4MbO/E4CQ6iRWq2NKnIKKcR8ocpwLJdCIv35Ut98U/LHaA
	9MbZjD8FtGnwsBHXNvWhTnNfXtpOaTTXLoQVc5R+nxD19Ge+7Xfz6V5LfiTNNLqpnLE4aBZ/t/WLu
	FopGD1Nc5gw5Wnbzu36ju24akbKDN9YeLV1wPloq992Ivcbh3JDKO4KjSaVvHYt/16VLsMThSUi/z
	YNJJF4djmxXaGBDN6Ow9I16rwrkDbcpEsBJIIK0yKh8LIhPG7OOtyqWM6hnGnZO9iABgmFZbbgn/E
	ATnSngWE67cDdju6gC7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcwMe-00067z-Vr; Sun, 24 May 2020 19:32:52 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcwGO-0006vA-7Y
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 19:26:25 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 115D0C0002;
 Sun, 24 May 2020 19:26:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date: Sun, 24 May 2020 21:26:19 +0200
Message-Id: <20200524192619.7945-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522121524.4161539-3-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d136fd1f93f45490e7b5e9513163f6890cb761b0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_122624_435756_5AEB20E7 
X-CRM114-Status: UNSURE (   5.41  )
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

T24gRnJpLCAyMDIwLTA1LTIyIGF0IDEyOjE1OjIxIFVUQywgPT91dGYtOD9xPz1DMz04MWx2YXJv
X0Zlcm49QzM9QTFuZGV6X1JvamFzPz0gd3JvdGU6Cj4gT25seSB2My4zLXY1LjAgaGF2ZSBhIGRp
ZmZlcmVudCBDUzAgbGF5b3V0Lgo+IENvbnRyb2xsZXJzIGJlZm9yZSB2My4zIHVzZSB0aGUgc2Ft
ZSBsYXlvdXQgZm9yIGV2ZXJ5IENTLgo+IAo+IEZpeGVzOiAyN2M1YjE3Y2QxYjEgKCJtdGQ6IG5h
bmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJyb2FkY29tIFNUQiBOQU5EIGNvbnRy
b2xsZXIiKQo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFy
aUBnbWFpbC5jb20+Cj4gQWNrZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21h
aWwuY29tPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
