Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DB0CA0FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 09:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B1ijOMTU8PwHIvYxRD2B9FgnjL7bD9cT11i6p7+MILQ=; b=ZFm7O5z027Yy7mYD3qgEVKyPdf
	rlNuGudilWvw9/xkAxtPyqLWtBLIA3/6HCCEqd1KQlJud2c4yvIa18fpTD3Nw5QzsOtt1XGTdH/8m
	bvXi5Aytym/JZ9QX2b3rrwgNFmiAWUZT+lPiVi2cUP0ruFD3HucT3QwkE0EMjmo6zAMe2WH5/wZUS
	Buy/NLCUyxVt90S4CvS39HT6WgiSMkWdtHZujLeKYG91Yl3czcZX0wFigCihaFVa6Gshwrh0FHJAb
	4f4KOrk9lH3bOT0TU4ekNkCi4gAjHtV7jKPqzIe4kpHl5d+NZRAT+CtdEQhzbNQBPBQUFPfJnae6V
	d3NwrYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0c4-00Gl6l-18;
	Fri, 01 Sep 2023 09:38:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0c0-00Gl53-1A
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 09:38:46 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 982EC635DB44;
	Fri,  1 Sep 2023 11:38:39 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id u0jqJb8Rxbvy; Fri,  1 Sep 2023 11:38:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 18F3B635DB45;
	Fri,  1 Sep 2023 11:38:39 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FV2b1RgP5yeP; Fri,  1 Sep 2023 11:38:39 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id EC844635DB44;
	Fri,  1 Sep 2023 11:38:38 +0200 (CEST)
Date: Fri, 1 Sep 2023 11:38:38 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jan Kara <jack@suse.cz>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, Yu Hao <yhao016@ucr.edu>
Message-ID: <1877357554.4324.1693561118827.JavaMail.zimbra@nod.at>
In-Reply-To: <26cd7b8f-abcc-410f-a7c7-e691999f4e3b@linaro.org>
References: <20230831111100.26862-1-jack@suse.cz> <26cd7b8f-abcc-410f-a7c7-e691999f4e3b@linaro.org>
Subject: Re: [PATCH] ubi: Reject device with erasesize 0
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reject device with erasesize 0
Thread-Index: h/iJEwAu1brtz5jDhLs2irRl1QOIbw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_023844_560912_FD86944A 
X-CRM114-Status: UNSURE (   6.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlR1ZG9yIEFtYmFydXMiIDx0
dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4gQW46ICJKYW4gS2FyYSIgPGphY2tAc3VzZS5jej4s
ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZz4sICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJZdSBI
YW8iIDx5aGFvMDE2QHVjci5lZHU+Cj4gR2VzZW5kZXQ6IEZyZWl0YWcsIDEuIFNlcHRlbWJlciAy
MDIzIDExOjI1OjExCj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gdWJpOiBSZWplY3QgZGV2aWNlIHdp
dGggZXJhc2VzaXplIDAKCj4gSGksIFJpY2hhcmQsCj4gCj4gT24gOC8zMS8yMyAxMjoxMSwgSmFu
IEthcmEgd3JvdGU6Cj4+IEluIHByaW5jaXBsZSBNVEQgZGV2aWNlIHdpdGggZXJhc2VzaXplIDAg
Y2FuIGV4aXN0IGFuZCBpdCBpcyBwb3NzaWJsZSB0byBjcmVhdGUKPj4gdGhlbSBlLmcuIHZpYSBL
Vk0uIElmIHRoYXQgaGFwcGVucyBVQkkgbGF5ZXIgY3VycmVudGx5IGNyYXNoZXMKPiAKPiBtdGQg
ZGV2aWNlcyBhcmUgb3JnYW5pemVkIGluIGVyYXNlIGJsb2NrcywgaGF2aW5nIGEgbXRkIHdpdGgg
ZXJhc2UKPiBzaXplIHplcm8gbG9va3Mgc3VzcGljaW91cyB0byBtZS4gRG8geW91IGtub3cgaWYg
dGhlcmUgYXJlIGFueSBtdGQKPiBkZXZpY2VzIHdpdGggZXJhc2VzaXplIG9mIHplcm8/CgpZZXMu
IFRoZXJlIGFyZS4gU28sIHRoZSBmaXggaXMgZmluZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
