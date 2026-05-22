Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AC5CD5BB3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuefTkstTqegbJkMKMcdAuiUiDrqFCsGwL0QQ7cWdao=; b=B5+oegNz9zRuV8
	ZI+bN9PNROgY0Qybz9pHj/K+7re2kP6d8ZlanuLRAXeYIcXxpcSEiVokSWxaY+hIs4e6HuwcisVc0
	ps/5U9FG3D6dzSuXfVE2PB+VZRJh8kjg7SZ1RL6UuzMMa7VJXxORtW9f35qvE4HTwvaKYc/8o+Veu
	ptv8RohEx7HjHZqjT9AefVS9ScJg0T/fMrmFYOUK34IrnzyFtzQcdRqULPudFUMPRf84RLwxdOTBh
	aZOAGWGuGcRKEdd4RpkTzgeq094/uSXvnR8KndTsn/ksMyJrfyvK+SQw6h35uRLTIxDg7J2XoFhPW
	5oR56UUAmYuOoxPfCvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSDU-0000000BLaw-17v6;
	Fri, 22 May 2026 15:55:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSDQ-0000000BLZq-2NTu
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 15:55:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EFB3B1A3673;
	Fri, 22 May 2026 15:55:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2E1A6003C;
	Fri, 22 May 2026 15:55:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13B7B108115FB;
	Fri, 22 May 2026 17:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779465307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VBHCCrIT6aJTUQLBZidYi9sgYkOpDfnCQeYwsTA2g9U=;
	b=njWClgMqEAgLUk1EtuycW1xHkCJfoqB0ww/YhqrzC7MedSwoErbd56BDT6iuWowNPVfuZj
	ifZ1Y4zSEmpNoP3U20CbKhT/yCYEC6djYz93snsFhSOU/4tqmEi1POJ6YvSKEzdj2cZ4yJ
	srDybx7RHTyxkWmnTRRoaxfWwj5Au94QsiSvpSXOTe9vP1wSwEM5WzK90l0OE3mcYSnc57
	HuXtGA6xxlGYDxzA8qgMCUn8gq6+ukAk//c1379ak1AUS0dMagywSwtzCzKrCZO7lcWH1i
	gGJ2MQi2Q1WelBLRh6KZdwZ7d/Wtndhd+4AI2O/SAn5zgT7SxLBBYs5uxAPbTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <9432f07f-3724-4257-b6ab-84721e619f78@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 12:10:45 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 17:55:00 +0200
Message-ID: <875x4fphgr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_085513_696661_90702582 
X-CRM114-Status: UNSURE (   7.24  )
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

T24gMjIvMDUvMjAyNiBhdCAxMjoxMDo0NSArMDMsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDUvNy8yNiA3OjQ2IFBNLCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+PiBGaXhlczogM2RkODAxMmE4ZWViICgibXRkOiBzcGktbm9yOiBhZGQgVEIgKFRv
cC9Cb3R0b20pIHByb3RlY3Qgc3VwcG9ydCIpCj4+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+IEZp
eGVzIHNoYWxsIGJlIHRoZSBmaXJzdCBwYXRjaGVzIGluIHRoZSBzZXQuCgpUZWNobmljYWxseSBz
cGVha2luZyBhbGwgZm91ciBmaXJzdCBwYXRjaGVzIGFyZSBmaXhlcywgZXhjZXB0IEkgZG9uJ3QK
YXNrIHRoZSBmaXJzdCBvbmUgdG8gYmUgYmFja3BvcnRlZC4gVGhlIHJlYXNvbiB3aHkgd2UgYXNr
IGZpeGVzIHRvIGJlCmZpcnN0IGluIHRoZSBzZXJpZXMgaXMgYmVjYXVzZSB3ZSB3YW50IHRoZW0g
dG8gYmUgYXMgaW5kZXBlbmRlbnQgYXMKcG9zc2libGUgZnJvbSBwcmV2aW91cyBjbGVhbnVwcy9j
aGFuZ2VzLiBIZXJlIGVhY2ggZm91ciBmaXJzdCBwYXRjaCBhcmUKdGFyZ2V0aW5nIGNvbXBsZXRl
bHkgZGlmZmVyZW50IHBsYWNlcyBhbmQgc2hvdWxkIG5vdCBpbnRlcmFjdCB3aXRoIGVhY2gKb3Ro
ZXIuIEFueXdheSwgSSB3aWxsIHJlLXNodWZmbGUgdGhlIHBhdGNoZXMuCgpBcyBmb3IgU2FzaGlr
bydzIGZlZWRiYWNrLCB0aGUgQUkgcmFpc2VzIHRoZSBzYW1lIHBvaW50IGFzIG91ciBwcmV2aW91
cwpkaXNjdXNzaW9uOiB0aGUgUUUgYml0IGhhbmRsaW5nIGlzIHJlYWxseSBiYWQsIGFuZCBJIGFt
IHdvcmtpbmcgb24KaW1wcm92aW5nIHRoaXMsIGluIGFub3RoZXIgc2VyaWVzIHdoaWNoIHdhaXRz
IGZvciB0aGlzIG9uZSB0byBsYW5kLgoKSG93ZXZlciB0aGUgb3RoZXIgd2FybmluZyBpdCByYWlz
ZXMgaXMgSU1PIHdyb25nOiBtaXhlZC1tb2RlcyBjaGlwcwooZWl0aGVyIHJlYWQgb3Igd3JpdGUg
d29ya2luZyBpbiBxdWFkIG1vZGUsIGFuZCB0aGUgb3RoZXIgaW4gc2luZ2xlCm1vZGUpIHNob3Vs
ZCBlbmFibGUgdGhlaXIgUUUgYml0IGFueXdheS4gUGxlYXNlIHJhaXNlIGEgd2FybmluZyBpZiB5
b3UKdGhpbmsgdGhpcyBhc3N1bXB0aW9uIGlzIHdyb25nLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
