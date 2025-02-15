Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5A8C021A0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Feb 2025 04:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/vlLYxo1rwAOpg4SAhxtD0A/931jqzvXDzjRBQrA0s=; b=zt5p7KELD9qOEPFRcJ1IzKXBpn
	/huYGEIDJObdqFITMoDmF24drIzGVwSK4L1JmAXXK7SWT603pCqzEAXNEfo6MpjFaGoj79C6KqjjV
	NHqK6uptdU6PVaIaktZdQmKkdsWWohm3Z+Bv4ueuaF6g4llw40O4cB/I3Y0mwltZqa6I3/oJ77isa
	HQiYr6bJUzSgLa83f6Y8Jx6vmfgJsPJL3mUH/v8CIgBPM7EcSHzA78MRStk3rcogDOQ9KB5fVNl4p
	1dVCveF8Bl0+XX2VONEM48h7WD/QL9QQ/sOsJGuzZgzzTuJvpl6yG7M0zmm+7OG0kBmaOnPBigrij
	gtQ6tSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjAGH-0000000H1B2-2Wux;
	Sat, 15 Feb 2025 04:58:41 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjAGE-0000000H1AX-3CSe
	for linux-mtd@lists.infradead.org;
	Sat, 15 Feb 2025 04:58:40 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YvxQR5GGnz16Plh;
	Sat, 15 Feb 2025 12:53:51 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4ADFD14022D;
	Sat, 15 Feb 2025 12:58:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Feb 2025 12:58:21 +0800
Subject: Re: [RFC] UBI statistics and bitrot interface
To: Ashley Herron <herroash@amazon.com>, <richard@nod.at>
CC: <alex@nextthing.co>, <boris.brezillon@free-electrons.com>,
	<linux-mtd@lists.infradead.org>, <rdlee@amazon.com>
References: <574215219.28176795.1739397523614.JavaMail.zimbra@nod.at>
 <20250214160419.18583-1-herroash@amazon.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4e774297-22e6-d175-e46f-3806cf511f45@huawei.com>
Date: Sat, 15 Feb 2025 12:58:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250214160419.18583-1-herroash@amazon.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_205838_949739_2AFF0567 
X-CRM114-Status: GOOD (  14.42  )
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

1NogMjAyNS8yLzE1IDA6MDQsIEFzaGxleSBIZXJyb24g0LS1wDoKPj4gSUlSQywgdGhpcyBwYXRj
aGVzIGhhdmUgYmVlbiBwYXJ0IG9mIG91ciBmYWlsZWQgYXBwcm9hY2ggdG8gc3VwcG9ydCBNTEMK
Pj4gTkFORC4gT25lIHBhcnQgd2FzIGV4cG9zaW5nIGEgbW9yZSBvciBsZXNzIHNvcGhpc3RpY2F0
ZWQgaW50ZXJmYWNlCj4+IHRvIHVzZXJzcGFjZSBzdWNoIHRoYXQgYSBOQU5EIGZsYXNoIHNwZWNp
ZmljIGRhZW1vbiBjYW4gZm9zdGVyIHRoZSBjaGlwLgo+Pgo+Pgo+PiBBZnRlciBzb21lIGl0ZXJh
dGlvbnMsIHViaWhlYWx0aGQgd2FzIGJvcm4uIEJ1dCBpdCBkb2VzIG5vdCB1c2UgYSBzdGF0aXN0
aWNzCj4+IGludGVyZmFjZS4KPiAKPiBVbmZvcnR1bmF0ZWx5IHViaWhlYWx0aGQgd291bGRuJ3Qg
Zml0IHdoYXQgd2UgbmVlZC4KPiAKPj4KPj4gV2hhdCBraW5kIG9mIG1ldHJpY3MgYXJlIHlvdSBs
b29raW5nIGZvcj8KPj4gTWF5YmUgc29tZSBlQlBGL3RyYWNpbmcgbWFnaWMgd2lsbCBhbHJlYWR5
IHNlcnZlIHlvdSBlbm91Z2ggZGF0YSBwb2ludHM/Cj4gCj4gVGhlIGdvYWwgaXMgdG8gY2FwdHVy
ZSBzaW1pbGFyIGRhdGEgYXMgZU1NQyBhbmQgVUZTIGRldmljZXMgcmVwb3J0IHJlZ2FyZGluZwo+
IHRvdGFsIGJ5dGVzIHdyaXR0ZW4gdG8gdGhlIGJsb2NrIGRldmljZS4gU28gSSB3YW50IHRvIGNh
cHR1cmUgdG90YWwgKHBheWxvYWQpCj4gYnl0ZXMgd3JpdHRlbiBieSBjYWxsZXJzIHRvIHRoZSBV
QkkgbGF5ZXIsIG5vdCBpbmNsdWRpbmcgVUJJIG92ZXJoZWFkIChoZWFkZXJzLAo+IHdlYXIgbGV2
ZWxpbmcpLiBUaGlzIGlzIGZvciB0aGUgcHVycG9zZSBvZiBtb25pdG9yaW5nIGFuZCBpZGVudGlm
eWluZyBhbnkKPiBwYXR0ZXJuIG9mIGV4Y2Vzc2l2ZSB3cml0aW5nIG9uIGRldmljZXMgaW4gb3Bl
cmF0aW9uIHRoYXQgbWF5IGVmZmVjdCBpdHMKPiBsaWZldGltZS4gCgo+IFdlIG1heSB3YW50IHRv
IG1vbml0b3IgdG90YWwgd3JpdGVzIHRvIGEgVUJJIGRldmljZSBvdmVyIGEgMjQgaG91cgo+IHBl
cmlvZHMgb3IgbGVzcywgc28gb25seSB1c2luZyBlcmFzZSBjb3VudGVyIG1vbml0b3JpbmcgZG9l
c24ndCBnaXZlIHVzIHRoZQo+IGxldmVsIG9mIG1vbml0b3Jpbmcgd2UgcmVxdWlyZS4gV2Ugd3Jp
dGUgdG8gc29tZSBVQkkgdm9sdW1lcyB1c2luZyBVQklGUwo+IGFuZCBvdGhlcnMgdXNpbmcgVUJJ
IElPIGRpcmVjdGx5LiBJIHdhcyBwbGFubmluZyB0byBhZGQgKG9yIHJlcXVlc3QgeW91IGFkZCkg
YQo+IHdjICh3cml0ZSBjb3VudCkgdmFyaWFibGUgdG8gdGhlIGN1cnJlbnQgc3RydWN0IHdpdGgg
ZWMgYW5kIHJjIGluIHRoaXMgcGF0Y2hzZXQuCj4gCgpJIHRoaW5rIGVicGYvdHJhY2luZyB3aWxs
IHNhdGlzZnkgeW91ciByZXF1aXJlbWVudHMgYnkgaG9va2luZyBmdW5jdGlvbiAKdWJpX2ViYV93
cml0ZV9sZWIoKS4KCj4gQ2hlZXJzLAo+IEFzaGxleQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
