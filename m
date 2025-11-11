Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50F7CCF9E3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Nov 2025 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mPdQ1p2ShVdF6yK8RNOUGc6PQNa2YKlYu4/DYXOXws=; b=srh3l3nXTTAiLJ
	fimh+tINENyGlvmLaWMfSYD8n/kvw99Y4G35Kb3jJied80MW6oCFki2q3CG0GShfcnnwurRwuIaaj
	25+spf1j4JOm0yerfclGJ6HFhoqKttD3uiLcPWT4fhrSp+PtZyz0Cl1+LVYb7azeS2zcBsITS6bLJ
	OV5kQfvYJFBOQXJX7eLcPSEL0PkW4BiQjpMODK/8YVTt7Ius3cJ8Hxa+TnMki86wiL+HOkrXJ2bSd
	zJuD32+hfy4MMDmkf2OwASftNOqJXp9IyvDylpWNosyJ4VtreFrOKsdaoyH419TCh11lXoF4VxLTZ
	j5lGKRwH2hrSri6jHJ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjP1-00000006k82-2Kkx;
	Tue, 11 Nov 2025 08:06:59 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjOz-00000006k7U-0vk2
	for linux-mtd@lists.infradead.org;
	Tue, 11 Nov 2025 08:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762848417; x=1794384417;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=YjA88/CYOEpRucIaf/Nb67L+pET5cX+v8Wm9RP7FNtM=;
  b=YswBZV+iV6qp7ZjCdYWDR2ZJhrzF15kl9iF3p6d3FwcTqAltpMG8eT4t
   uSIub9p9utFVAxMSlJuDJZMlgv99IHsTKTv4bDU8aQAD/fQcTOxygVN1A
   QW2ionXQLVfGqX7E16Qv4lI/EsJVwDcFSx4ojbR8m1oDXRJaKx9LstSk+
   JzD8AybM3/N896LCBL+qidVqE5IVt7h8jUXMJ8hKxot9feR8U4U8nyq4m
   RWyAqnWcoik9xy1EXmBxtF4hJskTY0fd1g8WxTmtGYtGjLh7vyJMOtaPK
   0Em1bTxpKQrCG15fClT4HmldmT3h7lphK5Tb53p+tVIyf8wOJQXgkc+2e
   g==;
X-CSE-ConnectionGUID: yyNN6MESRmiBfa6C4jINSQ==
X-CSE-MsgGUID: 6uFRZ7sKR+qbv5Ur48Q4yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64791726"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64791726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 00:06:56 -0800
X-CSE-ConnectionGUID: hI0QQit1Tdeq9d17cB1H5g==
X-CSE-MsgGUID: KBoGJHApTn+/IL3pRc+JkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="219553155"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.239])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 00:06:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Cc: Jani Partanen <jiipee@sotapeli.fi>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: Possible bug?
In-Reply-To: <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
 <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
 <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
 <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
Date: Tue, 11 Nov 2025 10:06:50 +0200
Message-ID: <98df450751f934f3a5c20ec09a08b72ef8fa2763@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_000657_321973_F1F064FD 
X-CRM114-Status: GOOD (  15.79  )
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

T24gVHVlLCAxMSBOb3YgMjAyNSwgIlVzeXNraW4sIEFsZXhhbmRlciIgPGFsZXhhbmRlci51c3lz
a2luQGludGVsLmNvbT4gd3JvdGU6Cj4+IE9uIE1vbiwgTm92IDEwLCAyMDI1IGF0IDAzOjQ5OjIw
UE0gKzAyMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+PiA+T24gU3VuLCAwOSBOb3YgMjAyNSwgSmFu
aSBQYXJ0YW5lbiA8amlpcGVlQHNvdGFwZWxpLmZpPiB3cm90ZToKPj4gPj4gSGVsbG8sIEkganVz
dCBnb3QgSW50ZWwgQXJjIEI1NzAuIEl0IHNlZW1zIHRvIHdvcmsgZmluZSBidXQgZXZlcnkgYm9v
dCBJCj4+ID4+IGdldCB0aGlzIGluIGRtZXNnOgo+PiA+Pgo+PiA+PiBbwqAgMzQyLjg2NTk0NF0g
LS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4+ID4+IFvCoCAzNDIuODY1OTUw
XSBVQlNBTjogYXJyYXktaW5kZXgtb3V0LW9mLWJvdW5kcyBpbgo+PiA+PiBkcml2ZXJzL210ZC9k
ZXZpY2VzL210ZF9pbnRlbF9kZy5jOjc1MDoxNQo+PiA+PiBbwqAgMzQyLjg2NTk1NF0gaW5kZXgg
MCBpcyBvdXQgb2YgcmFuZ2UgZm9yIHR5cGUgJzx1bmtub3duPiBbKl0nCj4+ID4KPj4gPkNjOiBB
bGV4YW5kZXIgYW5kIGxpbnV4LW10ZC4KPj4gPgo+PiA+SXQncyBwcm9iYWJseSBkdWUgdG8gc3Ry
dWN0IGludGVsX2RnX252bSByZWdpb25zW10gbWVtYmVyIGJlaW5nCj4+ID5fX2NvdW50ZWRfYnko
bnJlZ2lvbnMpIGJ1dCByZWdpb25zW10gaXMgaW5kZXhlZCBiZWZvcmUgbnJlZ2lvbnMgaGFzIGJl
ZW4KPj4gPmluaXRpYWxpemVkLgo+PiAKPj4geWVhaC4uLiBhbmQgd2Ugc2hvdWxkbid0IHNpbGVu
dGx5IGNvbnRpbnVlIGhpZGluZyB0aGUgRU5PTUVNLi4uIFNhc2hhLAo+PiBzb21ldGhpbmcgbGlr
ZSB0aGlzPwo+PiAKPgo+IEluIGdlbmVyYWwsIGxvb2tzIGdvb2QgZm9yIG1lLCBidXQgSSBzZWUg
dGhhdCB3ZSBjYW4gZmlsbCBsZXNzIGVudHJpZXMgYmVjYXVzZSBvZgo+ICAgICAgICAgICAgICAg
ICBpZiAoIWludm0tPnJlZ2lvbnNbaV0ubmFtZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPgo+IExldCdzIGxlYXZlICdudm0tPm5yZWdpb25zID0gbjsnIGluIHBsYWNlLCBv
bmx5IG5lZWQgdG8gZml4IHRoZSBjb21tZW50LgoKWW91IGhhdmUgdGhpcyBpbiBwbGFjZSwgbnJl
Z2lvbnMgYWxyZWFkeSBhY2NvdW5zIGZvciB0aGVtOgoKCS8qIGNvdW50IGF2YWlsYWJsZSByZWdp
b25zICovCglmb3IgKG5yZWdpb25zID0gMCwgaSA9IDA7IGkgPCBJTlRFTF9ER19OVk1fUkVHSU9O
UzsgaSsrKSB7CgkJaWYgKGludm0tPnJlZ2lvbnNbaV0ubmFtZSkKCQkJbnJlZ2lvbnMrKzsKCX0K
CkJSLApKYW5pLgoKCj4KPiAtIC0gCj4gVGhhbmtzLAo+IFNhc2hhCj4KPj4gTHVjYXMgRGUgTWFy
Y2hpCj4+IAo+PiAtLS0tCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9p
bnRlbF9kZy5jCj4+IGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfaW50ZWxfZGcuYwo+PiBpbmRl
eCBiNDM4ZWU1YWFjYzM0Li4xMTRlNjkxMzViOGQ5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210
ZC9kZXZpY2VzL210ZF9pbnRlbF9kZy5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbXRk
X2ludGVsX2RnLmMKPj4gQEAgLTczOCw2ICs3MzgsNyBAQCBzdGF0aWMgaW50IGludGVsX2RnX210
ZF9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZQo+PiAqYXV4X2RldiwKPj4gCj4+ICAgCWty
ZWZfaW5pdCgmbnZtLT5yZWZjbnQpOwo+PiAgIAltdXRleF9pbml0KCZudm0tPmxvY2spOwo+PiAr
CW52bS0+bnJlZ2lvbnMgPSBucmVnaW9uczsKPj4gCj4+ICAgCWZvciAobiA9IDAsIGkgPSAwOyBp
IDwgSU5URUxfREdfTlZNX1JFR0lPTlM7IGkrKykgewo+PiAgIAkJaWYgKCFpbnZtLT5yZWdpb25z
W2ldLm5hbWUpCj4+IEBAIC03NDUsMTMgKzc0NiwxNSBAQCBzdGF0aWMgaW50IGludGVsX2RnX210
ZF9wcm9iZShzdHJ1Y3QKPj4gYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldiwKPj4gCj4+ICAgCQlj
aGFyICpuYW1lID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICIlcy4lcyIsCj4+ICAgCQkJCSAgICAg
ICBkZXZfbmFtZSgmYXV4X2Rldi0+ZGV2KSwgaW52bS0KPj4gPnJlZ2lvbnNbaV0ubmFtZSk7Cj4+
IC0JCWlmICghbmFtZSkKPj4gLQkJCWNvbnRpbnVlOwo+PiArCQlpZiAoIW5hbWUpIHsKPj4gKwkJ
CXJldCA9IC1FTk9NRU07Cj4+ICsJCQlnb3RvIGVycjsKPj4gKwkJfQo+PiArCj4+ICAgCQludm0t
PnJlZ2lvbnNbbl0ubmFtZSA9IG5hbWU7Cj4+ICAgCQludm0tPnJlZ2lvbnNbbl0uaWQgPSBpOwo+
PiAgIAkJbisrOwo+PiAgIAl9Cj4+IC0JbnZtLT5ucmVnaW9ucyA9IG47IC8qIGluIGNhc2Ugd2hl
cmUga2FzcHJpbnRmIGZhaWwgKi8KPj4gCj4+ICAgCW52bS0+YmFzZSA9IGRldm1faW9yZW1hcF9y
ZXNvdXJjZShkZXZpY2UsICZpbnZtLT5iYXIpOwo+PiAgIAlpZiAoSVNfRVJSKG52bS0+YmFzZSkp
IHsKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
