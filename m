Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212C0C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:51:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6B121736
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pzTR6nzp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IdW48cZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6B121736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=th3DTSH/krmyczc46bz4K6oTdK5f9P5e8MVyjZ3Yt7Y=; b=pzTR6nzpP41m5k
	OM1UsnCNvZxYxxz13gRSfm/YsaN2A9f6MDQIctGeZe7SeoxVlZK1VxjPNU/uNdyerG3gxCbbnGcWr
	TrJMkx52MUmNsOdVOmU3FMq800R4uZqc8Qb4VIrnrxH9WO63029+T7mqlBWAehbiydZ87I1rjQM5j
	vSzJSrSXauGPYvexxXemXanT43XdIMRuJ+xj8nJaFK8oS8Ax/JK+dg/ApYjnxy6O859DA7oXBC8KR
	f0HOWoQEr4ypXAw7cs1fEv8evOa/pIPi7Rt1s2lcj8O2pOncqP2/RyQIKCltpw+1hlWUGTRbY0CKx
	SHIbOExFze6R/saLCA2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3ZC-0008HT-L5; Mon, 28 Jan 2019 09:50:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3ZA-0008GY-Sh
 for linux-mtd@bombadil.infradead.org; Mon, 28 Jan 2019 09:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fpAZ7h/FjRhKi39fue67Li20yCDwB8EgdLppFyWhE0=; b=IdW48cZV0giPX1SQ5Md5NKJUSN
 t+LV404S/8tOTXwd57/mCfu6LgcSWGLdbURK3QScxmE73mI9hWX1XKNo+HuG1qcLGTUyyFjO+KUhP
 Bys85xsUCr9OoHz7ZszjlHj3oUkHhMPYabAZ4b/EeUhGVZn2fGUAFt1iZ4wifGfOtS2vtnITuMDAE
 K1Hk+eAAXFHmbgXPb4Fir8+cCa8pixMjpAOatH77cMKRLB+i4nB+cVLJEMtKM1c3k12M11LbmsaB0
 j12PsWI2LansV+d3Y9nqEkhU/lfwop1odKOtgypGAQtEM9c3g2SFGPYp/Rwu4RfSjAWYnMAumOBxz
 oE0Pd3Ag==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3Z8-0003x8-2u
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:50:55 +0000
X-Originating-IP: 90.88.29.206
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A8EA860017;
 Mon, 28 Jan 2019 09:50:20 +0000 (UTC)
Date: Mon, 28 Jan 2019 10:50:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: nand: fix kernel-doc warnings
Message-ID: <20190128105019.5aa8edeb@xps13>
In-Reply-To: <20190128104319.7a9effde@bbrezillon>
References: <21d5edd7-1335-2731-6d53-5b15d053462c@infradead.org>
 <20190128104319.7a9effde@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_095054_144887_48A5D3BD 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFuZHksCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gTW9uLCAyOCBKYW4gMjAxOQoxMDo0MzozOCArMDEwMDoKCj4gT24gU3VuLCAyNyBKYW4gMjAx
OSAxODoyMTo0MiAtMDgwMAo+IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3
cm90ZToKPiAKPiA+IEZyb206IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+
ID4gCj4gPiBGaXgga2VybmVsLWRvYyB3YXJuaW5ncyBpbiBkcml2ZXJzL210ZC9uYW5kL3JhdzoK
CldpdGggdGhlIHByZWZpeCBjaGFuZ2VkIHRvICJtdGQ6IHJhd25hbmQ6IgoKQWNrZWQtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
