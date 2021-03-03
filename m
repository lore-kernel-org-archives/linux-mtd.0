Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C61C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:10:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9641B64EE4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9641B64EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kMRbOuSeOIvgk5LYS9mWMmDv2QjA1ZI88gQ8GqbCXlg=; b=COxKOlRkcS2uAePfJReh3nXPy
	NylY0g+syz8d7TlqmAMvODTN3tvIJrIDRTs3EJ+jLKblZWF+qlUqZS8Zgh8S74Cxr/V8qPhqFCiuP
	w5tj6cNYLAA8AZwxz8FVHcDtT7JR2YoBY4efEBWNhDsahFECFrq+dvnrWpe0oALxzVmB8tqqazXrc
	VqJ2swCiWbgLIL7mFCmuoehgW7r3w04R9leBNlbpdJutUkZaQRea/wVTCU8dcIbhi1Fd+sE4z9QCR
	NvBpWx0E6aIiCXfuCVcpcbh3BBEoO8IZ8GnnlBKztNadO2d9KLVMcuo0WebEGOoJVEpdOFV2VCN6f
	lDGrAjrWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHU4U-005Xi8-EN; Wed, 03 Mar 2021 16:09:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSoo-005Dj4-Tg
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=q63/4d/FKkGc9gG/e0cSVm1k+ntwiZbZVrIUQT8SS+g=; b=KmUHFkWs+c4YBJWaqQmSAgRshG
 LU5cINtPYYQv1VGvre5Z9+c4Gxgh0HbjQPHAVrt+NxALpTS64WZneLxtHLHC45f+nRkRO+l3R1K7m
 ptfftO1HE1Z9qPLypoFrWWf1SW5wd12ZTBUBuNJLEYHKCUGWchW7Il9v/mDYrF+vAYlGSqVMXPOAr
 f7yxZPcRDfRGggQRFGlFnhGh2e2U6q8uJeKNT21aR/rjhP+PxmfkNGV2i6DcMZh4MKOPokVjp9712
 g5q03xW4uVlu7N0EN8IX54q9DXkXgvc6AKFGY2xXhxQIBL5vvrxATwVBmW+lDJmOSXnqYO20htTzk
 Xz6OvnDQ==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOik-002B9z-Ee
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 10:27:10 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lHOij-000445-Ev; Wed, 03 Mar 2021 10:27:09 +0000
Subject: Re: [PATCH][next] mtd: nand: Fix error handling in nand_prog_page_op
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210303094246.5724-1-colin.king@canonical.com>
 <20210303104651.2d49fb2c@xps13>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <e7893539-9510-e149-f02b-f88c33f8175b@canonical.com>
Date: Wed, 3 Mar 2021 10:27:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303104651.2d49fb2c@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_102710_792963_326072EC 
X-CRM114-Status: GOOD (  10.89  )
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

T24gMDMvMDMvMjAyMSAwOTo0NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBDb2xpbiwKPiAK
PiBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9uIFdlZCwgIDMg
TWFyIDIwMjEKPiAwOTo0Mjo0NiArMDAwMDoKPiAKPj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4gVGhlIGxlc3MgdGhhbiB6ZXJvIGNvbXBhcmlz
b24gd2l0aCBzdGF0dXMgaXMgYWx3YXlzIGZhbHNlIGJlY2F1c2Ugc3RhdHVzCj4+IGlzIGEgdTgu
IEZpeCB0aGlzIGJ5IHVzaW5nIHJldCBhcyB0aGUgcmV0dXJuIGNoZWNrIGZvciB0aGUgY2FsbCB0
bwo+PiBjaGlwLT5sZWdhY3kud2FpdGZ1bmMoKSBhbmQgY2hlY2tpbmcgb24gdGhpcyBhbmQgYXNz
aWduaW5nIHN0YXR1cyB0byByZXQKPj4gaWYgaXQgaXMgT0suCj4+Cj4+IEFkZHJlc3Nlcy1Db3Zl
cml0eTogKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2FpbnN0IDAiKQo+PiBGaXhlczogNTJmNjdkZWY5
N2YxICgibXRkOiBuYW5kOiBmaXggZXJyb3IgaGFuZGxpbmcgaW4gbmFuZF9wcm9nX3BhZ2Vfb3Ao
KSAjMSIpCj4+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9u
aWNhbC5jb20+Cj4gCj4gVGhhbmtzIGZvciB0aGUgZml4LCBidXQgdGhpcyBoYXMgYmVlbiBoYW5k
bGVkIGp1c3QgYW4gaG91ciBhZ28gOikKCkFoLCBtaXNzZWQgdGhhdC4gR2xhZCB0byBrbm93IGl0
J3MgZml4ZWQuCgo+IAo+IENoZWVycywKPiBNaXF1w6hsCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
