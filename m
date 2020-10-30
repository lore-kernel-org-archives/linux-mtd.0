Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9748BC55178
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 10:08:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F000220825
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 10:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yRr6e3/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F000220825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AnaPy9CDHXdTcq4VzwpalCBA51el6PJqC3K6yTt8lk=; b=yRr6e3/7vK4B6X
	CJMQLR6U1oHHP6ai3i2gvqDFPpzJqrU8cyFtuNA6BlVUpmNpvqeGLObOj4E2w7AmQ3E5GLWrtfcC+
	mZPPr+aUTYcBpkYuBNN9gvSKYeeKgXDIv3RIeA7/qhJYTPIKCnMl3K6hOHRk82fXsmUYDqClbSPge
	DFPpQASB/fAXhDa5nkicdYSzhac691b33eIwCxxKapNHhj3NXP70ORhsHbrE4lYcndexVGAWeG85p
	oza2sDu6midhXvf4R0Rfdzoi/RBi4VPwBbud2LEtppiDsk11Fr7qO3uAORhlBQsberBmk9FY0l7Xv
	qmzBlnbd+I51p5Jej5ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYRJL-00075y-F9; Fri, 30 Oct 2020 10:07:07 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYRJJ-00075J-DS
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 10:07:06 +0000
IronPort-SDR: ieaCQRsFBPdYO8SYqPt/Ayvc9AXnRwx948efbxgIKQjmMm9UAONhO+/UA66QNveMjHowgZFTz8
 CHsYVRSz0Obg==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165089426"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="165089426"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 03:07:02 -0700
IronPort-SDR: B+dFTSx9H2RpfWItIplOW5X6Z6paV7eHCGfCwgj60zhUPW+qIcTWBl10ZRoPyjBgzTfCZlGJkp
 3qKEm+MIzz1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="525843590"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2020 03:07:02 -0700
Received: from [10.255.142.248] (vramuthx-MOBL1.gar.corp.intel.com
 [10.255.142.248])
 by linux.intel.com (Postfix) with ESMTP id 7EB2B5808A3;
 Fri, 30 Oct 2020 03:06:58 -0700 (PDT)
Subject: Re: [RESENDPATCH v15 2/2] mtd: rawnand: Add NAND controller support
 on Intel LGM SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20201026073021.33327-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201026073021.33327-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201028112037.326c06e2@xps13>
 <ab2b0b7a-93b6-51e4-ec08-7af4f4f38745@linux.intel.com>
 <20201030092329.280466d9@xps13>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <42724eab-7840-27f2-31ad-b5bc10fd89fd@linux.intel.com>
Date: Fri, 30 Oct 2020 18:06:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201030092329.280466d9@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_060705_600331_A76DADAE 
X-CRM114-Status: GOOD (  24.69  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tudor.ambarus@microchip.com, richard@nod.at, simon.k.r.goldschmidt@gmail.com,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 qi-ming.wu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMzAvMTAvMjAyMCA0OjIzIHBtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhlbGxvLAo+IAo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfY29udHJvbGxlcl9vcHMg
ZWJ1X25hbmRfY29udHJvbGxlcl9vcHMgPSB7Cj4+Pj4gKwkuYXR0YWNoX2NoaXAgPSBlYnVfbmFu
ZF9hdHRhY2hfY2hpcCwKPj4+PiArCS5zZXR1cF9pbnRlcmZhY2UgPSBlYnVfbmFuZF9zZXRfdGlt
aW5ncywKPj4+PiArCS5leGVjX29wID0gZWJ1X25hbmRfZXhlY19vcCwKPj4+PiArfTsKPj4+PiAr
Cj4+Pj4gK3N0YXRpYyB2b2lkIGVidV9kbWFfY2xlYW51cChzdHJ1Y3QgZWJ1X25hbmRfY29udHJv
bGxlciAqZWJ1X2hvc3QpCj4+Pj4gK3sKPj4+PiArCWlmIChlYnVfaG9zdC0+ZG1hX3J4KQo+Pj4+
ICsJCWRtYV9yZWxlYXNlX2NoYW5uZWwoZWJ1X2hvc3QtPmRtYV9yeCk7Cj4+Pj4gKwo+Pj4+ICsJ
aWYgKGVidV9ob3N0LT5kbWFfdHgpCj4+Pj4gKwkJZG1hX3JlbGVhc2VfY2hhbm5lbChlYnVfaG9z
dC0+ZG1hX3R4KTsKPj4+PiArfQo+Pj4+ICsKPj4+PiArc3RhdGljIGludCBlYnVfbmFuZF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+ICt7Cj4+Pj4gKwlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+Pj4+ICsJc3RydWN0IGVidV9uYW5kX2NvbnRyb2xsZXIg
KmVidV9ob3N0Owo+Pj4+ICsJc3RydWN0IG5hbmRfY2hpcCAqbmFuZDsKPj4+PiArCXN0cnVjdCBt
dGRfaW5mbyAqbXRkOwo+Pj4+ICsJc3RydWN0IHJlc291cmNlICpyZXM7Cj4+Pj4gKwljaGFyICpy
ZXNuYW1lOwo+Pj4+ICsJaW50IHJldCwgaTsKPj4+PiArCXUzMiByZWc7Cj4+Pj4gKwo+Pj4+ICsJ
ZWJ1X2hvc3QgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmVidV9ob3N0KSwgR0ZQX0tFUk5F
TCk7Cj4+Pj4gKwlpZiAoIWVidV9ob3N0KQo+Pj4+ICsJCXJldHVybiAtRU5PTUVNOwo+Pj4+ICsK
Pj4+PiArCWVidV9ob3N0LT5kZXYgPSBkZXY7Cj4+Pj4gKwluYW5kX2NvbnRyb2xsZXJfaW5pdCgm
ZWJ1X2hvc3QtPmNvbnRyb2xsZXIpOwo+Pj4+ICsKPj4+PiArCXJlcyA9IHBsYXRmb3JtX2dldF9y
ZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJlYnVuYW5kIik7Cj4+Pj4gKwll
YnVfaG9zdC0+ZWJ1ID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlcyk7Cj4+
Pj4gKwlpZiAoSVNfRVJSKGVidV9ob3N0LT5lYnUpKQo+Pj4+ICsJCXJldHVybiBQVFJfRVJSKGVi
dV9ob3N0LT5lYnUpOwo+Pj4+ICsKPj4+PiArCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9i
eW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJoc25hbmQiKTsKPj4+PiArCWVidV9ob3N0LT5o
c25hbmQgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKPj4+PiArCWlm
IChJU19FUlIoZWJ1X2hvc3QtPmhzbmFuZCkpCj4+Pj4gKwkJcmV0dXJuIFBUUl9FUlIoZWJ1X2hv
c3QtPmhzbmFuZCk7Cj4+Pj4gKwo+Pj4+ICsJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMy
KGRldiwgIm5hbmQsY3MiLCAmcmVnKTsKPj4+Cj4+PiBUaGVyZSBpcyBubyBuYW5kLGNzIHByb3Bl
cnR5LiBVc2UgJ3JlZycgaW5zdGVhZC4KPj4gTm90ZWQuCj4+PiAgICAKPj4+PiArCWlmIChyZXQp
IHsKPj4+PiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgY2hpcCBzZWxlY3Q6ICVkXG4i
LCByZXQpOwo+Pj4+ICsJCXJldHVybiByZXQ7Cj4+Pj4gKwl9Cj4+Pj4gKwllYnVfaG9zdC0+Y3Nf
bnVtID0gcmVnOwo+Pj4KPj4+IFRoZSBmb2xsb3dpbmcgZm9yIGxvb3AgaXMgd2VpcmQsIGFib3Zl
IHlvdSBjYW4gb25seSBzdG9yZSBhIHNpbmdsZSBjcwo+Pj4gbnVtYmVyLCB3aGlsZSBiZWxvdyB5
b3Ugc2VlbSB0byByZXNlcnZlIHNlcnZlcmFsIG1lbW9yeSBhcmVhcy4gUGxlYXNlCj4+PiBjbGFy
aWZ5IHRoaXMgY29kZS4KPj4gVGhpcyBJUCBzdXBwb3J0cyAyIGNoaXAgc2VsZWN0IGZvciAyIGRp
ZmZlcmVudCBtZW1vcnkgcmVnaW9ucyBzbyB3ZSB1c2VkIHRoZSBiZWxvdyBmb3IgbG9vcCwgYXMg
cGVyIHJldmlld2VycyBjb21tZW50IHVwZGF0ZWQuCj4+IAkJIEVCVV9DUzBfQkFTRSAgICAgMHhF
MUMwXzAwMDAgKE1lbW9yeS1NYXBwZWQpCj4+IAkJIEVCVV9DUzBfSU9fQkFTRSAgMHgxNzQwXzAw
MDAgKEZQSSBJL08gTWFwcGVkKQo+Pgo+PiAgICAgICAgICAgICAgICAgICAgRUJVX0NTMV9CQVNF
ICAgICAweEUxNDBfMDAwMCAoTWVtb3J5LU1hcHBlZCkKPj4gICAgICAgICAgICAgICAgICAgIEVC
VV9DUzFfSU9fQkFTRSAgMHgxN0MwXzAwMDAgKEZQSSBJL08gTWFwcGVkKQo+IAo+IFBsZWFzZSBt
YWtlIGEgZGlmZmVyZW5jZSBiZXR3ZWVuLCAidGhlcmUgYXJlIHR3byBDUywgZWl0aGVyIGNhbiBi
ZQo+IHBpY2tlZCBidXQgd2UgY2FuIHVzZSBvbmx5IG9uZSBpbiB0aGlzIGRyaXZlciIgb3IgInRo
ZXJlIGFyZSB0d28gQ1MsCj4gb25lIG9yIGJvdGggY2FuIGJlIHVzZWQiLiBZb3UgY2FuIHN0YXJ0
IHdpdGggc3VwcG9ydGluZyBhIHNpbmdsZSBDUyAobm8KPiBtYXR0ZXIgd2hpY2ggb25lIGlzIHBp
Y2tlZCBieSB0aGUgdXNlciB3aXRoIHRoZSByZWcgcHJvcGVydHkpIGJ1dCBpbgo+IHRoaXMgY2Fz
ZSB0aGVyZSBpcyBubyBzdWNoIGZvciBsb29wIGJlY2F1c2Ugb25seSAxIENTIGlzIHVzZWQuIE9y
IHlvdQo+IGNhbiBkZWNpZGUgdGhhdCBib3RoIENTIGNhbiBiZSBwb3B1bGF0ZWQgYW5kIGluIHRo
aXMgY2FzZSB5b3UgbXVzdAo+IGhhbmRsZSB0aGlzIGluIC0+c2VsZWN0X2NoaXAoKS4KU3VyZSwg
SSB3aWxsIGhhZGxlIHRoZSBzYW1lIGFzIHBlciB5b3VyIHN1Z2dlc3Rpb24sIHRoYW5rcyBhIGxv
dCEKClJlZ2FyZHMKVmFkaXZlbAo+IAo+Pgo+Pj4gICAgCj4+Pj4gKwo+Pj4+ICsJZm9yIChpID0g
MDsgaSA8IE1BWF9DUzsgaSsrKSB7Cj4+Pj4gKwkJcmVzbmFtZSA9IGRldm1fa2FzcHJpbnRmKGRl
diwgR0ZQX0tFUk5FTCwgIm5hbmRfY3MlZCIsIGkpOwo+Pj4+ICsJCXJlcyA9IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sCj4+Pj4gKwkJCQkJCSAgIHJl
c25hbWUpOwo+Pj4+ICsJCWVidV9ob3N0LT5jc1tpXS5jaGlwYWRkciA9IGRldm1faW9yZW1hcF9y
ZXNvdXJjZShkZXYsIHJlcyk7Cj4+Pj4gKwkJZWJ1X2hvc3QtPmNzW2ldLm5hbmRfcGEgPSByZXMt
PnN0YXJ0Owo+Pj4+ICsJCWlmIChJU19FUlIoZWJ1X2hvc3QtPmNzW2ldLmNoaXBhZGRyKSkKPj4+
PiArCQkJcmV0dXJuIFBUUl9FUlIoZWJ1X2hvc3QtPmNzW2ldLmNoaXBhZGRyKTsKPj4+PiArCX0K
Pj4+PiArCj4+Pj4gKwllYnVfaG9zdC0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7Cj4+
Pj4gKwlpZiAoSVNfRVJSKGVidV9ob3N0LT5jbGspKQo+Pj4+ICsJCXJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgUFRSX0VSUihlYnVfaG9zdC0+Y2xrKSwKPj4+PiArCQkJCSAgICAgImZhaWxlZCB0
byBnZXQgY2xvY2tcbiIpOwo+Pj4+ICsKPj4+PiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShl
YnVfaG9zdC0+Y2xrKTsKPj4+PiArCWlmIChyZXQpIHsKPj4+PiArCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBlbmFibGUgY2xvY2s6ICVkXG4iLCByZXQpOwo+Pj4+ICsJCXJldHVybiByZXQ7Cj4+
Pj4gKwl9Cj4+Pj4gKwllYnVfaG9zdC0+Y2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoZWJ1X2hvc3Qt
PmNsayk7Cj4+Pj4gKwo+Pj4+ICsJZWJ1X2hvc3QtPmRtYV90eCA9IGRtYV9yZXF1ZXN0X2NoYW4o
ZGV2LCAidHgiKTsKPj4+PiArCWlmIChJU19FUlIoZWJ1X2hvc3QtPmRtYV90eCkpCj4+Pj4gKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGVidV9ob3N0LT5kbWFfdHgpLAo+Pj4+
ICsJCQkJICAgICAiZmFpbGVkIHRvIHJlcXVlc3QgRE1BIHR4IGNoYW4hLlxuIik7Cj4+Pj4gKwo+
Pj4+ICsJZWJ1X2hvc3QtPmRtYV9yeCA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAicngiKTsKPj4+
PiArCWlmIChJU19FUlIoZWJ1X2hvc3QtPmRtYV9yeCkpCj4+Pj4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCBQVFJfRVJSKGVidV9ob3N0LT5kbWFfcngpLAo+Pj4+ICsJCQkJICAgICAiZmFp
bGVkIHRvIHJlcXVlc3QgRE1BIHJ4IGNoYW4hLlxuIik7Cj4+Pj4gKwo+Pj4+ICsJZm9yIChpID0g
MDsgaSA8IE1BWF9DUzsgaSsrKSB7Cj4+Pj4gKwkJcmVzbmFtZSA9IGRldm1fa2FzcHJpbnRmKGRl
diwgR0ZQX0tFUk5FTCwgImFkZHJfc2VsJWQiLCBpKTsKPj4+PiArCQlyZXMgPSBwbGF0Zm9ybV9n
ZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLAo+Pj4+ICsJCQkJCQkgICBy
ZXNuYW1lKTsKPj4+PiArCQlpZiAoIXJlcykKPj4+PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4+Pj4g
KwkJZWJ1X2hvc3QtPmNzW2ldLmFkZHJfc2VsID0gcmVzLT5zdGFydDsKPj4+PiArCQl3cml0ZWwo
ZWJ1X2hvc3QtPmNzW2ldLmFkZHJfc2VsIHwgRUJVX0FERFJfTUFTSyg1KSB8Cj4+Pj4gKwkJICAg
ICAgIEVCVV9BRERSX1NFTF9SRUdFTiwgZWJ1X2hvc3QtPmVidSArIEVCVV9BRERSX1NFTChpKSk7
Cj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJbmFuZF9zZXRfZmxhc2hfbm9kZSgmZWJ1X2hvc3QtPmNo
aXAsIGRldi0+b2Zfbm9kZSk7Cj4+Pj4gKwlpZiAoIW10ZC0+bmFtZSkgewo+Pj4+ICsJCWRldl9l
cnIoZWJ1X2hvc3QtPmRldiwgIk5BTkQgbGFiZWwgcHJvcGVydHkgaXMgbWFuZGF0b3J5XG4iKTsK
Pj4+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4+PiArCX0KPj4+PiArCj4+Pj4gKwltdGQgPSBuYW5k
X3RvX210ZCgmZWJ1X2hvc3QtPmNoaXApOwo+Pj4+ICsJbXRkLT5kZXYucGFyZW50ID0gZGV2Owo+
Pj4+ICsJZWJ1X2hvc3QtPmRldiA9IGRldjsKPj4+PiArCj4+Pj4gKwlwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBlYnVfaG9zdCk7Cj4+Pj4gKwluYW5kX3NldF9jb250cm9sbGVyX2RhdGEoJmVi
dV9ob3N0LT5jaGlwLCBlYnVfaG9zdCk7Cj4+Pj4gKwo+Pj4+ICsJbmFuZCA9ICZlYnVfaG9zdC0+
Y2hpcDsKPj4+PiArCW5hbmQtPmNvbnRyb2xsZXIgPSAmZWJ1X2hvc3QtPmNvbnRyb2xsZXI7Cj4+
Pj4gKwluYW5kLT5jb250cm9sbGVyLT5vcHMgPSAmZWJ1X25hbmRfY29udHJvbGxlcl9vcHM7Cj4+
Pj4gKwo+Pj4+ICsJLyogU2NhbiB0byBmaW5kIGV4aXN0ZW5jZSBvZiB0aGUgZGV2aWNlICovCj4+
Pj4gKwlyZXQgPSBuYW5kX3NjYW4oJmVidV9ob3N0LT5jaGlwLCAxKTsKPj4+PiArCWlmIChyZXQp
Cj4+Pj4gKwkJZ290byBlcnJfY2xlYW51cF9kbWE7Cj4+Pj4gKwo+Pj4+ICsJcmV0ID0gbXRkX2Rl
dmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOwo+Pj4+ICsJaWYgKHJldCkKPj4+PiArCQlnb3Rv
IGVycl9jbGVhbl9uYW5kOwo+Pj4+ICsKPj4+PiArCXJldHVybiAwOwo+Pj4+ICsKPj4+PiArZXJy
X2NsZWFuX25hbmQ6Cj4+Pj4gKwluYW5kX2NsZWFudXAoJmVidV9ob3N0LT5jaGlwKTsKPj4+PiAr
ZXJyX2NsZWFudXBfZG1hOgo+Pj4+ICsJZWJ1X2RtYV9jbGVhbnVwKGVidV9ob3N0KTsKPj4+PiAr
CWNsa19kaXNhYmxlX3VucHJlcGFyZShlYnVfaG9zdC0+Y2xrKTsKPj4+PiArCj4+Pj4gKwlyZXR1
cm4gcmV0Owo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IGVidV9uYW5kX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+ICt7Cj4+Pj4gKwlzdHJ1Y3QgZWJ1X25h
bmRfY29udHJvbGxlciAqZWJ1X2hvc3QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPj4+
PiArCWludCByZXQ7Cj4+Pj4gKwo+Pj4+ICsJcmV0ID0gbXRkX2RldmljZV91bnJlZ2lzdGVyKG5h
bmRfdG9fbXRkKCZlYnVfaG9zdC0+Y2hpcCkpOwo+Pj4+ICsJV0FSTl9PTihyZXQpOwo+Pj4+ICsJ
bmFuZF9jbGVhbnVwKCZlYnVfaG9zdC0+Y2hpcCk7Cj4+Pj4gKwllYnVfbmFuZF9kaXNhYmxlKCZl
YnVfaG9zdC0+Y2hpcCk7Cj4+Pj4gKwllYnVfZG1hX2NsZWFudXAoZWJ1X2hvc3QpOwo+Pj4+ICsJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGVidV9ob3N0LT5jbGspOwo+Pj4+ICsKPj4+PiArCXJldHVy
biAwOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBlYnVfbmFuZF9tYXRjaFtdID0gewo+Pj4+ICsJeyAuY29tcGF0aWJsZSA9ICJpbnRlbCxuYW5k
LWNvbnRyb2xsZXIiLCB9LAo+Pj4KPj4+IE5vIHZlcnNpb24gb3Igc29jIGluIHRoZSBjb21wYXRp
YmxlPyAobm90IG1hbmRhdG9yeSkuCj4+IFllcywgeW91J3JlIHJpZ2h0LCBpdCBzaG91bGQgYmUg
ImludGVsLGxnbS1lYnVuYW5kIiwgYnV0IHRoaXMgc2FtZSBkcml2ZXIgc3VwcG9ydHMgMiBkZmZl
cmVudCBTT0MncyAsIHRoYXQncyB0aGUgcmVhc29uIGtlcHQgYXMgZ2VuZXJpYwo+PiAiaW50ZWws
bmFuZC1jb250cm9sbGVyIgo+IAo+IEluIHRoaXMgY2FzZSBJIGd1ZXNzIGRlY2xhcmluZyB0d28g
Y29tcGF0aWJsZXMgaXMgdGhlIHdheSB0byBnby4KPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
