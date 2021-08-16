Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC1DC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 15:21:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5B460ED5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 15:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA5B460ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N0DpDiQcdpNvjdBHgtOqE8+5Zh6xigFNyh1z1aFt2NA=; b=wrU+uAcRC6OrGr
	yhPazwGTWGOhdU8vprQwd77s/npyhjhdk3bII1ozQU/urIYnWsIWDUiPXLvr0gwHfSY5pNwL2aFL1
	Wqq8MV4s4tiyiRjbgBPQ1zpTsvWZZGOnugQLi6HlzI0L4OSsv/wx5Z4TK2ubrdk90IhX+T2K8yyKy
	UFKsvo6n/n+8Cvc3RRo+PVqih6iYHDuQkgBbvZeEw4mF2TSrZFB5stxR7Zofyhi+gNv58om/Z+5Z9
	ghz9jaaSNJfEdxx/ZUqwH8RfPdUqpctUMu+WruurbZaPDf6UIPJ7+89VF5SBhgh36QLwPCAip4ien
	uDcDn8iqq9y+m5I4kHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFePy-00HLfS-P6; Mon, 16 Aug 2021 15:20:50 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFePv-00HLep-1K
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 15:20:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D804D4000A;
 Mon, 16 Aug 2021 15:20:41 +0000 (UTC)
Date: Mon, 16 Aug 2021 17:20:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Changes for 5.14-rc7
Message-ID: <20210816172040.7a67f8da@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_082047_258298_1123B147 
X-CRM114-Status: UNSURE (   9.12  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIHRoZSBNVEQgZml4ZXMgUFIgZm9yIHRoZSBuZXh0IC1yYy4g
QWdhaW4sIHNvcnJ5IGZvciB0aGUgZGVsYXkuCgpUaGFua3MsCk1pcXXDqGwKCgpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU3M2YwZjBlZTc1NDExNzFkODlmMmUyNDkxMTMwYzc3
NzFiYTU4ZDM6CgogIExpbnV4IDUuMTQtcmMxICgyMDIxLTA3LTExIDE1OjA3OjQwIC0wNzAwKQoK
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2Zp
eGVzLWZvci01LjE0LXJjNwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGI0ODAyNzA4
M2E3OGIxMzM1NjY5NTU1NWEwNWIwZTA4NWUzNzg2ODc6CgogIG10ZDogcmF3bmFuZDogRml4IHBy
b2JlIGZhaWx1cmUgZHVlIHRvIG9mX2dldF9uYW5kX3NlY3VyZV9yZWdpb25zKCkgKDIwMjEtMDgt
MDYgMjE6NDQ6MTYgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1URCBjb3JlIGZpeGVzOgoqIEZpeCBsb2NrIGhp
ZXJhcmNoeSBpbiBkZXJlZ2lzdGVyX210ZF9ibGt0cmFucwoqIEhhbmRsZSBmbGFzaGVzIHdpdGhv
dXQgT1RQIGdyYWNlZnVsbHkKKiBCcmVhayBjaXJjdWxhciBsb2NrcyBpbiByZWdpc3Rlcl9tdGRf
YmxrdHJhbnMKCk1URCBkZXZpY2UgZml4ZXM6CiogbWNocDQ4bDY0MDoKICAtIEZpeCBtZW1vcnkg
bGVhayBvbiBjbWQKICAtIFNpbGVuY2Ugc29tZSB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHdhcm5p
bmdzCiogYmxrZGV2czoKICAtIEluaXRpYWxpemUgcnEubGltaXRzLmRpc2NhcmRfZ3JhbnVsYXJp
dHkKCkNGSSBmaXhlczoKKiBGaXggY3Jhc2ggd2hlbiBlcmFzaW5nL3dyaXRpbmcgQU1EIGNhcmRz
CgpSYXcgTkFORCBmaXhlczoKKiBGaXggb2ZfZ2V0X25hbmRfc2VjdXJlX3JlZ2lvbnMoKToKICAt
IEFkZCBhIG1pc3NpbmcgY2hlY2sKICAtIEF2b2lkIGFuIHVud2FudGVkIHByb2JlIGZhaWx1cmUg
d2hlbiBhIERUIHByb3BlcnR5IGlzIG1pc3NpbmcKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQW5kcmVhcyBQZXJzc29uICgx
KToKICAgICAgbXRkOiBjZmlfY21kc2V0XzAwMDI6IGZpeCBjcmFzaCB3aGVuIGVyYXNpbmcvd3Jp
dGluZyBBTUQgY2FyZHMKCkNvbGluIElhbiBLaW5nICgxKToKICAgICAgbXRkOiBkZXZpY2VzOiBt
Y2hwNDhsNjQwOiBGaXggbWVtb3J5IGxlYWsgb24gY21kCgpEYW4gQ2FycGVudGVyICgyKToKICAg
ICAgbXRkOiByYXduYW5kOiBBZGQgYSBjaGVjayBpbiBvZl9nZXRfbmFuZF9zZWN1cmVfcmVnaW9u
cygpCiAgICAgIG10ZDogbWNocDQ4bDY0MDogc2lsZW5jZSBzb21lIHVuaW5pdGlhbGl6ZWQgdmFy
aWFibGUgd2FybmluZ3MKCkRlc21vbmQgQ2hlb25nIFpoaSBYaSAoMik6CiAgICAgIG10ZDogYnJl
YWsgY2lyY3VsYXIgbG9ja3MgaW4gcmVnaXN0ZXJfbXRkX2Jsa3RyYW5zCiAgICAgIG10ZDogZml4
IGxvY2sgaGllcmFyY2h5IGluIGRlcmVnaXN0ZXJfbXRkX2Jsa3RyYW5zCgpNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IEZpeCBwcm9iZSBmYWlsdXJlIGR1ZSB0
byBvZl9nZXRfbmFuZF9zZWN1cmVfcmVnaW9ucygpCgpNaWNoYWVsIFdhbGxlICgxKToKICAgICAg
bXRkOiBjb3JlOiBoYW5kbGUgZmxhc2hlcyB3aXRob3V0IE9UUCBncmFjZWZ1bGx5CgpaaGloYW8g
Q2hlbmcgKDEpOgogICAgICBtdGQ6IG10ZF9ibGtkZXZzOiBJbml0aWFsaXplIHJxLmxpbWl0cy5k
aXNjYXJkX2dyYW51bGFyaXR5CgogZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMg
fCAgMiArLQogZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hwNDhsNjQwLmMgICAgfCAgNSArKystLQog
ZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyAgICAgICAgICAgfCAxMSArKysrLS0tLS0tLQogZHJp
dmVycy9tdGQvbXRkY29yZS5jICAgICAgICAgICAgICAgfCAgNCArKystCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2Jhc2UuYyAgICB8IDEwICsrKysrKysrLS0KIDUgZmlsZXMgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
