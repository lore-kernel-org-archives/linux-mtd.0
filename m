Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74609CD342F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEUdZRWOutHlrsU88gbx+YMF2nROWn8Bhwwx0mjwCU4=; b=re9T913RScz3b2
	9pkimAgg0hmOVc7UlvyeJMpzZAqC6AxqJHJQ1vG8qwEqJGgmg1Vvz9xRPJPUlQKhKterUO6x2b12n
	b+93DbhH82gEnFCtMAtlmk4wcsFpIN8i3vgLge/M1ZEMZ8MshSNcuzThCgDivbfNg2WGhH7gIagND
	DJuE39kWROfMZnDQHkHLvlw0Nut5a7SyMCRYXaRx/wkvWODhozjLDZFTaizsKbAbIW1LHRk3DyVHS
	aY3edjakFzei4XR0vCzz76dA9RGWRGOksuZby0F3/Tvi4cT3QLZ/JMtD0iU6hNDT/XoNJoLvbHoK4
	dgZ5QKr2/8dH7Hcz0oMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKArC-0000000FUYO-2Jvm;
	Tue, 05 May 2026 08:10:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAr9-0000000FUXd-12ow
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 08:10:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A0DB74E42BCF;
	Tue,  5 May 2026 08:10:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A8175FD9D;
	Tue,  5 May 2026 08:10:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25FC211AD249A;
	Tue,  5 May 2026 10:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777968610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wqojrbNmyZDtYjYTfDSv+NteblAz01LppSlPWqNNyS4=;
	b=rbi2S0zs00YEewZbf9Qul0BnoxDxqZDYJfeVDTSeREai7hgjWz+xCHL0KlY9fCGbDFVHgF
	GBp7wXS6xkK9FovJ4aqUwvev9RFjvQ1ES3MFZXJMWiLK2ZSLNacSPBatnezCzIg7wPJ68n
	axtaipDDOY8XETclJFiiBH6f8Tam0kY7OJLHMSfVsB+g7T1ue0ofN6fvvNTqq/JwU+p5kj
	1buQRC21xCZz9kCM4d39Ql4dxygd0r3gQzUKP2o1iY79TPYMBB+XlxoTV6c8bTMOCr4gS3
	1avcfIaLz/TI2CEecbITwm3wDqGMEAMeDSDY/KVrc6rJIs6JGzW7R0XFmfs0iA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@rulkc.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  rulkc@linuxtesting.org,
  oxffffaa@gmail.com,  stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: fix condition in 'nand_select_target()'
In-Reply-To: <57b0cc2a-6d62-405c-bfa5-68d1c46dbad9@rulkc.org> (Arseniy
	Krasnov's message of "Tue, 5 May 2026 10:59:16 +0300")
References: <20260504221012.1310605-1-avkrasnov@rulkc.org>
	<87mryeqoqs.fsf@bootlin.com>
	<57b0cc2a-6d62-405c-bfa5-68d1c46dbad9@rulkc.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 05 May 2026 10:10:06 +0200
Message-ID: <87h5omqntt.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_011015_421034_68AB7097 
X-CRM114-Status: UNSURE (   8.12  )
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

T24gMDUvMDUvMjAyNiBhdCAxMDo1OToxNiArMDMsIEFyc2VuaXkgS3Jhc25vdiA8YXZrcmFzbm92
QHJ1bGtjLm9yZz4gd3JvdGU6Cgo+IDA1LjA1LjIwMjYgMTA6NTAsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4+IEhpLAo+Pgo+PiBPbiAwNS8wNS8yMDI2IGF0IDAxOjEwOjEyICswMywgQXJzZW5peSBL
cmFzbm92IDxhdmtyYXNub3ZAcnVsa2Mub3JnPiB3cm90ZToKPj4KPj4gVHdvIGltcG9ydGFudCB0
eXBvcyBpbiB0aGUgY29tbWl0IGxvZyA6LSkKPj4KPj4+ICdjcycgaGVyZSBtdXN0IGluIHJhbmdl
IFswOm5hbmRkZXZfbnRhcmdldHMpLgo+PiAgICAgICAgICAgICAgICAgYmUgICAgICAgICAgICAg
ICAgICAgICAgICAgICBbCj4KPgo+IEhpLCBzb3JyeSwgWW91IG1lYW4/Cj4KPgo+ICdjcycgaGVy
ZSBtdXN0IGJlIGluIHJhbmdlIFswOm5hbmRkZXZfbnRhcmdldHNdLsKgCgpJIG1lYW50IFswOm5h
bmRkZXZfbnRhcmdldHNbIHdoaWNoIGlzIHRoZSBtYXRoZW1hdGljYWwgd2F5LCBJSVJDLCB0bwpp
bmRpY2F0ZSB0aGF0IHRoZSBsYXN0IHZhbHVlIGlzIG91dCBvZiBzY29wZS9leGNsdWRlZC4KClsw
Om5hbmRkZXZfbnRhcmdldHNdIG1lYW5zIHRoYXQgbmFuZGRldl9udGFyZ2V0cyBpcyBpbmNsdWRl
ZCBpbiB0aGUKc2NvcGUgb2YgdmFsdWVzIGFuZCBoZXJlIHNpbmNlIHlvdSBhcmUgZXhwbGljaXRs
eSBzaG93aW5nIHRoYXQgaXQgaXMKbm90LCBpdCBmZWVscyB3cm9uZyB0byB1c2UgdGhhdCBjb252
ZW50aW9uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
