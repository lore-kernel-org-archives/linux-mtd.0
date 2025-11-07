Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3318CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yCCTRuLS54/Cm2OrMzk2QVAtEG4mO6z0SBvOl8G6+vM=; b=EUqtaHtS2DOTNPiGT6FS0aeh/h
	FTX9stXMOhmCLzqWwitl+1M8zaKvqUE7b3HpfeL3kxCfpi4cjX1L4+tL5O5FDeq+G4yr9UR1SdAA2
	c00+kBcshR/yAgXcdPWsVj0F81VPn8oIHssEwQuk+wSX7/NsX1fmUFvvN1WVr4X1o5a/fmrKIhHM9
	lKjoO8cTVfx0sslBs9iBrYjqZALtB2s7WZbmRPxWmkVEt858ADQkGH4Mz3If0A0XbUWA5r3cpwDks
	Rhg8+hENMRsokEJQElGGHop/HHBof6eAbZCf/FzMoJ/MoOYRQSLT7U4H2Q2JFeqA1yzKxnwpZPGim
	oMB1o4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHSgC-00000000rFL-0J8l;
	Fri, 07 Nov 2025 20:03:28 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHSg8-00000000rEQ-3T6N
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 20:03:26 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A8D3F2B03EC;
	Fri,  7 Nov 2025 21:03:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id X-nbup-2UNCI; Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 553D011C057;
	Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 51_Gcrbkj5Yv; Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2DA3911C056;
	Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Date: Fri, 7 Nov 2025 21:03:19 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, sethjenkins@google.com, 
	adobriyan <adobriyan@gmail.com>
Message-ID: <55378147.159026.1762545799936.JavaMail.zimbra@nod.at>
In-Reply-To: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
Subject: Re: UBIFS errors since Linux 5.15
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF143 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS errors since Linux 5.15
Thread-Index: +EEJ8XwfiheRTquyWgicZAVkYE0nQQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_120325_012550_E6C1AF62 
X-CRM114-Status: UNSURE (   7.90  )
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

RWRkaWUsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiRWRkaWUgSmFt
ZXMiIDxlYWphbWVzQGxpbnV4LmlibS5jb20+Cj4gQW46ICJsaW51eC1tdGQiIDxsaW51eC1tdGRA
bGlzdHMuaW5mcmFkZWFkLm9yZz4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiY2hlbmd6
aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+LAo+ICJPcGVuQk1DIE1haWxsaXN0IiA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+LCBzZXRoamVua2luc0Bnb29nbGUuY29tLAo+ICJhZG9icml5YW4iIDxh
ZG9icml5YW5AZ21haWwuY29tPgo+IEdlc2VuZGV0OiBGcmVpdGFnLCA3LiBOb3ZlbWJlciAyMDI1
IDE4OjM4OjU0Cj4gQmV0cmVmZjogVUJJRlMgZXJyb3JzIHNpbmNlIExpbnV4IDUuMTUKCj4gSGVs
bG8sCj4gCj4gV2UgYXJlIHVwZGF0aW5nIHNvbWUgQk1DIChBc3BlZWQgQVNUMjYwMCwgQVJNMzIp
IHN5c3RlbXMgdGhhdCB3ZXJlIG9uCj4gTGludXggNS40IGJ1dCBvYnNlcnZlIGNvbnNpc3RlbnQg
VUJJRlMgZXJyb3JzIHdpdGggTGludXggNS4xNSBhbmQgbGF0ZXIuCj4gVGhlIGVycm9ycyBzZWVt
IHRvIHZhcnk7IHRoZXJlIGlzIGEgc2FtcGxpbmcgYmVsb3cuCj4gCj4gCj4gV2UgcGVyZm9ybWVk
IGEgZ2l0IGJpc2VjdCBhbmQgY2FtZSB1cCB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWl0LCB3aGlj
aAo+IG9mIGNvdXJzZSBpcyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byBVQklGUy4gUmV2ZXJ0aW5n
IGl0IGRvZXMgcHJldmVudAo+IHRoZSBpc3N1ZS4uLiBEb2VzIGFueW9uZSBoYXZlIGFueSBzdWdn
ZXN0aW9ucz8KPiAKPiBjb21taXQgMzNmYzllMjZiN2NiMzlmMGQ0MjE5Yzg3NWEyNDUxODAyMjQ5
YzIyNQo+IEF1dGhvcjogU2V0aCBKZW5raW5zIDxzZXRoamVua2luc0Bnb29nbGUuY29tPgo+IERh
dGU6wqAgwqBUaHUgT2N0IDI3IDExOjM2OjUyIDIwMjIgLTA0MDAKClRoYXQncyBpbmRlZWQgc3Ry
YW5nZS4KQXJlIHlvdSBhYnNvbHV0ZWx5IHN1cmUgdGhhdCB0aGlzIGNvbW1pdCB0cmlnZ2VycyB0
aGUgaXNzdWU/CkUuZy4gaWYgeW91IHJldmVydCBpdCBvbiB0b3Agb2YgNS4xNSB0aGUgaXNzdWUg
dmFuaXNoZXMgYW5kIHdoZW4geW91CnJlLWFwcGx5IGl0LCB0aGUgaXNzdWUgaXMgYmFjaz8KClRo
YW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
