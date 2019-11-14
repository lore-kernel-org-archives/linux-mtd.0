Return-Path: <SRS0=UT8Q=ZG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D216C432C3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 10:01:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C41206D9
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 10:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OI1FDzI4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21C41206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nS3gPTZvrzcFCq8cBbEboGJwSr/N6g+hILVtke0BWTw=; b=OI1FDzI4kDxlZs
	w36ffEYF3HI72IeDgVUgyYX/PdOwkZxWjV+h8ORkvOHAj3s5IIhtvl9qo4Uz6+Wrsn+dZ3bUK6Enf
	2al6Be6rOG0u5jYvAxvaQQfC0LpQrSDHC9WfDCkFxHjMwBwhug9o1CFCJnaOgiku4pp4T2+9PpXpP
	04T5mdj7LmtQAc7yJSjHKoe/s/G+qsNoHJssNZaSgei6dmr19krdXC9gUol04u1tj7NcRDxxq9gr5
	lSK/l9XjIc2J+5x/i0a/NHdrZ9o5hmJdO/168kFmm8Ewe5VSHjqE484hfWR4pRF/39+6JUHXHaysg
	/ingLXvViMeNhS9NBnvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVBw6-0001SP-48; Thu, 14 Nov 2019 10:01:10 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVBw3-0001Rx-6v
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2019 10:01:08 +0000
Received: from xps13 (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr
 [86.206.246.123]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B1ABC24000E;
 Thu, 14 Nov 2019 10:00:54 +0000 (UTC)
Date: Thu, 14 Nov 2019 11:00:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ubi: remove unused variable 'err'
Message-ID: <20191114110053.4fbeb918@xps13>
In-Reply-To: <20191114072236.15104-1-yuehaibing@huawei.com>
References: <20191114072236.15104-1-yuehaibing@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_020107_387180_4822D9A0 
X-CRM114-Status: UNSURE (   5.35  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWXVlLAoKWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZSBvbiBUaHUs
IDE0IE5vdiAyMDE5IDE1OjIyOjM2CiswODAwOgoKPiBkcml2ZXJzL210ZC91YmkvZGVidWcuYzo1
MTI6Njogd2FybmluZzogdW51c2VkIHZhcmlhYmxlICdlcnInIFstV3VudXNlZC12YXJpYWJsZV0K
PiAKPiBjb21taXQgMzQyN2RkMjEzMjU5ICgibXRkOiBubyBuZWVkIHRvIGNoZWNrIHJldHVybiB2
YWx1ZQo+IG9mIGRlYnVnZnNfY3JlYXRlIGZ1bmN0aW9ucyIpIGxlYXZlIHRoaXMgdmFyaWFibGUg
bm90IHVzZWQuCgpUaGFua3MgZm9yIHRoZSBmaXggYnV0IEkgYWxyZWFkeSBmaXhlZCB0aGlzIHRy
aXZpYWwgaXNzdWUsIEkganVzdApkaWQgbm90IGhhZCB0aW1lIHllc3RlcmRheSBuaWdodCB0byBw
dXNoIGl0LCBub3cgaXQgaXMgZG9uZS4gSXQgd2lsbApiZSBwYXJ0IG9mIHRvbW9ycm93J3MgbGlu
dXgtbmV4dCByZWxlYXNlLgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
