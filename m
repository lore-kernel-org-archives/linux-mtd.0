Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0E0CCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo2kaMDlWGRuRqOF+FzvrWoUCGHDRatSXJdp/WnDt+w=; b=jAo+VnNL9+df0b
	LHMjSfp813qeoYTIbuNp7RjQWrglfHTnQPZqeIzkg3VKo27wntAfFIDl/bpfpcNXSKwXsIwWgNC5W
	j1bcLpxzvwTeVmpfnpUM7vnACm+n8U3iBQZTCK03COQRY9HcrnuwrDxTKz/Jc5hzp+VKmfp67PZg4
	VrdeKRJ7BRwUSs9sl9jNg93Njz2SZsE9DTZ7piudggBh6GYG7BJDtyGRgEsxmLrpWQE5LUtpJ3//O
	rt8+IgxSrDMZPI9uRqq2SEcjsgBZ2WO8SZ8neBNXZ9jHAjb1LGX2q21lMTVL8fg2mLsHkzRt2KGhp
	tSwoKHsPgdyWcCayPsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7GZ-00000008TZo-12mV;
	Wed, 12 Nov 2025 09:35:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7GW-00000008TZJ-11U0
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:35:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6FA6A4E41667;
	Wed, 12 Nov 2025 09:35:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C1826070B;
	Wed, 12 Nov 2025 09:35:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44CCF10371994;
	Wed, 12 Nov 2025 10:35:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762940145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mOhYAfyZJXObBAlUuqFf5cqWZP584nGbA1qnqY/jENo=;
	b=MHTwpDBMupQjAo0xVtrzcgSV2ZEjdgeU/HQTEmzFg2noc31N5zwmtWlnIxjO7o9aOIudkn
	hl4GsY8QHPAVfGu3EFqT9AatA+xLg7yCmGZBH9kadUPB6I1Nu+tUtWGGU5zsbShfPaUu+G
	1G+/32eSuyvuMyNdoclohz9VGa1Ni4FgjDz5MkPVBiJ2T50NYUr/yg2B9Tj+kc+xwrmdrG
	FJ4p6GK5eQuYtN9iuKXNg1MsUrwfzMGO1tbQcjpeSTuuU6NwkMxSlw68iGQ5na4KoxdV6P
	aL7gBbOnCruimGGFhEud53EQb6ud+4vNiLp5THrTgIvJHstFeGCIwqlruc8vkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 0/6] Hello,
In-Reply-To: <c67466c0-c133-4fac-82d5-b412693f9d30@linaro.org> (Tudor
	Ambarus's message of "Mon, 10 Nov 2025 08:54:24 +0200")
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
	<c67466c0-c133-4fac-82d5-b412693f9d30@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 12 Nov 2025 10:35:41 +0100
Message-ID: <87seej7fv6.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_013548_415392_76D2A8A8 
X-CRM114-Status: UNSURE (   8.86  )
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

T24gMTAvMTEvMjAyNSBhdCAwODo1NDoyNCArMDIsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IEhpLCBNaXF1ZWwsCj4KPiBPbiAxMS81LzI1IDc6MjYg
UE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhlcmUgaXMgYSBzZXJpZXMgYWRkaW5nIHN1cHBv
cnQgZm9yIDYgV2luYm9uZCBTUEkgTk9SIGNoaXBzLiBEZXNjcmliaW5nCj4+IHRoZXNlIGNoaXBz
IGlzIG5lZWRlZCBvdGhlcndpc2UgdGhlIGJsb2NrIHByb3RlY3Rpb24gZmVhdHVyZSBpcyBub3QK
Pj4gYXZhaWxhYmxlLiBFdmVyeXRoaW5nIGVsc2UgbG9va3MgZmluZSBvdGhlcndpc2UuCj4KPiBJ
J20gZ2xhZCB0byBzZWUgdGhpcywgeW91J3JlIGFuIGxvY2tpbmcgZXhwZXJ0IG5vdyA6KS4gRG8g
eW91IGNhcmUgdG8KPiBleHRlbmQgdGhlIFNQSSBOT1IgdGVzdGluZyByZXF1aXJlbWVudHMgWzFd
IHdpdGggc3RlcHMgb24gaG93IHRvIHRlc3QgdGhlCj4gbG9ja2luZz8gVGhlcmUncyBzb21lIHRl
c3RpbmcgcHJvcG9zZWQgYXQgWzJdLCB3b3VsZCB5b3UgcGxlYXNlIGNoZWNrIGFuZAo+IHJldmll
dyBpdD8KCkdvb2QgaWRlYS4gTGV0IG1lIGhhdmUgYSBsb290IGF0IHdoYXQgU2VhbiBwcm9wb3Nl
ZC4KCj4gWzFdIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvbXRkL3NwaS1ub3Iu
aHRtbCNtaW5pbXVtLXRlc3RpbmctcmVxdWlyZW1lbnRzCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC85MmU5OWE5Ni01NTgyLTQ4YTUtYTRmOS1lOWIzM2ZjZmYxNzFAbGlu
dXguZGV2LwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
