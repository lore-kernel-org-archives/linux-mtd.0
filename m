Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F58EC4345F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 02:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhFp5G3mhwFax9ZBXrHyDZ+5rIpzGhPQTyFpy2g0F64=; b=WpA48sKsFFPnqTYVF0vkyu5h4j
	H1ONId/ZeBbS1be2W8mJ4NBIPmBOEmE8WerMM7WVsbdjJ+RYzdBtjWx9SBcX3GB0BFnDNjV9Of3qT
	CyK1KQE6rLVy9H+Cv/i6mpkm6crbIvgcsNiMDWejLBfeAy0/GTFA8QPdlNLv7DR9h08/RV9kLvS5R
	JwrdvyJ6/3Fw0YgVub2Sb7kwRGuzV1AS/mRy5r9bHG+ogNxNJmaUf0x3hmMHk2GVfwVqwRCNXw1RI
	azwh6WTILZnVa/T5J6jGamKwfY+x00DDeG7lOUwWIGc1e6g9ynEKv2vLT2BxbXFixTJXmR5oDsS/D
	qE6D19IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3nq1-00000005mHW-2RU3;
	Mon, 06 May 2024 02:12:21 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3npu-00000005mFv-483k
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 02:12:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4VXlHr0jrCz1xmcT;
	Mon,  6 May 2024 10:10:48 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D21971A016C;
	Mon,  6 May 2024 10:11:54 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 10:11:54 +0800
Subject: Re: [PATCH] ubifs: fix kernel-doc warnings
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240502-ubifs-kdoc-v1-1-59c35a325141@quicinc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c94ba482-0b3a-e8c0-0990-dcb5507148c6@huawei.com>
Date: Mon, 6 May 2024 10:11:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240502-ubifs-kdoc-v1-1-59c35a325141@quicinc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_191215_612935_F4A6522E 
X-CRM114-Status: GOOD (  11.36  )
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

5ZyoIDIwMjQvNS8zIDQ6MTYsIEplZmYgSm9obnNvbiDlhpnpgZM6Cj4gbWFrZSBDPTEgcmVwb3J0
cyB0aGUgZm9sbG93aW5nIGtlcm5lbC1kb2Mgd2FybmluZ3M6Cj4gCj4gZnMvdWJpZnMvY29tcHJl
c3MuYzoxMDM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1Y3QgbWVtYmVyICdj
JyBub3QgZGVzY3JpYmVkIGluICd1Ymlmc19jb21wcmVzcycKPiBmcy91Ymlmcy9jb21wcmVzcy5j
OjE1NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2MnIG5v
dCBkZXNjcmliZWQgaW4gJ3ViaWZzX2RlY29tcHJlc3MnCj4gZnMvdWJpZnMvZmluZC5jOjM1Mzog
d2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZGF0YScgZGVzY3JpcHRpb24gaW4g
J3NjYW5fZm9yX2ZyZWVfY2InCj4gZnMvdWJpZnMvZmluZC5jOjM1Mzogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2FyZycgbm90IGRlc2NyaWJlZCBpbiAnc2Nh
bl9mb3JfZnJlZV9jYicKPiBmcy91Ymlmcy9maW5kLmM6NTk0OiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24gcGFyYW1ldGVyICdkYXRhJyBkZXNjcmlwdGlvbiBpbiAnc2Nhbl9mb3JfaWR4X2NiJwo+
IGZzL3ViaWZzL2ZpbmQuYzo1OTQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1
Y3QgbWVtYmVyICdhcmcnIG5vdCBkZXNjcmliZWQgaW4gJ3NjYW5fZm9yX2lkeF9jYicKPiBmcy91
Ymlmcy9maW5kLmM6Nzg2OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdkYXRh
JyBkZXNjcmlwdGlvbiBpbiAnc2Nhbl9kaXJ0eV9pZHhfY2InCj4gZnMvdWJpZnMvZmluZC5jOjc4
Njogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2FyZycgbm90
IGRlc2NyaWJlZCBpbiAnc2Nhbl9kaXJ0eV9pZHhfY2InCj4gZnMvdWJpZnMvZmluZC5jOjg2OiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdkYXRhJyBkZXNjcmlwdGlvbiBpbiAn
c2Nhbl9mb3JfZGlydHlfY2InCj4gZnMvdWJpZnMvZmluZC5jOjg2OiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAnYXJnJyBub3QgZGVzY3JpYmVkIGluICdzY2Fu
X2Zvcl9kaXJ0eV9jYicKPiBmcy91Ymlmcy9qb3VybmFsLmM6MzY5OiB3YXJuaW5nOiBleHBlY3Rp
bmcgcHJvdG90eXBlIGZvciB3YWtlX3VwX3Jlc2VydmF0aW9uKCkuIFByb3RvdHlwZSB3YXMgZm9y
IGFkZF9vcl9zdGFydF9xdWV1ZSgpIGluc3RlYWQKPiBmcy91Ymlmcy9scHJvcHMuYzoxMDE4OiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdsc3QnIGRlc2NyaXB0aW9uIGluICdz
Y2FuX2NoZWNrX2NiJwo+IGZzL3ViaWZzL2xwcm9wcy5jOjEwMTg6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBzdHJ1Y3QgbWVtYmVyICdhcmcnIG5vdCBkZXNjcmliZWQgaW4gJ3NjYW5f
Y2hlY2tfY2InCj4gZnMvdWJpZnMvbHB0LmM6MTkzODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIHN0cnVjdCBtZW1iZXIgJ3B0cicgbm90IGRlc2NyaWJlZCBpbiAnbHB0X3NjYW5fbm9k
ZScKPiBmcy91Ymlmcy9yZXBsYXkuYzo2MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IHN0cnVjdCBtZW1iZXIgJ2hhc2gnIG5vdCBkZXNjcmliZWQgaW4gJ3JlcGxheV9lbnRyeScKPiAK
PiBGaXggdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIEpvaG5zb24gPHF1aWNfampvaG5z
b25AcXVpY2luYy5jb20+Cj4gLS0tCj4gTm90ZSB1YmlmcyBzdGlsbCBoYXMgQz0xIHdhcm5pbmdz
IGZyb20gc21hdGNoIHRoYXQgYXJlIG5vdCBhZGRyZXNzZWQ6CgpSZXZpZXdlZC1ieTogWmhpaGFv
IENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKWy4uLl0KPiBkaWZmIC0tZ2l0IGEv
ZnMvdWJpZnMvam91cm5hbC5jIGIvZnMvdWJpZnMvam91cm5hbC5jCj4gaW5kZXggNzRhZWU5MjQz
M2Q3Li5mOTk3YTg1YmNkY2UgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvam91cm5hbC5jCj4gKysr
IGIvZnMvdWJpZnMvam91cm5hbC5jCj4gQEAgLTM1OSw3ICszNTksNyBAQCBzdGF0aWMgdm9pZCB3
YWtlX3VwX3Jlc2VydmF0aW9uKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+ICAgfQo+ICAgCj4gICAv
KioKPiAtICogd2FrZV91cF9yZXNlcnZhdGlvbiAtIGFkZCBjdXJyZW50IHRhc2sgaW4gcXVldWUg
b3Igc3RhcnQgcXVldWluZy4KPiArICogYWRkX29yX3N0YXJ0X3F1ZXVlIC0gYWRkIGN1cnJlbnQg
dGFzayBpbiBxdWV1ZSBvciBzdGFydCBxdWV1aW5nLgo+ICAgICogQGM6IFVCSUZTIGZpbGUtc3lz
dGVtIGRlc2NyaXB0aW9uIG9iamVjdAo+ICAgICoKPiAgICAqIFRoaXMgZnVuY3Rpb24gc3RhcnRz
IHF1ZXVpbmcgaWYgcXVldWluZyBpcyBub3Qgc3RhcnRlZCwgb3RoZXJ3aXNlIGFkZHMKClRoaXMg
cGVyaW9kIG9mIGNvZGUgd2FzIG1vZGlmaWVkIGluIHByZXZpb3VzIHBhdGNoIApodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjQwMjI3MDI0MjA0
LjEwODA3MzktMS1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS8gCiwgSSdtIG9rYXkgdG8gZHJvcCB0
aGUgb2xkIHBhdGNoIGFuZCBhcHBseSB0aGlzIG9uZS4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
