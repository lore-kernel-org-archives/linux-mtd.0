Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADF7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eC21nVI7DspfvFS0QghMGWxK6dxI7PEPN8fQY/I8P/k=; b=bTvIm8us5hcP61
	kPdV3FU4TW1hRDFilfIwoYCRdn21cdldVjlnWxr8KicbphcKf3yT09Z2/ePYmZQ+p0WuuWLMbCBfy
	b8PVIrWzfX7pOrrOk/U/IM0xhvxeDbBpmbPCsPcGbcO6F+gwRpNU3G5NzaZRvdX9hcdSvEgh/Bs1S
	PmTAqEch236kmdWdM3sIWiODLwj8a2uGOB9Nom0DtSiWKTtpADXnglB6mhSLVjpt6Duz/Zudk+Ws1
	hYEEuNfFWYRymKVlORebdpLDlmWtRw5lamp2Hfg45yds9FnfZdptjDAzUwpCmwTEuBhDYZg3CEqxq
	tCXOncdgUbsioE1FbWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n55LQ-00El5h-O5; Wed, 05 Jan 2022 12:24:44 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n55LO-00El5E-30
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 12:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641385482; x=1672921482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SlgaR6uzmEBK8uFF5uCky/iCc0048T/UdOFjxlvuZG4=;
 b=SI7ZIZ+3iG3cPDhB/ZzqBtC+L31nAI6Ni8Hamu4oWf60/CKQ09zqHHDN
 TCi3nvkQqYif12zqPI+50hON1Pa99Ds7GBP+FN9dMuK07Zr3V6qLSYlLo
 oI/G/4s23CzhZqrPZzh7V/+bGKdETjsqgwlKxAMUjUBeY38QqSIkHI5PH
 569LHv9Y1Vf4SqDVzf8Qy/aO5c72+97zylzBgIUmlaMHmG7MXDd1ZNsNO
 L0Bv0hYMe3xosmT/Kf3AavF28qv2Mi/V64t4purvcrgUaqsAxukMpskhD
 pjunNbBQHYH7pk8sR4s7sUoqkEbJetI6KZOVsGybMMF+XN/W9A9dPaD3A Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242385733"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="242385733"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 04:24:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="574371101"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jan 2022 04:24:38 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n55LK-000GaY-53; Wed, 05 Jan 2022 12:24:38 +0000
Date: Wed, 5 Jan 2022 20:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: kbuild-all@lists.01.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 3/3] nvmem: add driver handling U-Boot environment
 variables
Message-ID: <202201052036.kcalPY98-lkp@intel.com>
References: <20211230090449.11808-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230090449.11808-3-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_042442_214069_00DA76FB 
X-CRM114-Status: GOOD (  12.16  )
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
LXJjOF0KW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtp
bmRseSBkcm9wIHVzIGEgbm90ZS4KQW5kIHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2Vz
dCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRlZCBpbgpodHRwczovL2dpdC1zY20uY29tL2Rv
Y3MvZ2l0LWZvcm1hdC1wYXRjaF0KCnVybDogICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kv
bGludXgvY29tbWl0cy9SYWZhLU1pLWVja2kvbXRkLWNvcmUtY2FsbC1kZXZtX29mX3BsYXRmb3Jt
X3BvcHVsYXRlLWZvci1NVEQtZGV2aWNlcy8yMDIxMTIzMC0xNzA1MzEKYmFzZTogICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdCBm
b3ItbmV4dApjb25maWc6IGFybTY0LXJhbmRjb25maWctcjAwMy0yMDIyMDEwNSAoaHR0cHM6Ly9k
b3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjIwMTA1LzIwMjIwMTA1MjAzNi5rY2Fs
UFk5OC1sa3BAaW50ZWwuY29tL2NvbmZpZykKY29tcGlsZXI6IGFhcmNoNjQtbGludXgtZ2NjIChH
Q0MpIDExLjIuMApyZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOgogICAgICAgIHdnZXQg
aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIv
c2Jpbi9tYWtlLmNyb3NzIC1PIH4vYmluL21ha2UuY3Jvc3MKICAgICAgICBjaG1vZCAreCB+L2Jp
bi9tYWtlLmNyb3NzCiAgICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9j
b21taXQvNTJmNmJlNDcxMmQwNGI5MjdjZDM1NmRkOTU5NDBiZDc2ZjFmNWI5NwogICAgICAgIGdp
dCByZW1vdGUgYWRkIGxpbnV4LXJldmlldyBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51
eAogICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXgtcmV2aWV3IFJhZmEtTWktZWNraS9t
dGQtY29yZS1jYWxsLWRldm1fb2ZfcGxhdGZvcm1fcG9wdWxhdGUtZm9yLU1URC1kZXZpY2VzLzIw
MjExMjMwLTE3MDUzMQogICAgICAgIGdpdCBjaGVja291dCA1MmY2YmU0NzEyZDA0YjkyN2NkMzU2
ZGQ5NTk0MGJkNzZmMWY1Yjk3CiAgICAgICAgIyBzYXZlIHRoZSBjb25maWcgZmlsZSB0byBsaW51
eCBidWlsZCB0cmVlCiAgICAgICAgbWtkaXIgYnVpbGRfZGlyCiAgICAgICAgQ09NUElMRVJfSU5T
VEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTExLjIuMCBtYWtlLmNyb3NzIE89YnVp
bGRfZGlyIEFSQ0g9YXJtNjQgU0hFTEw9L2Jpbi9iYXNoCgpJZiB5b3UgZml4IHRoZSBpc3N1ZSwg
a2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIGFzIGFwcHJvcHJpYXRlClJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KCkFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZp
eGVkIGJ5ID4+KToKCiAgIGFhcmNoNjQtbGludXgtbGQ6IFVuZXhwZWN0ZWQgR09UL1BMVCBlbnRy
aWVzIGRldGVjdGVkIQogICBhYXJjaDY0LWxpbnV4LWxkOiBVbmV4cGVjdGVkIHJ1bi10aW1lIHBy
b2NlZHVyZSBsaW5rYWdlcyBkZXRlY3RlZCEKICAgYWFyY2g2NC1saW51eC1sZDogZHJpdmVycy9u
dm1lbS91LWJvb3QtZW52Lm86IGluIGZ1bmN0aW9uIGB1X2Jvb3RfZW52X3JlYWQnOgo+PiB1LWJv
b3QtZW52LmM6KC50ZXh0KzB4NGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtdGRfcmVhZCcK
ICAgYWFyY2g2NC1saW51eC1sZDogZHJpdmVycy9udm1lbS91LWJvb3QtZW52Lm86IGluIGZ1bmN0
aW9uIGB1X2Jvb3RfZW52X3Byb2JlJzoKPj4gdS1ib290LWVudi5jOigudGV4dCsweDNlMCk6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYGdldF9tdGRfZGV2aWNlX25tJwo+PiBhYXJjaDY0LWxpbnV4
LWxkOiB1LWJvb3QtZW52LmM6KC50ZXh0KzB4NDI4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
bXRkX3JlYWQnCiAgIGFhcmNoNjQtbGludXgtbGQ6IHUtYm9vdC1lbnYuYzooLnRleHQrMHg0OTQp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtdGRfcmVhZCcKCi0tLQowLURBWSBDSSBLZXJuZWwg
VGVzdCBTZXJ2aWNlLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwczovL2xpc3RzLjAxLm9yZy9oeXBl
cmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
