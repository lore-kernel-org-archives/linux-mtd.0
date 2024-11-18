Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08E2D10F57
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 05:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nbAQjlBk66kd4Um7inhtPkDRK6V6CN118g+INv3v9g=; b=C+KBH/9sKExr0Z3MXUITYk0wU6
	URKn4PpxnDMBjT2PwYaxqn69Hp0m6OJIHQJ/60/gUdxiJNqN+5khDFY2ynJP6NsIXYIYj9jyWJK5a
	8Z7IBzTD+CfMW1buMxmpeh9bMaSaYb8pk9g6Gtl5GFKTeZNUCAtdEq+bMX/7ap2x3Y8+L2Z+mPSab
	JmLMuvwKoXKxBs52jHFhhoZ6upP9shNB3xJ5wNwJN2fmOf7ZzLfogHfNP3WUixuc8auHSMIB1KLQa
	STtKKgcIHsqCWNBRfzpXZq80cfqudxrAZUnVl4CAbMs5b3hfEx0UELKxtcDIFxbSSPpLlILZ0b+pK
	mRGr7v6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuFs-00000008OJb-0pvi;
	Mon, 18 Nov 2024 05:24:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuFp-00000008OIa-35IQ
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 05:24:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XsGG353sgz92Gv;
	Mon, 18 Nov 2024 13:22:03 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0EDD41401E0;
	Mon, 18 Nov 2024 13:24:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Nov 2024 13:24:44 +0800
Subject: Re: [PATCH 2/2] jffs2: initialize inocache earlier
To: Fedor Pchelkin <pchelkin@ispras.ru>, Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, Wang Yong <wang.yong12@zte.com.cn>,
	Lu Zhongjun <lu.zhongjun@zte.com.cn>, Yang Tao <yang.tao172@zte.com.cn>, Al
 Viro <viro@zeniv.linux.org.uk>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
	<stable@vger.kernel.org>
References: <20241117184412.366672-1-pchelkin@ispras.ru>
 <20241117184412.366672-3-pchelkin@ispras.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b4865aaf-8253-b44e-55fe-d1fab1f5f092@huawei.com>
Date: Mon, 18 Nov 2024 13:24:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241117184412.366672-3-pchelkin@ispras.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_212454_119794_02AA2044 
X-CRM114-Status: GOOD (  15.07  )
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

1NogMjAyNC8xMS8xOCAyOjQ0LCBGZWRvciBQY2hlbGtpbiDQtLXAOgo+IEluc2lkZSBqZmZzMl9u
ZXdfaW5vZGUoKSB0aGVyZSBpcyBhIHNtYWxsIGdhcCB3aGVuIGpmZnMyX2luaXRfYWNsX3ByZSgp
IG9yCj4gamZmczJfZG9fbmV3X2lub2RlKCkgbWF5IGZhaWwgZS5nLiBkdWUgdG8gYSBtZW1vcnkg
YWxsb2NhdGlvbiBlcnJvciB3aGlsZQo+IHVuaW5pdCBpbm9jYWNoZSBmaWVsZCBpcyB0b3VjaGVk
IHVwb24gc3Vic2VxdWVudCBpbm9kZSBldmljdGlvbi4KPiAKPiBnZW5lcmFsIHByb3RlY3Rpb24g
ZmF1bHQsIHByb2JhYmx5IGZvciBub24tY2Fub25pY2FsIGFkZHJlc3MgMHhkZmZmZmMwMDAwMDAw
MDA1OiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgS0FTQU4gTk9QVEkKPiBLQVNBTjogbnVsbC1wdHIt
ZGVyZWYgaW4gcmFuZ2UgWzB4MDAwMDAwMDAwMDAwMDAyOC0weDAwMDAwMDAwMDAwMDAwMmZdCj4g
Q1BVOiAwIFBJRDogMTA1OTIgQ29tbTogc3l6LWV4ZWN1dG9yLjEgTm90IHRhaW50ZWQgNS4xMC4y
MDktc3l6a2FsbGVyICMwCj4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZY
ICsgUElJWCwgMTk5NiksIEJJT1MgMS4xMi4wLTEgMDQvMDEvMjAxNAo+IFJJUDogMDAxMDpqZmZz
Ml94YXR0cl9kZWxldGVfaW5vZGUrMHgzNS8weDEzMCBmcy9qZmZzMi94YXR0ci5jOjYwMgo+IENh
bGwgVHJhY2U6Cj4gICBqZmZzMl9kb19jbGVhcl9pbm9kZSsweDRjLzB4NTcwIGZzL2pmZnMyL3Jl
YWRpbm9kZS5jOjE0MTgKPiAgIGV2aWN0KzB4MjgxLzB4NmIwIGZzL2lub2RlLmM6NTc3Cj4gICBp
cHV0X2ZpbmFsIGZzL2lub2RlLmM6MTY5NyBbaW5saW5lXQo+ICAgaXB1dC5wYXJ0LjArMHg0ZGYv
MHg2ZDAgZnMvaW5vZGUuYzoxNzIzCj4gICBpcHV0KzB4NTgvMHg4MCBmcy9pbm9kZS5jOjE3MTMK
PiAgIGpmZnMyX25ld19pbm9kZSsweGIxMi8weGRiMCBmcy9qZmZzMi9mcy5jOjQ2OQo+ICAgamZm
czJfY3JlYXRlKzB4OTAvMHg0MDAgZnMvamZmczIvZGlyLmM6MTc3Cj4gICBsb29rdXBfb3Blbi5p
c3JhLjArMHhlYWQvMHgxMjYwIGZzL25hbWVpLmM6MzE2OQo+ICAgb3Blbl9sYXN0X2xvb2t1cHMg
ZnMvbmFtZWkuYzozMjM5IFtpbmxpbmVdCj4gICBwYXRoX29wZW5hdCsweDk2Yy8weDI2NzAgZnMv
bmFtZWkuYzozNDI4Cj4gICBkb19maWxwX29wZW4rMHgxYTQvMHgzZjAgZnMvbmFtZWkuYzozNDU4
Cj4gICBkb19zeXNfb3BlbmF0MisweDE3MS8weDQyMCBmcy9vcGVuLmM6MTE4Ngo+ICAgZG9fc3lz
X29wZW4gZnMvb3Blbi5jOjEyMDIgW2lubGluZV0KPiAgIF9fZG9fc3lzX29wZW5hdCBmcy9vcGVu
LmM6MTIxOCBbaW5saW5lXQo+ICAgX19zZV9zeXNfb3BlbmF0IGZzL29wZW4uYzoxMjEzIFtpbmxp
bmVdCj4gICBfX3g2NF9zeXNfb3BlbmF0KzB4MTNjLzB4MWYwIGZzL29wZW4uYzoxMjEzCj4gICBk
b19zeXNjYWxsXzY0KzB4MzAvMHg0MCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo0Ngo+IAo+IElu
aXRpYWxpemUgdGhlIGlub2NhY2hlIHBvaW50ZXIgdG8gYSBOVUxMIHZhbHVlIHdoaWxlIHByZXBh
cmluZyBhbiBpbm9kZQo+IGluIGpmZnMyX2luaXRfaW5vZGVfaW5mbygpLiBqZmZzMl94YXR0cl9k
ZWxldGVfaW5vZGUoKSB3aWxsIGhhbmRsZSBpdAo+IGxhdGVyIGp1c3QgZmluZS4KPiAKPiBGb3Vu
ZCBieSBMaW51eCBWZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFN5
emthbGxlci4KPiAKPiBGaXhlczogMWRhMTc3ZTRjM2Y0ICgiTGludXgtMi42LjEyLXJjMiIpCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBGZWRvciBQY2hlbGtp
biA8cGNoZWxraW5AaXNwcmFzLnJ1Pgo+IC0tLQo+ICAgZnMvamZmczIvb3MtbGludXguaCB8IDEg
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpSZXZpZXdlZC1ieTogWmhpaGFv
IENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZnMvamZm
czIvb3MtbGludXguaCBiL2ZzL2pmZnMyL29zLWxpbnV4LmgKPiBpbmRleCA4NmFiMDE0YTM0OWMu
LjM5YjY1NjVmMTBjOSAxMDA2NDQKPiAtLS0gYS9mcy9qZmZzMi9vcy1saW51eC5oCj4gKysrIGIv
ZnMvamZmczIvb3MtbGludXguaAo+IEBAIC01NSw2ICs1NSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBqZmZzMl9pbml0X2lub2RlX2luZm8oc3RydWN0IGpmZnMyX2lub2RlX2luZm8gKmYpCj4gICAJ
Zi0+bWV0YWRhdGEgPSBOVUxMOwo+ICAgCWYtPmRlbnRzID0gTlVMTDsKPiAgIAlmLT50YXJnZXQg
PSBOVUxMOwo+ICsJZi0+aW5vY2FjaGUgPSBOVUxMOwo+ICAgCWYtPmZsYWdzID0gMDsKPiAgIAlm
LT51c2VyY29tcHIgPSAwOwo+ICAgfQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
