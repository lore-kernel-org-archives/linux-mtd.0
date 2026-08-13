Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7F7C5AC67
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rr5enNO27IIMu676xYk5VLXmz8DAmvXrUnHKCOUwuEE=; b=MGyDWaqW03oO/i
	Abam7JAjiyrp/rOBOf3CkKHxN5Psyozka50qo0VXuTuJUyxYpa5llJTuh23Z6swVSBFLuJPF8SND5
	BkZYpIaiKiHxFhKA7Ru1IJsAuE1nHrnt3F7bJ6fnGqlsbbtNkwdDyHsQMxknWPgqvWJkD+HOwgftN
	z7eLxcBN2sZykyDdy1ax3Oeo+Q4VB/SJPzFQQfDq1MuMmM+RvxRNX2iYzVfw8Ual8q2nbaacYktKV
	uGWF8/NZt7OJ6A0lGyJYwsm8vs5LZgHiTkwQ8nEJ+9nc/nksWDP2GeNwFPPCBhH4QqlEiM9DY/edk
	wiZTApQfw8ie3kJGQZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv2-000000009gk-3fu2;
	Thu, 13 Aug 2026 08:36:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQuu-000000009VY-2J4C
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 08:36:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37C4C1A15E1;
	Thu, 13 Aug 2026 08:35:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07351602B8;
	Thu, 13 Aug 2026 08:35:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6327811C4DB29;
	Thu, 13 Aug 2026 10:35:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786610156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GpGUXUL/3ly8tG9nRmn5kJJy+CYafCrEj7bnx6zV2Ro=;
	b=ULJrxkpTfkC1gSTd5Svscu84GOvHJL0Qbxf0I7MS4nIoWKp9Ia5RtDkOVGsjsyGgkF1W4O
	0Mot+07TLuIDyFdkJ7c2ah64hwK2L4E2lgY7X08p7t+be+k93Q5WvIG+odZn7nyYCTs7o7
	uKTSKxWqs/GGWqcFP8q4U2+FZUF08nFdiS/TskZyoNFVhsCLWMw2iMmEcVbDvaqkPMlNtk
	H418GcTautbj4ZZTB6O4hKo+4tpmIVO5XZD947t1p7NsYTRxEjDbIIyfZ78P5nkqvTBidA
	XXfqcatSLZu+0j+DBVz7HvcMMQRURDbRapI2iDSTjLbpUJvYuOfnLhRXpCxY5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v7 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
In-Reply-To: <20260811183313.1550425-17-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 12 Aug 2026 00:03:11 +0530")
References: <20260811183313.1550425-1-s-k6@ti.com>
	<20260811183313.1550425-17-s-k6@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 13 Aug 2026 10:35:52 +0200
Message-ID: <87bjb6l8nr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013600_729407_8FF127E2 
X-CRM114-Status: GOOD (  12.95  )
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

SGkgU2FudGhvc2gsCgpJIGhhdmUgb25seSBvbmUgY29tbWVudCBvbiB0aGUgc3BpbmFuZCBiaXRz
LgoKPiArLyoKPiArICogc3BpbmFuZF90cnlfcmFua2VkX3ZhcmlhbnQoKSAtIFRyeSBjb250cm9s
bGVyIG9wdGltaXphdGlvbiBvbiB2YXJpYW50cyBpbgo+ICsgKgkJCQkgIHBlcmZvcm1hbmNlIG9y
ZGVyLgo+ICsgKiBAc3BpbmFuZDogICAgU1BJIE5BTkQgZGV2aWNlCj4gKyAqIEBtZW06ICAgICAg
ICBTUEkgbWVtb3J5IGRldmljZQo+ICsgKiBAaWZhY2U6ICAgICAgYnVzIGludGVyZmFjZSB0byBp
dGVyYXRlIChPRFRSIG9yIFNTRFIpCj4gKyAqIEB0cmllZF9tYXNrOiBiaXRtYXNrIG9mIGFscmVh
ZHktdHJpZWQgdmFyaWFudCBpbmRpY2VzOyB1cGRhdGVkIG9uIGVhY2ggdHJ5Cj4gKyAqCj4gKyAq
IEl0ZXJhdGVzIHRoZSBmdWxsIHJlYWQgdmFyaWFudCBsaXN0IGluIGRlc2NlbmRpbmcgcGVyZm9y
bWFuY2Ugb3JkZXIsCj4gKyAqIHNraXBwaW5nIHZhcmlhbnRzIGluIEB0cmllZF9tYXNrLCBhbmQg
Y2FsbHMgZXhlY3V0ZV90dW5pbmcgb24gZWFjaCB1bnRpbAo+ICsgKiBvbmUgc3VjY2VlZHMuIFJh
bmtlZCBpdGVyYXRpb24gZmluZHMgdGhlIGJlc3QgYXZhaWxhYmxlIHZhcmlhbnQgd2l0aG91dAo+
ICsgKiByZS10cnlpbmcgYWxyZWFkeS1hdHRlbXB0ZWQgb25lcy4KPiArICoKPiArICogT24gc3Vj
Y2Vzcywgc2V0cyBzcGluYW5kLT5tYXhfcmVhZF9vcCBhbmQgdXBkYXRlcyB0aGUgbWF0Y2hpbmcK
PiArICogb2R0cl9vcF90ZW1wbGF0ZXMucmVhZF9jYWNoZSBvciBzc2RyX29wX3RlbXBsYXRlcy5y
ZWFkX2NhY2hlLgo+ICsgKi8KPiArc3RhdGljIGJvb2wgc3BpbmFuZF90cnlfcmFua2VkX3Zhcmlh
bnQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICsJCQkJICAgICAgIHN0cnVjdCBz
cGlfbWVtICptZW0sCj4gKwkJCQkgICAgICAgZW51bSBzcGluYW5kX2J1c19pbnRlcmZhY2UgaWZh
Y2UsCj4gKwkJCQkgICAgICAgdTMyICp0cmllZF9tYXNrKQo+ICt7Cj4gKwljb25zdCBzdHJ1Y3Qg
c3BpbmFuZF9vcF92YXJpYW50cyAqdmFyaWFudHMgPSBzcGluYW5kLT5hbGxfcmVhZF92YXJpYW50
czsKPiArCWNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpiZXN0Owo+ICsJaW50IHJldDsKPiArCj4g
KwlpZiAoIXZhcmlhbnRzKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gKwl3aGlsZSAoKGJlc3Qg
PSBzcGluYW5kX29wX2ZpbmRfYmVzdF92YXJpYW50KHNwaW5hbmQsIHZhcmlhbnRzLCBpZmFjZSwK
PiArCQkJCQkJICAgICp0cmllZF9tYXNrKSkpIHsKPiArCQkqdHJpZWRfbWFzayB8PSBCSVQoYmVz
dCAtIHZhcmlhbnRzLT5vcHMpOwo+ICsJCXNwaW5hbmQtPm1heF9yZWFkX29wID0gKmJlc3Q7Cj4g
KwkJc3BpbmFuZC0+bWF4X3JlYWRfb3AubWF4X2ZyZXEgPSAwOwo+ICsJCXNwaW5hbmQtPm1heF93
cml0ZV9vcC5tYXhfZnJlcSA9IDA7Cj4gKwkJcmV0ID0gc3BpX21lbV9leGVjdXRlX3R1bmluZyht
ZW0sICZzcGluYW5kLT5tYXhfcmVhZF9vcCwKPiArCQkJCQkgICAgICZzcGluYW5kLT5tYXhfd3Jp
dGVfb3ApOwo+ICsJCWlmIChyZXQgJiYgcmV0ICE9IC1FT1BOT1RTVVBQKQo+ICsJCQlkZXZfZGJn
KCZtZW0tPnNwaS0+ZGV2LCAiJXMgb3B0aW1pemF0aW9uIGZhaWxlZDogJWRcbiIsCj4gKwkJCQlp
ZmFjZSA9PSBPRFRSID8gIk9EVFIiIDogIlNTRFIiLCByZXQpOwo+ICsJCWlmICghcmV0ICYmIHNw
aW5hbmQtPm1heF9yZWFkX29wLm1heF9mcmVxKSB7Cj4gKwkJCWlmIChpZmFjZSA9PSBPRFRSKQo+
ICsJCQkJc3BpbmFuZC0+b2R0cl9vcF90ZW1wbGF0ZXMucmVhZF9jYWNoZSA9IGJlc3Q7Cj4gKwkJ
CWVsc2UKPiArCQkJCXNwaW5hbmQtPnNzZHJfb3BfdGVtcGxhdGVzLnJlYWRfY2FjaGUgPSBiZXN0
Owo+ICsJCQlzcGluYW5kLT5jb250X3JlYWRfcG9zc2libGUgPSBmYWxzZTsKCldoeSBkbyB5b3Ug
ZGlzYWJsZSBjb250aW51b3VzIHJlYWRzPyBJIGtub3cgaXQgaXMgbm90IHRoZSBzYW1lIGFzIHRo
ZQpyZWFkIHRlbXBsYXRlLCBidXQgaXQgb25seSBkaWZmZXJzIGJ5IGEgZmV3IGR1bW15IGN5Y2xl
cywgc28gZXZlcnl0aGluZwpzaG91bGQgd29yayBhcyBleHBlY3RlZC4gSSBiZWxpZXZlIHdpdGhv
dXQgY29tcGxleGlmeWluZyBtdWNoIHRoZSBsb2dpYwp3ZSBzaG91bGQgYmUgYWJsZSB0byBzdXBw
b3J0IGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
