Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32025C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+gB7CNozAYZMmjLZ1y9h6kEx7cENCralh0VYTAve7E=; b=RO1m1Tx91u7n7D
	tz5aQ9wGAbRMElgnJKLV1PYm1v88yrnDykINwKTxfogocmH2FbKX5pvEx3RlpOnbtwUBLpiusABLP
	OWMai/P0YYiDd90jWv7Vz6cM9XWrOWOE1PKgfmxttg7tnv3AmjdbOrbLPpHMWxsB1xQbnXszGw7A+
	5ebUrhjxRbtQvq1ZVMovaIFcNOWBFkRQu/uE3WN3chNrhs35x/EtwTiaIAN435N6o1TFvy0VKVBy7
	AJ3bdiWCDvLNazrujQ5A5OWS3D1ef/9ZYvRuqgSRyM03Cs6dvlMUeF7+kDtpJQnPQg3UdAXvaYNBD
	tLrSvfy5b0u6DsPlCxbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdsN-0098wD-Cn; Mon, 16 May 2022 16:47:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdpx-0097p7-Qp; Mon, 16 May 2022 16:44:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7554660006;
 Mon, 16 May 2022 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652719485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUjbQlS3O1i0rkDnApT2NyN4So3rWaikhG7cYVbOcXM=;
 b=m2smwsK1yyTpi5NGCuIYbWpu4vQMX+9RzY8/NP6JJ1sx91tTxqivT0YlcTxG6Ub2QLFVFH
 nK8Fn+snRVBStsJNryq2Jx4IMGwYsBDiF/dlEUqNXeLJ07r8pg1N6hsDYOprBQ4X6k8vrS
 ue2IZG+QxPypoAAuzFcWQW95ijWe9kONqqptE6M0XqBgWvzCVVAQyNfKwcvPdy8OH2OGgk
 VqKWcOJJJL82KEl398SiMl1bc+uMbmkYS4vKITWhXRdXegqaEuQJ+yDOtgXYx0D9QtfRgB
 7Dsr45VDjFU5dIY7FPN3k0jmRZ0FlZ0RFSoUX1x3GsBkKghRqSSWY37rsVaLpA==
Date: Mon, 16 May 2022 18:44:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Heiko Stuebner <heiko@sntech.de>,
 Richard Weinberger <richard@nod.at>, Yihao Han <hanyihao@vivo.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: rockchip: Check before
 clk_disable_unprepare() not needed
Message-ID: <20220516184443.25827c24@xps-13>
In-Reply-To: <20220512184558.45966-1-phil.edworthy@renesas.com>
References: <20220512184558.45966-1-phil.edworthy@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_094450_082161_9903A16A 
X-CRM114-Status: UNSURE (   8.83  )
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

SGkgUGhpbCwKCnBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20gd3JvdGUgb24gVGh1LCAxMiBNYXkg
MjAyMiAxOTo0NTo1OCArMDEwMDoKCj4gQWxsIGNvZGUgaW4gY2xrX2Rpc2FibGVfdW5wcmVwYXJl
KCkgYWxyZWFkeSBjaGVja3MgdGhlIGNsayBwdHIgdXNpbmcKPiBJU19FUlJfT1JfTlVMTCBzbyB0
aGVyZSBpcyBubyBuZWVkIHRvIGNoZWNrIGl0IGFnYWluIGJlZm9yZSBjYWxsaW5nIGl0Lgo+IEEg
bG90IG9mIG90aGVyIGRyaXZlcnMgYWxyZWFkeSByZWx5IG9uIHRoaXMgYmVoYXZpb3VyLCBzbyBp
dCdzIHNhZmUKPiB0byBkbyBzbyBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWwgRWR3b3J0
aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20+CgpCb3RoIHBhdGNoZXMgaGF2ZSBiZWVuIGFw
cGxpZWQgdG8gbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
