Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F0C761A6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nk5A5i2X1HchPyfZtposV8sdpmC8X0AmfVBLVEFlTV0=; b=o5ExU7ouPNERZK
	jeTVBAh8nnq0VE2QJfcf9gyFHUfW5Pl2oR1ivrNNoxrqlzzyzDowt01MabfhFL5gZUqzr8o4SjMKE
	ImrrAj1bcqis0oxRJJpDVCb1sQg/XDJ5O0TcIxIGJByB6+vvmhpgDwtp4Oc93pU8DT8VfgM8rNjvo
	KEc90vsM5nQzQ5Y9QFarDAc3GKH7t6HG1t9+fIw5wvOXdASqR4YX0AXd5XoE8pH5tQNVbzJNgRt7k
	MG+rfKidPMZ9JwkH0ocBrJmK5BzMmJQd/EmvV0Bla1VBQvUyqavOn1oU4/Wc4QV/st6JWfGse3sug
	odUHnh9tq62mo4NGZDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHqn-00F1TW-2o;
	Mon, 03 Apr 2023 10:55:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHql-00F1Su-1i
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 10:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13F3C618F2;
	Mon,  3 Apr 2023 10:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32C5C433EF;
	Mon,  3 Apr 2023 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680519346;
	bh=2vE4vlhMu9H5hV4YHMR14O334Ulhx+CY2eWbaB8BslY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ghPiXUXpx++ZmAyuH32115yPJut8Qev1Z6qri0H49HFazTZ5ZFb1GBKwpCUXN0H7c
	 2AP43U47P4kSh2XHAdeM6XnCUUtnmSn2MndRmZN8TYOF7YwF+VRENR88DbSXzTkkCV
	 mcpwzulzct9tQ3e9orLDVUjJya8KAVWtUqJW8COSxM82FQFKiyGlpJyJcFWZoinKst
	 2EshTg0IL1o5xpK8Wmffbiwi0tbmVgQ0e/etq0IAxoh0p52ojE6pc0/psJzHvIxVVN
	 srffRucIDwgeBoAqsVctVFsW+be3efGi5eRQfaEo0lXKb7oQddRjdCz0bPIQog4QW3
	 ETzYKkH5KvSSQ==
Message-ID: <82f8f5b6-49a9-0eb3-c542-3260f58fe2b0@kernel.org>
Date: Mon, 3 Apr 2023 13:55:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 32/49] mtd: rawnand: omap_elm: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-33-u.kleine-koenig@pengutronix.de>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230401161938.2503204-33-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_035547_606419_9D7FDFC6 
X-CRM114-Status: GOOD (  13.72  )
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

CgpPbiAwMS8wNC8yMDIzIDE5OjE5LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJs
ZSB0byBkbyBlcnJvciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dl
dmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlw
aWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBp
cyBhCj4gcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0
aGUgZmlyc3Qgc3RlcCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0
byAucmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4gCj4gVHJpdmlh
bGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhl
IHJlbW92ZQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+CgpBY2tlZC1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
