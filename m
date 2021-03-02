Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8321CC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:15:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DFFB64EF8
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DFFB64EF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0gVuaDjtwNeyDNI3vII0K/SOVvHXCOav2ADWdXk20JE=; b=C3KURhGdLk+dp+LqRItIjpSSS
	J9+sUFDMsPZjhkeIqBi4fBeqK/YDyiArxLPY+6ZXGdVygIkgcGty3EJjeO2tXbXG3Ey25e0V8V57s
	I0vOcojqNKmmglI4s4aU3rZV6NAxjAgR8KVv/A+gMeGQTPTS8d+NvkWfDj2OX1fpYnbjShP3naHE7
	bub3fdFl1SSf5+DFNr6sWtXQdPY0V0S1DOQ+rpVCmPMwlNvAjYQHTCe+WuGff/eorFMFudfNTgH7p
	4PGNiHY1zYBlRRgefPwbdMp13ksgYhPJPtviAAcuq1NdCGMaHZUWbnkFg+jHvf/NpuIdGz+4Gp/iN
	fz/9Mp1dg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYnp-006Ybu-PR; Wed, 03 Mar 2021 21:13:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT7y-005Jdi-VF
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=VQq+GafE92akIFH35nx17N0T1U8pJdHJM7CIpIGJl3Y=; b=ARFj02G68aYSn6hceRC2F3+NkK
 WL7yyrbuhF+pXHnC7V1yY2xN2/19S/Uts8Ufls/g4nNsaYSbWg4l5E0UrRdDn6g7VJeNdBYDzgq9g
 LMRj0V7MQfd+NjeHyJgjbs+OjfTh9IzRY4Vep0yVJpEfRFyYSHDVX+EEYHSbeIfFL+VeEyDlPiTq8
 owPdNNV7kjAY6xCfdqXRYHQ9Lr41ANGArZIy/kzcKLPjOUizU8cUg4oMEn4rTwQxd2SKWY/TrW8Hp
 y4cvJW4sKHXF+0Srv2ZsJRiTXixntMloC7W+et6VLy8D8cAgpNLXR4tNgHmdC6f0fnv1ghfCWxmdA
 oZe3QbvQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8ZW-00HW1F-SX
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:12:41 +0000
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E0D1C200004;
 Tue,  2 Mar 2021 17:12:09 +0000 (UTC)
Date: Tue, 2 Mar 2021 18:12:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, andriy.shevchenko@linux.intel.com, Vignesh
 Raghavendra <vigneshr@ti.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Ramuthevar Vadivel Murugan
 <vadivel.muruganx.ramuthevar@linux.intel.com>, "open list:NAND FLASH
 SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 8/9] mtd/drivers/nand: Use HZ macros
Message-ID: <20210302181208.3b673e2c@xps13>
In-Reply-To: <ad7da99c-5385-02dc-5fbc-c9ae31903802@linaro.org>
References: <20210302163143.22998-1-miquel.raynal@bootlin.com>
 <ad7da99c-5385-02dc-5fbc-c9ae31903802@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171241_671484_52E46491 
X-CRM114-Status: UNSURE (   9.71  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+IHdy
b3RlIG9uIFR1ZSwgMiBNYXIgMjAyMQoxODowMzoxMiArMDEwMDoKCj4gT24gMDIvMDMvMjAyMSAx
NzozMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IE9uIFdlZCwgMjAyMS0wMi0yNCBhdCAxNDo0
MjoxOCBVVEMsIERhbmllbCBMZXpjYW5vIHdyb3RlOiAgCj4gPj4gSFogdW5pdCBjb252ZXJzaW9u
IG1hY3JvcyBhcmUgYXZhaWxhYmxlIGluIHVuaXRzLmgsIHVzZSB0aGVtIGFuZAo+ID4+IHJlbW92
ZSB0aGUgZHVwbGljYXRlIGRlZmluaXRpb24uCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gIAo+ID4gCj4gPiBBcHBsaWVk
IHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9s
aW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuICAKPiAKPiBBY3R1YWxseSwgSSB3YXMgZXhwZWN0
aW5nIHRvIGhhdmUgaXQgbWVyZ2VkIHRocm91Z2ggbGludXgtcG0gYXMgdGhpcwo+IHBhdGNoIGRl
cGVuZHMgb24gMS85Cj4gCj4gCj4gCgpObyBwcm9ibGVtLCBJIGp1c3QgcmVtb3ZlZCBpdCBmcm9t
IG15IHRyZWUuIEhvd2V2ZXIgaW4gdGhpcyBjYXNlCnBsZWFzZSBmaXggdGhlIHN1YmplY3QgcHJl
Zml4IHRvICJtdGQ6IHJhd25hbmQ6IGludGVsOiIuIFdpdGggdGhpcyBuaXQKZml4ZWQsCgpBY2tl
ZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
