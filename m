Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C2ED3ABF3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liDv0PMSTE5HN7nrMdWysu5BIhr/jpqX3sot60f/shk=; b=guHuTW36UxuWQQ
	OehxY+aeiH7ISRXb8JLUnxhdeJ1OmwIcuys2AEzpODbbfHG6eHgeTfSyVZK4r/MSA12TaENHx2aKp
	UENhJfhQ/Gcolr+Ti+ZQ6ozEaig6SIzFPkrn+/otBbul7v7QqdLVChX7TltB/IVqWRU1wV7pz/UgW
	Fxj8BMK3NIw9mP6KmEow4qb4GlgMUMc3zjX/F6SNTycZktdKGbqao756/uCgwbC9IXNunAUN9prF/
	I3q6lShcMpvRWNPnxvXrGNdAbeVCa7esKCB+8m31d5XZVFXVMOuoF3eFkrfhkW4OoLCBy2wQwUnR/
	zjMdgMZitHqm550HAE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZvd-000000011qJ-0luS;
	Mon, 11 Nov 2024 19:18:25 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZtx-000000011eu-1ogE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 19:16:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7763A40002;
	Mon, 11 Nov 2024 19:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731352598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d09C2IoK4+xkMEC1zVUKygGlrrSSMKoQFIvPALJmqwU=;
	b=nx+GDnf9lIHs25NLlu0g15jllh4b01LqYMOwt31eePV7VeOYP3SfgDgUdiQj9F5A6MEAi1
	PLTRxKbQvC+aMaV8Mr1zw0W08PkDosLWCcjPuoK9SBAFVPq4H5oINE0pYEeew41X5rWI9K
	xs2BVbs0fVBLw3G2YSp1kYh6MSpl69ttwq3nhm+XFb49Dzt6D5yoAJ9B3GWjPWT82iK+gu
	E3fJmCR8q5t1YuYzUk2j/jopoRwuXZFdU/6ChawefqunZg2Z5MF4njMOOZrTV7srN1IWBh
	lmAGax7wvtvAiWLpQfgizLvKSPiGkMf2dXtrLYQdm+5I8JABnrNM52gxHeAHIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v2 1/6] memory: ti-aemif: Create aemif_set_cs_timings()
In-Reply-To: <20241106085507.76425-2-bastien.curutchet@bootlin.com> (Bastien
	Curutchet's message of "Wed, 6 Nov 2024 09:55:02 +0100")
References: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
	<20241106085507.76425-2-bastien.curutchet@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 20:16:34 +0100
Message-ID: <8734jxshrh.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_111641_626875_CCAAFA8E 
X-CRM114-Status: UNSURE (   8.29  )
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

SGkgQmFzdGllbiwKCjIgdmVyeSBtaW5vciBuaXRzCgo+ICsvKioKPiArICogc3RydWN0IGFlbWlm
X2NzX3RpbWluZ3M6IHN0cnVjdHVyZSB0byBob2xkIGNzIHRpbWluZyBjb25maWd1cmF0aW9uCgpO
aXRwaWNrOiBzL2NzL0NTLyBpbiBwbGFpbiBlbmdsaXNoPwoKCi4uLgoKPiArLyoqCj4gKyAqIGFl
bWlmX3NldF9jc190aW1pbmdzIC0gU2V0IHRoZSB0aW1pbmcgY29uZmlndXJhdGlvbiBvZiBhIGdp
dmVuIGNoaXAgc2VsZWN0Lgo+ICsgKiBAYWVtaWY6IGFlbWlmIGRldmljZSB0byBjb25maWd1cmUK
PiArICogQGNzOiBpbmRleCBvZiB0aGUgY2hpcCBzZWxlY3QgdG8gY29uZmlndXJlLgoKTml0OiBT
cHVyaW91cyBkb3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKCi4uLgoKPiAtCS8q
IC4uLiBCdXQgY29uZmlndXJpbmcgdGlnaHRlciB0aW1pbmdzIGlzIG5vdCBhbiBvcHRpb24uICov
Cj4gLQllbHNlIGlmIChyZXN1bHQgPiBtYXgpCj4gLQkJcmVzdWx0ID0gLUVJTlZBTDsKPiAtCgpN
YXliZSB0aGlzIGlzIHRvbyBlYXJseSB0byByZW1vdmUgdGhlIGNoZWNrPyBJZiBzb21lb25lIGJp
c2VjdHMgYW5kCmZhbGxzIGluLWJldHdlZW4gdGhlIHBhdGNoZXMgb2YgeW91ciBzZXJpZXMsIE5B
TkQgc3VwcG9ydCB3b3VsZCBiZQpicm9rZW4gSSBndWVzcz8KCldpdGggdGhpcyBmaXhlZCwgZmVl
bCBmcmVlIHRvIGFkZCBteToKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
