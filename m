Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DD3D2ECF7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqxDvslJVM2JX08wX1vC8uj97TNr2KBjiD9wPc+jmwE=; b=y6DJVo0yGJZFO3
	/7YVMKksgQp9XxTSzXrhnltaoUUzLg1JGnXTu2GaJ4ic9BwbqlCJUDGasMKJE2FW/TlKw1bs+3U/2
	bo5ES+Fnba2fGsuq/4FzDzJVoeTdLdo72n2o7bJdSALUHPGlWdcZzz4Nf2eaKYHXnayV2uQe2oNkF
	5TgYqZQHn/ejT6HJGmQ/bmI7dOfxq9eht53bVkxWRwuF0dRTfam5Vpm+IpjndbIamvaYsMbPphsJe
	yEW9N7xxikBnz3dtehic5iZOqJdTZHR+yiFtTAJ8nLtOwXPr+315vBpmB8BtdUCSC4dVOoq0TcyvY
	Kr7X5ID8rASC7efiVoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDA6-0000000427q-2FQl;
	Tue, 20 Jan 2026 14:56:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDA3-0000000427V-3bo3
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 14:56:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E1524E421AC;
	Tue, 20 Jan 2026 14:56:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3084C606AB;
	Tue, 20 Jan 2026 14:56:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1561410B6B50F;
	Tue, 20 Jan 2026 15:56:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768921006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aiiF64/Crg7D0thgOrGHT16eEW2iJPzVrHJ8ClGguUg=;
	b=SVA+yYZsLizZPszL9kCEbpybr/096vW3WoAgn5ESvGj72kbE4npo40K+KYFqX6Mwa+wesz
	qZ369/wSNsFqskcVjB18pk9N4MVIkuJ8TuAurWAm5a7Sir4ZdqYkxkBIa5WHYPvNconQdB
	lKMUD3wVT1JasLD06a4hb0tVWY6T7Eaz0D7ytdwX5tPzZjVZEjEcutTlMJ9FqktTfGPT+l
	wr10SrIJhEjfgMjpBzaIyBNz9Z6u13tyg409xGoY7ChlzkAXYGeeo6vvUW/e7dTrpKUyTU
	/mHItJvMFHGEnbbpQKl3O5m44eQAMG/jzuwvnbkSNN5wMY4swjRvxkWuknMk1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
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
In-Reply-To: <CAL_JsqJ7_yKRTCOrxcq0QDy_MRMCRMQqhH=TKiBs=nubqNN9HA@mail.gmail.com>
	(Rob Herring's message of "Mon, 19 Jan 2026 19:54:24 -0600")
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
	<87tswhswsp.fsf@bootlin.com>
	<CAL_JsqJ7_yKRTCOrxcq0QDy_MRMCRMQqhH=TKiBs=nubqNN9HA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 20 Jan 2026 15:56:38 +0100
Message-ID: <87ikcws57d.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_065652_032863_B41BC5CA 
X-CRM114-Status: GOOD (  12.27  )
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

SGVsbG8sCgo+PiBUaGUgc2VyaWVzIGRvZXMgbm90IGFwcGx5IGNsZWFubHksIEkgdHJpZWQgbXRk
L25leHQgYW5kIHRoZW4KPj4gdjYuMTktcmMxLiBDYW4geW91IHBsZWFzZSByZWJhc2UgaXQgYW5k
IGZpeCB0aGUgY29uZmxpY3RzIChhdCBsZWFzdCAyCj4+IHBhdGNoZXMgZmFpbCwgYW5kIHRoZW4g
SSBzdG9wcGVkKT8KPgo+IEkgcmViYXNlZCBvbiBtdGQvbmV4dCBhbmQgc2VudCB2Mi4gSSBvbmx5
IHNhdyBvbmUgY29uZmxpY3QgdGhvdWdoLCBhbmQKPiB0aGF0IHdhcyB3aXRoIHNlYW1hLnlhbWwu
IFRoYXQncyBnb2luZyB0byBjb25mbGljdCB3aXRoIExpbnVzJyB0cmVlLAo+IGJ1dCB0aGUgcmVz
b2x1dGlvbiBpcyB0YWtlIHRoZSBkZWxldGVkIGZpbGUuCgpJIGRpZG4ndCBzZWUgd2hlcmUgdGhp
cyBzZWFtYSBmaWxlIHdhcyBtb2RpZmllZCwgZXhjZXB0IGZvciBMaW51cyBXLidzCmFkZHJlc3Mg
Y2hhbmdlLiBJcyB0aGVyZSBhbiAtcmMgSSBuZWVkIHRvIHB1bGw/IE9yIGFuIGltbXV0YWJsZSB0
YWc/CgpNYXliZSB0aGlzIHNlcmllcyBhcHBsaWVzIG9uIHRvcCBvZiB5b3VyIG5leHQgYnJhbmNo
PyBJIGNhbiBnaXZlIGFuIGFjawpmb3IgdGhlIGZ1bGwgc2VyaWVzIGlmIHRoYXQncyB0aGUgY2Fz
ZSBhbmQgeW91IGNhbiB0YWtlIGl0LgoKSSBnZW5lcmFsbHkgdHJ5IG15IGJlc3QgdG8gYXZvaWQg
Y29uZmxpY3RzIGF0IG1lcmdlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
