Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6416C48BF6
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EE2jWykvJpXJRkVjunvl+eeasQdo01qfYR6WrNS/oF8=; b=KAK+Wn2oueP/IG
	V7ye7mFXVZnw7AVRvFKlnCYywXm79h8CXTTkqBtBojzgLPLPFn5x270F+5kmEgX1pEGcluyM8NWKP
	G8+ytKSxtIPrai7F+Fk7Zu0Ku5OtSZ+TUfPN3yKpqS4lSs4+l1lgxFNwmprcI4T7FRQ+ekpvIILlz
	eHwRrs1rjG2k7Eo4WGolOzS5b7C/NNVOf6RDQC0GZW7mIOx74k69N3w6TLy+vySBzkWGQa24ItBQT
	HXm0iuzwC6/vFghvTP+yDxNtP8V/IZTzSlxKU+LBgEicpb0ZzBscQzBlL8WF3nYdFjp/8xuEY7fPv
	GM5iRc51eY8u3qABX6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckeZ-00000000f7V-2BLH;
	Wed, 21 Feb 2024 11:20:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckeW-00000000f5s-0GOt
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 11:20:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 306331C0007;
	Wed, 21 Feb 2024 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708514435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5cZ5i4n54ZZl4j6dUvtTwqTXJ11DN72pkExFKwV8TAw=;
	b=GsiG4OHcKSaQv/V+15amwbsKOgyAo/ez5hejHOZbFcCQLgD+1AXAURJywNuLk4EJRz0iLJ
	flJRVShYp2764IrkcrKZzckRlt6FM34XhOzW84vY49gdelE+pcLmKXSs26DQt35vSG/hlf
	S+5bfx3DH3vTz/eKdM7cLun8JCnKc7i76EtGS9pozjk2CHNJBL1oKtg8vFIFXgbXThBm8N
	fw8QeeqBS6EmpofCbH06HbKjdE0PHXlfYag1m83lPQ4PNefoQ3rqMW2luElFJ+WP842XGE
	rOQiVGdGZCickttPTZEpng6iEUx/O5PwLkPO3oXEs3LQaTSoNKhv2AJfPJNpHA==
Date: Wed, 21 Feb 2024 12:20:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Jaime Liao <jaimeliao.tw@gmail.com>, Alvin
 Zhou <alvinzhou@mxic.com.tw>, <eagle.alexander923@gmail.com>,
 <mans@mansr.com>, <martin@geanix.com>, Sean =?UTF-8?B?Tnlla2rDpnI=?=
 <sean@geanix.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 4/4] mtd: rawnand: Clarify conditions to enable
 continuous reads
Message-ID: <20240221122032.502fbf3f@xps-13>
In-Reply-To: <cce57281-4149-459f-b741-0f3c08af7d20@foss.st.com>
References: <20231222113730.786693-1-miquel.raynal@bootlin.com>
	<cce57281-4149-459f-b741-0f3c08af7d20@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_032040_402987_C64720DB 
X-CRM114-Status: GOOD (  14.18  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBG
cmksIDkgRmViIDIwMjQgMTQ6MzU6NDQgKzAxMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBJIGFtIHRl
c3RpbmcgbGFzdCBuYW5kL25leHQgYnJhbmNoIHdpdGggdGhlIE1QMSBib2FyZCwgYW5kIGkgZ2V0
IGFuIGlzc3VlIHNpbmNlIHRoaXMgcGF0Y2ggd2FzIGFwcGxpZWQuCj4gCj4gV2hlbiBJIHJlYWQg
dGhlIFNMQyBOQU5EIHVzaW5nIG5hbmR1bXAgdG9vbCAocmVhZGluZyBwYWdlIDAgYW5kIHBhZ2Ug
MSksIHRoZSBPT0IgaXMgbm90IGRpc3BsYXllZCBhdCBleHBlY3RlZC4gRm9yIHBhZ2UgMSwgb29i
IGlzIGRpc3BsYXllZCB3aGVuIGZvciBwYWdlIDAgdGhlIGZpcnN0IGRhdGEgb2YgdGhlIHBhZ2Ug
YXJlIGRpc3BsYXllZC4KPiAKPiBUaGUgbmFuZGR1bXAgY29tbWFuZCB1c2VkIGlzOiBuYW5kZHVt
cCAtYyAtbyAtbCAweDIwMDAgL2Rldi9tdGQ5CgpJIGJlbGlldmUgdGhlIGlzc3VlIGlzIG5vdCBp
biB0aGUgaW5kZXhlcyBidXQgcmVsYXRlZCB0byB0aGUgT09CLiBJCmN1cnJlbnRseSB0ZXN0IG9u
IGEgZGV2aWNlIG9uIHdoaWNoIEkgd291bGQgcHJlZmVyIG5vdCB0byBzbWFzaCB0aGUKY29udGVu
dCwgc28gdGhpcyBpcyBqdXN0IGNvbXBpbGUgdGVzdGVkIGFuZCBub3QgcnVuIHRpbWUgdmVyaWZp
ZWQsIGJ1dApjb3VsZCB5b3UgdGVsbCBtZSBpZiB0aGlzIHNvbHZlcyB0aGUgaXNzdWU6CgotLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2Jhc2UuYwpAQCAtMzU3Nyw3ICszNTc3LDggQEAgc3RhdGljIGludCBuYW5kX2Rv
X3JlYWRfb3BzKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGxvZmZfdCBmcm9tLAogICAgICAgIG9v
YiA9IG9wcy0+b29iYnVmOwogICAgICAgIG9vYl9yZXF1aXJlZCA9IG9vYiA/IDEgOiAwOwogCi0g
ICAgICAgcmF3bmFuZF9lbmFibGVfY29udF9yZWFkcyhjaGlwLCBwYWdlLCByZWFkbGVuLCBjb2wp
OworICAgICAgIGlmICghb29iX3JlcXVpcmVkKQorICAgICAgICAgICAgICAgcmF3bmFuZF9lbmFi
bGVfY29udF9yZWFkcyhjaGlwLCBwYWdlLCByZWFkbGVuLCBjb2wpOwogCiAgICAgICAgd2hpbGUg
KDEpIHsKICAgICAgICAgICAgICAgIHN0cnVjdCBtdGRfZWNjX3N0YXRzIGVjY19zdGF0cyA9IG10
ZC0+ZWNjX3N0YXRzOwoKCklmIHRoYXQgZG9lcyBub3Qgd29yaywgSSdsbCBkZXN0cm95IHRoZSBj
b250ZW50IG9mIHRoZSBmbGFzaCBhbmQKcHJvcGVybHkgcmVwcm9kdWNlLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
