Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AAC606A31A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IokWRmQv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bhNY92mI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q7tWkcbWiS9CtkHd2+mplJKeSwo375t7XJkvZ356WA4=; b=IokWRmQvWBMS/N6ZIYVmUseMWj
	mYSXEnGB+OOcSRSo7B5fJ1uepASM2NO5nG0QU9P+A7/yzWiwmCSARHIoFWGVeY5xOOAUVsVJ9xAk6
	3WByfpEZmTl812ZtBGpqhsjVmavHbCMI9FFHda+ksnnl5kmOPdL1nWYb8dQKjC5qvyqCbpSx5BZ3+
	3UOlg+J0eKRPj3P0YBMQ3llh6Vn+M39tu/HDI/v5y/TVw7R+wrwEJzB46LZgFJQ60eUovd6gCHmPq
	Lzvw0MVJTkysbDdu+ecxFpWP4OfJxCY9+mdz3dkvI1le6JU9gZGuemNPni44QJNIaWSFhS4kYrCv4
	dxFlisJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLaza-00000003rey-3Kpd;
	Tue, 27 Oct 2026 06:49:06 +0000
Received: from [113.46.200.227] (helo=canpmsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLazY-00000003rdw-3HFC
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 06:49:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=E7AReoFYct7WUrQ4kv0lsePfBeMYH9Q/DmLWXz7IMes=;
	b=bhNY92mI+eKRPemDJ92oKKy5AZ/98/OHSOo9nQk3wRFMvbbJnmmiB04rIEIGhA/61vxMNYVvP
	d6/Bw9ndioPbsmPyH0Dvakb8AcHldVkGwMP98FZDNLKd60z5GL6ENA2RQ3zF72VYPvBZNer4sLu
	XbmPtBBmSuL5xZyolT07xZ0=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jDLgG3Z3sznTWH;
	Tue, 27 Oct 2026 14:48:42 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B81140565;
	Tue, 27 Oct 2026 14:48:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 27 Oct 2026 14:48:36 +0800
Subject: Re: [PATCH v4] ubifs: zero stale data beyond EOF before file size
 grows
To: Nan Lin <lin.nan@h3c.com>, <sashiko-bot@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
	<zhou.kete@h3c.com>
References: <sashiko-outbox-185311@kernel.org>
 <20261027061226.3506517-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2689b58f-883c-d6da-1796-221ae98e4dc1@huawei.com>
Date: Tue, 27 Oct 2026 14:48:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027061226.3506517-1-lin.nan@h3c.com>
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_234904_999559_BAA5934B 
X-CRM114-Status: GOOD (  11.58  )
X-Spam-Score: -3.0 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8yNyAxNDoxMiwgTmFuIExpbiDQtLXAOgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IApbLi4uXQo+IAo+PiBCZWNhdXNlIHRoZSBv
bGQtRU9GIGZvbGlvIGlzIGFscmVhZHkgdXB0b2RhdGUsIHdvdWxkbid0IHViaWZzX3dyaXRlX2Vu
ZCgpCj4gCj4+IGFkdmFuY2UgaW5vZGUtPmlfc2l6ZSBhbmQgdWktPnVpX3NpemUgdG8gcG9zICsg
bGVuIGV2ZW4gd2hlbiBjb3BpZWQgPCBsZW4sCj4gCj4+IGV4cG9zaW5nIHRoZSB1bnplcm9lZCBz
dGFsZSBtbWFwIGRhdGEgaW4gW3BvcyArIGNvcGllZCwgcG9zICsgbGVuKT8KPiAKPj4KPiAKPj4g
QnkgY29tcGFyaXNvbiwgZXh0NF9ibG9ja196ZXJvX2VvZigpIHplcm9lcyB0aGUgZW50aXJlIHRh
aWwgb2YgdGhlIG9sZC1FT0YKPiAKPj4gZm9saW8gZnJvbSBvbGRfc2l6ZSB0byBmb2xpb19zaXpl
KGZvbGlvKSwgYW5kIGV4dDRfd3JpdGVfZW5kKCkgb25seSBhZHZhbmNlcwo+IAo+PiBpX3NpemUg
dG8gcG9zICsgY29waWVkLiBTaG91bGQgdWJpZnNfemVyb19lb2ZfaG9sZSgpIGFsc28gemVybyB0
byB0aGUgZW5kIG9mCj4gCj4+IHRoZSBmb2xpbyAob3IgYmUgY2FsbGVkIHdoZW5ldmVyIHRoZSB3
cml0ZSBleHRlbmRzIHBhc3QgaV9zaXplKSwgb3Igc2hvdWxkCj4gCj4+IHViaWZzX3dyaXRlX2Vu
ZCgpIGF2b2lkIGV4dGVuZGluZyBpX3NpemUgcGFzdCBwb3MgKyBjb3BpZWQ/Cj4gCj4gCj4gCj4g
VmFsaWQgY29uY2Vybi4gSSB0aGluayB0aGUgc2hvcnQtY29weSBpc3N1ZSBpcyBiZXN0IGhhbmRs
ZWQgc2VwYXJhdGVseQo+IAo+IHNpbmNlIGl0IGludm9sdmVzIHdyaXRlX2VuZCgpIGJ1ZGdldCBz
ZW1hbnRpY3MgYW5kIGFmZmVjdHMgYWxsIGJ1ZmZlcmVkCj4gCj4gd3JpdGVzLCBub3QganVzdCBl
eHRlbmRpbmcgb25lcy4gTm90ZSB0aGF0IHRoZSBpX3NpemUgYWR2YW5jZSB0byBwb3MgKyBsZW4g
b24KPiAKPiBzaG9ydCBjb3BpZXMgaXMgcHJlLWV4aXN0aW5nIFVCSUZTIGJlaGF2aW9yLCBub3Qg
aW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLgo+IAo+IFdvcnRoIGEgZGVkaWNhdGVkIGFuYWx5c2lz
L3BhdGNoIGJ1dCBvdXRzaWRlIHRoZSBzY29wZSBvZiB0aGlzIGZpeC4KPiAKCkFncmVlZAo+IAo+
IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
