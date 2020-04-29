Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92A0C83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79973206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sd5RZFE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79973206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sijmGodoo/JkwRHBDw0R3jeWyniy2aNwVY++WJDB1WI=; b=sd5RZFE2GupCa/
	dvF7/cMy5JMqtbY108d4d3VXfpHWNIDm5b5j5zPnM+QMj2V/w0uf1M0Jt/7Y8HlJnilJeZmfgsSXX
	gq7aoSDlPP5HEfqhg8uvEmUVlCi8KIH937GqAdzCZFhpQ8apCcq1mOF7yldNpA3PyoFUrWE2cGr62
	8JW43YmtcLPBZoM8Vfb50oBeGMjtDes6ZoOCyy9TLYWbefXQl1KCDApeo1SsfsWHMEVG2lq35+ULo
	mk6mrZxOVdURjzKWEL2PYk29oQDYkGhgghpUtGr2VFFLLZtJ1YIJak72rBFhKj8NghMHZ4aEv8L/j
	y+aoNQR5IzE1SrdbWsTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jToeZ-0007bC-3H; Wed, 29 Apr 2020 15:29:39 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jToeW-0007aL-CG
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 15:29:37 +0000
IronPort-SDR: 2oA3GVXHLA3b3E0kA2R4gWsNL9YmuRvJABLl8r23J08ViEPo/ySd7+Gbdu8nwncLfdCMROukwz
 UUw2elQh9TzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 08:29:35 -0700
IronPort-SDR: wHf8dhSjYq1ovl6/KJN6kiRcTLDiQ66kPnQ15/b7VAWrefT12q7R2zmrmTVy6hxv4qabvPobuF
 ghmfu4hGXVAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="432595853"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 29 Apr 2020 08:29:35 -0700
Received: from [10.255.166.42] (vramuthx-mobl1.gar.corp.intel.com
 [10.255.166.42])
 by linux.intel.com (Postfix) with ESMTP id B2A905802C8;
 Wed, 29 Apr 2020 08:29:30 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, qi-ming.wu@intel.com
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
 <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
 <20200429164832.6800fc70@collabora.com>
 <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
Message-ID: <f5961645-fe35-7ef5-05ff-c1529c5699a1@linux.intel.com>
Date: Wed, 29 Apr 2020 23:29:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_082936_435731_68F24262 
X-CRM114-Status: GOOD (  10.26  )
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
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpPbiAyOS80LzIwMjAgMTE6MTggcG0sIFJhbXV0aGV2YXIsIFZhZGl2ZWwgTXVy
dWdhblggd3JvdGU6Cj4gK8KgwqDCoCB3cml0ZWwobG93ZXJfMzJfYml0cyhlYnVfaG9zdC0+Y3Nb
ZWJ1X2hvc3QtPmNzX251bV0ubmFuZF9wYSkgfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBFQlVf
QUREUl9TRUxfUkVHRU4gfCBFQlVfQUREUl9NQVNLLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
YnVfaG9zdC0+ZWJ1ICsgRUJVX0FERFJfU0VMKHJlZykpOwo+ICsKPiArwqDCoMKgIHdyaXRlbChF
QlVfTUVNX0JBU0VfQ1NfMCB8IEVCVV9BRERSX01BU0sgfCBFQlVfQUREUl9TRUxfUkVHRU4sCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgIGVidV9ob3N0LT5lYnUgKyBFQlVfQUREUl9TRUwoMCkpOwoK
R29vZCBjYXRjaCEsIG9uZSB3aWxsIGJlIHJlbW92ZWQgLCBUaGFua3MgIQoKUmVnYXJkcwpWYWRp
dmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
