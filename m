Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EC1C38142
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMQeWUT/Cq0okO83G/J26sZ4QTstVxjzokI2+yqc9Zk=; b=AP6B9ZLpgbCX1G
	WIBt7/bDy+JY8Rj9ahCji/B/VG/7Ma3zarkQIDTUBQzbP0mZ2VlcxO2zbqzcs2w/v6eT+SAndLccI
	Xx4kTdbrp35Cit+4cr7xqoeEn2LIMuMTEO4fddUBMtK3mjBfjev+g5D1GRsVKhMbhJiwjF2rGWsCK
	O9KQv/A117ehTz3dRdeiUwdF/6m3OTS3FMprpO1jdqHaAP48YFH77mhFrFJ3XlDjG2LUyuaIvqfEN
	kQlEMxJ5FlSjQdOoxLlu3ZfehSjPKpGT9d15fA+I9wu5pV0lv/lyJ3iYczPjj8D6LjUrgHRNdzgNZ
	zivdathbGvUBkF5FQfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsFk-00GMKS-Bl; Mon, 23 Jan 2023 08:32:32 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsFa-00GMIQ-0T; Mon, 23 Jan 2023 08:32:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D5AB54000C;
	Mon, 23 Jan 2023 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674462734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5sr1+ft/o4KFGfy74z6A876hko9sf4WKrKKmi7Je/Y=;
	b=KuoNAfOv2pzHTPxQdsQDTsRxDucuLyajao1IkRwSgW0PBw/AR0kYdXWOVgMFnNpsqGFx+h
	41ejb8jbZap1x8ttBNzcXJZPqDSO9tXmdmnXaB4VoOySlL6kUZ7wLfT6iMnScmRCIGHzO6
	PiMk5LexuK8SRkHyEYIiXIAcdE+W/dAEx6sv5T/d6EigOw8p5514TFKf1wFOg4lgoiUshk
	0o8PJFBOlUK59cdoMz3N5rZsKV4c2N1Clgu/cPlgRXekCBEZJ2kiHF29ilWrDlZXYpxhAo
	2DOnc9oStAtUweOC3GsaqSRs4hhn9v7ChZPIcSChth/FXjZuwv9ibKkUEgcC9w==
Date: Mon, 23 Jan 2023 09:32:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Chen <lchen@ambarella.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Li Chen <me@linux.beauty>, Roger Quadros
 <rogerq@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, Liang
 Yang <liang.yang@amlogic.com>, Jean Delvare <jdelvare@suse.de>, Andreas
 =?UTF-8?B?QsO2aGxlcg==?= <dev@aboehler.at>, Christian Lamparter
 <chunkeey@gmail.com>, Rickard x Andersson <rickaran@axis.com>,
 linux-kernel@vger.kernel.org (open list), linux-mtd@lists.infradead.org
 (open list:NAND FLASH SUBSYSTEM), linux-arm-kernel@lists.infradead.org
 (moderated list:ARM/Ambarella SoC support)
Subject: Re: [PATCH 12/15] mtd: nand: add Ambarella nand support
Message-ID: <20230123093209.770995cf@xps-13>
In-Reply-To: <20230123073305.149940-13-lchen@ambarella.com>
References: <20230123073305.149940-1-lchen@ambarella.com>
	<20230123073305.149940-13-lchen@ambarella.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_003222_359412_C0A0D5A6 
X-CRM114-Status: GOOD (  16.00  )
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

SGkgTGksCgpJJ20gc29ycnksIHRoaXMgaXMgbm90IGdvaW5nIHRvIHdvcmsgYXQgYWxsLgoKPiAr
CWFtYmFyZWxsYV9uYW5kX2luaXQoaG9zdCk7Cj4gKwo+ICsJbXRkID0gbmFuZF90b19tdGQoJmhv
c3QtPmNoaXApOwo+ICsJbXRkLT5uYW1lID0gImFtYmFfbmFuZCI7Cj4gKwo+ICsJbmFuZF9jb250
cm9sbGVyX2luaXQoJmhvc3QtPmNvbnRyb2xsZXIpOwo+ICsJbmFuZF9zZXRfY29udHJvbGxlcl9k
YXRhKCZob3N0LT5jaGlwLCBob3N0KTsKPiArCW5hbmRfc2V0X2ZsYXNoX25vZGUoJmhvc3QtPmNo
aXAsIGRldi0+b2Zfbm9kZSk7Cj4gKwo+ICsJaG9zdC0+Y2hpcC5jb250cm9sbGVyID0gJmhvc3Qt
PmNvbnRyb2xsZXI7Cj4gKwlob3N0LT5jaGlwLmNvbnRyb2xsZXItPm9wcyA9ICZhbWJhcmVsbGFf
Y29udHJvbGxlcl9vcHM7Cj4gKwlob3N0LT5jaGlwLmxlZ2FjeS5jaGlwX2RlbGF5ID0gMDsKPiAr
CWhvc3QtPmNoaXAubGVnYWN5LnJlYWRfYnl0ZSA9IGFtYmFyZWxsYV9uYW5kX3JlYWRfYnl0ZTsK
PiArCWhvc3QtPmNoaXAubGVnYWN5LndyaXRlX2J1ZiA9IGFtYmFyZWxsYV9uYW5kX3dyaXRlX2J1
ZjsKPiArCWhvc3QtPmNoaXAubGVnYWN5LnJlYWRfYnVmID0gYW1iYXJlbGxhX25hbmRfcmVhZF9i
dWY7Cj4gKwlob3N0LT5jaGlwLmxlZ2FjeS5zZWxlY3RfY2hpcCA9IGFtYmFyZWxsYV9uYW5kX3Nl
bGVjdF9jaGlwOwo+ICsJaG9zdC0+Y2hpcC5sZWdhY3kuY21kX2N0cmwgPSBhbWJhcmVsbGFfbmFu
ZF9jbWRfY3RybDsKPiArCWhvc3QtPmNoaXAubGVnYWN5LmRldl9yZWFkeSA9IGFtYmFyZWxsYV9u
YW5kX2Rldl9yZWFkeTsKPiArCWhvc3QtPmNoaXAubGVnYWN5LndhaXRmdW5jID0gYW1iYXJlbGxh
X25hbmRfd2FpdGZ1bmM7Cj4gKwlob3N0LT5jaGlwLmxlZ2FjeS5jbWRmdW5jID0gYW1iYXJlbGxh
X25hbmRfY21kZnVuYzsKPiArCWhvc3QtPmNoaXAubGVnYWN5LnNldF9mZWF0dXJlcyA9IG5hbmRf
Z2V0X3NldF9mZWF0dXJlc19ub3RzdXBwOwo+ICsJaG9zdC0+Y2hpcC5sZWdhY3kuZ2V0X2ZlYXR1
cmVzID0gbmFuZF9nZXRfc2V0X2ZlYXR1cmVzX25vdHN1cHA7CgpQbGVhc2UgYmUgYXdhcmUgdGhh
dCB3ZSBubyBsb25nZXIgYWNjZXB0IGxlZ2FjeSBpbnRyb2R1Y3Rpb25zIHVwc3RyZWFtLgoKWW91
IGNhbiBsb29rIGZvciAtPmV4ZWNfb3AoKSBjb252ZXJzaW9ucyB1c2luZyBnaXQtbG9nLgoKPiAr
CWhvc3QtPmNoaXAub3B0aW9ucyB8PSBOQU5EX05PX1NVQlBBR0VfV1JJVEUgfCBOQU5EX1VTRVNf
RE1BOwo+ICsKPiArCXJ2YWwgPSBuYW5kX3NjYW4oJmhvc3QtPmNoaXAsIDEpOwo+ICsJaWYgKHJ2
YWwgPCAwKQo+ICsJCXJldHVybiBydmFsOwo+ICsKPiArCXJ2YWwgPSBtdGRfZGV2aWNlX3JlZ2lz
dGVyKG10ZCwgTlVMTCwgMCk7Cj4gKwlpZiAocnZhbCA8IDApCj4gKwkJbmFuZF9jbGVhbnVwKCZo
b3N0LT5jaGlwKTsKPiArCj4gKwlyZXR1cm4gcnZhbDsKPiArfQoKWy4uLl0KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2lkcy5jCj4gaW5kZXggZGFjYzU1MjliM2RmLi45ZjI2NGUyYTY0ODQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfaWRzLmMKPiBAQCAtNjIsNiArNjIsMTAgQEAgc3RydWN0IG5hbmRfZmxh
c2hfZGV2IG5hbmRfZmxhc2hfaWRzW10gPSB7Cj4gIAkJeyAuaWQgPSB7MHg5OCwgMHhkMywgMHg5
MSwgMHgyNiwgMHg3Nn0gfSwKPiAgCQkgIFNaXzRLLCBTWl8xSywgU1pfMjU2SywgMCwgNSwgMjU2
LCBOQU5EX0VDQ19JTkZPKDgsIFNaXzUxMil9LAo+ICAKPiArCXsiTVQyOUYyRzAxQUJBR0QgU1BJ
TkFORCAyRyAzLjNWIDgtYml0IiwKPiArCQl7IC5pZCA9IHsweDJjLCAweDI0LCAweDAwLCAweDAw
LCAweDAwfSB9LAo+ICsJCSAgU1pfMkssIFNaXzI1NiwgU1pfMTI4SywgMCwgMiwgMTI4fSwKPiAr
CgpSYXcgTkFORCAhPSBTUEktTkFORC4gSSBkb24ndCBnZXQgd2hhdCB5b3UncmUgZG9pbmcgaGVy
ZSBidXQgZWl0aGVyIHlvdQp3YW50IHRvIGRyaXZlIFNQSS1OQU5EcyBhbmQgdGhpcyBpcyBhIFNQ
SSBjb250cm9sbGVyIGRyaXZlciB0aGF0CmltcGxlbWVudHMgc3BpLW1lbSBvcHMgYW5kIHNob3Vs
ZCBiZSBsb2NhdGVkIHVuZGVyIGRyaXZlcnMvc3BpLywgb3IKdGhpcyBpcyBhIHBsYWluIHJhdyBO
QU5EIGNvbnRyb2xsZXIgd2hpY2ggaXMgd2lyZWQgdG8gYSBwYXJhbGxlbCBOQU5ECmFuZCB0aGlz
IHNob3VsZCBiZSB1bmRlciBkcml2ZXJzL210ZC9uYW5kL3Jhdy8uCgpFQ0MgY29udHJvbGxlcnMg
Y2FuIGJlIHNoYXJlZCB3aXRoIHRoZSBFQ0MgZW5naW5lIGFic3RyYWN0aW9uIHRob3VnaC4KCj4g
IAlMRUdBQ1lfSURfTkFORCgiTkFORCA0TWlCIDVWIDgtYml0IiwgICAweDZCLCA0LCBTWl84Sywg
U1BfT1BUSU9OUyksCj4gIAlMRUdBQ1lfSURfTkFORCgiTkFORCA0TWlCIDMsM1YgOC1iaXQiLCAw
eEUzLCA0LCBTWl84SywgU1BfT1BUSU9OUyksCj4gIAlMRUdBQ1lfSURfTkFORCgiTkFORCA0TWlC
IDMsM1YgOC1iaXQiLCAweEU1LCA0LCBTWl84SywgU1BfT1BUSU9OUyksCgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
