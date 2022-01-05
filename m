Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331ABC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrhEzOcZxOEVVHEHQ2cyJJtzLVa6DpI5OUUS/0jtDZM=; b=0qqV/oOpzVj/Pt
	zby/j3WQo7dMry6vBvYVkW3j8Df/EPyKppFrfLZ94oeiEJjNLH4BBeYXdgHwnF6Dvj1pNd6qYIaFq
	cbKihVI+MxV+8JKytfZYVKh2aHfeUOMlZYeRS9cWhBFxMCJda7AFxhr7jKnpptBYtpWBClmI11PFR
	qDUVvfP8CgWW0nKm4TQfSSrtKmdlZUoT8vydeUYVOxe9A119SrjNEbjT0JYZ9Qfx8SC1Tq9WYFrxh
	Liaz0AF5uASBDrkMaFX+jCRCb0DPzhTcShbTeCAGheMZS3vbSIc6lGjLQ0ZPKrB3V0xJUQcTWCffP
	sMukgRIeWlNkNspnt3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n54Y4-00EgbC-ST; Wed, 05 Jan 2022 11:33:44 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n54Y2-00Ega5-CQ
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 11:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641382422; x=1672918422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3Hd28/OpKDRgp94Vv+FZ+25YO7a/P3QdXcK7L/1o/sE=;
 b=eVQYE6TliPRfcoR5AFmnMR+/7zsC5T56+T2IsDicorcA056sC2Sj9CUU
 Hi/IvnpeSG6e+f92KP5MTupSTWZvA7QoevqMbqri0Ier46HUqe5k8MXke
 0xu7xAgNP2Kh2i+luKnP44HJs5kjxosB3vygxW19GyOgtRIR2uh7qZX0L
 1dvvspvOXpgKzo4RH0BwoL1aymTw2XL3pChTxgrq/ynEpqyQSwNbIuVdL
 /51XUhy18T1AtutGVwns3Akr/NubiSMPqagdQ5CucXX9+X/4pEnPOKRH1
 OMMSocljTytdK6NW9g8ioYBHCUbA9GFhGaB2G9h50JlOCbQIWymuE0VPT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241241534"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="241241534"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 03:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="470534337"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 05 Jan 2022 03:33:37 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n54Xx-000GYM-7n; Wed, 05 Jan 2022 11:33:37 +0000
Date: Wed, 5 Jan 2022 19:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 3/3] nvmem: add driver handling U-Boot environment
 variables
Message-ID: <202201051949.ZpWQfrvi-lkp@intel.com>
References: <20211230090449.11808-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230090449.11808-3-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_033342_471046_C627FF2B 
X-CRM114-Status: GOOD (  12.91  )
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

SGkgIlJhZmHFgiwKCkkgbG92ZSB5b3VyIHBhdGNoISBZZXQgc29tZXRoaW5nIHRvIGltcHJvdmU6
CgpbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHJvYmgvZm9yLW5leHRdClthbHNvIGJ1aWxkIHRl
c3QgRVJST1Igb24gbXRkL210ZC9uZXh0IG10ZC9tdGQvZml4ZXMgbGludXMvbWFzdGVyIHY1LjE2
LXJjOCBuZXh0LTIwMjIwMTA1XQpbSWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9u
ZyBnaXQgdHJlZSwga2luZGx5IGRyb3AgdXMgYSBub3RlLgpBbmQgd2hlbiBzdWJtaXR0aW5nIHBh
dGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVudGVkIGluCmh0dHBzOi8v
Z2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBhdGNoXQoKdXJsOiAgICBodHRwczovL2dpdGh1
Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL1JhZmEtTWktZWNraS9tdGQtY29yZS1jYWxsLWRl
dm1fb2ZfcGxhdGZvcm1fcG9wdWxhdGUtZm9yLU1URC1kZXZpY2VzLzIwMjExMjMwLTE3MDUzMQpi
YXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jv
YmgvbGludXguZ2l0IGZvci1uZXh0CmNvbmZpZzogaGV4YWdvbi1yYW5kY29uZmlnLXIwMTMtMjAy
MjAxMDUgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIyMDEwNS8y
MDIyMDEwNTE5NDkuWnBXUWZydmktbGtwQGludGVsLmNvbS9jb25maWcpCmNvbXBpbGVyOiBjbGFu
ZyB2ZXJzaW9uIDE0LjAuMCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0IGQ1
YjZlMzBlZDNhY2FkNzk0ZGQwYWVjNDAwZTYxN2RhZmZjNmNjM2QpCnJlcHJvZHVjZSAodGhpcyBp
cyBhIFc9MSBidWlsZCk6CiAgICAgICAgd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVu
dC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8gfi9iaW4vbWFr
ZS5jcm9zcwogICAgICAgIGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MKICAgICAgICAjIGh0dHBz
Oi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdC81MmY2YmU0NzEyZDA0YjkyN2NkMzU2
ZGQ5NTk0MGJkNzZmMWY1Yjk3CiAgICAgICAgZ2l0IHJlbW90ZSBhZGQgbGludXgtcmV2aWV3IGh0
dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4CiAgICAgICAgZ2l0IGZldGNoIC0tbm8tdGFn
cyBsaW51eC1yZXZpZXcgUmFmYS1NaS1lY2tpL210ZC1jb3JlLWNhbGwtZGV2bV9vZl9wbGF0Zm9y
bV9wb3B1bGF0ZS1mb3ItTVRELWRldmljZXMvMjAyMTEyMzAtMTcwNTMxCiAgICAgICAgZ2l0IGNo
ZWNrb3V0IDUyZjZiZTQ3MTJkMDRiOTI3Y2QzNTZkZDk1OTQwYmQ3NmYxZjViOTcKICAgICAgICAj
IHNhdmUgdGhlIGNvbmZpZyBmaWxlIHRvIGxpbnV4IGJ1aWxkIHRyZWUKICAgICAgICBta2RpciBi
dWlsZF9kaXIKICAgICAgICBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxF
Uj1jbGFuZyBtYWtlLmNyb3NzIFc9MSBPPWJ1aWxkX2RpciBBUkNIPWhleGFnb24gU0hFTEw9L2Jp
bi9iYXNoCgpJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIGFz
IGFwcHJvcHJpYXRlClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KCkFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+LCBvbGQgb25lcyBwcmVmaXhl
ZCBieSA8PCk6Cgo+PiBFUlJPUjogbW9kcG9zdDogIm10ZF9yZWFkIiBbZHJpdmVycy9udm1lbS9u
dm1lbV91LWJvb3QtZW52LmtvXSB1bmRlZmluZWQhCj4+IEVSUk9SOiBtb2Rwb3N0OiAiZ2V0X210
ZF9kZXZpY2Vfbm0iIFtkcml2ZXJzL252bWVtL252bWVtX3UtYm9vdC1lbnYua29dIHVuZGVmaW5l
ZCEKRVJST1I6IG1vZHBvc3Q6ICJfX3Jhd19yZWFkc2wiIFtkcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIua29dIHVuZGVmaW5lZCEKRVJST1I6IG1vZHBvc3Q6ICJfX3Jhd193cml0ZXNs
IiBbZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIua29dIHVuZGVmaW5lZCEKRVJST1I6
IG1vZHBvc3Q6ICJfX3Jhd19yZWFkc2wiIFtkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rl
ci5rb10gdW5kZWZpbmVkIQpFUlJPUjogbW9kcG9zdDogIl9fcmF3X3dyaXRlc2wiIFtkcml2ZXJz
L2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmtvXSB1bmRlZmluZWQhCkVSUk9SOiBtb2Rwb3N0
OiAiX19yYXdfcmVhZHNsIiBbZHJpdmVycy9pM2MvbWFzdGVyL2kzYy1tYXN0ZXItY2Rucy5rb10g
dW5kZWZpbmVkIQoKLS0tCjAtREFZIENJIEtlcm5lbCBUZXN0IFNlcnZpY2UsIEludGVsIENvcnBv
cmF0aW9uCmh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxp
c3RzLjAxLm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
