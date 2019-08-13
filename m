Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707DAC433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 10:03:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BB720665
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 10:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urs7z+Jz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43BB720665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9TvQc7iFbvcwu5ANmM/SD1EnVGIU+w5nOXjzxCuFQII=; b=urs7z+JzpdT1QqD54PE7qhhKj
	I8E+pfVkMpT69VrrDVPzmDPzivxxBSKnDkLK6jU8bmy5ZGRxFhE4wxwq/HHQOA5UpQSbIZjYeTv0K
	2RhlEYWCSvng7vf+jsDHS8+joceIk7N3kM0q0ukBisvKTePvDayC9nP1Tz+GLfAz0fp5e2n3SrwQ6
	KhF/216GoXOhgq8wxz/yfSQPa8zgNlfKjb6ZnRY5KNdd9Gsl90lp/6ZGczg3jULjdUVJFDeB4wOeV
	B9cMdrq0YXjGqmyujzcN0DK6qFduFPDQs4YqafuvXqx94erpuJp7iXwXGmy/aPYqEMX5cnQAOnEa7
	p/U3xpebw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxTeM-00072f-8A; Tue, 13 Aug 2019 10:03:30 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxTeJ-00072F-6p; Tue, 13 Aug 2019 10:03:28 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 03:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="376248256"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 13 Aug 2019 03:03:22 -0700
Received: from [10.226.38.12] (vramuthx-mobl1.gar.corp.intel.com
 [10.226.38.12])
 by linux.intel.com (Postfix) with ESMTP id C5811580417;
 Tue, 13 Aug 2019 03:03:21 -0700 (PDT)
To: linux-mtd@lists.infradead.org, linux-mtd-request@lists.infradead.org
References: <mailman.16568.1565684962.19300.linux-mtd@lists.infradead.org>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Regards-cadence-quadspi changes to be submitted as patch to upstream
Message-ID: <8bbd71ae-6c3a-6801-8902-ec4cab492d88@linux.intel.com>
Date: Tue, 13 Aug 2019 18:03:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <mailman.16568.1565684962.19300.linux-mtd@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_030327_259824_6C520B3D 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgogwqDCoCBHb29kIE1vcm5pbmcsIEhvcGUgeW91IGFyZSBkb2luZyB3ZWxsISEhCgogwqDC
oCBBcyBJIGFtIHNlZWtpbmcgaGVscCBmcm9tIHlvdSwgdG8gc3VibWl0IG15IGtlcm5lbCBkcml2
ZXIgcGF0Y2hlcyB0byAKdXBzdHJlYW0KIMKgwqAgY29tbXVuaXR5LCBoYXZlIG1hZGUgY2hhbmdl
cyBpbiAKL2RyaXZlcnMvbXRkL3NwaS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMgdG8gbWFrZSBpdCB3
b3JrCiDCoMKgIG9uIG91ciBpbnRlbCBMR00gU29DLCBpdCBpcyB3b3JraW5nIGZpbmUuCgogwqDC
oCBOb3cgdGhlIGNoYW5nZXMgdG8gYmUgcHVzaGVkIHRvIHVwc3RyZWFtLCBraW5kbHkgcmVzcG9u
ZCB0aGUgCmZvbGxvd2luZyBxdWVyaWVzLgogwqDCoCAxLiBzaGFsbCBJIHVzZSB0aGUgbGF0ZXN0
IDUuMyBrZXJuZWwgc291cmNlIGZyb23CoCBrZXJuZWwub3JnPyAob3IpCiDCoMKgIDIuSXMgdGhl
cmUgbWFpbnRhaW5lcnMgdHJlZT8gaWYgeWVzLCB0aGVuIGNhbiB5b3UgcGxlYXNlIHByb3ZpZGUg
bWUgCnRoZSBsaW5rLgogwqDCoCBQbGVhc2UgZG8gdGhlIG5lZWRmdWwuCgpCZXN0IFJlZ2FyZHMK
VmFkaXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
