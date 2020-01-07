Return-Path: <SRS0=PPpL=24=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FE2C33C99
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 09:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2015F20715
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 09:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNDRDGfw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tcN4ViOp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2015F20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsYetVUw39fI/wwJa2uuo8lcW94k3jh+rWLD4qbCOuk=; b=WNDRDGfw2mzfxf
	r4vPFRXyjAjFRIa3ZMXMerLRTUrK8/7FkhJnIuElHOCtQTkpbEhkU0TbvazOSHeq4gRrH0OoZq5kT
	pnWcOttxFJo1io28cUk/B/UMI9S7dxjuoXtMr71w+h61Z1Hee6adXxsiRlzX4MfkdS5LXDDI7WOnI
	e4j/2WuXML1mxmdsXtHaDxKnyp9CQgEDO2yBeA9vSdidj9LfFFl43TezShxWj/JL1LnH8TdflOugP
	a8qhca2QC7bYGqFevqgeceb8q9eYDGI2zSA9UnvfNzxGL6D5ZnRk6gIxl0/uGTbNG06QYgfqYvXkw
	C/wA+rt19G4aSRi1VEAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioknl-0007xC-FC; Tue, 07 Jan 2020 09:05:25 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioknj-0007x4-Vb
 for linux-mtd@bombadil.infradead.org; Tue, 07 Jan 2020 09:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yipb7jD339S7dDG4wVC9EjzxTnOCqSZKCaOKWHvIpX0=; b=tcN4ViOp2QiJQFlCcCYHHvm2H1
 rc20lEeWhCGFMVOz6mUqYDo+Ds0/ZY6nF/8cbVfI1Vx84Z7zPCQGDZSEcszwvTJjipwOJZIsYS6vn
 9FJeOfHFM3kGujnK5sHvDJ6glKjmbvEytsSpBhZG+jtAiOgzO0cH1rY5ZN89zLBwGc1pzJXSwdYUs
 RvKq4FhIGnwZXmUdKhmbiyiGJA7Pi1eJOOF5YokW0THHHWeBcjAIPdsetBg35Nh9rntd3V0a7diY0
 nKcxWMk5U8/dcQGgVNdC84/Lj3JDQq0jIDZgqusODUTwu5DGLyafI1olXu2FpYMq6lh5VfFYrO0Nl
 Pwq2QHYw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioknh-0004RM-6H
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2020 09:05:22 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 16206FF80D;
 Tue,  7 Jan 2020 09:04:39 +0000 (UTC)
Date: Tue, 7 Jan 2020 10:04:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2] mtd: cadence: Fix cast to pointer from integer of
 different size warning
Message-ID: <20200107100439.23f86175@xps13>
In-Reply-To: <CAOesGMjp8=uOwTnGwuMwTJMKVh915udgkhSb0joKMTcwWBEy-Q@mail.gmail.com>
References: <20191216110947.6fb2423a@xps13>
 <20191218095715.25585-1-gomonovych@gmail.com>
 <CAOesGMjp8=uOwTnGwuMwTJMKVh915udgkhSb0joKMTcwWBEy-Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Vasyl Gomonovych <gomonovych@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgT2xvZiwKCk9sb2YgSm9oYW5zc29uIDxvbG9mQGxpeG9tLm5ldD4gd3JvdGUgb24gTW9uLCA2
IEphbiAyMDIwIDEzOjE4OjE3IC0wODAwOgoKPiBNaXF1ZWwsIHRoaXMgd2FybmluZyBpcyBzdGls
bCB0aGVyZSBib3RoIGluIG1haW5saW5lIGFuZCBsaW51eC1uZXh0Lgo+IAo+IENhbiB5b3UgcGxl
YXNlIGFwcGx5IGl0IGFuZCBnZXQgaXQgc2VudCBpbiBzbyB3ZSBjYW4ga2VlcCB0aGUgdHJlZQo+
IGJ1aWxkaW5nIGNsZWFuaW5nIGFuZCBzcG90IHdhcm5pbmdzIHdpdGhvdXQgdGhlIG5vaXNlPyBU
aGFua3MhCj4gCj4gT24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMTo1NyBBTSBWYXN5bCBHb21vbm92
eWNoIDxnb21vbm92eWNoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVXNlIGRtYV9hZGRyX3Qg
dHlwZSB0byBwYXNzIG1lbW9yeSBhZGRyZXNzIGFuZCBjb250cm9sIGRhdGEgaW4KPiA+IERNQSBk
ZXNjcmlwdG9yIGZpZWxkcyBtZW1vcnlfcG9pbnRlciBhbmQgY3RybF9kYXRhX3B0cgo+ID4gVG8g
Zml4IHdhcm5pbmc6IGNhc3QgdG8gcG9pbnRlciBmcm9tIGludGVnZXIgb2YgZGlmZmVyZW50IHNp
emUKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWYXN5bCBHb21vbm92eWNoIDxnb21vbm92eWNoQGdt
YWlsLmNvbT4gIAo+IAo+IEFja2VkLWJ5OiBPbG9mIEpvaGFuc3NvbiA8b2xvZkBsaXhvbS5uZXQ+
Cj4gCgpTb3JyeSwgSSBhbSBsYXRlLiBJJ2xsIHNlbmQgYSBmaXhlcyBQUiB0aGlzIHdlZWsuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
