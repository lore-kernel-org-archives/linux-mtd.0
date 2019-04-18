Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5291C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:11:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6AF21479
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hq/dQBt7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dPvfroYT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6AF21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8KEueq0TlAheTNpnAn99S3yqs41xlQXkQ5cL12US2Y=; b=Hq/dQBt7UGmbsY
	5HdGqhWcMC3wKucCQr4DJi9gH7SC+5kkBfYEQ3q+G6VyzwnAA6vqU5GVfZ0A8AaVx+O3c9zwL8Lz8
	wr1j8Gipg/OU6vN2K6RwnTpCIXI4W4NTwyp9djsD+52QfoYzs/hAf6f7aKKWgTDNl4WcQCh/qxF2g
	c3n6EkJsjaXv46Jeilq2FquXc5ntT3mcdk5ZwV6ukPHpNBK4mwwBhHaEoMgFm3nqyFNkLo/bWzrxZ
	wKNXqpiRgJpcd8pFQA+/Am7H39zZajtbWzSOanjc/D8v+QVHXHiatBT+qC2RoO7f9QsCEjvRsbBBz
	AiFb9tS7ne/HnmiJhwIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9cw-0002bj-Cn; Thu, 18 Apr 2019 16:11:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9cU-0001xt-JL
 for linux-mtd@bombadil.infradead.org; Thu, 18 Apr 2019 16:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cpX3iA9Z6Lo0q/kuapTm390T7TEZa5Q1HSl/LwWjF4g=; b=dPvfroYT512lmLT55BR0QLUT24
 qURrrSAix9VQLGRBAaAqhIFbh/MqP04CLp2XNdjmixVAEGJfXSrIEZBLhN9EDeJMJadN0WowsK5q7
 oOqLc6Y7X1QAZ+Ox+Oa+n6vmUpy/azZPROnvfnvKWQHecIvzMaNC2YniOsbNyGGxcOv5M8mKkTRuj
 bO3CqYLfg3XM/fP2sSbPuf9qeqfl+zhdRA0fMQMo290W9p01aZNW+/+UA3dS0M81EQ2Za4p6l3jwe
 rpsm5UR0O5MTHvvu930Tk6XmojtElKvsc0/e7hTw9qgwCOAIuLeV+tbO5pXvB4CDsW5cY30UjzOC4
 2HIEeUdw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9cQ-0000sU-SZ
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:10:36 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 79FD01C000C;
 Thu, 18 Apr 2019 16:10:08 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:10:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
Subject: Re: [PATCH v1 mtd/nand/next 1/3] mtd: rawnand: fsl_elbc: Cosmetic move
Message-ID: <20190418181007.6ad9c4ce@xps13>
In-Reply-To: <20190322132619.10339-2-marek.behun@nic.cz>
References: <20190322132619.10339-1-marek.behun@nic.cz>
 <20190322132619.10339-2-marek.behun@nic.cz>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_171034_960906_C9CD1A64 
X-CRM114-Status: UNSURE (   5.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Shreeya Patel <shreeya.patel23498@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssCgpNYXJlayBCZWjDum4gPG1hcmVrLmJlaHVuQG5pYy5jej4gd3JvdGUgb24gRnJp
LCAyMiBNYXIgMjAxOSAxNDoyNjoxNworMDEwMDoKCj4gTW92ZSB0aGUgZnNsX2VsYmNfYXR0YWNo
X2NoaXAgZnVuY3Rpb24gYWZ0ZXIgdGhlIGRlZmluaXRpb25zIG9mCj4gZnNsX2VsYmNfcmVhZF9w
YWdlIGFuZCBmcmllbmRzIGluIHByZXBhcmF0aW9uIGZvciB0aGUgbmV4dCBwYXRjaC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBNYXJlayBCZWjDum4gPG1hcmVrLmJlaHVuQG5pYy5jej4KPiAtLS0KClNl
cmllcyBhcHBsaWVkIHRvIApodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9tdGQvbGludXguZ2l0IApicmFuY2ggbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
