Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71641C3A589
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 02:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425EC2184D
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 02:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E9uwW1GX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425EC2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aWBstu4gs05drd/AWYzNdkJF8iEZdegBJRUDNPJa9Sk=; b=E9uwW1GX8E6Xy1HOycHFtA2uG
	0wmZkmFJViG5zBarMNwueTkIu3Gk+KnicO9ny8gyGqNGWAv2QBQ+6i9nllqeBfT32xTfusqC1vIbS
	jTDN7AYbufUog6kxp12vopEYSmYNweXm5UFqVLqqcETxawaqKtzdIOvNcEBHO7PIRU+J6cTk/AROH
	/A1Dz0DlGfX4AXW/Y8BwbcHwi9iXG7zRUiMQkD8LVlYxWXIi079MKtMD2kgRLn6Md33qwapKhK4kh
	Xv/rrOcVIl7l3LBDr9t35s4dApegbfJS/Bm9Bs5wzHmNqe+2KDtAFnBx4q1GEbi/KXoRTErtB+3KX
	Z2z2sagdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzX2D-0001c0-RZ; Mon, 19 Aug 2019 02:04:38 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzX29-0001bC-Lb; Mon, 19 Aug 2019 02:04:36 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 19:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="177739171"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2019 19:04:32 -0700
Received: from [10.226.38.15] (vramuthx-mobl1.gar.corp.intel.com
 [10.226.38.15])
 by linux.intel.com (Postfix) with ESMTP id D14965806A0;
 Sun, 18 Aug 2019 19:04:30 -0700 (PDT)
Subject: Re: Regards-cadence-quadspi changes to be submitted as patch to
 upstream
To: Vignesh Raghavendra <vigneshr@ti.com>, Tudor.Ambarus@microchip.com,
 linux-mtd@lists.infradead.org, linux-mtd-request@lists.infradead.org
References: <mailman.16568.1565684962.19300.linux-mtd@lists.infradead.org>
 <8bbd71ae-6c3a-6801-8902-ec4cab492d88@linux.intel.com>
 <49190c04-fda8-2fff-eb6f-6a67435d5205@microchip.com>
 <97272d94-cc84-78dd-0abd-21f877af673e@linux.intel.com>
 <480268df-0f8b-fa99-7d7d-43477b371493@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <6442de00-9388-28b3-bee0-7a87658778ca@linux.intel.com>
Date: Mon, 19 Aug 2019 10:04:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <480268df-0f8b-fa99-7d7d-43477b371493@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_190433_747261_C6E96C3C 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlnbmVzaCwKCiDCoMKgwqAgwqDCoMKgIFRoYW5rIHlvdSBzbyBtdWNoIGZvciB0aGUgcmVz
cG9uc2UgYW5kIHlvdXIgdmFsdWFibGUgaW5mb3JtYXRpb24uCiDCoMKgwqAgwqDCoMKgIHN1cmVs
eSBmb2xsb3cgdGhlIHNhbWUgcHJvY2VzcyBiZWZvcmUgc3VibWl0dGluZyB0aGUgcGF0Y2hlcy4K
CldpdGggQmVzdCBSZWdhcmRzClZhZGl2ZWwgTXVydWdhbiBSCgpPbiAxNi84LzIwMTkgNjo1MyBQ
TSwgVmlnbmVzaCBSYWdoYXZlbmRyYSB3cm90ZToKPiBQbGVhc2UgZm9sbG93IGd1aWRlbGluZXMg
YXQ6Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJt
aXR0aW5nLXBhdGNoZXMuaHRtbAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0
ZXN0L3Byb2Nlc3MvY29kaW5nLXN0eWxlLmh0bWwKPgo+IFJ1biBzY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLS1zdHJpY3Qgb24gcGF0Y2hlcyBhbmQgZml4IHRoZSBpc3N1ZXMKPiByZXBvcnRlZCBieSB0
aGUgc2NyaXB0cyBiZWZvcmUgcG9zdGluZwo+Cj4gWW91IGNhbiBnZXQgbGlzdCBvZiBwZW9wbGUg
dG8gY2MgYnkgcnVubmluZyAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKPiBvbiB0aGUgcGF0
Y2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
