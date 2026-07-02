Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9EDC43327
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucti9PaV4gHXy7eCaNq7qdYU9qd36efCSVoBFy+WFiM=; b=1SjRiHDaQpB6Rl
	7WLnADsIRTZpi8kRNP30kvnsaFKrz1sKX9mBZ+T+/I6pqEfYuE+PVEmC59AwKr0Z6398TUjyxguAr
	vt0bO+Skwx1YAZvjqnlbIE0Gn+oGLm/sarW/Nm07lv/+CuKcdUSy0HpeMgmptEyg2HMArahaWMNDy
	nycz0vwQ50PmaZydc0NWGRUzCQIKZeplMiXEX/CqtztWXQHJ20gbVYXRcHUL+oZ5uDWbvp5m++B13
	lT71n7uDeNkp9KDdZEeNFn4joaWMlDxLUyVk40O0IJnZnzeLqnWabYD2qkXkhALTJLzN3gWck0rVK
	1jbpO7zbx0ljkgzc2BYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfH9A-00000004Uhl-446o;
	Thu, 02 Jul 2026 13:08:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfH97-00000004UhQ-3vRW
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 13:08:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B580E1A0DED;
	Thu,  2 Jul 2026 13:07:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A1C45FF03;
	Thu,  2 Jul 2026 13:07:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F236D104C9523;
	Thu,  2 Jul 2026 15:07:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782997676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4fTlorCasYnLUoMeosE9yaTKnF2BJEbvXaBR8469rzE=;
	b=c9gv6mZyNrLaSxtdYc2BFWUZwDduJRN/+zePPratbOGFNfGztkNyJGTFtTKKuU+tCoG6r/
	AfPYh9DNwb4ed8TVhlCGqJslpZISG5ioGmcxCuSqTuhM64TdMy4D/Asyi2SklEJPI8XNtp
	dZb81PGkwhG3qDC4OBBaRe6TD656r7ebaGezU7ZgKP6cchvoCr9YY6i4qSItyziVMbjCTv
	q23AF96vFVzNsy9eowelqkE5ewyXY2N6ODWRjCujequxKvUSdg5LFsZj1Yzfhj6sIjMN1l
	Cbxh6SQg3dCRDmDVJKZvNyPjqGE6QYa8UdcI+i3M0Z+v0XAUDbR545CEB7WNpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Kees Cook <kees@kernel.org>,  Finn Thain
 <fthain@linux-m68k.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: redboot: reject unterminated FIS names
In-Reply-To: <20260701053909.53859-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Wed, 1 Jul 2026 13:39:09 +0800")
References: <20260701053909.53859-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 02 Jul 2026 15:07:53 +0200
Message-ID: <87ldbtr13q.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_060802_113348_E4EA6F65 
X-CRM114-Status: UNSURE (   6.88  )
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

SGkgUGVuZ3BlbmcsCgpPbiAwMS8wNy8yMDI2IGF0IDEzOjM5OjA5ICswOCwgUGVuZ3BlbmcgSG91
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IFJlZEJvb3QgRklTIHBhcnRpdGlvbiBu
YW1lcyBhcmUgc3RvcmVkIGluIGEgZml4ZWQgMTYtYnl0ZSBmaWVsZCB0aGF0IGlzCj4gZXhwZWN0
ZWQgdG8gYmUgTlVMLXRlcm1pbmF0ZWQuIHBhcnNlX3JlZGJvb3RfcGFydGl0aW9ucygpIHVzZWQg
c3RybGVuKCkKPiB0byBzaXplIHRoZSBuYW1lcyBhcmVhIGFuZCBsYXRlciBjb3BpZWQgdGhlIHNh
bWUgZmllbGQgd2l0aCBzdHJjcHkoKSwgc28KPiBhIG1hbGZvcm1lZCB0YWJsZSBlbnRyeSB3aXRo
b3V0IGEgdGVybWluYXRvciBjb3VsZCBtYWtlIGJvdGggb3BlcmF0aW9ucwo+IHJlYWQgYmV5b25k
IHRoZSBkZXNjcmlwdG9yLgo+Cj4gVmFsaWRhdGUgZWFjaCBhY2NlcHRlZCBGSVMgbmFtZSB3aXRo
IHN0cm5sZW4oKSBiZWZvcmUgYWRkaW5nIGl0IHRvIHRoZQo+IHBhcnRpdGlvbiBsaXN0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KClBsZWFz
ZSBhZGQgRml4ZXMgYW5kIENjIHN0YWJsZSB0YWdzIHdoZW5ldmVyIHlvdSBzZW5kIGEgZml4LiBU
aGUgZml4ZXMKbG9vayBjb3JyZWN0IGFuZCBhcmUgY29ycmVjdGx5IGRvY3VtZW50ZWQsIGJ1dCBh
bGwgb2YgdGhlbSBtaXNzCnRoZSB0YWdzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
