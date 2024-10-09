Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AFCCEDD90
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93lAudM2/MqD8mAwUNRDBLaGyhBmTP0tqjCMHJv3Sc4=; b=I8gnwU4R0n9g+c
	wpMSxQI3ib1g/lnHqDeny3cRrMsUcdnM8J2quWeGGYz84QnIjBEF8G3m0ckBIHde5pGnUeRk0ZkSM
	LsJhD+GXqCf31cMhVZa8/t6fUSMm6oE+Sb2eiHjMlHYTt1D1djn8/Wmtm+Hfmp3dtrYgN7y3q0iRa
	wMINl8Bc7FyNpPUrOZ6Lk5FWyrdQbHJJgfd87aP9UaCH9Ah8DiZX+OQlfIXhQko1UU1scStCFqMIB
	NgW/KvYjcUu/aMf48P0rMyESAnDrQW3z1IYJ49rrVroaitroikXG5Tg0GV1TcRa58i1F0LudoEaoO
	oINlDu3rOzu0OXQM24bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8o-00000009Hgf-1wTZ;
	Wed, 09 Oct 2024 12:50:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW7p-00000009HLw-2rE5
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 12:49:16 +0000
Date: Wed, 9 Oct 2024 14:49:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728478147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0sgPMJhOW6eJMRrZ4pHVDQ9X2cnNDYkKj8bcVLLLuY=;
	b=bUbVY4G7mSoj4ksrm91PeIb2PL+BQfiWG2VDmq381RERbWIKjUCIi3h2TzXDcKKbPmRg30
	ENTe4LAMnMDr0edKlWBVtyEjrb3mdfR/woi9uWVKwjdtE/QXLOwFF23EH8aikJYuhkx3BH
	tnZBufSoG8UPDN/jizyfuc+qdlrjJInisz1c3Lj3r2nUT7PwMD3QyBfFvi/Fl8EPkACPFV
	PH6V+8CD2wN40UvsTehdEEE7wbMcBd6h4IR8gWBL3jdeyQeKDbedEh7xIdOh2Q4CZk+pP0
	0HUkCzgIC+E98VMKFt1K+dIC51BHTCCyVK7ZfqukYCkdoY5Ajty7XLZBO2ICOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728478147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0sgPMJhOW6eJMRrZ4pHVDQ9X2cnNDYkKj8bcVLLLuY=;
	b=9KTLBrSylq9Agd5Jwops+y4ewA1GSn2oYc5hCZZ2pJU8OBQCtqqTOXw8u6+wEgc+eb59qf
	uxJzDme1S5viCWDA==
From: Benedikt Spranger <b.spranger@linutronix.de>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/1] ubifs: Try to recover from missing znode
Message-ID: <20241009144900.367f9cb4@mitra>
In-Reply-To: <351bdd98-98ac-036f-4685-56e88a102cf3@huawei.com>
References: <20241008133342.1937674-1-b.spranger@linutronix.de>
	<0840be30-63bc-449d-a9a4-c4e6b54c8885@huawei.com>
	<883601802.30668.1728453832223.JavaMail.zimbra@nod.at>
	<351bdd98-98ac-036f-4685-56e88a102cf3@huawei.com>
Organization: Linutronix GmbH
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_054910_007465_23079F47 
X-CRM114-Status: GOOD (  16.13  )
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

T24gV2VkLCA5IE9jdCAyMDI0IDE4OjQ2OjQzICswODAwClpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+IHdyb3RlOgoKPiDlnKggMjAyNC8xMC85IDE0OjAzLCBSaWNoYXJkIFdl
aW5iZXJnZXIg5YaZ6YGTOgo+ID4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4+
IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+ID4+IEFuOiAi
QmVuZWRpa3QgU3ByYW5nZXIiIDxiLnNwcmFuZ2VyQGxpbnV0cm9uaXguZGU+LCAibGludXgta2Vy
bmVsIgo+ID4+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiBDQzogImxpbnV4LW10ZCIK
PiA+PiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAicmljaGFyZCIgPHJpY2hhcmRA
bm9kLmF0Pgo+ID4+IEdlc2VuZGV0OiBNaXR0d29jaCwgOS4gT2t0b2JlciAyMDI0IDA0OjIzOjAy
IEJldHJlZmY6IFJlOiBbUEFUQ0gKPiA+PiAxLzFdIHViaWZzOiBUcnkgdG8gcmVjb3ZlciBmcm9t
IG1pc3Npbmcgem5vZGUKPiA+IAo+ID4+IOWcqCAyMDI0LzEwLzggMjE6MzMsIEJlbmVkaWt0IFNw
cmFuZ2VyIOWGmemBkzoKPiA+Pj4gQWZ0ZXIgcG93ZXJjdXQgb24gYSBzeXN0ZW0gdXNpbmcgdWJp
ZnMgbW91bnRpbmcgZmFpbGVkOgo+ID4+Pgo+ID4+PiAyMDI0LTA5LTMwVDEyOjM4OjI2Ljg4MDQ4
NyswMjowMCBzb25qYSBrZXJuZWw6IFVCSUZTIGVycm9yCj4gPj4+ICh1YmkwOjAgcGlkIDIxNzgp
OiB1Ymlmc19yZWFkX25vZGUgW3ViaWZzXTogYmFkIG5vZGUgdHlwZSAoMjU1Cj4gPj4+IGJ1dCBl
eHBlY3RlZCA5KSAyMDI0LTA5LTMwVDEyOjM4OjI2Ljg4MDUwNiswMjowMCBzb25qYSBrZXJuZWw6
Cj4gPj4+IFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDIxNzgpOiB1Ymlmc19yZWFkX25vZGUgW3Vi
aWZzXTogYmFkIG5vZGUKPiA+Pj4gYXQgTEVCIDEwMzo0NjkyMCwgTEVCIG1hcHBpbmcgc3RhdHVz
IDAKPiA+Pj4gMjAyNC0wOS0zMFQxMjozODoyNi44ODA1MDkrMDI6MDAgc29uamEga2VybmVsOiBO
b3QgYSBub2RlLCBmaXJzdAo+ID4+PiAyNCBieXRlczogMjAyNC0wOS0zMFQxMjozODoyNi44ODA1
MTArMDI6MDAgc29uamEga2VybmVsOgo+ID4+PiAwMDAwMDAwMDogZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKPiA+Pj4gZmYgZmYgZmYgZmYgZmYg
ZmYgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uCj4gPj4+Cj4gPj4+IFdoaWxlIHRyYXZlcnNpbmcg
b3ZlciB6YnJhbmNoZXMgZHVyaW5nIHRoZSBqb3VybmFsIHJlcGxheSBvbmUKPiA+Pj4gemJyYW5j
aCBwb2ludHMgdG8gYSB6bm9kZSwgd2hpY2ggd2FzIG5vdCB3cml0dGVuIHRvIHRoZSBmbGFzaCBh
bmQKPiA+Pj4gdGhlcmVmb3JlIHRoZSBmbGFzaCBpcyBlbXB0eS4KPiA+Pgo+ID4+IFVCSUZTIGd1
YXJhbnRlZXMgdHdvIHRoaW5ncyBmb3Igem5vZGVzOgo+ID4+IDEpIGFsbCBpbmRleCBub2Rlcyhp
biBjb21taXQgc2VxIE4pIGFyZSB3cml0dGVuIG9uIGZsYXNoIGJlZm9yZQo+ID4+IG1hc3RlciBu
b2Rlcyhmb3IgY29tbWl0IHNlcSBOKSBhcmUgd3JpdHRlbi4KPiA+PiAyKSBhbGwgaW5kZXggbm9k
ZXMoaW4gY29tbWl0IHNlcSBOKSB3b24ndCBiZSBlcmFzZWQgZnJvbSBmbGFzaAo+ID4+IGJlZm9y
ZSBtYXN0ZXIgbm9kZXMoZm9yIGNvbW1pdCBzZXEgTisxKSBhcmUgd3JpdHRlbi4KPiA+PiBTbywg
SSBkb24ndCB1bmRlcnN0YW5kIHRoYXQgd2h5IHpub2RlcyBub3QgZXhpc3QgZHVyaW5nIGpvdXJu
YWwKPiA+PiByZXBsYXlpbmc/Cj4gPiAKPiA+IEluIGFkZGl0aW9uIHRvIHRoYXQsIGlzIGp1c3Qg
b25lIHpub2RlIG1pc3Npbmcgb3IgYXJlIGxhcmdlciBwYXJ0cwo+ID4gb2YgdGhlIGZsYXNoIGVt
cHR5PwoKU29tZSBiYWNrZ3JvdW5kOgpUaGUgc3lzdGVtIHByb2R1Y2luZyB0aGUgYnJva2VuIGlt
YWdlIHJ1bnMgb24gYW4gb2xkZXIga2VybmVsIHZlcnNpb24KKDQuOS4yODYtcnQxODkpLiBBdHRh
Y2hpbmcgVUJJIHBlcmZvcm1zIHdpdGhvdXQgYW55IGVycm9yLiBJdCBzZWVtcywKdGhhdCB0aGVy
ZSBpcyBvbmx5IG9uZSB6bm9kZSBtaXNzaW5nLiBUaGVyZSBhcmUgZW1wdHkgcGFydHMgb24gdGhl
CmZsYXNoLCBidXQgYXMgZmFyIGFzIEkgY2FuIHNlZSBhbGwgUEVCcyBoYXZlIFVCSSBoZWFkZXIg
SW5mb3JtYXRpb24uClRoZSBtaXNzaW5nIHpub2RlIGlzIHNvbWV3aGVyZSBpbiB0aCBtaWRkbGUg
b2YgYW4gUEVCIGFuZCBvdGhlciB6bm9kZXMKYXJlIGluIHRoYXQgUEVCLgoKPiBBZnRlciByZXZp
ZXdpbmcgdGhlIFROQyByZWxhdGVkIGNvZGUsIEkgY2Fubm90IGZpbmQgb3V0IGFueSBpbGxlZ2Fs
IAo+IGJlaGF2aW9ycyB0byBtYWtlIHpub2RlIGxvc3Qgb3IgdmFsaWQgaW5kZXggTEVCIGVyYXNl
ZC4KT0suIElzIGl0IHBvc3NpYmxlLCB0aGF0IHRoaXMgYmVoYXZpb3VyIGlzIGNhdXNlZCBieSBh
IGFscmVhZHkgZml4ZWQKYnVnPyBUaGlzIGhhcHBlbmQgb24gYSBzeXN0ZW0gcnVubmluZyA0Ljku
Mjg2LXJ0MTg5LgoKPiBIaSBCZW5lZGlrdCwgY291bGQgeW91IHByb3ZpZGUgYSBjb3JydXB0ZWQg
VUJJRlMgaW1hZ2U/IExldCBtZSB0cnkgCj4gZ2V0dGluZyBtb3JlIGluZm9ybWF0aW9uLgpJIG5l
ZWQgdG8gY2xhcmlmeSB0aGlzLgoKUmVnYXJkcwogICAgQmVuZWRpa3QgU3ByYW5nZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
