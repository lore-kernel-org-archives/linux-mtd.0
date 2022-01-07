Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEADC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 04:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uzy7UIasVnlD8p2o3h7STIhlmbazO882qZNDpSlgjFM=; b=lhMSECzFAcgxCJ
	D+/S8lSKsfNWx9elx3ASQyGF4SU3YViAYDhEba+SscDyLwP2itDfGN2H1YNIdIXGNcwWip7ck/t6t
	1fVhC9R5jiB1q6cQYoqe6DYqFHh78f6YspzSKOZ3iwGAjA2AUKd1Va5EpjKuganf4HoVq2O8RAoBe
	JstRQSLs0cgy64wayzYVV3/C99KyGiCcQUlyqU6QHxu5PhDrZUitnaIGNnXxapUxrcNGRte2GO83V
	JOomRp6DT52+1j5tO17bbalUEac7JONub1UM4wQfcs5bAl9msRUl0E2k69GOUXwXI4xxZ6xeomCMB
	FRBekZZsilP6O9GORtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5gYg-002F6f-MW; Fri, 07 Jan 2022 04:08:54 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5gYU-002F2w-2r; Fri, 07 Jan 2022 04:08:43 +0000
Received: from [10.28.39.73] (10.28.39.73) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 7 Jan 2022
 12:08:40 +0800
Message-ID: <3d4eff52-431d-438d-bbe6-3267d87e2d37@amlogic.com>
Date: Fri, 7 Jan 2022 12:08:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] mtd: rawnand: meson: fix the clock after discarding
 sd_emmc_c_clkc
Content-Language: en-US
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20220106032504.23310-1-liang.yang@amlogic.com>
 <20220106090832.42225c49@xps13>
 <9c7b1d77-cff1-b40c-6d02-f67ca8b9b683@amlogic.com>
In-Reply-To: <9c7b1d77-cff1-b40c-6d02-f67ca8b9b683@amlogic.com>
X-Originating-IP: [10.28.39.73]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_200842_156175_5BF7A62E 
X-CRM114-Status: UNSURE (   2.65  )
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

SGkgTWlxdWVsLAoKcmVmaW5lIHRoZSBjbG9jayBmcmFtZXdvcmsgZGlhZ3JhbS4KCk9uIDIwMjIv
MS83IDEwOjQwLCBMaWFuZyBZYW5nIHdyb3RlOgo+PiBXaGF0IGlzIG5hbmRfZGl2aWRlcj8KPiBp
IHNpbXBsaWZ5IG91ciBjbG9jayBmcmFtZXdvcmsgYmVsb3csIHNvIG5hbmQgZGl2aWRlciBpcyAK
PiBTRF9FTU1DX0NMT0NLWzU6MF0gaGVyZS4KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtLS0tLcKgwqDCoMKgwqDCoMKgwqDCoCAtLS0tLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLS0t
LS0KPiAgwqDCoMKgwqDCoMKgIHRoZSBvdGhlci0tLS0tLXzCoMKgwqAgXMKgwqDCoMKgwqDCoMKg
IHzCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKgwqDCoCB8Cj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IG11eMKgwqDCoCB8IC0tLS0twqAgfMKgIE7CoCB8IC0tLS0t
LS0tLS18IE5GQy98Cj4gIMKgwqDCoMKgwqDCoCBGQ0xLX0RJVjItLS0tLS18wqDCoMKgwqAgfMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwgRU1NQ3wKPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtLS0tLS/CoMKgwqDCoMKgwqDCoMKgIC0tLS0twqDCoMKgwqDC
oMKgwqDCoCAtLS0tLQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNEX0VNTUNfQ0xPQ0tbNzo2
XSBTRF9FTU1DX0NMT0NLWzU6MF0KCgogICAgICAgICAgICAgICAgICAgICAgICAgIC0tLS0tICAg
ICAgICAgICAtLS0tLS0tICAgICAgICAgLS0tLS0tLS0KICAgICAgICAgICAgICAgdGhlIG90aGVy
LXwgICAgICBcICAgICAgICB8ICAgICAgIHwgICAgICAgfCAgICAgICAgfAogICAgICAgICAgICAg
ICAgICAgICAgICAgfCBtdXggIHwtLS0tLS0tLXwgIE4gICAgfC0tLS0tLS18ICAgTkZDLyB8CiAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgfCAgICAgICAgfCAgICAgICB8ICAgICAgIHwg
ICBFTU1DIHwKICAgICAgICAgICAgICAgZmNsa19kaXYyLXwgICAgICAvICAgICAgICB8ICAgICAg
IHwgICAgICAgfCAgICAgICAgfAogICAgICAgICAgICAgICAgICAgICAgICAgIC0tLS0tICAgICAg
ICAgICAtLS0tLS0tICAgICAgICAgLS0tLS0tLS0KICAgICAgICAgICAgICAgICAgIFNEX0VNTUNf
Q0xPQ0tbNzo2XSAgIFNEX0VNTUNfQ0xPQ0tbNTowXQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
