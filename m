Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63513C27C4F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 04:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdWBZ/VelKbPNCs0S9FIAqJh6Tr6lO3E9aVh5ZGxA10=; b=ZNu63DcLUchUMDOT+sGVHgaXBb
	AgkEvi/UJoioIIwqapj/lhIH4nrw7ZrmHVUgrdqAZBUuGG7Mb3mSbJk0WQbiQW9OCmH3CC2iPeUIN
	jKve6lP40HwVQpid1iMt4xg1AQLoaIfeLlf9WPjswksx+9b9ORnnW5ntOVB6MAbyz6v17766IxbRw
	0EZCW3UiYbnGQeXMFkD6ApUMX2xaEwDAmjj8OVgC9lrkgJ+Yg7j7AKDJx91hXexMO/5W7LI+TOZWf
	957Vrdqwdsn2QBJzc6IBHKcU6Qr8o5z3L2wuRMu8NxWYccgYCg1K4EiFoRMnZJMo5DLrtFbMxR3Y2
	cJI6FjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQ51-0000000DWEQ-1zYs;
	Tue, 18 Jun 2024 04:04:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQ4x-0000000DWDB-1a0F
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jun 2024 04:04:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W3Cgy0XbqzxSKC;
	Tue, 18 Jun 2024 11:59:58 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id C23EF140159;
	Tue, 18 Jun 2024 12:04:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 12:04:07 +0800
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Gagan Sidhu <broly@mac.com>, Daniel Golle <daniel@makrotopia.org>
CC: Richard Weinberger <richard@nod.at>, ZhaoLong Wang
	<wangzhaolong1@huawei.com>, dpervushin <dpervushin@embeddedalley.com>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, yangerkun <yangerkun@huawei.com>, yi
 zhang <yi.zhang@huawei.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
 <E3E2C13C-1E52-46F2-BE2D-D2592C3369DB@mac.com>
 <F2DCFCE7-68FA-4C09-AE5B-09F2233575F1@mac.com>
 <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com>
 <303502000.252057.1718647746641.JavaMail.zimbra@nod.at>
 <90A90DA4-8B68-432D-9577-0D3635AF84BB@mac.com>
 <296007365.252185.1718649153090.JavaMail.zimbra@nod.at>
 <3841F21D-CA54-456C-9D9C-F06EEA332A30@mac.com>
 <136290141.252319.1718650375432.JavaMail.zimbra@nod.at>
 <ZnCcsPA-flVcxiAT@makrotopia.org>
 <C20708FB-0626-475E-A996-DE42ACF57A8B@mac.com>
 <C7514984-8CEB-4D1F-A896-BD6E653D311B@mac.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <251ae039-9f46-081b-a7ee-fe47de268865@huawei.com>
Date: Tue, 18 Jun 2024 12:03:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <C7514984-8CEB-4D1F-A896-BD6E653D311B@mac.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_210419_773790_960D2A2A 
X-CRM114-Status: GOOD (  23.78  )
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

5ZyoIDIwMjQvNi8xOCA2OjEzLCBHYWdhbiBTaWRodSDlhpnpgZM6CkhpLAo+IHNwb2tlIHRvIGEg
dXNlciwgZ2F2ZSBoaW0gYSBidWlsZCB3aXRob3V0IE1URF9HTFVFQkksIHJlc3RvcmluZyBjaGFu
Z2VzIG1hZGUgYnkgKEhBSEFIQSB5b3UgYXJlISBodWF3ZWkpLCBpdCBib290ZWQgZmluZS4KPiAK
Ck1heSBJIGhhdmUgdGhlIGxheWVycycgaW5mb3JtYXRpb24gYWJvdXQgbXRkL3ViaSwgeW91IGNh
biBnZXQgaXQgYnkgCidtdGRpbmZvIC1hJyBhbmQgJ3ViaW5mbyAtYScgYWZ0ZXIgYm9vdGluZyB0
aGUgZGV2aWNlLgpJIGd1ZXNzIHlvdXIgZGV2aWNlIGJvb3RzIGZyb20gdWJpYmxvY2swXzAuIFRo
ZXJlIGFyZSB0d28gd2F5cyBsb2FkaW5nIApib290aW5nIGRldmljZToKMS4gbXRkKG5hbmQpCiAg
ICB1YmkoaG9sZHMgdm9sdW1lIHViaTBfMCkKICAgIG10ZDEyIChnbHVlYmkpCiAgICBtdGRibG9j
azEyICAoVGhpcyB3YXkgaXMgY3V0IGJ5IHRoaXMgcGF0Y2gsIHNvIG10ZGJsb2NrMTIgaXMgbm90
IApnZW5lcmF0ZWQsIGp1c3QgbGlrZSBEYW5pZWwmUmljaGFyZCBhbmFseXplZCkKMi4gbXRkKG5h
bmQpCiAgICB1YmkoaG9sZHMgdm9sdW1lIHViaTBfMCkKICAgIHViaWJsb2NrMF8wCgo+IHNvIHdl
IG5lZWQgdG8gdGhpbmsgYWJvdXQgZWl0aGVyIGRlcHJlY2F0aW5nIEdMVUVCSSBvciBzZXR0aW5n
IGFuIG9wdGlvbiBpbiB0aGUgS2NvbmZpZyB0aGF0IGVuc3VyZXMgdGhleSBhcmUgbXV0dWFsbHkg
ZXhjbHVzaXZlLgo+IAo+IGdsdWViaSBpcyBkZWZpbml0ZWx5IGhpZ2hqYWNraW5nIHRoZSBibG9j
ayBkZXZpY2UgY3JlYXRlZCBieSBVQklfQkxPQ0sgYW5kIGFkZGluZyB0aGUgTVREX1VCSVZPTFVN
RSBmbGFnIHRvIGl0LgoKVGhlIGdsdWViaShtdGQpIGFuZCB1YmlibG9jayBjb3VsZCBleGlzdCBv
biB0aGUgc2FtZSBVQkkgdm9sdW1lIGF0IHRoZSAKc2FtZSB0aW1lLCBidXQgdGhleSBjYW5ub3Qg
YmUgb3BlbmVkIGF0IHRoZSBzYW1lIHRpbWUuIEhlcmUgaXMgYW4gCmV4YW1wbGUgSSB0ZXN0ZWQg
b24gdGhlIGxvY2FsIG1hY2hpbmU6CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAg4oaXIHViaWJsb2NrMF8wCm10ZDAobmFuZHNpbSkgLT4gdWJpMCAoaG9sZHMg
dm9sdW1lIHViaTBfMCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIOKGmCBnbHVlYmkobXRkMSkKCltyb290QGxvY2FsaG9zdCB+XSMgdWJpbmZvIC1hClVCSSB2
ZXJzaW9uOiAgICAgICAgICAgICAgICAgICAgMQpDb3VudCBvZiBVQkkgZGV2aWNlczogICAgICAg
ICAgIDEKVUJJIGNvbnRyb2wgZGV2aWNlIG1ham9yL21pbm9yOiAxMDo2MQpQcmVzZW50IFVCSSBk
ZXZpY2VzOiAgICAgICAgICAgIHViaTAKCnViaTAKVm9sdW1lcyBjb3VudDogICAgICAgICAgICAg
ICAgICAgICAgICAgICAxCkxvZ2ljYWwgZXJhc2VibG9jayBzaXplOiAgICAgICAgICAgICAgICAg
MTI2OTc2IGJ5dGVzLCAxMjQuMCBLaUIKVG90YWwgYW1vdW50IG9mIGxvZ2ljYWwgZXJhc2VibG9j
a3M6ICAgICA4MTkyICgxMDQwMTg3MzkyIGJ5dGVzLCA5OTIuMCBNaUIpCkFtb3VudCBvZiBhdmFp
bGFibGUgbG9naWNhbCBlcmFzZWJsb2NrczogMCAoMCBieXRlcykKTWF4aW11bSBjb3VudCBvZiB2
b2x1bWVzICAgICAgICAgICAgICAgICAxMjgKQ291bnQgb2YgYmFkIHBoeXNpY2FsIGVyYXNlYmxv
Y2tzOiAgICAgICAwCkNvdW50IG9mIHJlc2VydmVkIHBoeXNpY2FsIGVyYXNlYmxvY2tzOiAgMTYw
CkN1cnJlbnQgbWF4aW11bSBlcmFzZSBjb3VudGVyIHZhbHVlOiAgICAgMgpNaW5pbXVtIGlucHV0
L291dHB1dCB1bml0IHNpemU6ICAgICAgICAgIDIwNDggYnl0ZXMKQ2hhcmFjdGVyIGRldmljZSBt
YWpvci9taW5vcjogICAgICAgICAgICAyNDY6MApQcmVzZW50IHZvbHVtZXM6ICAgICAgICAgICAg
ICAgICAgICAgICAgIDAKClZvbHVtZSBJRDogICAwIChvbiB1YmkwKQpUeXBlOiAgICAgICAgZHlu
YW1pYwpBbGlnbm1lbnQ6ICAgMQpTaXplOiAgICAgICAgODAyNiBMRUJzICgxMDE5MTA5Mzc2IGJ5
dGVzLCA5NzEuOCBNaUIpClN0YXRlOiAgICAgICBPSwpOYW1lOiAgICAgICAgdm9sX2EKQ2hhcmFj
dGVyIGRldmljZSBtYWpvci9taW5vcjogMjQ2OjEKW3Jvb3RAbG9jYWxob3N0IH5dIyBtdGRpbmZv
IC1hCkNvdW50IG9mIE1URCBkZXZpY2VzOiAgICAgICAgICAgMgpQcmVzZW50IE1URCBkZXZpY2Vz
OiAgICAgICAgICAgIG10ZDAsIG10ZDEKU3lzZnMgaW50ZXJmYWNlIHN1cHBvcnRlZDogICAgICB5
ZXMKCm10ZDAKTmFtZTogICAgICAgICAgICAgICAgICAgICAgICAgICBOQU5EIHNpbXVsYXRvciBw
YXJ0aXRpb24gMApUeXBlOiAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbmQKRXJhc2VibG9j
ayBzaXplOiAgICAgICAgICAgICAgICAxMzEwNzIgYnl0ZXMsIDEyOC4wIEtpQgpBbW91bnQgb2Yg
ZXJhc2VibG9ja3M6ICAgICAgICAgIDgxOTIgKDEwNzM3NDE4MjQgYnl0ZXMsIDEwMjQuMCBNaUIp
Ck1pbmltdW0gaW5wdXQvb3V0cHV0IHVuaXQgc2l6ZTogMjA0OCBieXRlcwpTdWItcGFnZSBzaXpl
OiAgICAgICAgICAgICAgICAgIDUxMiBieXRlcwpPT0Igc2l6ZTogICAgICAgICAgICAgICAgICAg
ICAgIDY0IGJ5dGVzCkNoYXJhY3RlciBkZXZpY2UgbWFqb3IvbWlub3I6ICAgOTA6MApCYWQgYmxv
Y2tzIGFyZSBhbGxvd2VkOiAgICAgICAgIHRydWUKRGV2aWNlIGlzIHdyaXRhYmxlOiAgICAgICAg
ICAgICB0cnVlCgptdGQxCk5hbWU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9sX2EKVHlw
ZTogICAgICAgICAgICAgICAgICAgICAgICAgICB1YmkKRXJhc2VibG9jayBzaXplOiAgICAgICAg
ICAgICAgICAxMjY5NzYgYnl0ZXMsIDEyNC4wIEtpQgpBbW91bnQgb2YgZXJhc2VibG9ja3M6ICAg
ICAgICAgIDgwMjYgKDEwMTkxMDkzNzYgYnl0ZXMsIDk3MS44IE1pQikKTWluaW11bSBpbnB1dC9v
dXRwdXQgdW5pdCBzaXplOiAyMDQ4IGJ5dGVzClN1Yi1wYWdlIHNpemU6ICAgICAgICAgICAgICAg
ICAgMjA0OCBieXRlcwpDaGFyYWN0ZXIgZGV2aWNlIG1ham9yL21pbm9yOiAgIDkwOjIKQmFkIGJs
b2NrcyBhcmUgYWxsb3dlZDogICAgICAgICBmYWxzZQpEZXZpY2UgaXMgd3JpdGFibGU6ICAgICAg
ICAgICAgIHRydWUKCltyb290QGxvY2FsaG9zdCB+XSMgbHNibGsgfCBncmVwIHViaQp1YmlibG9j
azBfMCAyNTE6MCAgICAwIDk3MS45TSAgMCBkaXNrCgo+IAo+IHRoZXJlIGlzIG5vIG90aGVyIGV4
cGxhbmF0aW9uLgo+IAo+IGxvb2tzIGxpa2UgdGhpcyB3YXMgYW4gYWJzb2x1dGVseSBhbWF6aW5n
IGV4Y2hhbmdlIHRoYXQgZXZlbiBmdXJ0aGVyZWQgb3VyIHVuZGVyc3RhbmRpbmcgb2Ygd3RmIGlz
IGdvaW5nIG9uLgo+IAo+IHRoYW5rcyBmb3IgYmVpbmcgYSBncmVhdCBtb2RlcmF0b3IgZm9yIE1U
RCByaWNoCj4gCj4gVGhhbmtzLAo+IEdhZ2FuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
