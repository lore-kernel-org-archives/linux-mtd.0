Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F044AC48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 12:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4EB9613EB
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 12:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4EB9613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFWHI6sLaOHSAqiDoHtqq0SrE/9LjhkQkrs1Z/wl4rg=; b=QoBZyl41Nay0n9+gTErocXq4fr
	OQIimQc/+c/qs1+JcYGf9ki87o99BesBn9/tNJyoaSJL/Ctb13k/uRC+ReYM/85UgUmKH3ksmPPX8
	Jjgp4Y3Akz8W+lHEmbctN4od5Exzro0k+Sivbc+r493nG7R9B7TQBcjX76nlYQNJebpay59f6m1Mf
	M6Thx/MGj1QviTkei1QOmZqmKJrnsEaztCHxTLk+4uIUhHfrf03t+950Bu2AzGCqyjArebsruXt05
	RedlLn3c1bb33LO+NnZLpFyENGbMWlsOesjNt/OYAXHqkv2pwRAKUn6hzJjZ5xOQ5R8vRX2Qnn4sl
	m6jCIITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDiW-00E0dq-BA; Fri, 18 Jun 2021 12:35:24 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDiS-00E0cK-N0
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 12:35:22 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G5ytV5r8dz1BNvZ;
 Fri, 18 Jun 2021 20:30:10 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 20:35:14 +0800
Received: from [10.174.178.208] (10.174.178.208) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 18 Jun 2021 20:35:14 +0800
Subject: Re: [PATCH -next] mtd: rawnand: arasan: Fix missing
 clk_disable_unprepare() on error in anfc_probe()
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <nagasure@xilinx.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1623816404-66213-1-git-send-email-zou_wei@huawei.com>
 <20210618092752.5f117365@xps13>
From: Samuel Zou <zou_wei@huawei.com>
Message-ID: <be3b786d-dc6e-90b5-9bc6-05d078b21c40@huawei.com>
Date: Fri, 18 Jun 2021 20:35:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210618092752.5f117365@xps13>
Content-Language: en-US
X-Originating-IP: [10.174.178.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_053520_998070_BA86558B 
X-CRM114-Status: GOOD (  15.16  )
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

CkhpIE1pcXVlbCwKClRoYW5rcyBmb3IgeW91ciByZXZpZXcsIGFuZCBpdCdzIE9LIGluY2x1ZGUg
dGhlIGdvdG8gY2hhbmdlLgoKT24gMjAyMS82LzE4IDE1OjI3LCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+IEhpIFpvdSwKPiAKPiBab3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+IHdyb3RlIG9uIFdl
ZCwgMTYgSnVuIDIwMjEgMTI6MDY6NDQgKzA4MDA6Cj4gCj4+IEZpeCB0aGUgbWlzc2luZyBjbGtf
ZGlzYWJsZV91bnByZXBhcmUoKSBiZWZvcmUgcmV0dXJuCj4+IGZyb20gYW5mY19wcm9iZSgpIGlu
IHRoZSBlcnJvciBoYW5kbGluZyBjYXNlLgo+Pgo+PiBGaXhlczogNjE2MjJmNjc5MWExICgibXRk
OiByYXduYW5kOiBhcmFzYW46IFVzZSB0aGUgcmlnaHQgRE1BIG1hc2siKQo+PiBSZXBvcnRlZC1i
eTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFpvdSBX
ZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4KPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaCwgNjE2MjJm
Njc5MWExIGJlaW5nIHByb2JsZW1hdGljIGJlY2F1c2Ugb2YgdGhlCj4gbWFzayBub3QgYmVpbmcg
Y29ycmVjdGx5IGRlY2xhcmVkIEkgcHJlZmVyIHRvIGZpeCB0aGlzIHBhdGNoIGlubGluZSBhbmQK
PiBpZiB5b3UgZG9uJ3QgbWluZCBJJ2xsIGluY2x1ZGUgdGhlIGdvdG8gY2hhbmdlIGFzIHdlbGwu
Cj4gCj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xs
ZXIuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1uYW5k
LWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xs
ZXIuYwo+PiBpbmRleCA4MzE3ZDk3Li45Y2JjYzY5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCj4+IEBAIC0xNDUyLDcgKzE0NTIsNyBA
QCBzdGF0aWMgaW50IGFuZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4g
ICAKPj4gICAJcmV0ID0gZG1hX3NldF9tYXNrKCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSyg2NCkp
Owo+PiAgIAlpZiAocmV0KQo+PiAtCQlyZXR1cm4gcmV0Owo+PiArCQlnb3RvIGRpc2FibGVfYnVz
X2NsazsKPj4gICAKPj4gICAJcmV0ID0gYW5mY19wYXJzZV9jcyhuZmMpOwo+PiAgIAlpZiAocmV0
KQo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
