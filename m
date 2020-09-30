Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70A8C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:36:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4D62074A
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmAosxhB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B4D62074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAuUBGm0VmPGUqcMedJQURGMAudYbY3doDE2jnChmWE=; b=fmAosxhBk1XN7o
	cM9aB07MSXwQR2wExHBrqq7JNB+IIrbDjDGWwZ2wXIXMBRukS0nzcF/iKl2hYERTzxJ6nIDbZoUs3
	LADkvMRItN/lVbD6WVwT+NS+cJh5MQiaw9KPouim3a/xTt3Jcb4O1WRxpcdsr1zQ0Ul16rXkdK9TX
	PzV6Mr2td3zVkPkrQA09GAvz1SzA/YQSOtHCEoSl8q7BpgPvtP/V1Ej+Jz3PmOAfZQ7WkYfmPDS13
	voTihrRKOYp9/QE8O0j1/+0auiV40F4u7Wdic4O6+ywcoZ1nZIuyJshGGMe1b7Q4UAGduuYPwB0Qo
	TWDCC42gkKbufjMc6oiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNYWC-0006Us-4V; Wed, 30 Sep 2020 09:35:24 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNYW8-0006TD-Te
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 09:35:22 +0000
IronPort-SDR: KHh0N8sr0C8yRm3ii0+Yt8ABccHuPclVPKaRkSxviEVAi+rhcuT4RfaQoleLHlW6SHmRvff81q
 BB2OMxUjK7LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150185720"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="150185720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 02:35:14 -0700
IronPort-SDR: CvxftynzD8Grt40D+c09NMwSaYEOd8YaU4fAMki1iGRHXJSju2rfvoKJ/WBc9oHv3mDgTOH5lM
 5GX1cFQhsJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="515010272"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2020 02:35:13 -0700
Received: from [10.226.38.24] (unknown [10.226.38.24])
 by linux.intel.com (Postfix) with ESMTP id 87E115807A3;
 Wed, 30 Sep 2020 02:35:09 -0700 (PDT)
Subject: Re: [PATCH v14 0/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200924084842.41741-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200928162550.30bbce71@xps13>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <ef7ba9ba-b6c1-7a94-8320-b8023f721be2@linux.intel.com>
Date: Wed, 30 Sep 2020 17:35:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928162550.30bbce71@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_053521_104846_C127FF24 
X-CRM114-Status: GOOD (  21.55  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, christophe.kerello@st.com, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mips@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, qi-ming.wu@intel.com,
 robert.jarzmik@free.fr, piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMjgvOS8yMDIwIDEwOjI1IHBtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhlbGxvLAo+IAo+ICJSYW11dGhldmFyLFZhZGl2ZWwgTXVydWdhblgiCj4gPHZhZGl2ZWwubXVy
dWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdyb3RlIG9uIFRodSwgMjQgU2VwIDIw
MjAKPiAxNjo0ODo0MCArMDgwMDoKPiAKPj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBuZXcgSVAgb2Yg
TmFuZCBGbGFzaCBDb250cm9sbGVyKE5GQykgc3VwcG9ydAo+PiBvbiBJbnRlbCdzIExpZ2h0bmlu
ZyBNb3VudGFpbihMR00pIFNvQy4KPj4KPj4gRE1BIGlzIHVzZWQgZm9yIGJ1cnN0IGRhdGEgdHJh
bnNmZXIgb3BlcmF0aW9uLCBhbHNvIERNQSBIVyBzdXBwb3J0cwo+PiBhbGlnbmVkIDMyYml0IG1l
bW9yeSBhZGRyZXNzIGFuZCBhbGlnbmVkIGRhdGEgYWNjZXNzIGJ5IGRlZmF1bHQuCj4+IERNQSBi
dXJzdCBvZiA4IHN1cHBvcnRlZC4gRGF0YSByZWdpc3RlciB1c2VkIHRvIHN1cHBvcnQgdGhlIHJl
YWQvd3JpdGUKPj4gb3BlcmF0aW9uIGZyb20vdG8gZGV2aWNlLgo+Pgo+PiBOQU5EIGNvbnRyb2xs
ZXIgYWxzbyBzdXBwb3J0cyBpbi1idWlsdCBIVyBFQ0MgZW5naW5lLgo+Pgo+PiBOQU5EIGNvbnRy
b2xsZXIgZHJpdmVyIGltcGxlbWVudHMgLT5leGVjX29wKCkgdG8gcmVwbGFjZSBsZWdhY3kgaG9v
a3MsCj4+IHRoZXNlIHNwZWNpZmljIGNhbGwtYmFjayBtZXRob2QgdG8gZXhlY3V0ZSBOQU5EIG9w
ZXJhdGlvbnMuCj4+Cj4+IFRoYW5rcyBNaXF1ZWwsIEJvcmlzLCBBbmR5LCBBcm5kIGFuZCBSb2Ig
Zm9yIHRoZSByZXZpZXcgY29tbWVudHMgYW5kIHN1Z2dlc3Rpb25zLgo+PiAtLS0KPj4gdjE0Ogo+
PiAgICAtIEFkZHJlc3MgQW5keSdzIHJldmlldyBjb21tZW50cwo+PiAgICAtIGFsaWduIHRoZSBo
ZWFkZXJzIGFuZCByZXZvbWUgRHVwbGljYXRlcwo+PiAgICAtIHJlcGxjYWNlIG51bWVyaWNhbCBj
b25zdCB2YWx1ZXMgYnkgSFpfUEVSX01IWiBhbmQgVVNFQ19QRVJfU0VDCj4+ICAgICAgZGVmaW5l
ZCBtYWNyb3MKPj4gICAgLSBhZGQgZGV2X2Vycl9wcm9iZSgpIGFwaSBpbnN0ZWFkIG9mIGxlZ2Fj
eSBlcnIgY2hlY2sKPj4gICAgLSBhZGQgZ2V0X3VuYWxpZ25lZF9sZTMyKCkgYXBpIGluc3RlYWQg
b2YgbWFudWFsIGVuZGluZXNzCj4+ICAgIC0gcmVtb3ZlIHJlZHVkZW50IGNoZWNrCj4+ICAgIC0g
c3BsaXQgdGhlIGxpbmVzIGxvZ2ljYWxseSBpbiBiZXR3ZWVuIGFuZCBhZGQgcmVxdWlyZSBzcGFj
ZXMKPj4gdjEzOgo+PiAgICAtIEFkZHJlc3MgTWlxdWVsIFJheW5hbCByZXZpZXcgY29tbWVudHMK
Pj4gICAgLSB1cGRhdGUgdGhlIHJldHVybiB0eXBlIHdpdGggdmFyaWFibGUgJ3JldCcKPj4gICAg
LSBoYW5kbGUgZXJyIGNoZWNrIHN0YXRlbWVudCBwcm9wZXJseQo+PiAgICAtIGNoYW5nZSB0aGUg
bmFtaW5nIGNvbnZlbnRpb24gYWxpZ25lZCB3aXRoIHJlY2VudGx5IGNoYW5nZWQgdGhlIG5hbWlu
Zwo+PiAgICAgIGFyb3VuZCB0aGUgZGF0YSBpbnRlcmZhY2UKPj4gICAgICBkYXRhIHN0cnVjdHVy
ZSBhbmQgZnVuY3Rpb24gbmFtZXMKPj4gICAgLSByZXBsYWNlIGJ5IGRpdiA4IGluc3RlYWQgb2Yg
PDw0IGluIGVjYyBjYWxjdWxhdGlvbiBiZXR0ZXIgY29kZSByZWFkYWJpbGl0eQo+PiAgICAtIGhh
bmRsZSBjaGVja19vbmx5IHByb3Blcmx5IGxpa2UgZXhpc3RpbmcgZHJpdmVycwo+IAo+IEkgYW0g
c29ycnkgYnV0IHRoZXJlIGFyZSB0d28gdG8gdGhyZWUgY29tbWVudHMgd2hpY2ggeW91IGRpZCBu
b3QKPiBhZGRyZXNzIG9yIGFkZHJlc3NlZCBwYXJ0aWFsbHkgd2hpbGUgbm90IHNvIGltcGFjdGlu
ZyBvbiB0aGUgbG9naWMsCj4gY2FuIHlvdSBwbGVhc2UgcmV2aWV3IGFuZCBhZGRyZXNzIHRoZW0g
YWxsPyAocGxlYXNlIG5vdGUgdGhhdCBJIGNoZWNrZWQKPiB0aGUgcGF0Y2ggYWRkaW5nIHRoZSBk
cml2ZXIgYmVmb3JlIHRlbGxpbmcgeW91IHRoYXQpLgoKVGhhbmsgeW91IGZvciB5b3VyIGNvbW1l
bnRzLi4uIQoKU3VyZSwgSSB3aWxsIHJldmlldyBvbmNlIGFnYWluIGFsbCB5b3VyIGNvbW1lbnRz
IGluIHRoZSBwcmV2aW91cyBwYXRjaCAKc2VudCBpZiBhbnl0aGluZyBpcyBtaXNzZWQgdGhlbiB3
aWxsIGFkZCBpdCBhbmQgc2VuZCB0aGUgdXBkYXRlZCBwYXRjaC4KClJlZ2FyZHMKVmFkaXZlbAo+
IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
