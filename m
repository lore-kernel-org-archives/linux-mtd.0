Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1790C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 06:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBDYPPoO0+ApfFhHBsO/Yv+89Jr9ftGXYPM10nyQyug=; b=n2G7HTeftfZWEfdc5h8QHlCSQw
	R6Gz1J5f7NKs58z7DzyhrRoHRdCCbvCTf/nhY4m6Hg1CBvDkPwxjXmAAJF3BkoS3Vpu8varSo2bR9
	IsAwyMkg3wOPY1UqsTFmhm+e3hheaQcFE4SmgbeEq9GkXv4pBBk7yRYERr3vRjDRD4BMyGGF6R1P2
	bwmlKbF4PmikPTp8zIwF6eyQxxkYeSutaF+vsVHqMxOzUZg/jKG4o8YFlBa/ywei7qnMWeDMcMEVo
	Dxn48bpiWtntSHsIBuCcLDmtrjh4+l+N5S5eLq/zQxJIL0+50RrOShtphY67tZUEVtlxs32cKQ8Hu
	lweCj8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0c2D-0034u0-0O;
	Wed, 08 Nov 2023 06:27:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0c29-0034rc-1I
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 06:27:27 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SQFPy72S5zPp7c;
	Wed,  8 Nov 2023 14:23:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 8 Nov 2023 14:16:36 +0800
Subject: Re: [PATCH] ubifs: describe function parameters
To: Sascha Hauer <s.hauer@pengutronix.de>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, kernel
 test robot <lkp@intel.com>
References: <20231108060506.2976328-1-s.hauer@pengutronix.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ddaee23b-8e7e-eec0-9db1-7aa67bd845bd@huawei.com>
Date: Wed, 8 Nov 2023 14:16:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231108060506.2976328-1-s.hauer@pengutronix.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_222725_638809_6765C317 
X-CRM114-Status: UNSURE (   8.51  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMy8xMS84IDE0OjA1LCBTYXNjaGEgSGF1ZXIg0LS1wDoKPiBXaXRoIDE2YTI2YjIwZDJh
ZmQgKCJ1YmlmczogYXV0aGVudGljYXRpb246IEFkZCBoYXNoZXMgdG8gaW5kZXggbm9kZXMiKQo+
IGluc2VydF9ub2RlKCkgYW5kIGluc2VydF9kZW50KCkgZ290IGEgbmV3IGZ1bmN0aW9uIHBhcmFt
ZXRlciAnaGFzaCcuIEFkZAo+IGEgZGVzY3JpcHRpb24gZm9yIHRoaXMgbmV3IHBhcmFtZXRlci4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4K
PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2Vz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMxMTA1MTYxOC5EN1lV
RTFSci1sa3BAaW50ZWwuY29tLwo+IC0tLQo+ICAgZnMvdWJpZnMvcmVwbGF5LmMgfCAyICsrCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTogWmhpaGFvIENo
ZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
