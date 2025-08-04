Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DA8C87FDA
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1rpcyPE0yCWa+ZaXREA3YUiXYqosOdBNlNpp5tE9G4=; b=xsDk8gzSEb/5o5249EeGAfBVGn
	DNcb7pFlx5mSn35Or2MTdrBgcy7zxRml4Aeg9VtrYtrCWEiQpowKhNgY544mSCe+NYyRhMb6bqvha
	95b0PqBkXdilsocgeP10PjHh35TLBXtjoKJyXZPnzIp3gbA60iIfkhg/PNTKG9KcWDSUO/g88qu0t
	jDv5s/dXM2WFQ4GyYBxH40vmkwX9kynjEKyty6fSenivQVsIdoS80BLAI6kgaYCNnXyWke/Ra9dca
	pOD60oUgDIO4v86jbZxSbuSOEBsmqQ6sqDV+3Txk0G2/k+VPe1bQQdzSPaddC5Oj0jFpF3+i7e3YM
	GyrSjoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipLh-00000009nEa-0UbW;
	Mon, 04 Aug 2025 07:11:09 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipLJ-00000009n7n-3a9v
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 07:10:47 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bwSJs23b4z2Cd6d;
	Mon,  4 Aug 2025 15:06:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C48E614025A;
	Mon,  4 Aug 2025 15:10:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 4 Aug 2025 15:10:36 +0800
Subject: Re: linux-6.16/fs/jffs2/readinode.c:189: loop can never finish
To: David Binderman <dcb314@hotmail.com>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "richard@nod.at" <richard@nod.at>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
References: <AS8PR02MB10217F68E5D37ECD491495E669C23A@AS8PR02MB10217.eurprd02.prod.outlook.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <df923d94-92ee-f824-01e2-21e6ed3d593c@huawei.com>
Date: Mon, 4 Aug 2025 15:10:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB10217F68E5D37ECD491495E669C23A@AS8PR02MB10217.eurprd02.prod.outlook.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_001046_044200_58B0F4FE 
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

1NogMjAyNS84LzQgMTQ6MjMsIERhdmlkIEJpbmRlcm1hbiDQtLXAOgo+IEhlbGxvIHRoZXJlLAo+
IAo+IFN0YXRpYyBhbmFseXNlciBjcHBjaGVjayBzYWlkOgo+IAo+IGxpbnV4LTYuMTYvZnMvamZm
czIvcmVhZGlub2RlLmM6MTg5OjI0OiBzdHlsZTogRXhwcmVzc2lvbiBpcyBhbHdheXMgdHJ1ZSBi
ZWNhdXNlICdlbHNlIGlmJyBjb25kaXRpb24gaXMgb3Bwb3NpdGUgdG8gcHJldmlvdXMgY29uZGl0
aW9uIGF0IGxpbmUgMTg3LiBbbXVsdGlDb25kaXRpb25dCj4gCj4gU291cmNlIGNvZGUgaXMKPiAK
PiAgICAgIHdoaWxlIChuZXh0KSB7CgpIaSwKVGhlICduZXh0ICE9IE5VTEwnIGlzIGFsc28gYSBj
b25kaXRpb24gZm9yIHRoZSBsb29wLCB0aGlzIHNuaXBwZXQgb2YgCmNvZGUgZmluZHMgYSBsZWFm
IG5vZGUgaW4gJ3RuX3Jvb3QnLgo+ICAgICAgICAgIHRuID0gcmJfZW50cnkobmV4dCwgc3RydWN0
IGpmZnMyX3RtcF9kbm9kZV9pbmZvLCByYik7Cj4gCj4gICAgICAgICAgaWYgKHRuLT5mbi0+b2Zz
IDwgb2Zmc2V0KQo+ICAgICAgICAgICAgICBuZXh0ID0gdG4tPnJiLnJiX3JpZ2h0Owo+ICAgICAg
ICAgIGVsc2UgaWYgKHRuLT5mbi0+b2ZzID49IG9mZnNldCkKPiAgICAgICAgICAgICAgbmV4dCA9
IHRuLT5yYi5yYl9sZWZ0Owo+ICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICB9Cj4gCj4gSXQgbG9va3MgdG8gbWUgbGlrZSB0aGlzIGxvb3Agd2lsbCBuZXZlciBmaW5p
c2guCj4gU3VnZ2VzdCBjaGFuZ2UgIj49IiB0byAiPiIuCj4gCj4gUmVnYXJkcwo+IAo+IERhdmlk
IEJpbmRlcm1hbgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+IC4K
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
