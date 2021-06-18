Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B3FC48BE8
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 08:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BAC5613B9
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 08:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BAC5613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDO5OQaYQ7RkJ5LtjQ+N67CFpe92xgZvIMeWpi8l6Uw=; b=zmMqTjbtAEHgypg2yUH2+tJyE4
	/TUXyz0n2CinUlsxXtlO8sGUT09Dtx15rc7oryOE56RPisb3NT4I1WWljf7MkbBRcEw6h0PiyoTvf
	zdcWDzAyZdCDz0glnB7r2m7RQfs3mD/lomN8UFTW048Dz3lO4eOaLrhxWCwrG1Ema2CDsekeZGN4B
	FItHH8G3Bi0m+rHtP0JS8sw0Y/Z6sQmedLWmMUC3bPG4OdI0nj71glhHMANjjcHvPvpmtAx22FFjQ
	PjU5RRusawJFaBChSrCxGO0gEX2Sjiu+rg2BtfMLiLX/etG7+xMg6Kh7rAaRQLPBdiuWzEvbE1MVE
	MnIKP6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luAHO-00DNtN-VW; Fri, 18 Jun 2021 08:55:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luAHM-00DNrl-1H
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 08:55:09 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5t2b4Sf1z713v;
 Fri, 18 Jun 2021 16:51:51 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 16:55:02 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 18 Jun 2021 16:55:02 +0800
Subject: Re: [PATCH v2] mtd: mtd_blkdevs: Initialize
 rq.limits.discard_granularity
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, Christoph Hellwig
 <hch@lst.de>
References: <20210615093905.3473709-1-chengzhihao1@huawei.com>
 <20210618095207.0bec4fde@xps13>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <258a2366-0042-dc2b-0589-fe3a99851ded@huawei.com>
Date: Fri, 18 Jun 2021 16:55:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210618095207.0bec4fde@xps13>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_015508_274575_BCB5A271 
X-CRM114-Status: GOOD (  10.75  )
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

5ZyoIDIwMjEvNi8xOCAxNTo1MiwgTWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gSGkgWmhpaGFvLAo+
IAo+IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlIG9uIFR1ZSwg
MTUgSnVuIDIwMjEKPiAxNzozOTowNSArMDgwMDoKPiAKPj4gU2luY2UgY29tbWl0IGIzNWZkNzQy
MmMyZjgoImJsb2NrOiBjaGVjayBxdWV1ZSdzIGxpbWl0cy5kaXNjYXJkX2dyYW51bGFyaXR5Cj4+
IGluIF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQoKSIpIGNoZWNrcyBycS5saW1pdHMuZGlzY2FyZF9n
cmFudWxhcml0eSBpbgo+PiBfX2Jsa2Rldl9pc3N1ZV9kaXNjYXJkKCksIHdlIG1heSBnZXQgZm9s
bG93aW5nIHdhcm5pbmdzIG9uIGZvcm1hdHRlZCBmdGw6Cj4+Cj4+ICAgIFdBUk5JTkc6IENQVTog
MiBQSUQ6IDczMTMgYXQgYmxvY2svYmxrLWxpYi5jOjUxCj4+ICAgIF9fYmxrZGV2X2lzc3VlX2Rp
c2NhcmQrMHgyYTcvMHgzOTAKPj4KPj4gUmVwcm9kdWNlcjoKPj4gICAgMS4gZnRsX2Zvcm1hdCAv
ZGV2L210ZDAKPj4gICAgMi4gbW9kcHJvYmUgZnRsCj4+ICAgIDMuIG1rZnMudmZhdCAvZGV2L2Z0
bGEKPj4gICAgNC4gbW91bnQgLW9kaXNjYXJkIC9kZXYvZnRsYSB0ZW1wCj4+ICAgIDUuIGRkIGlm
PS9kZXYvemVybyBvZj10ZW1wL3RzdCBicz0xTSBjb3VudD0xMCBvZmxhZz1kaXJlY3QKPj4gICAg
Ni4gZGQgaWY9L2Rldi96ZXJvIG9mPXRlbXAvdHN0IGJzPTFNIGNvdW50PTEwIG9mbGFnPWRpcmVj
dAo+Pgo+PiBGaXggaXQgYnkgaW5pdGlhbGl6aW5nIHJxLmxpbWl0cy5kaXNjYXJkX2dyYW51bGFy
aXR5IGlmIGRldmljZSBzdXBwb3J0cwo+PiBkaXNjYXJkIG9wZXJhdGlvbi4KPiAKPiBDYW4geW91
IHBsZWFzZSB2ZXJpZnkgdGhhdCB0aGlzIGlzIHN0aWxsIG5lZWRlZCBhZnRlciBDaHJpc3RvcGgn
cwo+IGFkZGl0aW9uYWwgZml4Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMTA2MDIwNjUzNDUuMzU1Mjc0LTEwLWhjaEBsc3QuZGUvCj4g
CkhpLCBNaXF1ZWwsCkkgY2FuIHN0aWxsIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBhZnRlciBbMV0g
YXBwbGllZC4KSSBsb29rIHRocm91Z2ggdGhpcyBzZXJpZXMgcGF0Y2hlcyBhbmQgSSBkaWRuJ3Qg
ZmluZCBvdXQgCidycS5saW1pdHMuZGlzY2FyZF9ncmFudWxhcml0eScgaGFzIGJlZW4gaW5pdGlh
bGl6ZWQgc29tZXdoZXJlLiBUaGUgCnBhdGNoc2V0IGlzIGFtaW5nIGF0IHJlY29uc3RydWN0aW5n
IHRvIGF2b2lkIGJvaWxlcnBsYXRlIGNvZGUgaW4gZHJpdmVycz8KU28gJ3JxLmxpbWl0cy5kaXNj
YXJkX2dyYW51bGFyaXR5JyBzdGlsbCBuZWVkIHRvIGJlIGluaXRpYWxpemVkIGluIAptdGRibG9j
ayBkcml2ZXIuCgpbMV0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4t
ZGV2ZWwvcGF0Y2gvMjAyMTA2MDIwNjUzNDUuMzU1Mjc0LTEwLWhjaEBsc3QuZGUvCgo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
