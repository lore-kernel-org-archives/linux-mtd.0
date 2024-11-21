Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB3BD711CA
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WtH2DmrLRf+NHtGuo4O5mutXmOKaqOW1vLEPDVe46k4=; b=jMwSysZkipEAykQ/yzfqmE/7OM
	tIwoLJ+nUdOoLNLAPTgtasl17M1hdRWifGc88a9jSZT4EysZXOwIeP9pL/I7CidP2p1RcHBkgjwkx
	0X8O8CT5Y6L6rel+c7HD8yturARGE/RdnDPNapOFlkDE519FDdV1VtBfbjuqufR84dO6KA4H5GUCI
	hAgv1XlZA4/3lvyi6hf+jwcklYFwMBYOXVXQaCV33qGfJc4lnWlvmsFS3qO1E9tz600WVsMqqQtJe
	RySxkhxc2+CxD1Wv8EBVHkZHLJpgLlVM4A5bqZ1+sueuSXW9RWMJu1XqfcNZXUgrE3TeO1dWO2Fws
	bYVi8Jbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4ZI-0000000HNey-41fD;
	Thu, 21 Nov 2024 10:37:48 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4ZG-0000000HNdW-0849
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 10:37:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E73022BFA25;
	Thu, 21 Nov 2024 11:37:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8Vmv9G1jRBxg; Thu, 21 Nov 2024 11:37:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 85A2E2BFA55;
	Thu, 21 Nov 2024 11:37:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BkmKxaUje48R; Thu, 21 Nov 2024 11:37:34 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 633E52BFA25;
	Thu, 21 Nov 2024 11:37:34 +0100 (CET)
Date: Thu, 21 Nov 2024 11:37:34 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <rickard.andersson@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <308788156.51756690.1732185454130.JavaMail.zimbra@nod.at>
In-Reply-To: <20241121102157.3498056-1-rickard.andersson@axis.com>
References: <20241121102157.3498056-1-rickard.andersson@axis.com>
Subject: Re: [PATCH 1/2] ubi: Expose interface for reading erase counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Expose interface for reading erase counters
Thread-Index: TbrL645gFgEZzEVnjvYJ5vvht9Q0Bw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_023746_213765_2CBF98E1 
X-CRM114-Status: UNSURE (   4.65  )
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

Umlja2FyZCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJSaWNrYXJk
IFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4gQW46ICJyaWNoYXJk
IiA8cmljaGFyZEBub2QuYXQ+LCAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LAo+ICJyaWNr
YXJkMzE0IGFuZGVyc3NvbiIgPHJpY2thcmQzMTQuYW5kZXJzc29uQGdtYWlsLmNvbT4KPiBDQzog
IlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4sICJrZXJu
ZWwiIDxrZXJuZWxAYXhpcy5jb20+Cj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDIxLiBOb3ZlbWJl
ciAyMDI0IDExOjIxOjU2Cj4gQmV0cmVmZjogW1BBVENIIDEvMl0gdWJpOiBFeHBvc2UgaW50ZXJm
YWNlIGZvciByZWFkaW5nIGVyYXNlIGNvdW50ZXJzCgo+IFVzaW5nIHRoZSBpb2N0bCBjb21tYW5k
ICdVQklfSU9DRUNORk8nIHVzZXIgc3BhY2UgY2FuIG9idGFpbiBtZWFuCj4gYW5kIG1heCBlcmFz
ZSBjb3VudGVycyBvZiBhIGRldmljZS4gSWYgZmFzdG1hcCBpcyBlbmFibGVkIGFsc28gZXJhc2UK
PiBjb3VudGVyIGluZm9ybWF0aW9uIG9mIHRoYXQgYXJlYSBhbmQgaXRzIGNvbXBsZW1lbnRhcnkg
YXJlYSBpcwo+IHByb3ZpZGVkLgoKdGhlIGlkZWEgd2FzIGhhdmluZyBhbiBpb2N0bCBpbnRlcmZh
Y2UgdG8gZ2V0IHRoZSBFQyBjb3VudGVycyBvZiBhbGwgUEVCcy4KU3VjaCB0aGF0IHVzZXJzcGFj
ZSBjYW4gZG8gdGhlIG1lYW4vbWF4L21pbiBjYWxjdWxhdGlvbnMgb24gaXQncyBvd24uClRoYXQg
d2F5IHRoZSBrZXJuZWwgaW50ZXJmYWNlIGlzIGNsZWFuIGFuZCBnZW5lcmljLiBVc2Vyc3BhY2Ug
Y2FuIGludGVycHJldAp0aGUgZGF0YSBhcyBpdCBuZWVkcy4KClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
