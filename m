Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F012CED258
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ReNROsRxA42ELOxhzaV8b5gDtplemKAPwe3g6Aq2Ss=; b=UkOUskEZETlvuM0719VjtWz9kb
	l6UMi8a+II3+9Z8wncNvh/GvmeBWognjtKy9izUM7+az0ECf3fFdWgMOHmhVEFQIr24MWxGEbRMdw
	vQDOdV26gelxcU7BX3iwir4nLMAxlRX9zzGiz/RcTYHU9W3RXa+tOXUjRQ9DE4c7hzfauNxvi4nh1
	AlhRC3/TXZ4UyCTPTDqqu/d9VnSE/2JNCpOJ6eDjMpCEDq8VMr1P5eYoTQ1ZB9ZIJzF7tXrP8WeYc
	Ijb7bcsr1Zp78p3LqpuxQiXu0HcZGiOnZwQ8cg/fISAyjv6NcZ7pP8FH4tNvGzoGijWd9FjyA3hnl
	BCjNc2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0O0-00000004L0v-43gu;
	Tue, 08 Oct 2024 02:55:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy0Nx-00000004Ky1-3ILE
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 02:55:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XN0sG0DTLz1HKQj;
	Tue,  8 Oct 2024 10:51:30 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 4F1E6140392;
	Tue,  8 Oct 2024 10:55:34 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:55:33 +0800
Subject: Re: [PATCH RFC 2/2] mtd: ubi: add support for protecting critical
 volumes
To: Richard Weinberger <richard@nod.at>, Daniel Golle <daniel@makrotopia.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, robh <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, John Crispin
	<john@phrozen.org>, linux-mtd <linux-mtd@lists.infradead.org>, devicetree
	<devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org>
 <251386789.117942.1727612762462.JavaMail.zimbra@nod.at>
 <ed98871a-b41a-9755-4eed-18ad9e00869c@huawei.com>
 <364911897.123906.1727721820227.JavaMail.zimbra@nod.at>
 <Zvr-hOM2DfveaqeC@makrotopia.org>
 <1249604143.124110.1727726047386.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <131bb6bc-1cb3-ead7-12d9-89beba9408ca@huawei.com>
Date: Tue, 8 Oct 2024 10:55:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1249604143.124110.1727726047386.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_195542_208320_6B194DE8 
X-CRM114-Status: GOOD (  15.84  )
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

5ZyoIDIwMjQvMTAvMSAzOjU0LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiRGFuaWVsIEdvbGxlIiA8ZGFuaWVsQG1h
a3JvdG9waWEub3JnPgo+Pj4gbGlrZSBhIHViaXJtdm9sIC4uLiAtLWkta25vdy13aGF0LWltLWRv
aW5nLgo+PgoKU29ycnkgZm9yIHRoZSBkZWxheSByZXBseSwgY2F1c2VkIGJ5IG15IGhvbGlkYXku
Cj4+IFRydWUsIGVuZm9yY2VtZW50IGRvZXNuJ3QgbmVlZCB0byBoYXBwZW4gaW4ga2VybmVsICh0
aG91Z2ggSSB0aGluayBpdCdzCj4+IG5pY2VyLCBidXQgcmVhbGx5IGp1c3QgYSBtYXR0ZXIgb2Yg
dGFzdGUsIEkgZ3Vlc3MpLiB1YmktdG9vbHMgd291bGQgc3RpbGwKPj4gbmVlZCB0byBiZSBhYmxl
IHRvIHJlY29nbml6ZSBjcml0aWNhbCB2b2x1bWVzIHNvbWVob3csIGFuZCB0aGF0IGNvdWxkIGJl
Cj4+IGRvbmUgYnkgY2hlY2tpbmcgaWYgdGhlICd2b2x1bWUtaXMtY3JpdGljYWwnIHByb3BlcnR5
IGlzIHByZXNlbnQgaW4KPj4gL3N5cy9jbGFzcy91YmkvdWJpKl8qL29mX25vZGUvCj4gCj4gRXhh
Y3RseS4KPiBJIGFsc28gZG9uJ3QgbWluZCBhZGRpbmcgYSBpbi1tZW1vcnkgJ3ZvbHVtZS1pcy1j
cml0aWNhbCcgcHJvcGVydHkgdG8KPiBVQkkgZGlyZWN0bHkuIEknbSBqdXN0IGEgbGl0dGxlIGhl
c2l0YXRlZCB0byBjaGFuZ2UgdGhlIFVBUEkgb3IgdGhlIG9uLWRpc2sKPiBkYXRhIHN0cnVjdHVy
ZXMgZm9yIHRoaXMgZmVhdHVyZXMuCgpBZGQgYSBuZXcgaW50ZXJmYWNlIHVuZGVyIHRoZSBzeXNm
cyBpcyBmaW5lLgo+ICAgCj4+IElmIHlvdSBwcmVmZXIgZ29pbmcgZG93biB0aGF0IHJvYWQgaW5z
dGVhZCBJIHdpbGwgd29yayBvbiBwYXRjaGVzIGZvcgo+PiBnaXQuaW5mcmFkZWFkLm9yZy9tdGQt
dXRpbHMuZ2l0IGluc3RlYWQuCj4gCj4gWWVzLiBXaGVuIGRvbmUgaW4gdXNlcnNwYWNlLCBpdCdz
IGFsc28gbXVjaCBlYXNpZXIgdG8gb2ZmZXIgdGhlIC0taS1rbm93LXdoYXQtaW0tZG9pbmcKPiBm
bGFnIHRvIHN0aWxsIHJlbW92ZSBhIGNyaXRpY2FsIHZvbHVtZS4KCkxvb2tzIGdvb2QsIEkgbGlr
ZSBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
