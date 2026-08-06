Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A929CC55ABF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2026 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmy4KAm7xEJYaOzfMcM0F7np8UzfEJaDU7H5BtFWemc=; b=1XJOD6YhqxAPLA
	n78kPVdnjU+Gh6nOfgHZ2C+ycfUpKUy92jrRXdoUHVpe+JIpGXU5SHzWbwb9KBkFq7BrI7/L/9Rpk
	IRusp/gr/5RaQ6wEAL1NEDSXOqMLyiTCWep2mwlXlL5Laot3lwWE+o2OZ5eUwLsmGJ/g/Xwbc5dyN
	Fapw7KYeaQiqa7AscTadEKLS3QD0wgxFHbJvJmqiMLmAuU3QJXEM/WSWCYQ5warvqHpQ3kBC12i4L
	jJgxTpS7lKuYlIQSTTDDtyK3AS64FCYT0qlCPQeasV7f5j14IqCzq2fqqHNVgts/XxGYcDwC90GqZ
	mwP3fSbfyLSThuduN46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsgx-000000059nb-19Ba;
	Thu, 06 Aug 2026 07:39:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsgu-000000059mj-02ol
	for linux-mtd@lists.infradead.org;
	Thu, 06 Aug 2026 07:39:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F27E94E41109;
	Thu,  6 Aug 2026 07:38:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C23C7602B8;
	Thu,  6 Aug 2026 07:38:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1D0111C35B4E;
	Thu,  6 Aug 2026 09:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786001936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QIpNJGDYu2wZCVnPTESRZf6oFiqJiFOUQMFU1NQbBq4=;
	b=DwL0rzdXpbyZjZlyFIANEjiJii3OqpE1w9gWtP+xSGzuZf8WBXo8Zf0XKP00Lwu2Lz2Kf2
	QakD2hT3EM8vt1EDbbm/OhFIuO/s7p2injKXw96ciew1qKWqHbIUW8eYxkp2IW6dKi/J+8
	9XqTlmxKD+O6H2bY3b5eUkn/AUGtcZfzTRK8JSHSrkUB3CaF+aZpVxiEMbRHA6K2kDpnOX
	EnzPG6+eI4JGvLfUNbvtSjrf14deK0sS3XhlT7haV8UoUIS4oS0pAybe0Arydv52+WYpjp
	L1reV7b4KyLh6KBsJcjlvTM2sjEOfAR6q7njQqOfagrrqC125aey+i6Vwro/xg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Steam Lin" <STLin2@winbond.com>,  "Hsin-Yi
 Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
In-Reply-To: <87mrv2exwp.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 04
	Aug 2026 16:57:26 +0200")
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
	<DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 06 Aug 2026 09:38:50 +0200
Message-ID: <87se4rem0l.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_003900_381925_2949F90F 
X-CRM114-Status: GOOD (  10.92  )
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

SGVsbG8gTWljaGFlbCwKCj4+IE9uZSB0aGluZyB0aGF0IGNvbWVzIHRvIG1pbmQgaXMgaGFyZHdh
cmUgd3JpdGUgcHJvdGVjdGlvbi4gSWYKPj4gdGhlcmUncyBub3RoaW5nIGJlZm9yZSB0aGF0IGNv
ZGUgd2hpY2ggY2hlY2tzIGl0LCB0aGUgdmVyaWZ5IG1pZ2h0Cj4+IGZhaWwgaWYgdGhlIGhhcmR3
YXJlIHdyaXRlIHByb3RlY3Rpb24gaXMgZW5hYmxlZC4gU28gd2Ugc2hvdWxkCj4+IHNvbWVob3cg
Y2hlY2sgZm9yIHRoYXQgYW5kIGRyb3AgdGhlIHZlcmlmeSBoZXJlLgo+Cj4gQnV0IGhvdyBkbyB5
b3UgdGhpbmsgd2Ugc2hvdWxkIGhhbmRsZSBpdD8gV2lsbCB0aGUgUUUgYml0IHdyaXRpbmcKPiB2
ZXJpZmljYXRpb24gZmFpbCBpZiBIVyBXUCBpcyBlbmFibGVkPwoKTG9va2luZyBpbnRvIHRoaXMg
ZnVydGhlcjogd2Ugc2hhbGwgcmV0dXJuIGFuIGVycm9yIGlmIHRoZSBRRSBiaXQgaXMgbm90CnNl
dC4gSXQganVzdCB0ZWxscyB0aGUgY2FsbGVyIHRoYXQgcXVhZCBtb2RlIGNhbm5vdCBiZSB1c2Vk
LiBUaGVuIHVwIHRvCnRoZSBjYWxsZXIgdG8gZWl0aGVyIGhhcmQgZmFpbCBvciBqdXN0IGRlZ3Jh
ZGUgaW50byBzaW5nbGUgbW9kZSAobWF5YmUKYmVjYXVzZSBvZiBhIHN0cmFwcGVkIFdQKS4gV2hh
dCB3ZSBzaG91bGQgZG8gaXMgdG8gcHJvcG9zZSBhIERUIHByb3BlcnR5CnRvIGZsYWcgd2hlbiBX
UCBpcyBzdHJhcHBlZCBpbiBoYXJkd2FyZSwgdGhpcyB3b3VsZCBtYWtlIHRoZSBjb250ZW50IG9m
CnRoZSBzdGF0dXMgcmVnaXN0ZXJzIGltbXV0YWJsZSBhbmQgd2Ugd291bGQganVzdCBza2lwIHRo
ZSBlbnRpcmUgd3JpdGUKb3BlcmF0aW9uIGluIHRoZSBmaXJzdCBwbGFjZSwgaW5zdGVhZCBvZiBk
ZWxpYmVyYXRlbHkgdHJ5aW5nIGFuZCBnZXQgYQoxMDAlIGZhaWx1cmUgcmF0ZS4gTmV2ZXJ0aGVs
ZXNzLCB0aGUgY2hhbmdlcyBpbnRyb2R1Y2VkIGhlcmUgYXJlIGtpbmQgb2YKb3J0aG9nb25hbCBh
bmQgZG8gbm90IGFsdGVyIHRoZSBjdXJyZW50IGJlaGF2aW91cjsgd2Ugc2hhbGwgaG93ZXZlcgps
aXN0ZW4gaWYgcGVvcGxlIHN0YXJ0IGNvbXBsYWluaW5nIGFib3V0IHRoaXMgYW5kIHBlcmhhcHMg
aW1wbGVtZW50IHRoZQpzb2x1dGlvbiBwcm9wb3NlZCBhYm92ZS4KClRoYW5rcyEKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
