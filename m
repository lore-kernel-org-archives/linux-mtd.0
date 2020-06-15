Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C88DC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 08:51:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425FE20679
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 08:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUu6YRUA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425FE20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oqDj8n/cuLYbHEuMw93ja9P1n7/u1QKqvRu2gKkNi4=; b=KUu6YRUAQNI3KX
	GGaf4wnZvJnkZ+c1XNM1/wQMvC8qwSZUxox/K0lbl+4cUGQ7PcTDpm1D2xHl3NeBe4BhOxMZPyBkh
	nH4uKM+mfLXZih77IOCRzE3YxTPNz69/sxBcG1eTuscG6LUWcjLkucYHuUwh5NNSDqjPXNTQNHWta
	6Safg66HUEHwg8inagtWBh3acsSkRX7VR9GVJ9EtVQHaM7FtyOMEI4bPJ+sJbgLuPmyhTNnGPbiup
	GkE00QuYErc6zRhOOxdW4HpWqSaUrOSqVZPWTVZGthjUTaOD+jzmleJap0F4DjvxH5WzjSgMPvEBt
	CdKmjRKUUIQYXA93MXOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkkq2-0006F3-8Y; Mon, 15 Jun 2020 08:51:30 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkkoW-0002ac-5e
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 08:49:57 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DAED9240013;
 Mon, 15 Jun 2020 08:49:45 +0000 (UTC)
Date: Mon, 15 Jun 2020 10:49:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V4 1/2] mtd: rawnand: qcom: avoid write to unavailable
 register
Message-ID: <20200615104943.16b1b8db@xps13>
In-Reply-To: <1591948696-16015-2-git-send-email-sivaprak@codeaurora.org>
References: <1591948696-16015-1-git-send-email-sivaprak@codeaurora.org>
 <1591948696-16015-2-git-send-email-sivaprak@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_014956_360778_70C66178 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2l2YXByYWthc2gsCgpTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJv
cmEub3JnPiB3cm90ZSBvbiBGcmksIDEyIEp1bgoyMDIwIDEzOjI4OjE1ICswNTMwOgoKPiBTRkxB
U0hDX0JVUlNUX0NGRyBpcyBvbmx5IGF2YWlsYWJsZSBvbiBvbGRlciBpcHEgbmFuZCBwbGF0Zm9y
bXMsIHRoaXMKPiByZWdpc3RlciBoYXMgYmVlbiByZW1vdmVkIHdoZW4gdGhlIE5BTkQgY29udHJv
bGxlciBpcyBtb3ZlZCBhcyBwYXJ0IG9mIHFwaWMKPiBjb250cm9sbGVyLgo+IAo+IEF2b2lkIHdy
aXRpbmcgdGhpcyByZWdpc3RlciBvbiBkZXZpY2VzIHdoaWNoIGFyZSBiYXNlZCBvbiBxcGljIE5B
TkQKPiBjb250cm9sbGVyLgo+IAo+IEZpeGVzOiBkY2U4NDc2MCAobXRkOiBuYW5kOiBxY29tOiBT
dXBwb3J0IGZvciBJUFE4MDc0IFFQSUMgTkFORCBjb250cm9sbGVyKQoKVGhlIEZpeGVzIGxpbmUg
aXMgbm90IHByb3Blcmx5IGZvcm1lZDogdGhlIG51bWJlciBvZiBkaWdlc3QgZGlnaXRzIG11c3QK
YmUgMTIgYW5kIHRoZSB0aXRsZSBzaG91bGQgYmUgZW5jbG9zZWQgd2l0aCAiIi4gSSB3aWxsIGZp
eCB3aGVuCmFwcGx5aW5nLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
