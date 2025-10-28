Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC46CCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRujOJerPmLxJisW/CeC2WN9qeHVtifbqWA8DePE6Fw=; b=4qUyOBh83qz1Rq
	A8s0wugyq047gW7fTh+aZGif5vQb+uid6g3sTMnchBEQNhtpJnNgk09EhYT3g4iw1IwrEViK2mhal
	3JoS8+iQD56S00APj0fcqx4aGbGbAaYblPhz7Lq6MfeY3K5ZYDoLBKw5Si0qo5Gs+J31quCgz+6dL
	rGxZp3vv62rXCB+/No11YL9TQPrzlWXnEYlfRCKeUUZ/I/SX1EGTX4hua1Jf3Mi3V7RYN1FbKS/dv
	T/ZBJ8zA8P0435/VXTJ2QM4jaWgWYsAAHW6t4UjqpQcGyw6D9szAFCwwGkLMbjGiZ19lUA+QO7Ezx
	hSfcZSl1CuAWkQa65xPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6S-0000000GG7H-3SpL;
	Tue, 28 Oct 2025 15:59:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6P-0000000GG5z-1xC3
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:59:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B7FC3C0BEA2
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 15:58:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECFEE606AB;
	Tue, 28 Oct 2025 15:59:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7328C117A998A;
	Tue, 28 Oct 2025 16:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761667153; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RY/nm5aUJouQ5oq2RwHqt7r9HFxM9I/z9HF1k9kOPGY=;
	b=pm2SvWPc39T2ZbKJrGI3WI0vbu7ANWhzIBOBIUdnNjhL6yMoG/7FuWLRTHcQS+DTW5QFCq
	PUm0ODvPmVckU4a+8aYXKp7Y8K54Wmb7j1zEibAMh1H/UzsQIC7MCHMhSG7fXh9wBzzNMQ
	ez4DllNMb2Ea5ZLann37cQUpKZCm2TA849XnT2X+x2FdXs2/vum33Nf771vrq4z7fM8U3m
	B+PAduiazp6/HCEuLdADctjkTaGd74Q59NtDlMp54OvNK7eg7I4aADffmsMxa5wjWPFjZD
	kHzD/tBufb6HVKuhNYnKgiCpufEMlU0Qm6qlaBJyarDVNfM1Cb6UqDAAAbbl/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251024001943.29557-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20251024001943.29557-1-aryan.srivastava@alliedtelesis.co.nz>
Subject: Re: [PATCH v0 0/2] mtd: nand: allow unconventional NAND layouts
Message-Id: <176166714319.365556.6997921902455862428.b4-ty@bootlin.com>
Date: Tue, 28 Oct 2025 16:59:03 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085917_651692_6069F8A5 
X-CRM114-Status: UNSURE (   7.93  )
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

T24gRnJpLCAyNCBPY3QgMjAyNSAxMzoxOTo0MCArMTMwMCwgQXJ5YW4gU3JpdmFzdGF2YSB3cm90
ZToKPiBDdXJyZW50bHkgdmFsaWRpdHkgY2hlY2tzIGluIG5hbmRfc2Nhbl90YWlsIG9ubHkgYWxs
b3cgTkFORCBsYXlvdXRzIHdpdGgKPiBldmVubHkgc2l6ZWQgY2h1bmtzLiBUaGlzIHJlc3VsdHMg
aW4gY29udHJvbGxlcnMgd2hpY2ggdXNlCj4gdW5jb252ZW50aW9uYWwgbGF5b3V0cyB0byBmYWls
IHRoZXNlIGNoZWNrcy4gVG8gcGFzcyB0aGVzZSBjaGVja3MKPiB0aGUgbWFydmVsbF9uYW5kIGRy
aXZlciB3b3VsZCBpbmNvcnJlY3RseSByZWFkIHBhZ2VzIChsZWF2aW5nIG91dCB0aGUKPiB1bmV2
ZW5seSBzaXplZCBjaHVuaykuCj4gCj4gUmVsYXggdGhpcyBjaGVjayBhbmQgcmVtb3ZlIHRoZSBj
aGFuZ2Ugd2hpY2ggbW9kaWZpZXMgdGhlIGxheW91dHMKPiByZXN1bHRpbmcgaW4gZXJyb3Vub3Vz
IHJlYWQvd3JpdGVzLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoK
WzEvMl0gUmV2ZXJ0ICJtdGQ6IHJhd25hbmQ6IG1hcnZlbGw6IGZpeCBsYXlvdXRzIgogICAgICBj
b21taXQ6IDZkMjJkOTYxMjIwMjZiNjJlZDA4ZDk3ZmU1ODUzMjFjNzg4OTEzZmMKWzIvMl0gbXRk
OiBuYW5kOiByZWxheCBFQ0MgcGFyYW1ldGVyIHZhbGlkYXRpb24gY2hlY2sKICAgICAgY29tbWl0
OiA1ZWQ3ZTU5ZGQyYzUwMmI5ZjY4NTBlM2RlNjljNTg1MzhjZjI3ZWZmCgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
