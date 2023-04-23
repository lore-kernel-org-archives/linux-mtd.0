Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A2FC7618E
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Apr 2023 03:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Psxax73pklxKvYssnPompkL5ptVT6YRL1RYYO/8COA=; b=RTmtzbnyL1t0pL+y4fMxkzvua6
	MP7uE/LQ3OArU5tTPSu74GrfZQkiWL7JlTkA9IPwx6KNg0KKhoSjeCYr1CH0YiNVPqI0SUJBWDEYH
	7/DB/Iv2nWBln8EoO0y6DwaXFifb5/upJF+NwSgwQdbZzgmNYnshR01R+rXGDhCkU+d7UM8cv//aS
	85LGu7wq0wYhZdtlUd/rfBfG6rQWfBqQyiMETXTstbQ2PVy/BTYJOye25RqpNyFDuGw2DIa9Ksktk
	z548+WqGthbjfBLpNQmIAU9pGcfldjvJRjnhq2WyKtcps0LazCZrTq2EeqMo0Ctua5k61SHEg+F0N
	zKUfsjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqQHr-00Dhmd-1t;
	Sun, 23 Apr 2023 03:21:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqQHn-00Dhlo-1r
	for linux-mtd@lists.infradead.org;
	Sun, 23 Apr 2023 03:21:14 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Q3tjK19XRz17VZT;
	Sun, 23 Apr 2023 11:17:09 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 11:20:56 +0800
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
To: Richard Weinberger <richard@nod.at>, Yu Hao <yhao016@ucr.edu>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com>
 <687864524.118195.1681799447034.JavaMail.zimbra@nod.at>
 <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com>
 <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com>
 <977347543.226888.1682011999468.JavaMail.zimbra@nod.at>
 <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com>
 <412779912.228444.1682023015809.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com>
Date: Sun, 23 Apr 2023 11:20:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <412779912.228444.1682023015809.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_202112_065690_D3F4951B 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjMvNC8yMSA0OjM2LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4+IENhbiB5b3UgcGxlYXNlIHNoYXJlIHRoZSBxZW11
IGNvbW1hbmQgbGluZT8KPj4gcWVtdS1zeXN0ZW0teDg2XzY0IC1tIDJHIC1zbXAgMiAta2VybmVs
Cj4+IC9ob21lL3Rlc3QvV29ya3NwYWNlL1N5ekdlbi9saW51eC1kaXN0cm8vbGludXgtNi4yLWRl
YnVnL2FyY2gveDg2L2Jvb3QvYnpJbWFnZQo+PiAtYXBwZW5kIOKAnGNvbnNvbGU9dHR5UzAgcm9v
dD0vZGV2L3NkYSBuZXQuaWZuYW1lcz0w4oCdIC1oZGEKPj4gL2hvbWUvdGVzdC9Xb3Jrc3BhY2Uv
U3l6R2VuL2xpbnV4LWRpc3Ryby9pbWFnZS9zdHJldGNoLmltZyAtY2hhcmRldgo+PiBzb2NrZXQs
aWQ9U09DS1NZWixzZXJ2ZXI9b24sbm93YWl0LGhvc3Q9bG9jYWxob3N0LHBvcnQ9NTQ2NDAgLW1v
bgo+PiBjaGFyZGV2PVNPQ0tTWVosbW9kZT1jb250cm9sIC1kZXZpY2UgdmlydGlvLXJuZy1wY2kg
LWRldmljZQo+PiBlMTAwMCxuZXRkZXY9bmV0MCAtbmV0ZGV2Cj4+IHVzZXIsaWQ9bmV0MCxyZXN0
cmljdD1vbixob3N0ZndkPXRjcDoxMjcuMC4wLjE6MTE3NjAtOjIyIC1kaXNwbGF5IG5vbmUKPj4g
LXNlcmlhbCBzdGRpbyAtY3B1IGhvc3QsbWlncmF0YWJsZT1vZmYgLW5vLXJlYm9vdCAtbmFtZSBW
TSAtc25hcHNob3QKPj4gLWVuYWJsZS1rdm0KPj4KPj4+IFdpdGhpbiBMaW51eCB5b3UgY2FuIHF1
ZXJ5IC9wcm9jL210ZCBvciAvc3lzL2NsYXNzL210ZC8KPj4+IHRvIGdldCBpbmZvcyBhYm91dCB0
aGUgTVREIGluIHF1ZXN0aW9uLgo+Pj4KPj4KPj4gVGhhbmtzIGZvciB0aGUgaGludHMuIFdlIGZp
bmQgdGhhdCB0aGlzIGlzIGEg4oCcbXRkcmFtIHRlc3QgZGV2aWNl4oCdLgo+Pgo+PiByb290QHN5
emthbGxlcjp+IyBjYXQgL3Byb2MvbXRkCj4+IGRldjogICAgc2l6ZSAgIGVyYXNlc2l6ZSAgbmFt
ZQo+PiBtdGQwOiAwMDAyMDAwMCAwMDAwMTAwMCDigJxtdGRyYW0gdGVzdCBkZXZpY2XigJ0KPiAK
PiBIbW0sIG10ZHJhbSBzaG91bGQgYmUgZmluZSwgZXJhc2VzaXplIGlzIG5vdCB6ZXJvLgo+IAoK
SSBndWVzcyB0aGUgemVyby1lcmFzZXNpemUgbXRkIGRldmljZSBpcyBkeW5hbWljYWxseSBnZW5l
cmF0ZWQgaW4gCnJ1bnRpbWUsIGFmdGVyIGxvb2tpbmcgdGhyb3VnaCB0aGUgY29kZSwgSSBmaW5k
IGVyYXNlc2l6ZSBpcyAKaW5pdGlhbGxpemVkIGluIHNwZWNpZmljIGZsYXNoIGRyaXZlciBhbmQg
aXQgd29uJ3QgYmUgdXBkYXRlZCBsYXRlcihlZy4gCmlvY3RsXHN5c2N0bCkuIEFuZCBzb21lIG10
ZCBkZXZpY2VzIG1heSBoYXZlIHplcm8gZXJhc2VzaXplLCBlZy4gCmRyaXZlcnMvbXRkL2Rldmlj
ZXMvbWNocDIzazI1Ni5jWzFdLiBVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IGtub3cgaG93IHRvIAps
b2FkL3NpbXVsYXRlIHRoaXMgbXRkLCBtYXliZSBpdCByZXF1aXJlcyBhIHJlYWwgZGV2aWNlPyBJ
ZiB3ZSBsb2FkIHRoaXMgCm10ZCBkZXZpY2UgYXMgdWJpLCBpdCB3aWxsIHRyaWdnZXIgdGhlIHBy
b2JsZW0/CgoKWzFdIGh0dHBzOi8vY2xvdWQudGVuY2VudC5jb20vZGV2ZWxvcGVyL2Fzay9zb2Yv
MTE0NjE2NDMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
