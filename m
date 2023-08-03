Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB00C001DF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Aug 2023 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1UninjZjgAVAlbXaKRRees0B637O7vG3mdIVcybaR0=; b=LO1thmmVdBga4X
	+HYRlfuWCU33yb5BII4oQRBLLhuIHWrlGTdLPEkNNpF8HNGc6HZIQhgyodpDCdAinjwUorpyRYtlZ
	ut+v7JWOcpqaeb5k0W1dB/n6l9QQ6HkgqSWzjBQOao6E4C6mcjZE6oAmms4GygZdEtvipeEyOZowP
	a53jCmWBvGGDKRsI3Rzib5Yf8WXhinc1h3UPEtXzeCuwWJKPx58s74asru+syeQGou17riX8uUhCG
	RWDTfcwqdbX6bWVvPb3HaLpfkVJX3BxzmE1C/3t9+3DsSGp9Dm3T0/fcTylemPA040B4od8xlKB09
	27VmIs5fTgLEJlRkDpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX6F-008DGf-1u;
	Thu, 03 Aug 2023 12:06:39 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX6C-008D8T-1F
	for linux-mtd@lists.infradead.org;
	Thu, 03 Aug 2023 12:06:38 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RGncs4vQKz4f41VF
	for <linux-mtd@lists.infradead.org>; Thu,  3 Aug 2023 20:06:21 +0800 (CST)
Received: from [10.174.176.83] (unknown [10.174.176.83])
	by APP1 (Coremail) with SMTP id cCh0CgCnAh09mMtk5HSqOg--.25574S2;
	Thu, 03 Aug 2023 20:06:22 +0800 (CST)
Message-ID: <d535f8ee-47b1-0e3e-d611-c26769f3764f@huaweicloud.com>
Date: Thu, 3 Aug 2023 20:06:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mtd: fix use-after-free in mtd release
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Winkler, Tomas" <tomas.winkler@intel.com>,
 "Lubart, Vitaly" <vitaly.lubart@intel.com>
References: <20230727145758.3880967-1-alexander.usyskin@intel.com>
 <ZMKJRNDoQV8p0DH4@smile.fi.intel.com> <20230727172013.7c85c05d@xps-13>
 <ZMKUJbl7kFOfgKGg@smile.fi.intel.com> <20230727183611.37d01f51@xps-13>
 <CY5PR11MB63660B9CE604C0CFF2E088DAED04A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <d9d56389-7409-79ae-6854-00ab8de7da4d@huawei.com>
 <20230802144426.2411bba2@xps-13>
From: huaweicloud <zhangxiaoxu@huaweicloud.com>
In-Reply-To: <20230802144426.2411bba2@xps-13>
X-CM-TRANSID: cCh0CgCnAh09mMtk5HSqOg--.25574S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5E7kC6x804xWl14x267AKxVW8JVW5JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7
	xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr
	0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
	r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7jXdUUUUU
X-CM-SenderInfo: x2kd0wp0ld053x6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_050636_662899_61F24EAE 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy84LzIgMjA6NDQsIE1pcXVlbCBSYXluYWwg5YaZ6YGTOgo+IEhpIHpoYW5nLAo+
IAo+IHpoYW5neGlhb3h1NUBodWF3ZWkuY29tIHdyb3RlIG9uIE1vbiwgMzEgSnVsIDIwMjMgMDk6
MzU6NDIgKzA4MDA6Cj4gCj4+IOWcqCAyMDIzLzcvMzAgMTk6MTAsIFVzeXNraW4sIEFsZXhhbmRl
ciDlhpnpgZM6Cj4+PiBNaXF1ZWwsIGlzIHRoaXMgcGF0Y2ggaGVscHMgd2l0aCB5b3VyIG9yaWdp
bmFsIHByb2JsZW0gb2YgZGV2aWNlcyBub3QgZnJlZWQ/Cj4+Pgo+Pj4gWmhhbmcsIGlzIHRoaXMg
cGF0Y2ggaGVscHMgd2l0aCB5b3VyIHByb2JsZW0gd2l0aCBLQXNhbj8KPj4gQWZ0ZXIgdGhpcyBw
YXRjaCBhcHBsaWVkLCB0aGUgcHJvYmxlbSBjYW4gc3RpbGwgYmUgcmVwcm9kdWNlZC4KPiAKPiBE
aWQgeW91IHRlc3QgbXkgcGF0Y2ggYXMgd2VsbD8gRG9lcyBLYXNhbiBzdGlsbCBjb21wbGFpbiB3
aXRoIGl0PwpBZnRlciB0aGlzIHBhdGNoIGFwcGxpZWQsIHRoZSBwcm9ibGVtIGNhbiBzdGlsbCBi
ZSByZXByb2R1Y2VkLgoKCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
