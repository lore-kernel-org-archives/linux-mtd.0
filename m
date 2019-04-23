Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443D2C282DD
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:53:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C52206BA
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYL+66i8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="n6YMDDai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C52206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHa2VkGJ2KjJxsQUF8P3wQjPVVc6IQw3/zYHUQhbw3Q=; b=QYL+66i8TqTUyd
	km6zNExx1AiPuETnHOX1iqdCw08PdU5n8d1PTL4OwYr6gmkKAcjp0sn2C8FWe34WfztWTwV94s7Ma
	P91fq7L3zR55O9dhM+dTSlK1YD6qcXHzQtYq9Ku3isHllSelLIc3t45z6RTfi3Pj3Z9sI3tiDxxQz
	fqic6YyHNlT8Fkulx15CeO2aFOCyIwNBEzBeehY3MymNqgGbCCexjLMXeHjVuoFIQ69JNj0tVj/Gl
	WKJ3mFwzde8wAfH4xspf2OeVNHnY4K19V8DyqEhuqKppZ7CQuNnKhNewozuZLNSkHYBPpOl1yEUmq
	6WKwJsMu1honnO+7Gfsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hImV8-0001sh-Hs; Tue, 23 Apr 2019 03:53:46 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hImSK-0006dQ-AE; Tue, 23 Apr 2019 03:51:04 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3N3o2cD023044;
 Tue, 23 Apr 2019 12:50:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3N3o2cD023044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555991412;
 bh=ck3m1Bnhk+gBZ69Ip9jiWsEf5IWvpXJTs7wxMIQoCXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n6YMDDaiO+Y+ehsJY3BwtkUdg1YDcyPA3Dzmuu8XOwJ1WrZig5ClP17Sypb2aBakK
 pdb05/Mxt6GVPh61aaBT0xJP66Mu0V7s+lzlxmzMKtCZpnT8wEPrNDYE+HzwcwOsrt
 M+K4hgRSZ2BsDVMyqA2McjsJjJooi4+aOx81MKG7ecEsFD8/riXxDnXctaXPrCzSeY
 2Awph1mCyl2BuT2YcctjtjX9fGNx3slwDHVqkisVXH/eIqwqW4g1+6Ign1Zg0xzjsQ
 nEbhKOdhvwUnu9BexA/KqiOdzGngWI9/3T9raieSibcixW3rUYkf2NW/Jkw05P6Tx3
 svNkTBvfuxmgA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [RESEND PATCH v3 05/11] mtd: rawnand: vf610_nfc: add initializer to
 avoid -Wmaybe-uninitialized
Date: Tue, 23 Apr 2019 12:49:53 +0900
Message-Id: <20190423034959.13525-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423034959.13525-1-yamada.masahiro@socionext.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_205053_289431_BA178EE5 
X-CRM114-Status: GOOD (  10.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathieu Malaterre <malat@debian.org>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBwcmVwYXJlcyB0byBtb3ZlIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyBmcm9tIHg4NiB0
byBhIGNvbW1vbgpwbGFjZS4gV2UgbmVlZCB0byBlbGltaW5hdGUgcG90ZW50aWFsIGlzc3VlcyBi
ZWZvcmVoYW5kLgoKS2J1aWxkIHRlc3Qgcm9ib3QgaGFzIG5ldmVyIHJlcG9ydGVkIC1XbWF5YmUt
dW5pbml0aWFsaXplZCB3YXJuaW5nCmZvciB0aGlzIHByb2JhYmx5IGJlY2F1c2UgdmY2MTBfbmZj
X3J1bigpIGlzIGlubGluZWQgYnkgdGhlIHg4Ngpjb21waWxlcidzIGlubGluaW5nIGhldXJpc3Rp
Yy4KCklmIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyBpcyBlbmFibGVkIGZvciBhIGRpZmZlcmVu
dCBhcmNoaXRlY3R1cmUKYW5kIHZmNjEwX25mY19ydW4oKSBpcyBub3QgaW5saW5lZCwgdGhlIGZv
bGxvd2luZyB3YXJuaW5nIGlzIHJlcG9ydGVkOgoKZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBf
bmZjLmM6IEluIGZ1bmN0aW9uIOKAmHZmNjEwX25mY19jbWTigJk6CmRyaXZlcnMvbXRkL25hbmQv
cmF3L3ZmNjEwX25mYy5jOjQ1NTozOiB3YXJuaW5nOiDigJhvZmZzZXTigJkgbWF5IGJlIHVzZWQg
dW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21heWJlLXVuaW5pdGlhbGl6ZWRdCiAg
IHZmNjEwX25mY19yZF9mcm9tX3NyYW0oaW5zdHItPmN0eC5kYXRhLmJ1Zi5pbiArIG9mZnNldCwK
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgogICAgICAgICAgICBuZmMtPnJlZ3MgKyBORkNfTUFJTl9BUkVBKDApICsgb2Zmc2V0LAogICAg
ICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICAgICAg
ICB0cmZyX3N6LCAhbmZjLT5kYXRhX2FjY2Vzcyk7CiAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFz
YWhpcm9Ac29jaW9uZXh0LmNvbT4KLS0tCgpDaGFuZ2VzIGluIHYzOiBOb25lCkNoYW5nZXMgaW4g
djI6CiAgLSBzcGxpdCBpbnRvIGEgc2VwYXJhdGUgcGF0Y2gKCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy92ZjYxMF9uZmMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMKaW5kZXggYTY2MmNhMTk3MGU1Li4x
OTc5MmQ3MjVlYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5j
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jCkBAIC0zNjQsNyArMzY0LDcg
QEAgc3RhdGljIGludCB2ZjYxMF9uZmNfY21kKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiB7CiAJ
Y29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyOwogCXN0cnVjdCB2ZjYxMF9uZmMgKm5m
YyA9IGNoaXBfdG9fbmZjKGNoaXApOwotCWludCBvcF9pZCA9IC0xLCB0cmZyX3N6ID0gMCwgb2Zm
c2V0OworCWludCBvcF9pZCA9IC0xLCB0cmZyX3N6ID0gMCwgb2Zmc2V0ID0gMDsKIAl1MzIgY29s
ID0gMCwgcm93ID0gMCwgY21kMSA9IDAsIGNtZDIgPSAwLCBjb2RlID0gMDsKIAlib29sIGZvcmNl
OGJpdCA9IGZhbHNlOwogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
