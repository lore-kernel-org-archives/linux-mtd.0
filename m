Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2F8C3DA60
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNQMx3J5CVgj/15CoVPSiZR8mWKrv/ui2yw+acBDZFw=; b=RMPi9QbwdW23gMUzG9pdNGyNaf
	SseHPc8WYRdLpyStk89hk7U6GsQpdVl3mS12toX3L6Vyp2Ht1VcIal7nygBohifDaWhthqR+XpoZ9
	bP6hjwfn7ciphKZc9r+xUZjOqh3DBYjhLekNvNwq5DhJApPqYOcYhGxW54CQwoYQJn+HLPGgobRl2
	UYht2oXJ6wF80FGCMz9T6XZ+4OQM6WJsf11300Z/grVhPZy5lBc5Rb16q9VfoDab+iqsMb3IxLxCH
	uQZOAL0s4TQgNELe9Xf63F2VeHmqgpotKrjuJazyM8YjwV3gGXhR+CzsUqXgFfzpJ2hcaY7bII1mU
	nTKBUD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULbR-0000000GCKZ-2dhd;
	Thu, 18 Jul 2024 07:31:01 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULb9-0000000GC8k-36dk
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 07:30:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WPkrB6VCnz28fYF;
	Thu, 18 Jul 2024 15:26:18 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 22CE61A0170;
	Thu, 18 Jul 2024 15:30:38 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 15:30:37 +0800
Subject: Re: [BUG REPORT] potential deadlock in inode evicting under the inode
 lru traversing context on ext4 and ubifs
To: Ryder Wang <rydercoding@hotmail.com>, Theodore Ts'o <tytso@mit.edu>,
	Zhihao Cheng <chengzhihao@huaweicloud.com>
CC: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Christoph Hellwig
	<hch@infradead.org>, linux-mtd <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, "zhangyi (F)" <yi.zhang@huawei.com>, yangerkun
	<yangerkun@huawei.com>, "wangzhaolong (A)" <wangzhaolong1@huawei.com>
References: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
 <20240712143708.GA151742@mit.edu>
 <MEYP282MB3164B39D532251DC6C36B652BFAC2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <10db909b-1b42-82f1-4ca3-3079e66ac7d3@huawei.com>
Date: Thu, 18 Jul 2024 15:30:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB3164B39D532251DC6C36B652BFAC2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_003044_501829_CA9C9BE9 
X-CRM114-Status: GOOD (  11.19  )
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

1NogMjAyNC83LzE4IDExOjA0LCBSeWRlciBXYW5nINC0tcA6CkhpLCBSeWRlcgo+PiBVbSwgSSBk
b24ndCBzZWUgaG93IHRoaXMgY2FuIGhhcHBlbi4gIElmIHRoZSBlYV9pbm9kZSBpcyBpbiB1c2Us
Cj4+IGlfY291bnQgd2lsbCBiZSBncmVhdGVyIHRoYW4gemVybywgYW5kIGhlbmNlIHRoZSBpbm9k
ZSB3aWxsIG5ldmVyIGJlCj4+IGdvIGRvd24gdGhlIHJlc3Qgb2YgdGhlIHBhdGggaW4gaW5vZGVf
bHJ1X2lub2RlKCk6Cj4+Cj4+ICAgICAgICAgIGlmIChhdG9taWNfcmVhZCgmaW5vZGUtPmlfY291
bnQpIHx8Cj4+ICAgICAgICAgICAgICAuLi4pIHsKPj4gICAgICAgICAgICAgICAgICBsaXN0X2xy
dV9pc29sYXRlKGxydSwgJmlub2RlLT5pX2xydSk7Cj4+ICAgICAgICAgICAgICAgICAgc3Bpbl91
bmxvY2soJmlub2RlLT5pX2xvY2spOwo+PiAgICAgICAgICAgICAgICAgIHRoaXNfY3B1X2RlYyhu
cl91bnVzZWQpOwo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBMUlVfUkVNT1ZFRDsKPj4gICAg
ICAgICAgfQo+IAo+IFllcywgaW4gdGhlIGZ1bmN0aW9uIGlub2RlX2xydV9pbm9kZSAoaW4gY2Fz
ZSBvZiBjbGVhcmluZyBjYWNoZSksIHRoZXJlIGhhcyBiZWVuIHN1Y2ggaW5vZGUtPmlfc3RhdGUg
Y2hlY2sgbWVjaGFuaXNtIHRvIGF2b2lkIGRvdWJsZS1yZW1vdmluZyB0aGUgaW5vZGUgd2hpY2gg
aXMgYmVpbmcgcmVtb3ZlZCBieSBhbm90aGVyIHByb2Nlc3MuIFVubHVja2lseSwgbm8gc3VjaCBz
aW1pbGFyIGlub2RlLT5pX3N0YXRlIGNoZWNrIG1lY2hhbmlzbSBpbiB0aGUgZnVuY3Rpb24gaXB1
dF9maW5hbCAoaW4gY2FzZSBvZiByZW1vdmluZyBmaWxlKSwgc28gZG91YmxlLXJlbW92aW5nIGlu
b2RlIGNhbiBzdGlsbCBhcHBlYXIuCgpJJ20gYSBsaXR0bGUgY29uZnVzZWQgYWJvdXQgdGhlIHBy
b2Nlc3Mgb2YgaW5vZGUgZG91YmxlLXJlbW92aW5nLCBjYW4gCnlvdSBwcm92aWRlIGEgZGV0YWls
ZWQgY2FzZSBhYm91dCBob3cgZG91YmxlLXJldmVtb3ZpbmcgaGFwcGVucz8gSSBjYW4ndCAKZmlu
ZCB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4gaW5vZGUgZG91YmxlLXJlbW92aW5nIGFuZCB0aGUg
cHJvYmxlbSBpIApkZXNjcmliZWQuCj4gCj4gSXQgbG9va3Mgd2UgbmVlZCB0byBhZGQgc29tZSBp
bm9kZS0+aV9zdGF0ZSBjaGVjayBpbiBpcHV0X2ZpbmFsKCkgLCBpZiB3ZSB3YW50IHRvIGZpeCB0
aGlzIHJhY2UgY29uZGl0aW9uIGJ1Zy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
