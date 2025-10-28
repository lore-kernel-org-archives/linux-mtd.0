Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B089ECCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZBb+2brZNtHYvXYg9VDWc9srKl+FFCS9UBiCvGtYF8=; b=ykM3l3zbcjEeSE
	CqQazbdiFJPFtBLHyLuyIyK+aCZ1Gfg25R82pmu96bOtwuHO+E8sLJuax5uYu3BqJUdesfRm0tDaS
	Tfnm//CEl2+n8AMkuvrZtv2ikLHIpGQLVNUulkS8Yp+MlcU72u9Gqape6mUkJbIWLqFV+6o5VUmSw
	BlDqcx54LwClPwl73EbzzI8NwauTYx6dWw5F9ah43HML5X0w6i9+W2BCyGZ6orqXamrsZ4RjEAPRv
	JSDPAxCXUxi6YmM3tEkEUzaivS/8VpDeUKlYDYeqqj2EEsCVtKmyYKvzOhIdWgaqg/iCAL7HbZEib
	4lKHrPqYgCreQl7wr19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmRX-0000000GIvr-487r;
	Tue, 28 Oct 2025 16:21:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmRQ-0000000GIu1-3z8L;
	Tue, 28 Oct 2025 16:21:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7148A1A170E;
	Tue, 28 Oct 2025 16:20:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40FF0606AB;
	Tue, 28 Oct 2025 16:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DA7B117AC2F7;
	Tue, 28 Oct 2025 17:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761668457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z2gmi5A9sdMhOB9KSfIt5x+ZIc+vGxgYVE8BEvo1P9M=;
	b=KCJnb7ZSsKeg4swbTs2c0T6Pg/HT+ws9lWd6MSyvhjUkIl7Q6MhbEsl/T5zqMTATMJAGI9
	+AcpEDrRx7loU39FZ/fM5LH4yxFqJEosm00gIDdispbgdjpE/aNCbUav02KAsaG7c/13jT
	gHJlm6Ea/1YV8NSJFbWcHzUCpgyxgxXA+eJqksWBGk7EGFLut/Z+1aKbo7ZoudjToC6PZD
	84QFupfTS0L5VwpWLPVW++YDZoKCVqr1YoCfSWwVb74hAa8l3PV0jvm0EF+nnf5eTXRLwk
	taILyzLFkR6wt/aT5PaWbxhw9YFJwIHQJ6TnsjXc8197SvOSRQ9kkhOJdF/7rQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Samuel Holland <samuel@sholland.org>,  Richard Genoud
 <richard.genoud@bootlin.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/16] mtd: rawnand: sunxi: rework pattern found
 registers
In-Reply-To: <6097267.MhkbZ0Pkbq@jernej-laptop> ("Jernej =?utf-8?Q?=C5=A0k?=
 =?utf-8?Q?rabec=22's?= message of
	"Tue, 28 Oct 2025 16:41:48 +0100")
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
	<20251028073534.526992-8-richard.genoud@bootlin.com>
	<6097267.MhkbZ0Pkbq@jernej-laptop>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Oct 2025 17:20:41 +0100
Message-ID: <87v7jz576u.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092103_005172_A472FB5E 
X-CRM114-Status: UNSURE (   7.04  )
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

T24gMjgvMTAvMjAyNSBhdCAxNjo0MTo0OCArMDEsIEplcm5laiDFoGtyYWJlYyA8amVybmVqLnNr
cmFiZWNAZ21haWwuY29tPiB3cm90ZToKCj4gRG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9i
IDA4OjM1OjAwIFNyZWRuamVldnJvcHNraSBzdGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5v
dWQgbmFwaXNhbChhKToKPj4gT24gSDYvSDYxNiwgdGhlIHJlZ2lzdGVyIEVDQ19QQVRfRk9VTkQg
aXMgYXQgaXRzIG93biBhZGRyZXNzLCBhbmQgbm90Cj4+IHBhcnQgb2YgRUNDIHN0YXR1cyByZWdp
c3Rlci4KPj4gU28sIGludHJvZHVjZSB0aGUgcGF0dGVybiBmb3VuZCByZWdpc3RlciBvZmZzZXQg
aW4gc3VueGlfbmZjX2NhcHMsIGFsb25nCj4+IHdpdGggaXRzIG1hc2suCj4+IAo+PiBBbHNvLCBp
bnRyb2R1Y2UgYSBub24gY29tcGlsZS10aW1lIGZpZWxkX2dldCgpIGJlY2F1c2UgRklFTERfR0VU
KCkgYW5kCj4+IHUzMl9nZXRfYml0cygpIGRvbid0IHdvcmsgd2l0aCBub24gY29tcGlsZS10aW1l
IGNvbnN0YW50Lgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc2MTU4ODQ2
NS5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUKPgo+IFVybHMgc2hvdWxkIHVzZSBMaW5rOiB0
YWcgYW5kIGJlIHBsYWNlZCBhdCB0aGUgYm90dG9tLgoKSSB3YXMgYWJvdXQgdG8gYXBwbHksIHNv
IEknbGwgZml4IHRoaXMgd2hpbGUgYXBwbHlpbmcuCgo+Cj4gQ29kZSBpdHNlbGYgbG9va3MgZmlu
ZS4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
