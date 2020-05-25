Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8E0C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 06:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A99F204EA
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 06:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p8ljBlbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A99F204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98ShM/sSVRzi2KChJFT1399T7avYWWL5ljtvTdIHm50=; b=p8ljBlbAGphmuY
	/W+zanI3+pJpJvJQtEqb6Qv96qTpVJLun3noQAKwCTohiSJ/kRwbhh8dRTwSfJynrArijV9SDx6nY
	hGnJJoU/T594i2cB9fG6GlmY80xn5QkhGGEHBN1dVck1gIPiabh+VYqw5XGK5BZTep7D6qnwyRhe4
	nKBVeNgMqiO9UbMRbxClTtOys3v/nk5Kpy+LAifxpDSJ8pAS22p9ljNXFB0G84tEP2+/7YoJ70uj2
	Gd5SH2666AOpJj7m0cf+Z+nYymLP7m84VJsj6WMuMtNjsW2hs4LuZ9bGOE/N/sIxvFUl0mLcKBM9O
	AWka3KiO5v/gTRNk6q9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd6sp-0007h8-EK; Mon, 25 May 2020 06:46:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd6sm-0007c5-Tt
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 06:46:46 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DE3802611ED;
 Mon, 25 May 2020 07:46:42 +0100 (BST)
Date: Mon, 25 May 2020 08:46:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 17/17] mtd: rawnand: nandsim: Reorganize
 ns_cleanup_module()
Message-ID: <20200525084637.328d2872@collabora.com>
In-Reply-To: <20200525001328.6b52da1f@xps13>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-18-miquel.raynal@bootlin.com>
 <CAFLxGvzU2ESxZ74cve9w=CLBY2v95MMMJqzOFEmCAhVHYF5VvA@mail.gmail.com>
 <20200525001328.6b52da1f@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_234645_094776_56A8EBE6 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, dedekind@infradead.org,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNSBNYXkgMjAyMCAwMDoxMzoyOCArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgUmljaGFyZCwKPiAKPiBSaWNoYXJkIFdl
aW5iZXJnZXIgPHJpY2hhcmQud2VpbmJlcmdlckBnbWFpbC5jb20+IHdyb3RlIG9uIFN1biwgMjQg
TWF5Cj4gMjAyMCAyMzozNzoxMyArMDIwMDoKPiAKPiA+IE9uIFNhdCwgTWF5IDksIDIwMjAgYXQg
OToxOSBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZTog
IAo+ID4gPiAgICAgICAgIG5zX2RlYnVnZnNfcmVtb3ZlKG5zKTsKPiA+ID4gLSAgICAgICBuc19m
cmVlKG5zKTsgICAgLyogRnJlZSBuYW5kc2ltIHByaXZhdGUgcmVzb3VyY2VzICovCj4gPiA+IC0g
ICAgICAgbmFuZF9yZWxlYXNlKGNoaXApOyAvKiBVbnJlZ2lzdGVyIGRyaXZlciAqLwo+ID4gPiAt
ICAgICAgIGtmcmVlKG5zKTsgICAgICAgIC8qIEZyZWUgb3RoZXIgc3RydWN0dXJlcyAqLwo+ID4g
PiAtICAgICAgIG5zX2ZyZWVfbGlzdHMoKTsKPiA+ID4gKyAgICAgICBXQVJOX09OKG10ZF9kZXZp
Y2VfdW5yZWdpc3Rlcihuc210ZCkpOwo+ID4gPiArICAgICAgIG5zX2ZyZWUobnMpOwo+ID4gPiAr
ICAgICAgIGtmcmVlKGVyYXNlX2Jsb2NrX3dlYXIpOwo+ID4gPiArICAgICAgIG5hbmRfY2xlYW51
cChjaGlwKTsKPiA+ID4gKyAgICAgICBsaXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBuLCAmZ3JhdmVf
cGFnZXMpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGtmcmVlKGxpc3RfZW50cnkocG9zLCBzdHJ1
Y3QgZ3JhdmVfcGFnZSwgbGlzdCkpOwo+ID4gPiArICAgICAgICAgICAgICAgbGlzdF9kZWwocG9z
KTsgICAgCj4gPiAKPiA+IEFyZSB5b3Ugc3VyZSB5b3UgY2FuIHVzZSBwb3MgYWZ0ZXIgZnJlZWlu
ZyB0aGUgZW50cnk/Cj4gPiBTbWVsbHMgbGlrZSB1c2UgYWZ0ZXIgZnJlZS4KPiA+ICAgCj4gCj4g
TW1tbWgsIEkgc2hvdWxkIHByb2JhYmx5IGludmVydCB0aG9zZSB0d28gbGluZXMsIGZpcnN0IGNh
bGwgbGlzdF9kZWwoKQo+IGFuZCB0aGVuIGNhbGwga2ZyZWUoKSBvbiBsaXN0X2VudHJ5KCkuCgpZ
b3UgY2FuIGFsc28gdXNlICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoKToKCglzdHJ1Y3QgZ3Jh
dmVfcGFnZSAqcG9zLCAqbjsKCgkuLi4KCglsaXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBuLCAmZ3Jh
dmVfcGFnZXMsIGxpc3QpIHsKCQlsaXN0X2RlbCgmcG9zLT5saXN0KTsKCQlrZnJlZShwb3MpOwoJ
fQoKPiAKPiBUaGFua3MgZm9yIG5vdGljaW5nIQo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
