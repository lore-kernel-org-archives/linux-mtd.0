Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8ABC79FA0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foLuQG7DYlpMO2kWFWicwAwaNJQeLD0ZErQ2+QMYrrU=; b=LndFITcbSJoEUS
	sRCnNmCyznl13MBmrD3aXsy3kru9iIF8TPjbuWi1O9vUSug2fS7aBzTVyHmzzCYDgCwWba05IHc3R
	dN1Z09AdVO2dbiI/kQVq7Fs3LkL5kfp6gHLk/FYVQLkyuECaAgYDCRYujjIe9qPMlfvZNOLhn/tAy
	SC/NOqqaeNhfjDmSe+QmbOVKaw05VQ43pB4/ZvpDE6+ECKCmPriUPrOA24C4deukW3VS3AeaHbhAq
	6vqCALSlPJFdxvBzD6+uJOKNB4bPCLCcV7j4So9PwOnnVYOKa+aOY7R+ZOwpwTJSOtUStyKpvGymI
	VWsRJp1DPE6R/V9OZ3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sJ5-00000008dcu-0w01;
	Tue, 08 Sep 2026 09:39:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sJ1-00000008dcT-1pnG
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 09:39:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 091A61A1A53;
	Tue,  8 Sep 2026 09:39:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C96603C4;
	Tue,  8 Sep 2026 09:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2328311C79CA0;
	Tue,  8 Sep 2026 11:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788860393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4GHa3lNHMkLWKE81S5CI6BlV5V3PtJ3VoW2M7li/Edg=;
	b=LCHZ571RWZ7U7M8TbTFAHthgTx+h87AllccsZvqf2kcMsQ7Y6z0dBhWg78XiFpgPtu91DG
	qWApgX2wU/Juan6iBKL3phpPFPVL3+EwYmzzANWuBOrXD/uBQIw81qBl1I7xItXgp3vZvX
	Xib49WAQukU1h+vXVE4qAYVL/lhiyo1f6zSRWyUNDhdoy+VPOvFePPcY2qtj/F3bsQ96Rk
	nUa4eIqo8mPww930rz2amNUzrdx1QeoVuS/DBqwWn6KN9EVezFvrKjBGq2QxblAZgp2wDu
	VjjjpxZUUKEo9ZeDuFfnsBduHrEe5Y7iuPSuK9fiinzcDoijKLR46VRCYuAPVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: fzz <1768315307@qq.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Richard Weinberger
 <richard@nod.at>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com> (fzz's
	message of "Tue, 8 Sep 2026 11:25:30 +0800")
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 11:39:49 +0200
Message-ID: <87bja8ulne.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023955_609650_EDCEE980 
X-CRM114-Status: GOOD (  12.16  )
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

SGVsbG8gWm9uZ3poZW4sCgpPbiAwOC8wOS8yMDI2IGF0IDExOjI1OjMwICswOCwgZnp6IDwxNzY4
MzE1MzA3QHFxLmNvbT4gd3JvdGU6Cgo+IEZyb206IFpvbmd6aGVuIEZlbmcgPDE3NjgzMTUzMDdA
cXEuY29tPgo+Cj4gV2hlbiBzcXVhc2hmcyByZWFkcyBmaWxlcyB0aHJvdWdoIG10ZGJsb2NrLCB0
aGUgbXRkYmxvY2sgbGF5ZXIKPiBzcGxpdHMgSS9PIGludG8gNTEyLWJ5dGUgc2VjdG9ycy4gRm9y
IGEgNEstcGFnZSBTUEkgTkFORCwgdGhpcwo+IG1lYW5zIHJlYWRpbmcgdGhlIHNhbWUgcGFnZSA4
IHRpbWVzICg0MDk2IC8gNTEyKSwgZ2VuZXJhdGluZyA3eAo+IHJlZHVuZGFudCBTUEkgcmVhZC1m
cm9tLWNhY2hlIG9wZXJhdGlvbnMuIEVhY2ggc3VjaCBvcGVyYXRpb24KPiBpbnZvbHZlcyBhIGZ1
bGwgU1BJIGJ1cyB0cmFuc2FjdGlvbiwgc2lnbmlmaWNhbnRseSBzbG93aW5nIGRvd24KPiBib290
IHRpbWUgYW5kIGZpbGUgYWNjZXNzLgo+Cj4gQ2FjaGUgdGhlIGxhc3Qgc3VjY2Vzc2Z1bGx5IHJl
YWQgcGFnZSBpbiBzcGluYW5kX2RldmljZSB0byBhdm9pZAo+IHRoZXNlIHJlZHVuZGFudCBvcGVy
YXRpb25zLiBXaGVuIHRoZSBzYW1lIHt0YXJnZXQsIGVyYXNlYmxvY2ssCj4gcGFnZX0gaXMgcmVx
dWVzdGVkIGNvbnNlY3V0aXZlbHksIHRoZSBkYXRhIGlzIHNlcnZlZCBkaXJlY3RseQo+IGZyb20g
dGhlIGJvdW5jZSBidWZmZXIgKGRhdGFidWYpIHZpYSBtZW1jcHksIHNraXBwaW5nIHRoZSBTUEkK
PiB0cmFuc2FjdGlvbiBlbnRpcmVseS4KPgo+IFRoZSBjYWNoZSBpcyBpbnZhbGlkYXRlZCBvbiB3
cml0ZSBhbmQgZXJhc2Ugb3BlcmF0aW9ucy4gUkFXIHJlYWRzLAo+IE9PQiByZWFkcywgYW5kIGNv
bnRpbnVvdXMgcmVhZHMgYXJlIGV4Y2x1ZGVkIGZyb20gY2FjaGluZyB0bwo+IG1haW50YWluIGNv
cnJlY3RuZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWm9uZ3poZW4gRmVuZyA8MTc2ODMxNTMwN0Bx
cS5jb20+CgpTYXNoaWtvIHJlcG9ydHMgaW50ZXJlc3Rpbmcgd2FybmluZ3MsIGNhbiB5b3UgcGxl
YXNlIGFkZHJlc3MgdGhlbT8KClRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hp
a28gQUkgcmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgotIFtD
cml0aWNhbF0gVGhlIHBhZ2UgY2FjaGluZyBtZWNoYW5pc20gdXNlcyB0aGUgc2hhcmVkIGJvdW5j
ZSBidWZmZXIKYHNwaW5hbmQtPmRhdGFidWZgIHRvIHN0b3JlIGNhY2hlZCBkYXRhLCBidXQgZmFp
bHMgdG8gdW5jb25kaXRpb25hbGx5CmludmFsaWRhdGUgdGhlIGNhY2hlIHdoZW4gdGhpcyBidWZm
ZXIgaXMgb3ZlcndyaXR0ZW4gYnkgb3RoZXIKb3BlcmF0aW9ucywgbGVhZGluZyB0byBzZXZlcmUg
Y3Jvc3MtcGFnZSBkYXRhIGNvcnJ1cHRpb24uCi0gW0NyaXRpY2FsXSBQYWdlcyB3aXRoIHVuY29y
cmVjdGFibGUgRUNDIGVycm9ycyBhcmUgcHJlbWF0dXJlbHkgY2FjaGVkCmFzIHZhbGlkLCBjYXVz
aW5nIHN1YnNlcXVlbnQgcmVhZHMgdG8gYnlwYXNzIEVDQyBjaGVja3MgYW5kIHNpbGVudGx5CnJl
dHVybiBjb3JydXB0ZWQgZGF0YSBhcyBzdWNjZXNzZnVsLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
