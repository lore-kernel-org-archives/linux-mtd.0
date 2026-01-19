Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B2ECCF2E3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuenkispOGHMcAh7wG47a8vIitiXK/uQQOPsnliMjPA=; b=uCDtEBoG7JrVZ7
	KV+eQY25oIOLKbRKpAPEJc0VwZnh43i9uFwZsQiX3yzQI+CAYSR9IuJjO8B8n7r6iieFTTPT2IZYV
	wofmY94Cu9OU9tcSK8EHIZh2alSNBxUKCs6mGRHvsG57CrIzE01ah4cadJ44UOhEZdiYRxmrU7mFm
	TaJOjMX2bGDwwm/52kS0ChDrryO9UYA9RCWnVtfulAk9kmNj0PNXXJN3KVPT4IRBaRa9farpHhQji
	IZpVcMOoHu0uvOJrIC08MW2FqTxUKz/lLDLWfOWUkC4tqXB2CxuoAIw3NowVeipN2RYQL3cu4Pdvn
	EiyiWC0m3sMLUNtG/iiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmoI-00000001oUh-2gfO;
	Mon, 19 Jan 2026 10:48:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmoC-00000001oUF-14cg
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:48:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09347C214C4;
	Mon, 19 Jan 2026 10:48:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A46C60731;
	Mon, 19 Jan 2026 10:48:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 389EA10B6AE98;
	Mon, 19 Jan 2026 11:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768819709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LesPQtP8nBpkLG5sVvumxxLxN/aDk/ihJRQImuDvqHY=;
	b=wUWGRqNrXy5hT3TdOC5N3mfiMFCZP6/Udi6kKrjVnE95z5mWJZhp9InQhvokC7pwgnBP8m
	LugDc76PMnz/JhmSVqqQag4QrYorxiUAvI20ELl6MBRhwm5K30y03er9m/PJykETQg9uUB
	Sa8StQLeUw6KE0c3mHz4RxiAjpNsyyD/qbiINdBRWwy9Qq8Jfq16MInQjdm0sZswD0YPq9
	drezzbrbhBi1gyEFQ069+yw85vDbgzaY9Ybnhiodd1RE8D3bZo6mCHve/94NTmKLGUIEk5
	noPcSmsfNkPFUEx1slK4c6gj981LGeUvlj3byfOLjH3IZAx8R/D+lF5r2nWZ/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Brian Norris <computersforpeace@gmail.com>,
  Kamal Dasu <kdasu.kdev@gmail.com>,  William Zhang
 <william.zhang@broadcom.com>,  Nick Terrell <terrelln@fb.com>,  David
 Sterba <dsterba@suse.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Simon Glass
 <sjg@chromium.org>,  Linus Walleij <linusw@kernel.org>,  Ulf Hansson
 <ulf.hansson@linaro.org>,  Marcus Folkesson <marcus.folkesson@gmail.com>,
  Tony Lindgren <tony@atomide.com>,  Roger Quadros <rogerq@kernel.org>,
  Hauke Mehrtens <hauke@hauke-m.de>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mmc@vger.kernel.org
Subject: Re: [PATCH 00/10] dt-bindings: mtd: Partition binding fixes and
 restructuring
In-Reply-To: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org> (Rob
	Herring's message of "Thu, 08 Jan 2026 11:53:09 -0600")
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 19 Jan 2026 11:48:22 +0100
Message-ID: <87tswhswsp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024833_220184_E8BAF381 
X-CRM114-Status: UNSURE (   9.11  )
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

SGVsbG8gUm9iLAoKT24gMDgvMDEvMjAyNiBhdCAxMTo1MzowOSAtMDYsICJSb2IgSGVycmluZyAo
QXJtKSIgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoZSBwYXJ0aXRpb24gYmluZGluZ3Mg
ZmFpbCB0byByZXN0cmljdCB1bmRlZmluZWQgcHJvcGVydGllcy4gVGhpcyBpcyAKPiBwcmltYXJp
bHkgb24gZml4ZWQtcGFydGl0aW9ucyB3aGljaCBjYW4gYmUgbmVzdGVkIGFuZCBwYXJ0aXRpb24g
bm9kZXMgCj4gd2l0aG91dCBhIGNvbXBhdGlibGUgc3RyaW5nLiBUaGlzIHNlcmllcyBmaXhlcyB0
aG9zZSBpc3N1ZXMgYW5kIHRoZW4gCj4gc2V2ZXJhbCBwcm9ibGVtcyBleHBvc2VkIGJ5IHJlc3Ry
aWN0aW5nIHVuZGVmaW5lZCBwcm9wZXJ0aWVzLiBBcyBwYXJ0IG9mIAo+IHRoaXMsIHRoZSBzY2hl
bWEgc3RydWN0dXJlIGlzIHJld29ya2VkIHRvIGZvbGxvdyBtb3JlIGNvbnZlbnRpb25hbCAKPiBz
dHJ1Y3R1cmUgb2YgYXBwbHlpbmcgc2NoZW1hcyBieSBjb21wYXRpYmxlIGFuZCBhIHNjaGVtYSBv
bmx5IGNoZWNrcyAxIAo+IGxldmVsIG9mIG5vZGVzICh1bmxlc3MgcG9zc2libGUgY2hpbGQgbm9k
ZXMgYXJlIGZpeGVkKS4KClRoZSBzZXJpZXMgZG9lcyBub3QgYXBwbHkgY2xlYW5seSwgSSB0cmll
ZCBtdGQvbmV4dCBhbmQgdGhlbgp2Ni4xOS1yYzEuIENhbiB5b3UgcGxlYXNlIHJlYmFzZSBpdCBh
bmQgZml4IHRoZSBjb25mbGljdHMgKGF0IGxlYXN0IDIKcGF0Y2hlcyBmYWlsLCBhbmQgdGhlbiBJ
IHN0b3BwZWQpPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
