Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B352C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=806hCA1F2LJPuNT/C/v3ZGmrtEWS3QcYjZ/AvBJco2I=; b=u5us1mUxOp+P2K
	4pOR9AIoHF+E+fF6+suk7WsVQZ5nqCY1vWA2w1jiN5Wo7LMKm3O/hjzt9ve4WmtxqM7ySkj7nDOnh
	UJabnkesVd3qaaFUaN2ccSu+I6TITNVUCoSsDlCF4Z91VH/ZX5wfVkIRAYc4oiCfn8nce7ujxb3DG
	cgA8f77106DqXMHhlBGNXWPmjNSSOHc59PDEc5IYrgu/bEx2ruZqUtMJByywHlRZFwNesMA+bNHmw
	vFiE7235ETk/8EAwInMcveieKA7bjQsnBrrEJmHkagzXYRyfcRpk31eAazJ6+1p5s57q20iXtU1Sc
	Tcs6xe0GJPFm2/WZU2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJAw-00000004meY-3o7j;
	Thu, 02 Jul 2026 15:18:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJAt-00000004mch-476G
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 15:18:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B67EC4E40C32;
	Thu,  2 Jul 2026 15:17:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 893D65FF03;
	Thu,  2 Jul 2026 15:17:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67BA1104C9546;
	Thu,  2 Jul 2026 17:17:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783005477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XJcp/jSBxeHnFxrM6Rs3ULcVX0u98ZwkSzH0A0tofRQ=;
	b=rIN9BtpxUv4teVWCSx1I107Y3zq2MvLk0RZjpMpBisN7vaAU/MxKtQbIxqQ+hBjoysaBcn
	P08T3sE+OW7ZVYwn8RA+CFsRTfSkbAN1ZikRpQHgtabhc/XWZCRca7WoY+K8TcSXsD7HUr
	vvUmFC9hQFmuiCTbZf91T2c+fD1ccfGGv2bK66vB64Htv+E1OLA4ZUOjZEll3LSvBrWanC
	7xQpsVm83p2mGeZyDBdMpE83J9tKqefguQ59i7l9GEqfca3vshfz5ed9CwoQvuJA/1q07m
	Lqar07NW2Y9YoZEyJIajHYyiEh/KDY/5jPpxbfyFsOYmPsaLcpOSI66bIxiGxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
In-Reply-To: <20260601125438.3481722-1-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 1 Jun 2026 14:52:42 +0200")
References: <20260601125438.3481722-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 02 Jul 2026 17:17:55 +0200
Message-ID: <87jyrdpgik.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081800_159101_8F5C89A5 
X-CRM114-Status: GOOD (  12.44  )
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

SGVsbG8sCgo+IFRoaXMgbWlnaHQgaGF2ZSB0aGUgY29uc2VxdWVuY2UgdGhhdCBhbGwgdGhlIGZs
YXNoZXMgbm93IGdldCBhCj4gUkRTRlBEIG9wY29kZSB3aGljaCBtaWdodCBiZSBhbiB1bmtub3du
IG9wY29kZS4gQnV0IHRoYXQgd2FzIGFscmVhZHkKPiB0aGUgY2FzZSBmb3IgYW55IGZsYXNoZXMg
d2hpY2ggd2VyZSB1bmtub3duIHRvIHRoZSBsaW51eCBrZXJuZWwuIFNvCj4gZmFyLCB0aGVyZSB3
YXMgbm90IGEgc2luZ2xlIGNvbXBsYWludC4KPgo+IFNlZSBwYXRjaCAzIGZvciBtb3JlIGluZm9y
bWF0aW9uLiBJZiBmZWVkYmFjayBpcyBwb3NpdGl2ZSwgdGhpcyBpcwo+IGludGVuZGVkIHRvIGJl
IGFwcGxpZWQgdG8gdGhlIHNwaS1ub3IgdHJlZSBhZnRlciB0aGUgbmV4dCBtZXJnZQo+IHdpbmRv
dywgc28gaXQgd2lsbCBzaXQgYXJvdW5kIGluIC1uZXh0IGZvciBxdWl0ZSBzb21lIHRpbWUgYW5k
IGdldAo+IHNvbWUgdGVzdGluZy4KClRlc3RlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KClRlc3RlZCB3aXRoIGEgV2luYm9uZCBXMjVRMDJKVkZJTS4KCklm
IHlvdSBjYW4gYWxzbyBnaXZlIGEgdHJ5IHRvIG15IFFFUiByZXdvcmsgSSB3b3VsZCBiZSBpbnRl
cmVzdGVkIHRvCmdhdGhlciBmZWVkYmFjayBvbiBpdCBhbmQgaWRlYWxseSBhbHNvIHRyeSB0byBt
ZXJnZSB0aGlzIGtpbmQgb2YgcmV3b3JrCmVhcmx5IGluIHRoZSBjeWNsZS4gOykKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
