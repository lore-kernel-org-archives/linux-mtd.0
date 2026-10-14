Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD9CC6B27
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68GMvir9deD+bpAqL3tc1nvMWub/Y1t6krllwksxngA=; b=L03Coc4UVK/UyR
	+sHMcjKeKVhk1Ln387xyK6xtSaKpYYGuoFShG/q99UBgoTEmxfcT7fjLFP3LX0lC7VcF3lKFAkXBe
	gHnYRq/M59MZgevqnfCzXzPEwOOMAHWM3C1us2AYsQoJPFdw1yVPBnZiHvEkzAQI+4jS6DMloO5G7
	b6eaDkg1RZNqq83fVSDjNH2d2OQcvC7GJa/c6axu7F1nbYvmHDqeWztIOQR3dzO9N20Fp+2ql4c9p
	lQEyaAc31+Ov1c8kkWRJePZIoK619U0/M4GXUfLV5EC6uKqTrHeg6Z+1Xan+WtxCO8ToybPpqjgC1
	/HqKk79kwByG8MvvWwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuiz-0000000EwoY-2N47;
	Wed, 14 Oct 2026 08:52:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuix-0000000Ewnk-2CHO
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i48MIGwzBxi2do2WYXSYPbruC3HoFCZMxRU1UUDDuYs=; b=dz4W6ZpZjV5nJXOm8NtoKrkD+x
	0HMU5BkF2XpTceNO08lOIWPUPKgoQyB5gLJUyaAjGCLlsFFXDOcmWdVJB4m76wDXbcRXE3jtyiYyM
	gJhhaLDDNSAbgvqz6AOBRfnXFfYHzhUMMqp/SZX99IuhejkkKFan59iHsO+AfC+goBjtuWBQAMxn2
	boWJg52TI8iGlhq62h0fs2AWiF9kP0TmEqons1y5Du4qJvsfRxLeHMASdSqRSl7fRm2CY8lHO/CYD
	owlBnn1XKz2+EWfCG5phqYvNvDIqWIMvSy4vCBuI4OyPjoOgxSFhsDuMTZms8bxH3Sp9cPHvvPzdP
	yCU6LNTg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuiu-0000000GWnn-04mA
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 08:52:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1F8BFC63440;
	Wed, 14 Oct 2026 08:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2A560368;
	Wed, 14 Oct 2026 08:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAE79103286A7;
	Wed, 14 Oct 2026 10:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791967940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i48MIGwzBxi2do2WYXSYPbruC3HoFCZMxRU1UUDDuYs=;
	b=I39l4qPTZiayixscQ25oSYYL3NpbdUqY5vfY8WjlnawudFpyJfGrP7Qd2xXs+oY+HTA5L9
	HYG+p+V4eBlDcIkQ33/sT8qNfxC8TxPzOExPZE/a5dM+N52o+LuWWB8KjPTdbW+x9UMPeB
	Qhecxah11hmwDPZRaT9PiF59W4bRSzao28f6nvWfzVCtSEvWNU49ziJdfT9UvzUTpIujSw
	iU/fUi0oEKauswQ54YxEGuXjuFAKJNNr7aF6yW+3HO1ThHWX9cevyrzYYK6akFYkZC0gOW
	PhIc3r6BCCYQxX/ItYeHQdHgIF9KDMPtMIGn2ZmhijQyiPsPDfQXidzI/a9xkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <srini@kernel.org>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <linux@armlinux.org.uk>,  <richardcochran@gmail.com>,
  <linusw@kernel.org>,  <arnd@arndb.de>,  <aaro.koskinen@iki.fi>,
  <gregkh@linuxfoundation.org>,  <mathieu.dubois-briand@bootlin.com>,
  <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <netdev@vger.kernel.org>
Subject: Re: [PATCH v8 5/8] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
In-Reply-To: <89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
	(Manikandan Muralidharan's message of "Wed, 14 Oct 2026 12:10:09
	+0530")
References: <cover.1790847519.git.manikandan.m@microchip.com>
	<89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:52:14 +0200
Message-ID: <87fqy8zmtd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_095232_367094_CA688D56 
X-CRM114-Status: GOOD (  19.88  )
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

SGksCgpPbiAxNC8xMC8yMDI2IGF0IDEyOjEwOjA5ICswNTMwLCBNYW5pa2FuZGFuIE11cmFsaWRo
YXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+IHdyb3RlOgoKPiBBZGQgYW4gTlZNRU0g
bGF5b3V0IHRoYXQgZXhwb3NlcyB0aGUgZmFjdG9yeS1wcm9ncmFtbWVkIEVVSS00OCBpZGVudGlm
aWVyCj4gZnJvbSB0aGUgTWljcm9jaGlwL1NTVCB2ZW5kb3IgU0ZEUCBwYXJhbWV0ZXIgdGFibGUg
KGUuZy4gU1NUMjZWRjA2NEJFVUkpCj4gYXMgYSAibWFjLWFkZHJlc3MiIGNlbGwsIGZvciB1c2Ug
YXMgYSBuZXR3b3JrIE1BQyBhZGRyZXNzLiBUaGUgdmVuZG9yCj4gdGFibGUgaXMgbG9jYXRlZCBh
dCBydW50aW1lIHZpYSB0aGUgU0ZEUCBOVk1FTSBkZXZpY2UgKG5vIG9mZnNldCBpbiBEVCksCj4g
YW5kIGEgcmVhZF9wb3N0X3Byb2Nlc3MgY2FsbGJhY2sgcmV2ZXJzZXMgdGhlIExTQi1maXJzdCBi
eXRlcyBpbnRvCj4gY2Fub25pY2FsIE1BQyBvcmRlci4gQmluZHMgdG8gYW4gIm52bWVtLWxheW91
dCIgbm9kZSB3aXRoIGNvbXBhdGlibGUKPiAibWljcm9jaGlwLHNzdDI2dmYtc2ZkcC1ldWkiLgo+
Cj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBt
aWNyb2NoaXAuY29tPgoKTW9zdGx5IG1pbm9yIG5pdHMsIHNlZSBiZWxvdy4KCj4gLS0tIGEvZHJp
dmVycy9udm1lbS9sYXlvdXRzL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9udm1lbS9sYXlvdXRz
L01ha2VmaWxlCj4gQEAgLTYsNCArNiw1IEBACj4gIG9iai0kKENPTkZJR19OVk1FTV9MQVlPVVRT
KSArPSBmaXhlZC1sYXlvdXQubwo+ICBvYmotJChDT05GSUdfTlZNRU1fTEFZT1VUX1NMMjhfVlBE
KSArPSBzbDI4dnBkLm8KPiAgb2JqLSQoQ09ORklHX05WTUVNX0xBWU9VVF9PTklFX1RMVikgKz0g
b25pZS10bHYubwo+ICtvYmotJChDT05GSUdfTlZNRU1fTEFZT1VUX1NTVDI2VkZfU0ZEUF9FVUkp
ICs9IHNzdDI2dmYtc2ZkcC1ldWkubwo+ICBvYmotJChDT05GSUdfTlZNRU1fTEFZT1VUX1VfQk9P
VF9FTlYpICs9IHUtYm9vdC1lbnYubwoKTm90IHN1cmUgdGhpcyBpcyBvcmRlcmVkIGFscGhhYmV0
aWNhbGx5LCBzbyBpbiBnZW5lcmFsIGFkZCBpdCBhdCB0aGUgZW5kLgoKPiArLyogU0ZEUCBoZWFk
ZXIgYW5kIHBhcmFtZXRlciBoZWFkZXIsIGFzIGxhaWQgb3V0IG9uIHRoZSBmbGFzaC4gKi8KPiAr
c3RydWN0IHNmZHBfaGVhZGVyIHsKPiArCXU4IHNpZ25hdHVyZVs0XTsKPiArCXU4IG1pbm9yOwo+
ICsJdTggbWFqb3I7Cj4gKwl1OCBucGg7Cj4gKwl1OCB1bnVzZWQ7Cj4gK307Cj4gKwo+ICtzdHJ1
Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyIHsKPiArCXU4IGlkX2xzYjsKPiArCXU4IG1pbm9yOwo+
ICsJdTggbWFqb3I7Cj4gKwl1OCBsZW5ndGg7Cj4gKwl1OCBwYXJhbWV0ZXJfdGFibGVfcG9pbnRl
clszXTsKPiArCXU4IGlkX21zYjsKPiArfTsKPiArCj4gKyNkZWZpbmUgU0ZEUF9TSUdOQVRVUkUJ
CQkweDUwNDQ0NjUzVQo+ICsKPiArI2RlZmluZSBTRkRQX1BBUkFNX0hFQURFUl9JRChoKQkJKCgo
aCktPmlkX21zYiA8PCA4KSB8IChoKS0+aWRfbHNiKQo+ICsjZGVmaW5lIFNGRFBfUEFSQU1fSEVB
REVSX1BUUChoKQlnZXRfdW5hbGlnbmVkX2xlMjQoKGgpLT5wYXJhbWV0ZXJfdGFibGVfcG9pbnRl
cikKPiArCj4gKy8qIE1pY3JvY2hpcCAodmVuZG9yKSBwYXJhbWV0ZXIgdGFibGUgaWRlbnRpZmll
cjogaWRfbXNiIDw8IDggfCBpZF9sc2IuICovCgpUaGlzIGlzIG5vdCByZWxldmFudCwgd2Ugc2F3
IGl0IGp1c3QgYWJvdmUgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgoKPiArI2RlZmlu
ZSBTRkRQX01DSFBfVkVORE9SX0lECQkweDAxYmYKPiArCj4gKyNkZWZpbmUgU0ZEUF9NQ0hQX0VV
STQ4X01BUktFUl9PRkZTRVQJMHg2MAo+ICsjZGVmaW5lIFNGRFBfTUNIUF9FVUk0OF9NQVJLRVIJ
CTB4MzAKPiArI2RlZmluZSBTRkRQX01DSFBfRVVJNDhfT0ZGU0VUCQkweDYxCj4gKwo+ICtzdGF0
aWMgaW50IHNmZHBfZXVpX3JlYWRfcG9zdF9wcm9jZXNzKHZvaWQgKnByaXYsIGNvbnN0IGNoYXIg
KmlkLCBpbnQgaW5kZXgsCj4gKwkJCQkgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICpi
dWYsCj4gKwkJCQkgICAgICBzaXplX3QgYnl0ZXMpCj4gK3sKPiArCXU4ICpkYXRhID0gYnVmOwo+
ICsJaW50IGk7Cj4gKwpJIGJlbGlldmUgdGhlIGlmIGFnYWluc3QgdGhlIGxlbmd0aCBpcyB3cm9u
ZyBhbmQgc2hvdWxkIGJlIGludmVydGVkIGFuZApwbGFjZWQgaGVyZToKCiAgICAgICAgaWYgKGJ5
dGVzICE9IEVUSF9BTEVOKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgpTaW5jZSBs
ZW5naHQgZG9lcyBub3QgY2hhbmdlLCBwcmVmZXIgdG8gYmFpbCBvdXQgZWFybHkuCgo+ICsJLyog
U0ZEUCBzdG9yZXMgdGhlIGFkZHJlc3MgbGVhc3Qtc2lnbmlmaWNhbnQgb2N0ZXQgZmlyc3Q7IHJl
dmVyc2UgaXQuICovCj4gKwlmb3IgKGkgPSAwOyBpIDwgYnl0ZXMgLyAyOyBpKyspCj4gKwkJc3dh
cChkYXRhW2ldLCBkYXRhW2J5dGVzIC0gMSAtIGldKTsKPiArCj4gKwlpZiAoYnl0ZXMgPT0gRVRI
X0FMRU4gJiYgIWlzX3ZhbGlkX2V0aGVyX2FkZHIoYnVmKSkKCklzIGJ5dGVzICE9IEVUSF9BTEVO
IGEgdmFsaWQgdXNlIGNhc2U/Cgo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCXJldHVybiAw
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHNmZHBfZXVpX2ZpbmRfdmVuZG9yX3RhYmxlKHN0cnVj
dCBudm1lbV9kZXZpY2UgKm52bWVtLCB1MzIgKnB0cCkKPiArewo+ICsJc3RydWN0IHNmZHBfcGFy
YW1ldGVyX2hlYWRlciBwaDsKPiArCXN0cnVjdCBzZmRwX2hlYWRlciBoZHI7Cj4gKwlpbnQgbnBo
LCBpLCByZXQ7Cj4gKwo+ICsJcmV0ID0gbnZtZW1fZGV2aWNlX3JlYWQobnZtZW0sIDAsIHNpemVv
ZihoZHIpLCAmaGRyKTsKPiArCWlmIChyZXQgPCAwKQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJ
aWYgKGdldF91bmFsaWduZWRfbGUzMihoZHIuc2lnbmF0dXJlKSAhPSBTRkRQX1NJR05BVFVSRSkK
PiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwkvKiBUaGUgbnVtYmVyIG9mIHBhcmFtZXRlciBo
ZWFkZXJzIChOUEgpIGZpZWxkIGlzIHplcm8tYmFzZWQuICovCj4gKwlucGggPSBoZHIubnBoOwoK
bnBoID0gaGRyLm5waCArIDEgPwoKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDw9IG5waDsgaSsrKSB7
CgphbmQgaGVyZSB0aGUgdXN1YWwgaSA8IG5waD8KCj4gKwkJcmV0ID0gbnZtZW1fZGV2aWNlX3Jl
YWQobnZtZW0sIHNpemVvZihoZHIpICsgaSAqIHNpemVvZihwaCksCj4gKwkJCQkJc2l6ZW9mKHBo
KSwgJnBoKTsKPiArCQlpZiAocmV0IDwgMCkKPiArCQkJcmV0dXJuIHJldDsKPiArCj4gKwkJaWYg
KFNGRFBfUEFSQU1fSEVBREVSX0lEKCZwaCkgIT0gU0ZEUF9NQ0hQX1ZFTkRPUl9JRCkKPiArCQkJ
Y29udGludWU7Cj4gKwo+ICsJCSpwdHAgPSBTRkRQX1BBUkFNX0hFQURFUl9QVFAoJnBoKTsKPiAr
CQlyZXR1cm4gMDsKPiArCX0KPiArCj4gKwlyZXR1cm4gLUVOT0VOVDsKPiArfQoKLi4uCgo+ICsJ
aW5mby5uYW1lID0gIm1hYy1hZGRyZXNzIjsKPiArCWluZm8ub2Zmc2V0ID0gYmFzZSArIFNGRFBf
TUNIUF9FVUk0OF9PRkZTRVQ7Cj4gKwlpbmZvLmJ5dGVzID0gRVRIX0FMRU47Cj4gKwlpbmZvLm5w
ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUobGF5b3V0X25wLCAibWFjLWFkZHJlc3MiKTsKPiArCWlu
Zm8ucmVhZF9wb3N0X3Byb2Nlc3MgPSBzZmRwX2V1aV9yZWFkX3Bvc3RfcHJvY2VzczsKPiArCj4g
KwlyZXQgPSBudm1lbV9hZGRfb25lX2NlbGwobnZtZW0sICZpbmZvKTsKPiArCWlmIChyZXQpCj4g
KwkJb2Zfbm9kZV9wdXQoaW5mby5ucCk7Cj4gKwllbHNlCj4gKwkJZGV2X2RiZyhkZXYsICJleHBv
c2VkIEVVSS00OCBhdCBTRkRQIG9mZnNldCAweCV4XG4iLCBpbmZvLm9mZnNldCk7CgpUaGlzIG9u
ZSBpcyBub3QgcmVhbGx5IHVzZWZ1bCBhbnltb3JlLgoKPiArCj4gKwlvZl9ub2RlX3B1dChsYXlv
dXRfbnApOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
