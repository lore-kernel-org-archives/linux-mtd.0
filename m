Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD809C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 17:55:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509F06196F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 17:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 509F06196F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgHQRe/c284PrcNd+OsLeb90mrvYMTJ7q7RXSdovSXQ=; b=qf9EoAEKiYa/zE
	5/ThfBtJqUp4P0+XYnD3mDiMCCIm50wzBWlxXBPuXyyQSRVwEv9BX6yfaUp1ewh15t1Wj4wefNfMu
	0wVf1+dB6gwZd+ELo1L4m3/7PPyjcal9UT894AulelC7PqKjZc6frWj8328LPHD0B42imSBXKk5+Q
	3Bsm5Iu+HWFPPsGJxaGfq9XSlnKbhuFsvdaEVUJ4eKQGgbdef+mhrx1MyLnbQKedTpi6UPUflJ5KA
	dTMvauIaEVIOGp5GaQWtk0HcWTNTnPJw1f4Fy1F+z2foNQVGXNGAyaqvgWahM202rPfqIRD5JHB7d
	aeflu4posoEFaY9UOfEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOOku-00CCLM-Tk; Mon, 22 Mar 2021 17:54:21 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOOkr-00CCKs-CU
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 17:54:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A714E60A357B;
 Mon, 22 Mar 2021 18:54:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Z28JrLjOa-cP; Mon, 22 Mar 2021 18:54:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0C2A860A357C;
 Mon, 22 Mar 2021 18:54:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rnKQDEnnD768; Mon, 22 Mar 2021 18:54:12 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D97E360A357B;
 Mon, 22 Mar 2021 18:54:12 +0100 (CET)
Date: Mon, 22 Mar 2021 18:54:12 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Michael Walle <michael@walle.cc>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <867376179.104878.1616435652773.JavaMail.zimbra@nod.at>
In-Reply-To: <9fb7a635-75ed-2840-b751-3ab8764f0890@gmail.com>
References: <20210303155735.25887-1-michael@walle.cc>
 <9fb7a635-75ed-2840-b751-3ab8764f0890@gmail.com>
Subject: Re: [PATCH] mtd: require write permissions for locking and badblock
 ioctls
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: require write permissions for locking and badblock ioctls
Thread-Index: MD3YlBDD0Vk+6pgMtjmJD07E01YdqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_175417_505459_6133100D 
X-CRM114-Status: UNSURE (   5.36  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJhZmHFgiBNacWCZWNraSIg
PHphamVjNUBnbWFpbC5jb20+Cj4gQW46ICJNaWNoYWVsIFdhbGxlIiA8bWljaGFlbEB3YWxsZS5j
Yz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1r
ZXJuZWwiCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gQ0M6ICJNaXF1ZWwgUmF5
bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2Qu
YXQ+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sCj4gIkdyZWcgS3Jv
YWgtSGFydG1hbiIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IEdlc2VuZGV0OiBNb250
YWcsIDIyLiBNw6RyeiAyMDIxIDE3OjM5OjQxCj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gbXRkOiBy
ZXF1aXJlIHdyaXRlIHBlcm1pc3Npb25zIGZvciBsb2NraW5nIGFuZCBiYWRibG9jayBpb2N0bHMK
Cj4gT24gMDMuMDMuMjAyMSAxNjo1NywgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gTUVNTE9DSywg
TUVNVU5MT0NLIGFuZCBPVFBMT0NLIG1vZGlmeSBwcm90ZWN0aW9uIGJpdHMuIFRodXMgcmVxdWly
ZQo+PiB3cml0ZSBwZXJtaXNzaW9uLiBEZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlIE1FTUxPQ0sg
bWlnaHQgZXZlbiBiZQo+PiB3cml0ZS1vbmNlLCBlLmcuIGZvciBTUEktTk9SIGZsYXNoZXMgd2l0
aCB0aGVpciBXUCMgdGllZCB0byBHTkQuIE9UUExPQ0sKPj4gaXMgYWx3YXlzIHdyaXRlLW9uY2Uu
Cj4+IAo+PiBNRU1TRVRCQURCTE9DSyBtb2RpZmllcyB0aGUgYmFkIGJsb2NrIHRhYmxlLgo+PiAK
Pj4gRml4ZXM6IGY3ZTZiMTliYzc2NCAoIm10ZDogcHJvcGVybHkgY2hlY2sgYWxsIHdyaXRlIGlv
Y3RscyBmb3IgcGVybWlzc2lvbnMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxt
aWNoYWVsQHdhbGxlLmNjPgo+IAo+IFNob3VsZCBiZSBmaW5lIGZvciBPcGVuV3J0IHRvb2xzIHRv
IG15IGJlc3Qga25vd2xlZGdlIChhbmQgcXVpY2sgdGVzdGluZykuCj4gCj4gQWNrZWQtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCk5pY2UhCgpBY2tlZC1ieTogUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
