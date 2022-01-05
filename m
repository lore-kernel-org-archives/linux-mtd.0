Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675EDC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otqAmSguCcBClx01qb1ki/lgLNUUeyRc5Ib1NBizxWE=; b=yntV3HD+fuK/ps
	7BYePx94qM/41uOscleF9izWbOVOLDT30VUbULLjNmBP3PSsF22kO/wGYOdNYbGGb8HzEZXDERz5k
	9edYWnen5h8y9aLpMwkzXKAX7HzzCpMHGKuisYp0T0tl7UPeIShZdi/P8DT4K8XC/BJ93NIFzXiKK
	QZ+3Q2khQ4tHYZREIb+ZcS7diVcEmfptM6q8+ANFERP7VaNHSLdNOYlf3MXKxK5YUyaBoYZHSzH7q
	QFh49Syt+4kzlqkdT1YYiUYtTQD1IxEyX8ln+aPdW10NqXVKpHCunMSL3srm6UohyHIn/5TgQ0tqN
	9ZsgSf9h707N3ACUToIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n50uR-00E593-W3; Wed, 05 Jan 2022 07:40:36 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n50uP-00E58M-2C
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 07:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641368433; x=1672904433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=40Lnf+baSm67V658AjUqQ6irVu4JpmrkRKU6Zn0OZpI=;
 b=BSuuyZk8W3TbLJZ3u0UnoPDhUbo6CEMgVp49z25JcAH2Qv/SZXKbHLOs
 qste/Zgv2agMyvXtYV7WAXwxyzaBepA8FsMyZn5+VYfgWk+drpoE5mvvp
 QDCAN92dZX3nlousV5uPNO5QXNADNl3cFpXIRKgaluN3uqMw6wZV74B1H
 530rhIfvM3T4Qdm85fxO6zrWzbxXmlcFkGnEmQj8t0zYCIhMX9Nyy4bZh
 VDxEH7vPrrGAa+ph4n0X1MjIuQciZ/U9XNCnE1Futiwz8Uf7h5C1qKKtu
 STwzqnTSbDnTuddAYGFEW6gXVZ1UQ1Wm8+XCNvKrbddyrnS3l3tdXUQBv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223067592"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="223067592"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 23:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="526532002"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2022 23:40:29 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n50uK-000GNa-Of; Wed, 05 Jan 2022 07:40:28 +0000
Date: Wed, 5 Jan 2022 15:40:17 +0800
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
Message-ID: <202201051502.yOxThsL0-lkp@intel.com>
References: <20211230090449.11808-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230090449.11808-3-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_234033_148943_57FE72EE 
X-CRM114-Status: GOOD (  12.05  )
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
b3ItbmV4dApjb25maWc6IG5pb3MyLXJhbmRjb25maWctcjAxMy0yMDIyMDEwNSAoaHR0cHM6Ly9k
b3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjIwMTA1LzIwMjIwMTA1MTUwMi55T3hU
aHNMMC1sa3BAaW50ZWwuY29tL2NvbmZpZykKY29tcGlsZXI6IG5pb3MyLWxpbnV4LWdjYyAoR0ND
KSAxMS4yLjAKcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKToKICAgICAgICB3Z2V0IGh0
dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3Ni
aW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzCiAgICAgICAgY2htb2QgK3ggfi9iaW4v
bWFrZS5jcm9zcwogICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29t
bWl0LzUyZjZiZTQ3MTJkMDRiOTI3Y2QzNTZkZDk1OTQwYmQ3NmYxZjViOTcKICAgICAgICBnaXQg
cmVtb3RlIGFkZCBsaW51eC1yZXZpZXcgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgK
ICAgICAgICBnaXQgZmV0Y2ggLS1uby10YWdzIGxpbnV4LXJldmlldyBSYWZhLU1pLWVja2kvbXRk
LWNvcmUtY2FsbC1kZXZtX29mX3BsYXRmb3JtX3BvcHVsYXRlLWZvci1NVEQtZGV2aWNlcy8yMDIx
MTIzMC0xNzA1MzEKICAgICAgICBnaXQgY2hlY2tvdXQgNTJmNmJlNDcxMmQwNGI5MjdjZDM1NmRk
OTU5NDBiZDc2ZjFmNWI5NwogICAgICAgICMgc2F2ZSB0aGUgY29uZmlnIGZpbGUgdG8gbGludXgg
YnVpbGQgdHJlZQogICAgICAgIG1rZGlyIGJ1aWxkX2RpcgogICAgICAgIENPTVBJTEVSX0lOU1RB
TExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy0xMS4yLjAgbWFrZS5jcm9zcyBPPWJ1aWxk
X2RpciBBUkNIPW5pb3MyIFNIRUxMPS9iaW4vYmFzaAoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtp
bmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZQpSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CgpBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhl
ZCBieSA+Pik6CgogICBuaW9zMi1saW51eC1sZDogZHJpdmVycy9udm1lbS91LWJvb3QtZW52Lm86
IGluIGZ1bmN0aW9uIGB1X2Jvb3RfZW52X3JlYWQnOgogICB1LWJvb3QtZW52LmM6KC50ZXh0KzB4
MmMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtdGRfcmVhZCcKICAgdS1ib290LWVudi5jOigu
dGV4dCsweDJjKTogcmVsb2NhdGlvbiB0cnVuY2F0ZWQgdG8gZml0OiBSX05JT1MyX0NBTEwyNiBh
Z2FpbnN0IGBtdGRfcmVhZCcKICAgbmlvczItbGludXgtbGQ6IGRyaXZlcnMvbnZtZW0vdS1ib290
LWVudi5vOiBpbiBmdW5jdGlvbiBgdV9ib290X2Vudl9wYXJzZSc6CiAgIHUtYm9vdC1lbnYuYzoo
LnRleHQrMHgyZDQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtdGRfcmVhZCcKICAgdS1ib290
LWVudi5jOigudGV4dCsweDJkNCk6IHJlbG9jYXRpb24gdHJ1bmNhdGVkIHRvIGZpdDogUl9OSU9T
Ml9DQUxMMjYgYWdhaW5zdCBgbXRkX3JlYWQnCj4+IG5pb3MyLWxpbnV4LWxkOiB1LWJvb3QtZW52
LmM6KC50ZXh0KzB4MzE0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbXRkX3JlYWQnCiAgIHUt
Ym9vdC1lbnYuYzooLnRleHQrMHgzMTQpOiByZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJf
TklPUzJfQ0FMTDI2IGFnYWluc3QgYG10ZF9yZWFkJwogICBuaW9zMi1saW51eC1sZDogZHJpdmVy
cy9udm1lbS91LWJvb3QtZW52Lm86IGluIGZ1bmN0aW9uIGB1X2Jvb3RfZW52X3Byb2JlJzoKICAg
dS1ib290LWVudi5jOigudGV4dCsweDRlYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGdldF9t
dGRfZGV2aWNlX25tJwogICB1LWJvb3QtZW52LmM6KC50ZXh0KzB4NGVjKTogcmVsb2NhdGlvbiB0
cnVuY2F0ZWQgdG8gZml0OiBSX05JT1MyX0NBTEwyNiBhZ2FpbnN0IGBnZXRfbXRkX2RldmljZV9u
bScKCi0tLQowLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5v
cmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
