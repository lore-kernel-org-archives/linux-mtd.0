Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6721606A325
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v865tywm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SefnjUk3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0pwwWD0xIYFhYJnpg0BCGP9bpxEMXHyc4PgCDU+VRVw=; b=v865tywmSYFk8ilVDNShTOjg32
	HmDtbtWn8ISWbtlc1TFupAd7vwpr8x27XuQ9+25aSvn79xD5IySGFvpeiKlyErMTAhhSIO08GY6ad
	w+PtPTOOKF3YHgjM2QHeizUCCsQhgnixkCy0x4dwtt3AwZGc6xa3ETqoO9rlbgCEkqA9tU47KI67U
	fF1ilZ/olAp1qdGpBo60V8HVsktXcqKkJTZiP012VnTx+v2ane2RNFlu/iXNs9cuwEHaVWARY+fLi
	DcJ7uyQLEYnGOZlQ7VWmjIPwlY1D8Dt6sMLCqGsPr9JV456pDq7nW8sLpT/qn17j+puFSATZTWQzT
	cMpRuBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbKM-00000008DoN-0EjM;
	Wed, 18 Nov 2026 08:47:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbKJ-00000008Dns-3aj9
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 08:47:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3DE0E4E4160A;
	Wed, 18 Nov 2026 08:47:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1107D5FE9B;
	Wed, 18 Nov 2026 08:47:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED02411BC0B1A;
	Wed, 18 Nov 2026 09:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794991653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kGrHNZsv8k17WyDtcN0KoKiEb8AAC/oHWu//7fo5faM=;
	b=SefnjUk3W69idot9zlT4yJ6DKWi198Tgr1TgEoP1D48Q04zWbpCJZjGgCen4SwBPVj4ljf
	/yEc5B4h7eMQxoBBvjOCc8vFCmdXgNxXbQ/IOTdXu2/lBr5NoO22F9tMShnqbvThwWk4++
	JUNOnk7jleWX0Y+Y+3htuXY5KEj/tp2U8MuO2H8lmPX1pFW2fnQYFrSolgPSOgvva1n7dO
	Khu9BQsdc8WSUq5l33NU6LEB+MxV3t8JAEEQQqtOejFev1xDk2O1IQNcvsfZs61x0NPPQ7
	g6oefbEVfytz21Eo9SnxDoHzGt7mUwxYLYe8VO3pH/W7qf8WODOm0jpAL/mBCQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  devicetree@vger.kernel.org,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  linux-mips@vger.kernel.org,
  Hauke Mehrtens <hauke@hauke-m.de>,  Aleksander Jan Bajkowski
 <olek2@wp.pl>,  John Crispin <john@phrozen.org>,  Sebastien Decourriere
 <sebtx452@gmail.com>,  Yangtao Li <frank.li@vivo.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
In-Reply-To: <5155531.6YUMPnJmAY@prime> (Simon Wunderlich's message of "Tue,
	17 Nov 2026 17:45:36 +0100")
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
	<20261114100608.3432120-3-sw@simonwunderlich.de>
	<87fqwzn3tq.fsf@bootlin.com> <5155531.6YUMPnJmAY@prime>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 09:47:28 +0100
Message-ID: <87qzgijzkv.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_004736_040736_2977CF54 
X-CRM114-Status: GOOD (  10.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4gQWJvdXQgcGh5c21hcDogeW91IHdlcmUgcmlnaHQsIGFuZCB0aGlzIHdhcyBhY3R1YWxseSBh
IGdyZWF0IGhpbnQuIEkgdGVzdGVkIG9uIAo+IHRoZSBteSBSUzEyMzogd2l0aCB0aGUgRUJVIHN3
YXAgdGhhdCBpdHMgYm9vdCBsb2FkZXIgZW5hYmxlcywgdGhlIGZsYXNoIGlzIAo+IHNpbXBseSBh
IHBsYWluIENGSSBmbGFzaC4gV2l0aCBjb21wYXRpYmxlID0gImNmaS1mbGFzaCIgYW5kIHRoZSBn
ZW5lcmljIHBoeXNtYXAgCj4gZHJpdmVyLCBwcm9iaW5nLCByZWFkcyAoaWRlbnRpY2FsIHRvIHdo
YXQgbGFudGlxLWZsYXNoIHJlYWRzLCB1bmFsaWduZWQgcmVhZHMgCj4gaW5jbHVkZWQpLCBlcmFz
ZSBhbmQgd3JpdGUgYWxsIHdvcmsuIFNvIHRoaXMgYm9hcmQgbmVlZHMgbm8gbGFudGlxLWZsYXNo
IGNoYW5nZSAKPiBhdCBhbGwsIGFuZCBJJ20gZHJvcHBpbmcgcGF0Y2hlcyAyIHRvIDUuIFRoZXJl
IHdvbid0IGJlIGEgdjIuCj4KPiBUdXJuaW5nIGxhbnRpcS1mbGFzaCBpdHNlbGYgaW50byBhIHBo
eXNtYXAgdmFyaWFudCBmb3IgdGhlIGJvYXJkcyB3aXRoIHRoZSAKPiBjbGFzc2ljIFUtQm9vdCBz
ZXR1cCB3b3VsZCBwcm9iYWJseSBiZSB0aGUgY2xlYW5lciBtb2RlbCwgYnV0IEkgZG9uJ3QgaGF2
ZSAKPiBzdWNoIGEgYm9hcmQgdG8gdGVzdCBpdCwgc28gSSdtIGxlYXZpbmcgdGhhdCBhbG9uZSBm
b3Igbm93Lgo+Cj4gVGhhbmsgeW91IGFnYWluIQo+ICAgICAgU2ltb24KCkV4Y2VsbGVudCwgdGhh
bmtzIGZvciB0aGUgZmVlZGJhY2shCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
