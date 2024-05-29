Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE73C27C43
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 02:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjfTPZDTw6RuSHLO9OiPTB/TcBb4brBO5DsV7u71MgI=; b=G36GdMLjXnuV5NgbkYCIwFm4HS
	DFe+aAXScjcJBE9JVimdubTqjWm0dhQyESxQ75zRCDDRc5Etmp0jqJiPFBTd0FKjVWAVw196FkWrV
	+Hgz3p1lpsDouNHLMk2avOent3Hoh4rdvWbmD1Mq+x6+0URHM4AT7HQxyf8eP+cqOoOCZrK/3k44g
	hkUldRECSLZKO0BUQQGn2DhMqD2mZEgc3llydBjywq8562PZdCAHpHXqXk+p6351wLuI4e/ac6/b2
	+yq0W/SBYN4KwuNFtD6byaR1mDXL9VskXZw5iKxH8Z3uqS2nEL7RGDPdwpWXXoHGhi8luLDvfAGAZ
	MAOp213Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9Ve-00000002eRA-2xhH;
	Wed, 29 May 2024 02:57:50 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9Vb-00000002eQG-1o1j
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 02:57:49 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4VpvCk6VZwz1xrvP
	for <linux-mtd@lists.infradead.org>; Wed, 29 May 2024 10:56:18 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id CF3E61A016C
	for <linux-mtd@lists.infradead.org>; Wed, 29 May 2024 10:57:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 10:57:35 +0800
Subject: Re: UBIFS Recovery Process on Power Cutoff
To: Mani K <manivalaguru@gmail.com>, <linux-mtd@lists.infradead.org>
References: <CAGhZNMM8DpbuKX==XrM_xBYuL4S5VAgezSupGN-FHd+ENq+ang@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1414abb0-43b2-8f78-54f3-b80504effebd@huawei.com>
Date: Wed, 29 May 2024 10:57:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAGhZNMM8DpbuKX==XrM_xBYuL4S5VAgezSupGN-FHd+ENq+ang@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_195747_655497_DC9EABFD 
X-CRM114-Status: GOOD (  14.00  )
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

1NogMjAyNC81LzI4IDE4OjMyLCBNYW5pIEsg0LS1wDoKPiBIZWxsbywKPiAKPiBXZSBoYXZlIGEg
c3lzdGVtIGJhc2VkIG9uIGEgQ3VzdG9tIEFSTSBTT0MgcnVubmluZyBvbiBhIExpbnV4IGtlcm5l
bAo+IHdpdGggYSBVQklGUyBmaWxlc3lzdGVtIG1haW50YWluZWQgb24gTk9SIGZsYXNoLiBXaGVu
IHRoZSBzeXN0ZW0gcG93ZXIKPiBpcyBjdXQgb2ZmIGFicnVwdGx5LCB3ZSBub3RpY2UgcmVjb3Zl
cnktcmVsYXRlZCBtZXNzYWdlcyB3aGVuIHRoZQo+IGZpbGVzeXN0ZW0gaXMgbW91bnRlZC4gVGhp
cyByZWNvdmVyeSBwcm9jZXNzIHRha2VzIGFkZGl0aW9uYWwgYm9vdAo+IHRpbWUgb2YgMi0zIHNl
Y29uZHMuCj4gCj4gSGVyZSBhcmUgdGhlIGxvZyBtZXNzYWdlcyB3ZSBvYnNlcnZlOgo+IFsgICAg
NC40MTE1NTFdIHViaTA6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0ZWQsIFBJ
RCA1ODYKPiBbICAgIDcuMTkxNDA2XSBVQklGUyAodWJpMDowKTogTW91bnRpbmcgaW4gdW5hdXRo
ZW50aWNhdGVkIG1vZGUKPiBbICAgIDcuMTk3NjU5XSBVQklGUyAodWJpMDowKTogYmFja2dyb3Vu
ZCB0aHJlYWQgInViaWZzX2JndDBfMCIgc3RhcnRlZCwgUElEIDY2Mwo+IFsgICAgNy4yMTI3MzBd
IFVCSUZTICh1YmkwOjApOiByZWNvdmVyeSBuZWVkZWQKPiBbICAgIDcuOTUxNTQ2XSBVQklGUyAo
dWJpMDowKTogcmVjb3ZlcnkgY29tcGxldGVkCj4gWyAgICA3Ljk1NjI4MF0gVUJJRlMgKHViaTA6
MCk6IFVCSUZTOiBtb3VudGVkIFVCSSBkZXZpY2UgMCwgdm9sdW1lIDAsIG5hbWUgImFwcCIKPiBb
ICAgIDcuOTYzNjIwXSBVQklGUyAodWJpMDowKTogTEVCIHNpemU6IDY1NDA4IGJ5dGVzICg2MyBL
aUIpLAo+IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczogOCBieXRlcy8yNTYgYnl0ZXMKPiBbICAg
IDcuOTczMjI2XSBVQklGUyAodWJpMDowKTogRlMgc2l6ZTogMTU4Mjg3MzYgYnl0ZXMgKDE1IE1p
QiwgMjQyCj4gTEVCcyksIGpvdXJuYWwgc2l6ZSAyMjg5MjgwIGJ5dGVzICgyIE1pQiwgMzUgTEVC
cykKPiBbICAgIDcuOTgzODc0XSBVQklGUyAodWJpMDowKTogcmVzZXJ2ZWQgZm9yIHJvb3Q6IDAg
Ynl0ZXMgKDAgS2lCKQo+IFsgICAgNy45ODk4MjddIFVCSUZTICh1YmkwOjApOiBtZWRpYSBmb3Jt
YXQ6IHc0L3IwIChsYXRlc3QgaXMgdzUvcjApLAo+IFVVSUQgMDAwMDAwMDAtMDAwMC0wMDA4LTAw
MDAtMDAwMDAwMDAwMDAxLCBzbWFsbCBMUFQgbW9kZWwKPiAKPiBJcyB0aGVyZSBhbnkgb3B0aW9u
IHRvIHByZXZlbnQgdGhlIHJlY292ZXJ5IHByb2Nlc3MgZnJvbSBoYXBwZW5pbmc/Cj4gCgpVQklG
UyBtYWtlcyBpdCBiZSBjb25zaXN0ZW50IGFnYWluIGJ5IHJlcGxheWluZyBqb3VybmFsKHJlY292
ZXJ5LXJlbGF0ZWQgCm1lc3NhZ2VzLiBUaGUgYWltIG9mIHJlY292ZXJ5IGlzIHRvIHVwZGF0ZSB0
aGUgbWV0YWRhdGEsIG90aGVyd2lzZSB0aGUgCnVzZXJkYXRhIGNvdWxkIGJlIGxvc3QvY29ycnVw
dGVkIGZvciB0aGUgc3RhbGUgbWV0YWRhdGEpLCB0aGUgZmlsZXN5c3RlbSAKaW1hZ2UgY291bGQg
YmVjb21lIGluY29uc2lzdGVudCBpZiBVQklGUyBza2lwcyB0aGUgcmVjb3ZlcnksIHNvIEkgdGhp
bmsgCnN0b3BwaW5nIHJlY292ZXJ5IGlzIG5vdCByaWdodC4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
