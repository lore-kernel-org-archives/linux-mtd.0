Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38EDC43461
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 13:34:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0125961001
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 13:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0125961001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EoSf+A9mXRk+COgjXnHQ8J0lLSN6N6rx1VfEMlH1PcI=; b=WeggKYWOOwAS+99X7z5wwPiys
	hJXUErVSFsHf3IyjCrLodlRXceanPty7Yg4s+6C0/QZSFToNAWKQbMTWuRUq1Roqkk9kmOKXJkqTA
	u5a0LE+nzpvm3ikrs/MCHv3WrmS+Hlra2Fr49vPNhsm9xcjgIXnwqTig5H1xcgT39JjS1Eka10g4W
	aOW7AWrE4gQr2SZTuitwmfZlmgDUmZ1Z1TV3M5jGZvlM1PZZSW/LPuukLoIEx9KAx9CQeTSkkw/jj
	4yM+YUezxuqsJYF7YcEEbrsS6oXTJuRqwWADSRKU4v2KnWgNQ0Xh6RyZ1hFT9cAcV2soZnP1mXFrx
	zqB7SAEwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUUnG-0088xD-98; Thu, 08 Apr 2021 13:33:58 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUUnC-0088wd-AF
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 13:33:56 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7CE35240005;
 Thu,  8 Apr 2021 13:33:51 +0000 (UTC)
Date: Thu, 8 Apr 2021 15:33:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: <joern@lazybastard.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yi.zhang@huawei.com>
Subject: Re: [PATCH V2] mtd: phram: Fix error return code in phram_setup()
Message-ID: <20210408153350.4a6472b4@xps13>
In-Reply-To: <20210408133812.1209798-1-yukuai3@huawei.com>
References: <20210408144610.0c0686ae@xps13>
 <20210408133812.1209798-1-yukuai3@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_143354_464049_3604BF06 
X-CRM114-Status: GOOD (  14.59  )
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

SGkgWXUsCgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IHdyb3RlIG9uIFRodSwgOCBBcHIg
MjAyMSAyMTozODoxMiArMDgwMDoKCj4gUmV0dXJuIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBmcm9t
IHRoZSBlcnJvciBoYW5kbGluZyBjYXNlIGluc3RlYWQKPiBvZiAwLCBhcyBkb25lIGVsc2V3aGVy
ZSBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lA
aHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYyB8IDEgKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNl
cy9waHJhbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gaW5kZXggNWIwNGFlNmMz
MDU3Li42ZWQ2YzUxZmFjNjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJh
bS5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gQEAgLTI3MCw2ICsyNzAs
NyBAQCBzdGF0aWMgaW50IHBocmFtX3NldHVwKGNvbnN0IGNoYXIgKnZhbCkKPiAgCWlmIChsZW4g
PT0gMCB8fCBlcmFzZXNpemUgPT0gMCB8fCBlcmFzZXNpemUgPiBsZW4KPiAgCSAgICB8fCBlcmFz
ZXNpemUgPiBVSU5UX01BWCB8fCByZW0pIHsKPiAgCQlwYXJzZV9lcnIoImlsbGVnYWwgZXJhc2Vz
aXplIG9yIGxlblxuIik7Cj4gKwkJcmV0ID0gLUVJTlZBTDsKPiAgCQlnb3RvIGVycm9yOwo+ICAJ
fQo+ICAKCkFjdHVhbGx5IEkgZG9uJ3Qga25vdyB3aHkgYnV0IEkgb3Zlcmxvb2tlZCB0aGUgY2hh
bmdlLiBJIHRob3VnaHQgeW91CndlcmUgcmVtb3ZpbmcgdGhlIHJldCA9IGxpbmUsIHNvcnJ5IGFi
b3V0IHRoYXQuIEFueXdheSwgSSBwcmVmZXIKdGhlIG5ldyB3b3JkaW5nIHNvIEknbGwgYXBwbHkg
dGhlIHYyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
