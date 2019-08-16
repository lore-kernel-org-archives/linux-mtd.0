Return-Path: <SRS0=cvjG=WM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAE8C3A59C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2019 10:52:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF47205F4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2019 10:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jaLChCBG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YwjPfLx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF47205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=INGy7FDJx5KRs5L5219h0VnN2GqODdTCOFrmLusKl1Q=; b=jaLChCBG5W1cCwZo1UMZ0ZL0s0
	w7KG7Ge1ypI5/NB6y59xPP7ylJeujfX7rcNnVjJX0Hpb/iP3L9o1lOzm/ml8ENtdNgLOtcqkz6fHk
	iIYJj/+tXxWK9iIlZVeG2WQf61UPwUPw29NnutSK1kP+64bYEXA+TSP0QRZDxvv3WV1Ho+FXSpX7X
	edyW7nhK3jurD78Rieai+l23z+q/9ZdeKupzVwqL/GsGRJ0wLw3Oy3HuHxqOJWUq43kgg5bp6J8hv
	SwOc8Z1IS+kyEgB9Ng6fNBtTGkUGk+dR/zYRW7vhL9XqRPpQr6KDztiMl6t4QcziZeqaZKRi1iGdQ
	222w69iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyZqa-0005Hj-K4; Fri, 16 Aug 2019 10:52:40 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyZqX-0005HH-T3; Fri, 16 Aug 2019 10:52:39 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7GAqZI4005219;
 Fri, 16 Aug 2019 05:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565952755;
 bh=TY1RRr0yeaP2JZjUFQbbBqH/Zqlz5vCp+ZNvGgKy5f0=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=YwjPfLx3bERDR3j6KazEeUlm9VKroe4Ihy5DEYx4/0ladNZ937wnkt6R6mnoe5ux0
 BRGyNhkhpCZdl0oHUSS8HnyUGzXJ6qCT5oAJ9PEJJDR/6sx0RYrWH+6eBaOLHpaBzD
 YKDhA/E5jHLmiYw3UmJmrYCDHTaBNskMF3KZwc7k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7GAqZWT129186
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Aug 2019 05:52:35 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 05:52:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 16 Aug 2019 05:52:35 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7GAqXo7061444;
 Fri, 16 Aug 2019 05:52:33 -0500
Subject: Re: Regards-cadence-quadspi changes to be submitted as patch to
 upstream
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>,
 <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-mtd-request@lists.infradead.org>
References: <mailman.16568.1565684962.19300.linux-mtd@lists.infradead.org>
 <8bbd71ae-6c3a-6801-8902-ec4cab492d88@linux.intel.com>
 <49190c04-fda8-2fff-eb6f-6a67435d5205@microchip.com>
 <97272d94-cc84-78dd-0abd-21f877af673e@linux.intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <480268df-0f8b-fa99-7d7d-43477b371493@ti.com>
Date: Fri, 16 Aug 2019 16:23:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <97272d94-cc84-78dd-0abd-21f877af673e@linux.intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_035238_023915_6A034F4E 
X-CRM114-Status: GOOD (  11.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxNC8wOC8xOSA2OjQxIEFNLCBSYW11dGhldmFyLCBWYWRpdmVsIE11cnVnYW5YIHdy
b3RlOgo+IEhpLCBUdWRvciwKPiAKPiDCoCBUaGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIHJlc3Bv
bnNlLCBzdXJlIEkgd2lsbCBkbyB0aGUgc2FtZS4KCkFsc28KClBsZWFzZSBmb2xsb3cgZ3VpZGVs
aW5lcyBhdDoKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMuaHRtbApodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xh
dGVzdC9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1sCgpSdW4gc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tc3RyaWN0IG9uIHBhdGNoZXMgYW5kIGZpeCB0aGUgaXNzdWVzCnJlcG9ydGVkIGJ5IHRoZSBz
Y3JpcHRzIGJlZm9yZSBwb3N0aW5nCgpZb3UgY2FuIGdldCBsaXN0IG9mIHBlb3BsZSB0byBjYyBi
eSBydW5uaW5nIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbApvbiB0aGUgcGF0Y2gKCj4gCj4g
QmVzdCBSZWdhcmRzCj4gVmFkaXZlbAo+IE9uIDEzLzgvMjAxOSA2OjQ1IFBNLCBUdWRvci5BbWJh
cnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+IFQ6wqDCoMKgwqDCoCBnaXQKPj4gZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgc3BpLW5v
ci9uZXh0Cj4+Cj4+IFlvdSBjYW4gY2hlY2sgTUFJTlRBSU5FUlMgZmlsZSB3aGVuIGluIGRvdWJ0
Lgo+Pgo+PiBDaGVlcnMsCj4+IHRhCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCgotLSAKUmVnYXJkcwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
