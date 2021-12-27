Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DA3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2904xGClQRiwmi3fqFehdDT5Cn98U5FVQQbNmTzdX4g=; b=FYa9TR2MWuzRsSOzM7QTIRtRBI
	N3EXqgW61m5jPfNnxLJJGfjz6l0hVrQhWStYCJonV86YgWigl7b0UPYytIP1H7/S6OQ6SZoI1wY3h
	xnSuwEO8idgoP/1aI4p8oTeiVaxRXv1oppmAQTe6yqWCha3w46o3WMH93CUk3e2DGMX1BAVqjYPa9
	3bbv4Mt1098wDh3anUFDGv1apxDIaAoCjEdFs0voOGO2NJgeOefJvPAwQOpaT6PZ/hulZxD5SYuWM
	1jpptKFvClBX0RxNxSyGToFNVTZ1yFzHq8koJod4NN5psdXe1VRn/4iOH5VcObtg0ykidtqiGPBqF
	yYQJHc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1oyM-00Gg8J-5H; Mon, 27 Dec 2021 12:19:26 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1oyJ-00Gg7Q-2l
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 12:19:24 +0000
Received: from kwepemi100010.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JMxXG2CrPz91xj;
 Mon, 27 Dec 2021 20:18:22 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100010.china.huawei.com (7.221.188.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 20:19:16 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 20:19:16 +0800
Subject: Re: [PATCH v6 00/15] Some bugfixs for ubi/ubifs
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, mcoquelin stm32 <mcoquelin.stm32@gmail.com>, "kirill
 shutemov" <kirill.shutemov@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <1020444725.206730.1640599987424.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <adc72750-7aca-bb6e-6921-fcaad89485bd@huawei.com>
Date: Mon, 27 Dec 2021 20:19:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1020444725.206730.1640599987424.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_041923_306160_551875C7 
X-CRM114-Status: UNSURE (   4.52  )
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

5ZyoIDIwMjEvMTIvMjcgMTg6MTMsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cgo+IFRoYW5r
cyBhIGxvdCBmb3IgYWxsIHRoaXMgZml4ZXMhIEkgd2lsbCBzdGFydCByZXZpZXdpbmcvcGlja2lu
ZyB0aGVtIGFuCj4gYXMgc29vbiB0aGUgc2VyaWVzIGlzIHN0YWJsZS4KPiBTbyBwbGVhc2UgZG9u
J3QgcmVzZW5kIGV2ZXJ5dGhpbmcgaWYgeW91IG9ubHkgYWRkIGEgbmV3IHBhdGNoLgpPSy4gTmV3
IHBhdGNoZXMoSWYgSSBmaW5kIG5ldyBidWdzKSB3aWxsIGJlIHNlbnQgaW5kZXBlbnRseS4gdjYg
c2VyaWVzIAppcyBjbG9zZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
