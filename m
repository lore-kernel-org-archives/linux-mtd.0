Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AED7C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 13:16:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098CA206BE
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 13:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="levhIb19";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WT2ocYCh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 098CA206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Klkh1y+vTxPIfkXWRb7WdYiMsL02OO+Ye4P7ulBiF/M=; b=levhIb19J0NbVY542LMvXt5ej
	FjXRtlb2uTCLJx2RA1pJUvl8MPAmgRkJXRh4rSBtkffMS+D985HEFMNpB+YVDzSkXX1hRZaojnuZ3
	2qjt7Gw59l29VpqbkY+a61/I8mb6P4tK1zqOGeBZwRZekShP/PjmOCfNi9dc6wJnRjMj4QDn10PKw
	lU6Q0t7+smyGE7J5KBP4JeOzQASoMgaQ4lVBnOSzvkbZcEeLD8BXw3kNQ8qe+rsfzDVj+RIC3/98i
	1mCwJe2QfkmD24XIXnw0aetAN0BtRx6T6HBmit5aXXoOVW5Aftqa+Dbk1COarOPL2fdTqiFXkW+uT
	9KuLIeuvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqG73-0001vJ-IT; Tue, 30 Jun 2020 13:15:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqG71-0001v7-PP
 for linux-mtd@merlin.infradead.org; Tue, 30 Jun 2020 13:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=IKki1jk+2ciKSX9+TJn82ETUqubvSx/CvAFU3QnpCaE=; b=WT2ocYChLuH6XnfYfCO4T3bzTQ
 F5S6pvNK8nLfYKcYJ8SpdOUvHF5fbOqyqI7ZKZxqHBF+Gr77J0f3oml8PgV/5Fjh5rHVG/+ieNTI0
 Sf+fPVpAgsIujX8hPgQQcnKAIqqDoNucp2V5l0XKbCzRc9RJuO7avFO/GPu4rVGoWNc70OkNfyFu3
 R7ZwbHHkMV7xAWKEtgiG4Nx1QicT4KsF3NanX+mY0BFVx2YwkQT9GP1ZN7Itx1Sk2645As6V7Yf52
 P1g8b7jV96EWt53WcWGaaHMmUPF+Y7BwJKREhxFcDJRj2QReZ3TQys+KuxKUT1LvCxLXJiEJmRzNT
 JVDoOxDw==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqG6a-0006eF-Cm
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 13:15:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0F6B5607400F;
 Tue, 30 Jun 2020 15:15:03 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JJxR3CV9DT85; Tue, 30 Jun 2020 15:15:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CD19A6074029;
 Tue, 30 Jun 2020 15:15:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rqyz6CPgndyz; Tue, 30 Jun 2020 15:15:01 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9FD5F607400F;
 Tue, 30 Jun 2020 15:15:01 +0200 (CEST)
Date: Tue, 30 Jun 2020 15:15:01 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Message-ID: <25305185.75764.1593522901565.JavaMail.zimbra@nod.at>
In-Reply-To: <20200630130438.141649-1-houtao1@huawei.com>
References: <20200630130438.141649-1-houtao1@huawei.com>
Subject: Re: [PATCH 0/3] fixes for ubifs xattr operations
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: fixes for ubifs xattr operations
Thread-Index: CfSc5wZdeL5RbiJcq3LDt/16cOUiFA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_141531_042672_A4E75920 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGFvLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkhvdSBUYW8iIDxo
b3V0YW8xQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAibGlu
dXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gQ0M6ICJIb3UgVGFvIiA8
aG91dGFvMUBodWF3ZWkuY29tPgo+IEdlc2VuZGV0OiBEaWVuc3RhZywgMzAuIEp1bmkgMjAyMCAx
NTowNDozNQo+IEJldHJlZmY6IFtQQVRDSCAwLzNdIGZpeGVzIGZvciB1YmlmcyB4YXR0ciBvcGVy
YXRpb25zCgo+IEhpLAo+IAo+IFRoZSBwYXRjaCBzZXQgdHJpZXMgdG8gZml4IHRoZSByYWNlIGJl
dHdlZW4gdWJpZnMgeGF0dHIgcmVhZAo+IG9wZXJhdGlvbnMgYW5kIHdyaXRlIG9wZXJhdGlvbnMu
Cj4gCj4gTm93IGlub2RlX2xvY2soKSBpcyBhY3F1aXJlZCBkdXJpbmcgeGF0dHIgd3JpdGUgb3Bz
IChzZXQgJiByZW1vdmUpLAo+IGhvd2V2ZXIgbm8gZXh0cmEgbG9jayBpcyB0YWtlbiBpbiB4YXR0
ciByZWFkIG9wcyAobGlzdCAmIGdldCksIGFuZAo+IGl0IGxlYWRzIHRvIHRocmVlIHByb2JsZW1z
Ogo+IAo+ICgxKSB1Ymlmc19saXN0eGF0dHIoKSBtYXkgaW5jdXIgbWVtb3J5IGNvcnJ1cHRpb24g
YW5kIGFzc2VydGlvbiBmYWlsdXJlCj4gCj4gKDIpIHViaWZzX3hhdHRyX2dldCgpIG1heSBpbmN1
ciBhc3NlcnRpb24gZmFpbHVyZQo+IAo+ICgzKSB1Ymlmc194YXR0cl9nZXQoKSBtYXkgcmV0dXJu
IGEgc3RhbGUgeGF0dHIgdmFsdWUKPiAKPiBUbyBmaXggaXQsIGluc3RlYWQgb2YgYWRkaW5nIGEg
eGF0dHItcmVsYXRlZCByd3NlbSBmb3IgdWJpZnMgaW5vZGUsCj4gd2UgZGVjaWRlIHRvIGZpeCB0
aGVzZSBwcm9ibGVtcyBzaW1wbHkgYW5kIHN0aWxsIGRvIHhhdHRyIHJlYWQgb3BlcmF0aW9uCj4g
bG9ja2xlc3NseS4gVGhlIG1ham9yIGNvbmNlcm4gaXMgdGhhdCB4YXR0ciByZWFkIG9wZXJhdGlv
bnMgKGxpc3QgJiBnZXQpCj4gbWF5IHJldHVybiB4YXR0ciBuYW1lcyBvciB2YWx1ZXMgd2hpY2gg
aXMgc3RpbGwgaW4gY3JlYXRpb24gb3IgcmVtb3ZhbAo+IHByb2Nlc3MsIGJ1dCB3ZSB0aGluayB0
aGF0J3MgT0sgYmVjYXVzZSBubyBzdGFsZSBuYW1lIG9yIHZhbHVlIGlzCj4gcmV0dXJuZWQsIGp1
c3QgZWl0aGVyIHRoZSBvbGQgb25lcyBvciB0aGUgbmV3IG9uZXMuCj4gCj4gQ29tbWVudHMgYXJl
IHdlY2xvbWUuCgpUaGFua3MgYSBsb3QgZm9yIGRpZ2dpbmcgaW50byB0aGlzLgpEbyB5b3UgaGF2
ZSBhIHRlc3QgZm9yIHRoaXM/ICh4ZnN0ZXN0IHByZWZlcmVkKS4KCkknbSBhIGJpdCBzdXJwcmlz
ZWQgdGhhdCB0aGlzIGNhbiBhY3R1YWxseSBoYXBwZW4sIEkgd2FzIHVuZGVyIHRoZSBpbXByZXNz
aW9uCnRoYXQgdmZzIGNhcmVzIGFib3V0IHRoaXMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
