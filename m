Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C58C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 15:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D266021473
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 15:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="podbeLfh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="PFJf6mm0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D266021473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzjiU7iERGYKz0Juf9uNMkX/tQHcBxY/JBqXfc14eA0=; b=podbeLfhlZwqbF
	nh5Rw40aknfKTGCkxY0xKBnOLrGh3jTSa2eLPhR5mN9y0TZzKc/tysYxoJMujF949SOf9mNJMMQWk
	PJ5Gs9PUTTlL4ILG3uw1uxEk/J+Wa3UzehLR8V10UYRoDSzuVqJa+4ClkKJX2ssC5I2JfTkrjd30m
	uQe/W59IxKV0ar9u2kjwl0tmaw/725wCCGXg3069+K5uImeu5T1yXIbaUvNDxcqPvTbpcHGJBXT66
	VqKoLnlwGfSZIyyoFv8Ri8oM4TfF0leFgtmsRb93HniJBAzh2Vrzt00JZ4l1GWxRaf+RByYH75Wr7
	8DqgHtzm6h2UPoqFFZqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goVS4-00045o-2J; Tue, 29 Jan 2019 15:37:28 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goVRx-0003uS-FP
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 15:37:25 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id A24B3160069
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2019 16:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1548776233; bh=QjXLibLmjk+oqmf8FmsAQxfwBGSD24Lymh6zHDlUTI0=;
 h=From:To:Cc:Subject:Date:From;
 b=PFJf6mm0q8nlh4WxOYIQzLS95Tp/F6XdpPeeEINIOGL/YWY6WF5fbVvajUapheB1W
 h/HYIRlsfFnDzQgTPMdcKkNgXsSb10K96AmzEC0g6/O5KV3qXsWCfPGQLBV1yMDOuc
 B3Xzmt9WAkOc05GsxHISz1ENEdSQJ/SFLTC8kliWO+91E99wDl2xKF/if8mpdoCwid
 q/QqMJXNBvMpblu3sr9jNSzUblED5S+az8tn6efyKT/jNuzVvgqhsKiyeE7kcCMwTk
 7WuOiuO4IgmNrLzTEuqJbrAGervIkIjZgisFREK+rUii+LCM/6ULSU5spTb/ydzZ5/
 PCVf9lT5s7Z8g==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 43prGJ191Vz6tmR;
 Tue, 29 Jan 2019 16:37:12 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: han.xu@nxp.com, bbrezillon@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
Date: Tue, 29 Jan 2019 16:37:00 +0100
Message-Id: <20190129153700.18717-1-martink@posteo.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_073721_970928_57BA3F7C 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 Martin Kepplinger <martin.kepplinger@ginzinger.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFydGluIEtlcHBsaW5nZXIgPG1hcnRpbi5rZXBwbGluZ2VyQGdpbnppbmdlci5jb20+
CgpEaXNhYmxlIEJDSCBzb2Z0IHJlc2V0IGFjY29yZGluZyB0byBNWDIzIGVycmF0dW0gIzI4NDcg
KCJCQ0ggc29mdApyZXNldCBtYXkgY2F1c2UgYnVzIG1hc3RlciBsb2NrIHVwIikgZm9yIE1YMjgg
dG9vLiBJdCBoYXMgdGhlIHNhbWUKcHJvYmxlbS4KCk9ic2VydmVkIHByb2JsZW06IG9uY2UgcGVy
IDEwMCwwMDArIE1YMjggcmVib290cyBOQU5EIHJlYWQgZmFpbGVkIG9uCkRNQSB0aW1lb3V0IGVy
cm9yczoKWyAgICAxLjc3MDgyM10gVUJJOiBhdHRhY2hpbmcgbXRkMyB0byB1YmkwClsgICAgMi43
NjgwODhdIGdwbWlfbmFuZDogRE1BIHRpbWVvdXQsIGxhc3QgRE1BIDoxClsgICAgMy45NTgwODdd
IGdwbWlfbmFuZDogQkNIIHRpbWVvdXQsIGxhc3QgRE1BIDoxClsgICAgNC4xNTYwMzNdIGdwbWlf
bmFuZDogRXJyb3IgaW4gRUNDLWJhc2VkIHJlYWQ6IC0xMTAKWyAgICA0LjE2MTEzNl0gVUJJIHdh
cm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtMTEwIHdoaWxlIHJlYWRpbmcgNjQKYnl0ZXMgZnJv
bSBQRUIgMDowLCByZWFkIG9ubHkgMCBieXRlcywgcmV0cnkKWyAgICA0LjE3MTI4M10gc3RlcCAx
IGVycm9yClsgICAgNC4xNzM4NDZdIGdwbWlfbmFuZDogQ2hpcDogMCwgRXJyb3IgLTEKCldpdGhv
dXQgQkNIIHNvZnQgcmVzZXQgd2Ugc3VjY2Vzc2Z1bGx5IGV4ZWN1dGVkIDEsMDAwLDAwMCBNWDI4
IHJlYm9vdHMuCgpJIGhhdmUgYSBxdW90ZSBmcm9tIE5YUCByZWdhcmRpbmcgdGhpcyBwcm9ibGVt
LCBmcm9tIEp1bHkgMTh0aCAyMDE2OgoKIkFzIHRoZSBpLk1YMjMgYW5kIGkuTVgyOCBhcmUgb2Yg
dGhlIHNhbWUgZ2VuZXJhdGlvbiwgdGhleSBzaGFyZSBtYW55CmNoYXJhY3RlcmlzdGljcy4gVW5m
b3J0dW5hdGVseSwgYWxzbyB0aGUgZXJyYXRhcyBtYXkgYmUgc2hhcmVkLgpJbiBjYXNlIG9mIHRo
ZSBkb2N1bWVudGVkIGVycmF0YXMgYW5kIHRoZSB3b3JrYXJvdW5kcywgeW91IGNhbiBhbHNvCmFw
cGx5IHRoZSB3b3JrYXJvdW5kIHNvbHV0aW9uIG9mIG9uZSBkZXZpY2Ugb24gdGhlIG90aGVyIG9u
ZS4gVGhpcyBoYXZlCmJlZW4gcmVwb3J0ZWQsIGJ1dCBJ4oCZbSBhZnJhaWQgdGhhdCB0aGVyZSBh
cmUgbm90IGFuIGVzdGltYXRlZCBkYXRlIGZvcgp1cGRhdGluZyB0aGUgRXJyYXRhIGRvY3VtZW50
cy4KUGxlYXNlIGFjY2VwdCBvdXIgYXBvbG9naWVzIGZvciBhbnkgaW5jb252ZW5pZW5jZXMgdGhp
cyBtYXkgY2F1c2UuIgoKU2lnbmVkLW9mZi1ieTogTWFuZnJlZCBTY2hsYWVnbCA8bWFuZnJlZC5z
Y2hsYWVnbEBnaW56aW5nZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gS2VwcGxpbmdlciA8
bWFydGluLmtlcHBsaW5nZXJAZ2luemluZ2VyLmNvbT4KLS0tCgpUaGlzIGlzIHNvbWV0aGluZyB3
ZSBoYXZlIGluIG91ciB0cmVlIGZvciB5ZWFycyBhbmQgaXMgcnVubmluZyBvbgpwcm9kdWN0aW9u
IHN5c3RlbXMgYW5kIEkgaG9wZSB0aGF0IHRoaXMgaGVscHMgb3RoZXJzIHRvby4KCnRoYW5rcwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJ0aW4KCgoKIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jIHwgMTMgKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLWxpYi5jCmluZGV4IGJkNGNmYWM2YjVhYS4uYTQ3NjhkZjUwODNmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYworKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYwpAQCAtMTU1LDkgKzE1
NSwxMCBAQCBpbnQgZ3BtaV9pbml0KHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKIAogCS8q
CiAJICogUmVzZXQgQkNIIGhlcmUsIHRvby4gV2UgZ290IGZhaWx1cmVzIG90aGVyd2lzZSA6KAot
CSAqIFNlZSBsYXRlciBCQ0ggcmVzZXQgZm9yIGV4cGxhbmF0aW9uIG9mIE1YMjMgaGFuZGxpbmcK
KwkgKiBTZWUgbGF0ZXIgQkNIIHJlc2V0IGZvciBleHBsYW5hdGlvbiBvZiBNWDIzIGFuZCBNWDI4
IGhhbmRsaW5nCiAJICovCi0JcmV0ID0gZ3BtaV9yZXNldF9ibG9jayhyLT5iY2hfcmVncywgR1BN
SV9JU19NWDIzKHRoaXMpKTsKKwlyZXQgPSBncG1pX3Jlc2V0X2Jsb2NrKHItPmJjaF9yZWdzLAor
CQkJICAgICAgIEdQTUlfSVNfTVgyMyh0aGlzKSB8fCBHUE1JX0lTX01YMjgodGhpcykpOwogCWlm
IChyZXQpCiAJCWdvdG8gZXJyX291dDsKIApAQCAtMjYzLDEyICsyNjQsMTAgQEAgaW50IGJjaF9z
ZXRfZ2VvbWV0cnkoc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQogCS8qCiAJKiBEdWUgdG8g
ZXJyYXR1bSAjMjg0NyBvZiB0aGUgTVgyMywgdGhlIEJDSCBjYW5ub3QgYmUgc29mdCByZXNldCBv
biB0aGlzCiAJKiBjaGlwLCBvdGhlcndpc2UgaXQgd2lsbCBsb2NrIHVwLiBTbyB3ZSBza2lwIHJl
c2V0dGluZyBCQ0ggb24gdGhlIE1YMjMuCi0JKiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhlIE1YMjgg
bmVlZHMgdGhlIHJlc2V0LCBiZWNhdXNlIG9uZSBjYXNlIGhhcyBiZWVuCi0JKiBzZWVuIHdoZXJl
IHRoZSBCQ0ggcHJvZHVjZWQgRUNDIGVycm9ycyBjb25zdGFudGx5IGFmdGVyIDEwMDAwCi0JKiBj
b25zZWN1dGl2ZSByZWJvb3RzLiBUaGUgbGF0dGVyIGNhc2UgaGFzIG5vdCBiZWVuIHNlZW4gb24g
dGhlIE1YMjMKLQkqIHlldCwgc3RpbGwgd2UgZG9uJ3Qga25vdyBpZiBpdCBjb3VsZCBoYXBwZW4g
dGhlcmUgYXMgd2VsbC4KKwkqIGFuZCBNWDI4LgogCSovCi0JcmV0ID0gZ3BtaV9yZXNldF9ibG9j
ayhyLT5iY2hfcmVncywgR1BNSV9JU19NWDIzKHRoaXMpKTsKKwlyZXQgPSBncG1pX3Jlc2V0X2Js
b2NrKHItPmJjaF9yZWdzLAorCQkJICAgICAgIEdQTUlfSVNfTVgyMyh0aGlzKSB8fCBHUE1JX0lT
X01YMjgodGhpcykpOwogCWlmIChyZXQpCiAJCWdvdG8gZXJyX291dDsKIAotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
