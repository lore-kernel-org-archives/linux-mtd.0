Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D266AC28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQgzm9HKKyCDkl+qkGuDLjgReSqN8iMUA1+UwuX0l/s=; b=p732KoOohMy8rV/E9nTcAZAUau
	Xw2PSjyVl9Hagqy0N/s44zOlwV63qqXsIpo9pTU5Bh5g4uQAA4gYu3vdJtvdTvgf48bGvcIFfavc1
	dMk27BCCET0SnNlYLiZ+YfCIuBOv/MuLnost7LwhihX7iAzYJRuZnT++ag6y2ERVyx7uUnN2N/asN
	z0QY6tlcZeJckcdpc0ZgVwgxwEVmIJ+bWzHw88Vjdvut25dMjTv8qY7LyMkDRZYq+tnbE3Tvy6nZB
	/xp02Apq/C+Ikv4X1+4iqXgaglIGQeGA3gr8LcuwNCH0PTznQDAuq2Vdjz0te2MvMDP0FXC2CshmY
	iBo7NG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNVt-0000000G5Sx-3fYr;
	Sat, 15 Mar 2025 09:09:01 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNVq-0000000G5RB-0OiL
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 09:09:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZFFlY2q6Zz1cyhS;
	Sat, 15 Mar 2025 17:08:41 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AA55E14010D;
	Sat, 15 Mar 2025 17:08:49 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Mar 2025 17:08:48 +0800
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
	<netdev@vger.kernel.org>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
 <Z9VCPB_pcT4ycYyt@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <dfa799fd-5ece-4ea4-d5d0-8c1da39a3a8d@huawei.com>
Date: Sat, 15 Mar 2025 17:08:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Z9VCPB_pcT4ycYyt@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_020858_291759_A91AED6E 
X-CRM114-Status: UNSURE (   9.63  )
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

1NogMjAyNS8zLzE1IDE3OjAyLCBIZXJiZXJ0IFh1INC0tcA6Cj4gT24gU2F0LCBNYXIgMTUsIDIw
MjUgYXQgMDQ6NTg6MzFQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+Pgo+PiBIaSwgSGVy
YmVydCwgSSBnb3Qgc29tZSB3YXJuaW5nIG1lc3NhZ2VzIHdoaWxlIHJ1bm5pbmcgeGZzdGVzdHMs
IGl0IGxvb2tzCj4+IGxpa2UgdGhlIGNvbXByZXNzb3IgcmV0dXJucyBlcnJvciBjb2RlLgo+IAo+
IFllcyB0aGlzIGlzIGV4cGVjdGVkIGFzIGluY29tcHJlc3NpYmxlIGRhdGEgd2lsbCBub3cgc2hv
dyB1cCBhcwo+IGVycm9ycyBzaW5jZSB3ZSByZWR1Y2VkIHRoZSBvdXRwdXQgYnVmZmVyIHNpemUg
ZHVlIHRvIExaTyBnZXR0aW5nCj4gZml4ZWQuICBJJ2xsIHNpbGVuY2UgdGhhdCB3YXJuaW5nLgoK
QWNjb3JkaW5nIHRvIHRoZSB3YXJuaW5nIG1lc3NhZ2UsIGN1cnJlbnQgY29tcHJlc3NvciBpcyB6
c3RkLiBUaGUgb3V0cHV0IApidWZmZXIgc2l6ZSBpcyBsaW1pdGVkIG9ubHkgZm9yIExaTyBjb21w
cmVzc29yIGJ5IFsxXS4KCnViaWZzX2NvbXByZXNzX3JlcSBbdWJpZnNdOiBjYW5ub3QgY29tcHJl
c3MgNDA5NiBieXRlcywgY29tcHJlc3NvciB6c3RkLCAKZXJyb3IgLTIyLCBsZWF2ZSBkYXRhIHVu
Y29tcHJlc3NlZAoKWzFdIApodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvaGVyYmVydC9jcnlwdG9kZXYtMi42LmdpdC9jb21taXQvP2lkPWNjNDdmMDcy
MzRmNzJjYmQ4ZTJjOTczY2RiZjJhNjczMDY2MGE0NjMKPiAKPiBUaGVyZSBhcmUgbm8gcmVhc29u
cyB3aHkgY29tcHJlc3Npb24gc2hvdWxkIGZhaWwsIG90aGVyIHRoYW4gdGhlCj4gZGF0YSBiZWlu
ZyBpbmNvbXByZXNzaWJsZS4KPiAKPiBUaGFua3MsCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
