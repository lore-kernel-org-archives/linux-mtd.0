Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9369DC624C6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylkyga4GBLApUVxUNkcjArnXn+hGDapDkf7ea9wJI70=; b=l9cwkinbSxYJBw
	u7VTOUAH5QXBYj3QMADkgNjLOg6GJprcMj3DwqyhERQtcsazGEmgb7iGrVs9+TBuKKsKF27I99UNG
	DyEkEJkKOtto3yyFXIxojCH6evOWDU4sfvk23+5WRMlY3UiR34mTQnlM/kL9sFHK3f3slI9y26B8N
	5y+Qqe3dAC4eECiwq6DeKFuX40ohIykIg5wwgrFBbVONzJ+Z0cbyfPixJvJxaXbuhr8HBvJZj7K2t
	z8v5WXfF6ZbN2clfPSBQP4ZzE3PWbS0/UrmOfMTeL8MaILkhXPWcf5DEPSadCLvtAB1m4+LDmMrgG
	nDAggopzWWri4hANTAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KOc-0000000BMbK-1J1X;
	Tue, 01 Sep 2026 09:03:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KOZ-0000000BMZs-0Yot
	for linux-mtd@lists.infradead.org;
	Tue, 01 Sep 2026 09:03:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 229D34E4149C;
	Tue,  1 Sep 2026 09:03:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9DBB6053C;
	Tue,  1 Sep 2026 09:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D87A811C78AAE;
	Tue,  1 Sep 2026 11:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788253381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dVSTupzsKDeKcaOCfLgTue1jYvMasSEVlpq2JV9+6jU=;
	b=MJWBBoD56GD1gKMxyfsPWLPEUcE9vRgAYgIRAzg6cwJmDCdtzke3j7KuygdQYD6AU8JGr2
	GKaqslm1ZTFs7QX6di7xfUjopH+ur8ijdXPU+7mUuK2qP20jf7QVXnuGj49QQfQ66R9gca
	erGt/XmynmF26FIUFylqf9oX93o85jP7XixnI2CREKpsQMDfxrPz0P3o6UCQU4sJhxTbKp
	kTogl93s2G648lT1wsMR3IqLntJDyzoGI6/F6E94dNQcA4iXw5rzr7e7v7KOm8wRDNcb6D
	JNUCnN9+S3v2NQdc9/dqN1pOuR6iAm9gowwws49ZVMJLRqPs3htZL0sZIQTOqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Jonathan Corbet" <corbet@lwn.net>,  "Shuah
 Khan" <skhan@linuxfoundation.org>,  "Steam Lin" <STLin2@winbond.com>,
  "Hsin-Yi Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
In-Reply-To: <DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 11:46:14 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
	<DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 01 Sep 2026 11:02:56 +0200
Message-ID: <87qzjd8htr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_020307_303525_93D143F8 
X-CRM114-Status: UNSURE (   9.06  )
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

SGVsbG8sCgo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyB3aW5ib25kX25v
cl9wYXJ0bmFtZV9maXh1cHMgPSB7Cj4+ICsJLnBvc3Rfc2ZkcCA9IHdpbmJvbmRfbm9yX3BhcnRu
YW1lX3Bvc3Rfc2ZkcF9maXh1cHMsCj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgYm9vbCBpc193MjVx
eHhydihjb25zdCBzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiArewo+PiArCXN0cnVjdCBzZmRwX2hl
YWRlciAqc2ZkcF9oID0gKHN0cnVjdCBzZmRwX2hlYWRlciAqKW5vci0+c2ZkcC0+ZHdvcmRzOwo+
Cj4gbml0cGljaywgc3BpX25vcl9zZmRwX2dldF9oZWFkZXIoKT8KCll1cC4KCj4+ICsJICogVzI1
UXh4UlYgY2hpcHMgcmUtdXNlIHRoZSBzYW1lIElEIGFzIHRoZSBXMjVReHhKViBmYW1pbHkuCj4+
ICsJICoKPj4gKwkgKiBDaGlwcyBhcmUgdmVyeSBzaW1pbGFyLCBXMjVReHhSViBicmluZ3MgbW9z
dGx5IHBlcmZvcm1hbmNlIGFuZCBwb3dlcgo+PiArCSAqIGNvbnN1bXB0aW9uIGltcHJvdmVtZW50
cy4gVGhlIFJWIGZhbWlseSBkb2VzIG5vdCByZXF1aXJlIHRoZSBtdWx0aQo+PiArCSAqIGRpZSBm
aXh1cC4KPj4gKwkgKgo+PiArCSAqIFRoZXkgY2FuIGJlIGRpc3Rpbmd1aXNoZWQgYmFzZWQgb24g
dGhlaXIgU0ZEUCBtaW5vciByZXZpc2lvbjoKPj4gKwkgKiBXMjVReHhKVjogICAgICAgIEpFU0Qy
MTZBLCBtaW5vciByZXZpc2lvbiA9PSAwNWgKPj4gKwkgKiBXMjVRNTEyLzAxLzAySlY6IEpFU0Qy
MTZCLCBtaW5vciByZXZpc2lvbiA9PSAwNmgKPj4gKwkgKiBXMjVReHhSVjogICAgICAgIEpFU0Qy
MTZGLCBtaW5vciByZXZpc2lvbiA+PSAwQWgKPj4gKwkgKi8KPj4gKwlyZXR1cm4gc2ZkcF9oLT5t
aW5vciA+PSBTRkRQX0pFU0QyMTZGX01JTk9SOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgYm9vbCB3
aW5ib25kX2p2X21hdGNoKGNvbnN0IHN0cnVjdCBzcGlfbm9yICpub3IpCj4+ICt7Cj4+ICsJcmV0
dXJuICFub3ItPnNmZHAgfHwgIWlzX3cyNXF4eHJ2KG5vcik7Cj4KPiBTbyBob3cgZG8gd2Uga25v
dyBpZiBub3ItPnNmZHAgaXMgYWxyZWFkeSB0aGVyZSBmb3IgYSBnaXZlbiBmaXh1cC4KPiBXaXRo
b3V0IGhhdmluZyBsb29rZWQgYXQgdGhlIGNvZGUsIHRoZXJlIGNvdWxkIHBvdGVudGlhbGx5IGJl
IGZpeHVwcwo+IGJlZm9yZSBTRkRQIGlzIHBhcnNlZCAoYW5kIHRoZSBub3ItPnNmZHAgaXMgcG9w
dWxhdGVkKSwgcmlnaHQ/IE1pZ2h0Cj4gYmUgd29ydGggdG8gYmUgbWVudGlvbmVkIHNvbWV3aGVy
ZS4KCllvdSBhcmUgcmlnaHQsIGl0IGlzIHdvcnRoIG1lbnRpb25pbmcuIEluIHByYWN0aWNlIG9u
bHkgZGVmYXVsdF9pbml0KCkKaXMgdG9vIGVhcmx5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
