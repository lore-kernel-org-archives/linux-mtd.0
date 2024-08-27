Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E31C52D6F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2024 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX5sYnKBde8MLt8wGFsaevQFSR2m0Hn92Mc/cqzsYpA=; b=ZDH5t/Dyvux+GS/YPb9LjHjkRF
	3R11YzknOwaPsbqSjWmR6bipJe8KqdwSvgREvidMdoz3k1gNAxsOY1EaWmyeMIbYOP5m8HkYVhKSR
	LiDf+rjgiG4PC4HRxMDTuCzfJvxECY8CxP9T5G3jZ0WrCiEeYPEEQUfpdPLL4t+mK5dyeHylZd/DB
	exy/7bT/PsulZwXJ5AUu0Z2jpmjSq9RPtPxbpM+y7sCfO+6bgShhlTFfFwme1yiLEGdKSTSOeTuW9
	nXbdCW6CQcmg8+Q9VySOJKT2CEAKY5ezR1OPiU4PmFvuUBe2CLE0JCBExqoNourqMoodNSjLqljRA
	aj+MjCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirat-0000000APGJ-3UQn;
	Tue, 27 Aug 2024 08:30:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqQN-0000000AAbv-2PTb
	for linux-mtd@bombadil.infradead.org;
	Tue, 27 Aug 2024 07:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FM3eDnPFcDB4U8vPk2HWyi9oA+NLZFHl+PJkKZxk3cc=; b=pXGLUKhXu7hWukBfWq6AweDIoN
	h8za3H5tpxa1nrhgLq6jElKjC7d5ZOrgsCeNHn6f4Sbb7oO1Opqz4dfeS8tAQ5U59ODAVj8uPJq1V
	qHTkdY8twkmyGs1fnewOXF2Mb9vt1SccOKl88bwJnSE8L8IXVgazN7H/5oQgv1AYfwLM0v/3YyaCS
	qs622Cvopk5XX7JzEfaAJoS1Vi3HIId25qVRioKssAOYhiRt4In44c1yjASsGLN3HL04PAABcUOtq
	JLigJ6a089USqJq9oWCaNq9FENB1w+wv6kbOOEaL8a7Yua8Btj6Izxahos4fcx+Gqx4Mxps6GC++W
	b/EhG2aw==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqQJ-0000000AoHg-3PkJ
	for linux-mtd@lists.infradead.org;
	Tue, 27 Aug 2024 07:15:30 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WtJhf41mdz2CnVs;
	Tue, 27 Aug 2024 15:14:58 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 623101400F4;
	Tue, 27 Aug 2024 15:15:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 15:15:07 +0800
Subject: Re: [PATCH 1/2] ubi: wl: Put source PEB into correct list if trying
 locking LEB failed
To: Ryder Wang <rydercoding@hotmail.com>, "richard@nod.at" <richard@nod.at>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20240819032622.2241165-1-chengzhihao1@huawei.com>
 <20240819032622.2241165-2-chengzhihao1@huawei.com>
 <MEYP282MB316452BB4702F6B48314C57BBF942@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <6857c06d-fa16-40ea-a14e-bb67e4406148@huawei.com>
 <MEYP282MB3164273F8D66D202F6A9F5C2BF942@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3623fa55-9f42-d844-5dfd-79a534d85bbe@huawei.com>
Date: Tue, 27 Aug 2024 15:15:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB3164273F8D66D202F6A9F5C2BF942@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_081528_433772_179F9F6E 
X-CRM114-Status: GOOD (  13.51  )
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

1NogMjAyNC84LzI3IDE0OjI1LCBSeWRlciBXYW5nINC0tcA6Cj4+IE5vdywgZTEgaXMgdGhlIHNv
dXJjZSBQRUIgd2l0aCBzbWFsbGVyIGVyYXNlIGNvdW50ZXIsIGl0IHdpbGwgYmUgcGlja2VkCj4+
IGFzIHNvdXJjZSBQRUIgYWdhaW4gaW4gbmV4dCBXTCBpZiBpdCBub3QgYmVjb21lcyBmcmVlIHll
dC4KPj4KPj4gV2UgZG9uJ3QgcHV0IGl0IGludG8gc2NydWIgdHJlZSwgYmVjYXVzZSB0aGUgc2Ny
dWIgdHlwZSBQRUIgbWVhbnMgdGhhdAo+PiBiaWZsaXBzIGV2ZXIgaGFwcGVuIGR1cmluZyByZWFk
aW5nLCB0aGUgZGF0YSBpcyBub3Qgc3RhYmxlIGFueW1vcmUgaW4KPj4gdGhhdCBQRUIsIHNvIFVC
SSBtb3ZlcyBkYXRhIGZyb20gc2NydWIgdHlwZSBQRUIganVzdCB0YWtlIHRoZQo+PiBvcHBvcnR1
bml0eSBvZiBXTCBwcm9jZXNzLgo+Pgo+PiBJT1csIGluIHRoaXMgY2FzZSwgdGhlIFdMIHdvbid0
IGxvc3Qga2VlcGluZyBlYyBiYWxhbmNlZCB3aGV0aGVyIHdlIGtlZXAKPj4gZTEgaW4gdXNlZCB0
cmVlIG9yIG1vdmUgaXQgaW50byBzY3J1YiB0cmVlLiBJdCdzIHRoZSBzYW1lIHRoaW5nIGFzIHRo
ZQo+PiBNT1ZFX1RBUkdFVF9XUl9FUlIvTU9WRV9UQVJHRVRfUkRfRVJSIGNhc2UuCj4gCj4gVGhl
biB3aGF0J3MgdGhlIHBvc2l0aXZlIHJldHVybiBhbmQgbmVjZXNzaXR5IG9mIHRoaXMgcGF0Y2g/
IEl0IGxvb2tzIHRoZXJlIGlzIGZldyBkaWZmZXJlbmNlIGJlZm9yZSBhbmQgYWZ0ZXIgYXBwbHlp
bmcgdGhlIHBhdGNoLgo+IC4KPiAKClRoZSBtb3N0IG5lY2Vzc2l0eSBpcyB0aGF0IG1ha2UgdGhl
IG1lc3NhZ2UgJ3ViaTA6IHNjcnViYmVkIFBFQiA2NiAoTEVCIAowOjEwKSwgZGF0YSBtb3ZlZCB0
byBQRUIgMTY1JyBub3QgYmUgZmFsc2UgcG9zaXRpdmUsIHVzZXIgY291bGQgYmUgCmNvbmZ1c2Vk
IHdoZW4gaGUgZ2V0IHRoZSBrZXJuZWwgbWVzc2FnZSB3aGlsZSBydW5uaW5nIHRlc3RzIG9uIGEg
Cm5hbmRzaW0oYSBuYW5kIHNpbXVsYXRvciBiYXNlZCBvbiBtZW1vcnksIHdoaWNoIHdvbid0IGdl
bmVyYXRlIGJpdGZsaXBzKS4KQXMgZm9yIHRoZSB0ZXN0aW5nIHJlc3VsdHMoYSBzbWFsbCBkZWNy
ZW1lbnQgb2YgZWMgY291bnRlcikgYmFzZWQgb24gdGhlIApwYXRjaGVzLCB0aGVyZSBpcyBhIHNt
YWxsIGRpZmZlcmVuY2U6CgpCZWZvcmUgcGF0Y2hlczoKc3RlcCAxLiBJbiBmaXJzdCB3bCwgZTEg
aXMgcHV0IGludG8gc2NydWIgdHJlZSwgZTIgaXMgcHV0IGludG8gZnJlZSB0cmVlLgpzdGVwIDIu
IFRoZSBzZWNvbmQgd2wgbXVzdCBiZSBzY2hlZHVsZWQgYWNjb3JkaW5nIHRvIHRoZSBpbXBsZW1l
bnRhdGlvbiAKb2YgZW5zdXJlX3dlYXJfbGV2ZWxpbmcoKSwgYmVjYXVzZSBzY3J1YiB0cmVlIGlz
IG5vdCBlbXB0eS4Kc3RlcCAzLiBJbiBzZWNvbmQgd2wsIGUxIGlzIHN0aWxsIGUxIGluIHN0ZXAg
MSwgZTIgaXMgcGlja2VkIGZyb20gCnViaS0+Zm1fd2xfcG9vbCwgd2hpY2ggaXMgbm90IHRoZSBz
YW1lIGUyIGluIHN0ZXAgMiwgd2hpY2ggbWVhbnMgdGhhdCAKdGhlIGUyLT5lYyBjb3VsZCBiZSBz
bWFsbGVyIHRoYW4gZTEtPmVjICsgVUJJX1dMX1RIUkVTSE9MRCwgdGhlcmUgaXMgbm8gCm5lZWQg
dG8gZG8gdGhlIHNlY29uZCB3bCBhY3R1YWxseS4KCkFmdGVyIHBhdGNoZXM6CnN0ZXAgMS4gSW4g
Zmlyc3Qgd2wsIGUxIGlzIHB1dCBpbnRvIHVzZWQgdHJlZSwgZTIgaXMgcHV0IGludG8gZnJlZSB0
cmVlLgpzdGVwIDIuIFRoZSBzZWNvbmQgd2wgbWF5IG5vdCBiZSBzY2hlZHVsZWQgYWNjb3JkaW5n
IHRvIHRoZSAKaW1wbGVtZW50YXRpb24gb2YgZW5zdXJlX3dlYXJfbGV2ZWxpbmcoKSwgYmVjYXVz
ZSBzY3J1YiB0cmVlIGlzIGVtcHR5IAphbmQgdGhlIGVjIGNvdW50ZXIgb2YgZmlyc3QgZW50cnkg
aW4gdWJpLT5mbV93bF9wb29sIGlzIG5vdCBncmVhdGVyIHRoYW4gCmUxLT5lYyArIFVCSV9XTF9U
SFJFU0hPTEQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
