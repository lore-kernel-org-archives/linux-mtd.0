Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66546C47DD9
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 01:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7tXq8VNw8vVuUMWpsXmBaUZW+Y/7J6j2/aRrD/nNdQ=; b=Umt+/YckXuv3zYYKcdBYb2KviS
	Tg2WImDQ3brxFYYXeuGcGtf72V203C7+IOV9QfbxWEgIGVrB3qQ5Rkv6BVu9Y5NoMl4QiBT+UTpCj
	djIE/4fyE0CB/ycipPQ+BwW3V5yqxRmxEpz9Es9M0rQpI/m3Sl/e/KisDdcrfnneO6Xo90lamy84D
	MW/9Q39FwaF6F1HBqBziO/FjWmPAcp1xaLK6VtPzRDtWaoybgNk2DhaScjyJ4UBcqQR4tnmKonNOi
	eWEvAMlpqXNnCmGhU/xESVoZe+PvoEV/lCQuCwjyfgRmw1IC2emG7a6j22s9a91rWaW5B2hmcNN8g
	M8pEnH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZRc-0000000EU06-1KY5;
	Mon, 25 Mar 2024 01:48:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZRa-0000000ETzQ-058t
	for linux-mtd@bombadil.infradead.org;
	Mon, 25 Mar 2024 01:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qMsf3KeVJhz9LCkdSTsrHHgHjkK472vAkDnRxSAu+0w=; b=RKYEMv4OkS7y3UFxcDaOPc9tir
	kPzR+JGfHcRIDFdn1X73lg/miWitJvHaCx03+fSFmzmQE8wpZ/Dgaj76xlzgobgzei6fM2ntuezzY
	KG7iAKECUlCfNRp1OFJaNr0SztFmHFT2KWcX+gLT+sG9hEiLrNeKVTKDe+DVBF9fzwLGCmtsuvacO
	2rEh4UK/ZV0SBtIXW38objrEGJsTWZ70qIZFR+OVdW2F8GKnKJjJO6RGcvKTxAIxZYmLG9aJEOETk
	Zbg57VAlYfD+k+/aPclpmf9b6eo53cDfKHHv62YTZxfb0XmZ1lm4gvAXIl6xfKTgG7R7tVEJFbZcT
	v/L+9bgg==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZOy-0000000GKaJ-0lVj
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 01:48:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4V2wdx6NR2zXjH8;
	Mon, 25 Mar 2024 09:41:57 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 66058140258;
	Mon, 25 Mar 2024 09:44:41 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 09:44:40 +0800
Subject: Re: [PATCH] ubifs: xattr: remove unused anonymous enum
To: <pascal.eberhard@se.com>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240324004134.161755-1-pascal.eberhard@verified.se.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7030eaa5-73b5-7aa3-3b7d-56a3519878b3@huawei.com>
Date: Mon, 25 Mar 2024 09:44:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240324004134.161755-1-pascal.eberhard@verified.se.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_014606_817832_D82EEBC0 
X-CRM114-Status: GOOD (  11.10  )
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

1NogMjAyNC8zLzI0IDg6NDEsIHBhc2NhbC5lYmVyaGFyZEB2ZXJpZmllZC5zZS5jb20g0LS1wDoK
PiBGcm9tOiBQYXNjYWwgRWJlcmhhcmQgPHBhc2NhbC5lYmVyaGFyZEBzZS5jb20+Cj4gCj4gY29t
bWl0IDJiODhmYzIxY2FlOSAoInViaWZzOiBTd2l0Y2ggdG8gZ2VuZXJpYyB4YXR0ciBoYW5kbGVy
cyIpIHJlbW92ZXMKPiB1c2FnZSBvZiB0aGlzIGFub255bW91cyBlbnVtLiBEZWxldGUgdGhlIGVu
dW0gYXMgd2VsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXNjYWwgRWJlcmhhcmQgPHBhc2NhbC5l
YmVyaGFyZEBzZS5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy94YXR0ci5jIHwgMTMgLS0tLS0tLS0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpo
aWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2Zz
L3ViaWZzL3hhdHRyLmMgYi9mcy91Ymlmcy94YXR0ci5jCj4gaW5kZXggMDg0N2RiNTIxOTg0Li5m
MDk2OTUxOWFkMDUgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMveGF0dHIuYwo+ICsrKyBiL2ZzL3Vi
aWZzL3hhdHRyLmMKPiBAQCAtNDgsMTkgKzQ4LDYgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgveGF0dHIuaD4KPiAgIAo+IC0vKgo+IC0gKiBFeHRlbmRl
ZCBhdHRyaWJ1dGUgdHlwZSBjb25zdGFudHMuCj4gLSAqCj4gLSAqIFVTRVJfWEFUVFI6IHVzZXIg
ZXh0ZW5kZWQgYXR0cmlidXRlICgidXNlci4qIikKPiAtICogVFJVU1RFRF9YQVRUUjogdHJ1c3Rl
ZCBleHRlbmRlZCBhdHRyaWJ1dGUgKCJ0cnVzdGVkLiopCj4gLSAqIFNFQ1VSSVRZX1hBVFRSOiBz
ZWN1cml0eSBleHRlbmRlZCBhdHRyaWJ1dGUgKCJzZWN1cml0eS4qIikKPiAtICovCj4gLWVudW0g
ewo+IC0JVVNFUl9YQVRUUiwKPiAtCVRSVVNURURfWEFUVFIsCj4gLQlTRUNVUklUWV9YQVRUUiwK
PiAtfTsKPiAtCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGlub2RlX29wZXJhdGlvbnMgZW1wdHlf
aW9wczsKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGVtcHR5X2ZvcHM7
Cj4gICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
