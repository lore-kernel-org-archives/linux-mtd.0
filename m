Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E32E6688D
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Nov 2024 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4bn/IquN2y08t+Umxinz6PMqxAWM5ozBr4wOYKrZrM=; b=LtPIi/k+GYsggy
	Hb9xQbeN999vksgjFbGiXBzU3TblbsioPbO9pOukuahTY1qFHsguFd/7mdMtv+XFKb8WBsAHbGLqE
	o4TJHhh5iRTiKMySqet4wH0ZovHvTHzGCw4CEIWmcsTwCpCvwBOzmxWI6a88yogIAaux2L9rEL43C
	F/Zwa7OlULpWOg8QYCAyZflqfPsgGjwcfupdiMN1dGr1Uo8OsUq9JZ0N21q5LlULViwJZkZ83us1K
	t9/eiUXFGixTtHTmwJJeRniEMwafxlVze89M7Qd8Ar4I1Ozfhrb8qDMje3EWeYTdkSqHwsAPGAMJL
	vUcOR5l8CfE5OLl5if1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBCQ-00000005hfe-3j1F;
	Sun, 24 Nov 2024 11:54:46 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBCN-00000005hf9-0oiI
	for linux-mtd@lists.infradead.org;
	Sun, 24 Nov 2024 11:54:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE7DE1BF207;
	Sun, 24 Nov 2024 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732449278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xBZm4+sAGZjKcmTO3qVBfqyohXzmaieWRyYtQ1Du1yw=;
	b=JGPaVDaYrg2o1qKRAgDr60lqd8mow1PxaIPJtvFbdH6FhtvYud8Ifwn6x5NSawaU4ZcxcC
	1uwkvNsZU2oyOSNzWp7GeFZUFJK9dkJGDbu18+K7Vk/EcWwA7qgykg0pCe5TOxgcIWPiOi
	QnzblUPAm3LxahDeGPhLY89V5/noyUNHELRcmJuHVwMhg0tUjJlY6pFtvJfbx2AZZFa/nz
	UuZ4uZIazVLTXd9vuiwe0ZLi5gD5n7zgstFEw7khH3jWmY5bL4nRV4j7UZIUbgszW0/gWT
	+MhNN09eZYi8qOyb015ZxMwL+cSqLZ1Fla4TpRDC9f/RuvA9zglfAadi3Y++WA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
Cc: Michal Simek <michal.simek@amd.com>,  Jinjie Ruan
 <ruanjinjie@huawei.com>,  Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
  Naga Sureshkumar Relli <nagasure@xilinx.com>,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: arasan: Fix double assertion of chip-select
In-Reply-To: <Z0Iq9ex25MkwC_Cm@UBUNTU-PF54DSY0> (Maciej Andrzejewski's message
	of "Sat, 23 Nov 2024 20:20:21 +0100")
References: <Z0Iq9ex25MkwC_Cm@UBUNTU-PF54DSY0>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sun, 24 Nov 2024 12:54:36 +0100
Message-ID: <87wmgsdeyr.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_035443_365337_6FC7A6E7 
X-CRM114-Status: GOOD (  10.49  )
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

SGkgTWFjaWVqLAoKT24gMjMvMTEvMjAyNCBhdCAyMDoyMDoyMSArMDEsIE1hY2llaiBBbmRyemVq
ZXdza2kgPG1hY2llai5hbmRyemVqZXdza2lAbS13b3Jrcy5uZXQ+IHdyb3RlOgoKPiBXaGVuIHR3
byBjaGlwLXNlbGVjdHMgYXJlIGNvbmZpZ3VyZWQgaW4gdGhlIGRldmljZSB0cmVlLCBhbmQgdGhl
IHNlY29uZCBpcwo+IGEgbm9uLW5hdGl2ZSBHUElPLCBib3RoIHRoZSBHUElPLWJhc2VkIGNoaXAt
c2VsZWN0IGFuZCB0aGUgZmlyc3QgbmF0aXZlCj4gY2hpcC1zZWxlY3QgbWF5IGJlIGFzc2VydGVk
IHNpbXVsdGFuZW91c2x5LiBUaGlzIGRvdWJsZSBhc3NlcnRpb24gY2F1c2VzCj4gaW5jb3JyZWN0
IHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlvbnMuCj4KPiBUaGUgaXNzdWUgb2NjdXJzIGJlY2F1c2Ug
d2hlbiBuZmMtPm5jcyA8PSAyLCBuZmMtPnNwYXJlX2NzIGlzIGFsd2F5cwo+IGluaXRpYWxpemVk
IHRvIDAgZHVlIHRvIHN0YXRpYyBpbml0aWFsaXphdGlvbi4gQ29uc2VxdWVudGx5LCB3aGVuIHRo
ZQo+IHNlY29uZCBjaGlwLXNlbGVjdCAoR1BJTy1iYXNlZCkgaXMgc2VsZWN0ZWQgaW4gYW5mY19h
c3NlcnRfY3MoKSwgaXQgaXMKPiBkZXRlY3RlZCBieSBhbmZjX2lzX2dwaW9fY3MoKSwgYW5kIG5m
Yy0+bmF0aXZlX2NzIGlzIGFzc2lnbmVkIHRoZSB2YWx1ZSAwLgo+IFRoaXMgcmVzdWx0cyBpbiBi
b3RoIHRoZSBHUElPLWJhc2VkIGNoaXAtc2VsZWN0IGJlaW5nIGFzc2VydGVkIGFuZCB0aGUKPiBO
QU5EIGNvbnRyb2xsZXIgcmVnaXN0ZXIgcmVjZWl2aW5nIDAsIGVycm9uZW91c2x5IHNlbGVjdGlu
ZyB0aGUgbmF0aXZlCj4gY2hpcC1zZWxlY3QuCj4KPiBUaGlzIHBhdGNoIHJlc29sdmVzIHRoZSBp
c3N1ZSwgYXMgY29uZmlybWVkIGJ5IG9zY2lsbG9zY29wZSB0ZXN0aW5nIHdpdGgKPiBjb25maWd1
cmF0aW9ucyBpbnZvbHZpbmcgdHdvIG9yIG1vcmUgY2hpcC1zZWxlY3RzIGluIHRoZSBkZXZpY2Ug
dHJlZS4KPgoKT2sgdG8gbWUsIGNhbiB5b3UgcGxlYXNlIHNlbmQgYSB2MiB3aXRoIGNvcnJlY3Qg
Rml4ZXMgYW5kIENjOiBzdGFibGUKdGFncywgcGxlYXNlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
