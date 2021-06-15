Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57866C48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 18:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8140610A1
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 18:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8140610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iz180Lh+WtBXo5AySOT7xU3AO+npMpI8vNsLpppwFdk=; b=HZg61g0oYStObYaErLyuYyu17c
	ZDYkj/3d1k+g3KCdOzDeZnGoRBiUbfSp2G5W/A78GhfHt7RPMvlPV8qZ2c/ptPxT9M5k68kZ9RKRI
	p2mMenL0J/m3fjex8IGxfJ6+Pi4w2Dbqk9tMSaI4LQm/SLcWAUJxdfDFaSWqtZxlyX03hN/S5xi5Y
	h6cFdFeZch8cnzYD5u3bb5md6El/3kDkg8H6KOhiOITLKJ2l689oCnpqfLK0/8zDlVEo5oh5qY11y
	bwWg0/xCGglqv6eon05mcFKG55orP1zoeLkdZ9V+U/AZAP2b2cT+tscKDv+3Z1j9M1IwwZwT+KM/x
	EN24rFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltDTK-00209G-2t; Tue, 15 Jun 2021 18:07:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9IO-000DwX-UO
 for linux-mtd@bombadil.infradead.org; Tue, 15 Jun 2021 13:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8c2t7H3ry71d7xmZQlvVSaIB3tgUpNjjIcgIdWVEVtw=; b=GlD6c2X/ko0pnnf7RrggQrlHMU
 hBM6p3XcDQwDsm59mtlhMOzYgIvrkN9YtnQBb+Dbln1GxBU2t0Q4bNy8pWDpt6/M10bllFvjgU8Gv
 3hK3YifLfda3g2jlyGBooIngDdvAcB6OYbqST92NrVrId5FhFlZqzEhvDrHSLNlUbJnLlkg6p599w
 gNdOqEA6BpL9J6sJZeu4or5zf/sL6EjYLBwphuJOCRSDEIhi5hQPUD1SI3pA4/E/8VcoYTcAbuDgb
 w/Rns36/tjdkUiyTfnlFAcjO6VILdpRP+ra8OFaQ+npCo2gRZkZBSyTdXRonFX7JonHvOfVhZUziA
 BxE4l8MA==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt53o-007Xs0-TU
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 09:08:49 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G42RX0qWMz1BMYF;
 Tue, 15 Jun 2021 17:03:36 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 17:08:35 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 15 Jun 2021 17:08:35 +0800
Subject: Re: [PATCH 0/6] Fix deadlock in ftl formating on mtd
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
 <20210613171208.64395d32@xps13>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <13b42e51-d176-ad54-e3a1-353284bb2d2e@huawei.com>
Date: Tue, 15 Jun 2021 17:08:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210613171208.64395d32@xps13>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_100848_137702_60B6868D 
X-CRM114-Status: UNSURE (   9.36  )
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

5ZyoIDIwMjEvNi8xMyAyMzoxMiwgTWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gSGkgWmhpaGFvLAo+
IAo+IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlIG9uIFN1biwg
MTMgSnVuIDIwMjEKPiAxOTozMDoyOSArMDgwMDoKPiAKCj4gCj4gSSB1bmRlcnN0YW5kIHRoYXQg
c29tZSBmaXhlcyBuZWVkIHRvIHJldmVydCBhIGNvdXBsZSBvZiBwYXRjaGVzLCBidXQKPiBpc24n
dCByZXZlcnRpbmcgNiBjb21taXRzIGZyb20gdGhlIHYyLjYuMzIga2VybmVsIGEgYml0IG9kZCBm
b3IgdGhhdD8KPiBBdCBsZWFzdCwgY2FuIHlvdSBqdXN0aWZ5IHRoaXMgY2hvaWNlPyBBcmUgYWxs
IHRoZXNlIGNvbW1pdHMgdXNlbGVzcwo+IGFuZCBidWdneT8KCkhpIE1pcXVlbCwKClRoaXMgc2Vy
aWVzIG9mIHJldmVydCBwYXRjaGVzIGNhbWUgZnJvbSBoaXN0b3J5IGNvbW1pdHMgd2hpY2ggcmVs
YXRlZCAKd2l0aCAibXRkOiBhbGxvdyB0byB1bmxvYWQgdGhlIG10ZHRyYW5zIG1vZHVsZSBpZiBp
dHMgYmxvY2sgZGV2aWNlcyAKYXJlbid0IG9wZW4iLiBJIGFkbWluIGl0J3MgYSB3ZWlyZCBtZXRo
b2QgYW5kIGxldCdzIGZvcmdldCBpdC4KQWZ0ZXIgc29tZSBsb2NhbCB0ZXN0cywgSSB0aGluayB3
ZSdkIGJldHRlciByZXNlcnZlICJtdGQ6IGFsbG93IHRvIAp1bmxvYWQgdGhlIG10ZHRyYW5zIG1v
ZHVsZSBpZiBpdHMgYmxvY2sgZGV2aWNlcyBhcmVuJ3Qgb3BlbiIgdG8gc3VwcG9ydCAKcmVtb3Zp
bmcgbXRkYmxvY2sgbW9kdWxlIGlmIG5vIG9uZSB0YWtlcyBpdC4gQnV0IHdlIG1heSBtb3ZlIGdl
dHxwdXQgCm10ZF9kZXZpY2UgaW50byBhZGR8ZGVsX210ZF9ibGt0cmFucyB0byBzb2x2ZSBkZWFk
bG9jayBwcm9ibGVtLCBtYXliZSB3ZSAKZG9uJ3QgaGF2ZSB0byBnZXRfbXRkX2RldmljZSBlYWNo
IHRpbWUgb3BlbiBtdGQgYmxvY2sgZGV2aWNlIGluIApibGt0cmFuc19vcGVuIGlmIHdlIGhhdmUg
Y2FsbGVkIGdldF9tdGRfZGV2aWNlKCkgaW4gCmFkZF9tdGRfYmxrdHJhbnNfZGV2KCkuIFNlZSB2
MiAibXRkOiBtdGRfYmxrZGV2czogR2V0fFB1dCBtdGRfZGV2aWNlIGluIAphZGR8ZGVsX210ZF9i
bGt0cmFucyIuCgo+Pgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gLgo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
