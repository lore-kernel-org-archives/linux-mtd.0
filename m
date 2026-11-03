Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB03606A324
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 04:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m5/NVf6q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=12COAAUg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cMvTg8iFJELyMq6L9sn6WXfvQLQWRKTP5kaxEv/yqBk=; b=m5/NVf6qu6+M/ssFmCndzqe2Ib
	a6qLQfvF4Hx3+z+YxqB+wWW5u9yGm0DbWVhElvcAuByoZAp00OyBPMDwFm4+ClXs7c4O7LtB2CqII
	zpyXLTgaKobFBvXNHkuFVl2SuADzjz5SoMGdV5+SApe0YlOOzKCwswJEXaVSsD77ufWVSJ2ldXjRM
	aUJ4+skk5r+8WMOm8/g/UW/gxWmdacuQL2OkzdDZ32x+yiwti6VLvO/ADZTH/cad/SkiO1aWfPjhV
	4QlRkzJRRspWwAvlxWiY19pfJfKqYHdH7VVpglVVGWxsQnmi+/xmBGX6LPpw56ol/AFIy4ymIKPH7
	2hRm9dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Tc-000000016Lf-1xZw;
	Tue, 03 Nov 2026 04:50:28 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6TX-000000016Jg-2pyr
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 04:50:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tKYkGRJueQ4xHnKwkjwzEUwQGmQwSgxAdVrQiSPCVM0=;
	b=12COAAUgRMSucGDaRdd9nEFO2NcTHpF5KyMlJi0iyNbGUdDBgOIlaA4H62rB1QpDjcR/0O6J0
	FCB/aCxNjZUW3QzF9tjs8Zk17bI/TSawtH6KqJ7qfEqwtJc0SDMyoE6gs3BatGavL3lSTTOX83S
	JevDnaKi2SQaddDID29g7Os=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jJbjD4M4mz1cyqq;
	Tue,  3 Nov 2026 12:50:08 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 0024240574;
	Tue,  3 Nov 2026 12:50:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 12:50:17 +0800
Subject: Re: [PATCH 3/5] ubifs: reject master nodes claiming a too small inode
 number
To: <shao.mingyin@zte.com.cn>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261103123104319tX_sQcNY56466a6yZeEgg@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a6608f36-7ce2-bfbe-339c-c5719bbb867f@huawei.com>
Date: Tue, 3 Nov 2026 12:50:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103123104319tX_sQcNY56466a6yZeEgg@zte.com.cn>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_205024_580937_F08326CA 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -3.8 (---)
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMyAxMjozMSwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+PiBU
aGlzIGNoZWNrIGNvdWxkIGJlIG1lcmdlZCBpbnRvIHByZXZpb3VzIGNoZWNrOgo+PiAgICBmIChj
LT5oaWdoZXN0X2ludW0gPj0gSU5VTV9XQVRFUk1BUkspCj4gCj4gQWdyZWVkLCB0aGUgdHdvIGJv
dW5kcyBiZWxvbmcgaW4gb25lIHRlc3Q6Cj4gCj4gCWlmIChjLT5oaWdoZXN0X2ludW0gPj0gSU5V
TV9XQVRFUk1BUksgfHwKPiAJICAgIGMtPmhpZ2hlc3RfaW51bSA8IFVCSUZTX0ZJUlNUX0lOTykK
PiAKVGhpcyBsb29rcyBmaW5lLCB0aGVyZSBhcmUgbWFueSBwbGFjZXMgcmV0dXJuIHRoZSBzYW1l
IGVyciBjb2RlIApjb3JyZXBvbmRpbmcgc2V2ZXJhbCByZWFzb25zLCB0aGUgZXJyIGNvZGUgaGVs
cCB1c2VyIHRvIGlkZW50aWZ5IHdoaWNoIApmaWVsZCBpcyBpbmNvcnJlY3QsIHRoZW4gdWJpZnNf
ZHVtcF9ub2RlKCkgd2lsbCBzaG93IGFsbCBkZXRhaWxzLgo+IE9uZSBzaWRlIGVmZmVjdDogYSB0
b28gc21hbGwgaGlnaGVzdF9pbnVtIHRoZW4gcmVwb3J0cyBlcnJvciAzIGluc3RlYWQgb2YKPiB0
aGUgc2VwYXJhdGUgY29kZSAyNC4gIElmIHlvdSB3b3VsZCByYXRoZXIga2VlcCB0aGUgdHdvIHJh
bmdlcyBhcGFydCBpbgo+IHRoZSBsb2csIEkgY2FuIGxlYXZlIHRoZSBsb3dlciBib3VuZCBhcyBp
dHMgb3duIGNoZWNrLgo+IAo+IFRoYW5rcywKPiBTaGFvCj4gLgo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
