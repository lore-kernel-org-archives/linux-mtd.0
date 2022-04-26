Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A2BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eYz8lyrj+D3GsA0NfArVW73aHwlCxbnPpigc3NcGxo=; b=JYETpBpbaHB73l
	+bGejZh2UyL/Tt+GcyiOF7Gf/7vmvKLQhSbfNUsZ1mxbrQpw4q6wvhJ8udwMtLzyYrb7UraY72+Q6
	1cg1FV/Ds7dWwd9m0RqRuFBuUL47/UmHTY8sE24aj3/Kpjzpwl4Cxa65JhMIYEg3SxTsfKLtg6is2
	UhiDmIyfAAhmKMgeEtqagGPA6WC/BIy5ASVl+HxlUn5HVYQRSav7ged6BLOtjcvNRyl6j+JXTsfgQ
	kUHVDAqCyoj26kiY9YTK/nDBzdS4+u8qisf04pWjSDWuhORZ6uX5p3TlD+wORhMgiIxJZ0rxVxkHW
	NARLYUnXmYVaSUrrKxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFla-00D0of-QC; Tue, 26 Apr 2022 07:37:47 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFlS-00D0gt-Oc
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 07:37:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48235E000C;
 Tue, 26 Apr 2022 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650958651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTqC0UAEn+VbPJ5B6PSf6FoSoJExZ22S4rLqRvysvmY=;
 b=HBxUaEVzyzNFbKjjdZoWELx/PiZW/0gZi1dt49sDdPXzqkgkTfos7ZMnfwmhBmoWtrxXVK
 UcKyt98110uVp9noFjvZHMXjsLAK0e+P5JOAROr6V2c3lA/28ZjpmbDwSfThRSG7ypQByw
 ifdQoG0h/dQT6TXcG/I7WI1mhLj8g+dHcJ3w0/SnvePbr013Pz0xTAYmoLgc3UoqI4RoK5
 4bBJie/G6woGTmheO09VD6coxLRnTrVr8UasSOty7Jis9bEQ412qf532lRrlX0VijGFXV0
 mBICQzmRHyJ5Btm5l5nFTL82BgosbHbUk1dmEsugCwerXsui2rbKk9/CrUME7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtdblock: warn if opened on NAND
Date: Tue, 26 Apr 2022 09:37:29 +0200
Message-Id: <20220426073729.37111-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220328161108.87757-1-bjorn@mork.no>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'96a3295c351da82d7af99b2fc004a3cf9f4716a9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_003739_160839_E42A2D33 
X-CRM114-Status: GOOD (  12.88  )
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

T24gTW9uLCAyMDIyLTAzLTI4IGF0IDE2OjExOjA4IFVUQywgPT91dGYtOD9xP0JqPUMzPUI4cm5f
TW9yaz89IHdyb3RlOgo+IFdhcm5pbmcgb24gZXZlcnkgdHJhbnNsYXRlZCBtdGQgcGFydGl0aW9u
IHJlc3VsdHMgaW4gZXhjZXNzaXZlIGxvZyBub2lzZQo+IGlmIHRoaXMgZHJpdmVyIGlzIGxvYWRl
ZDoKPiAKPiAgIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweGMyLCBDaGlw
IElEOiAweGYxCj4gICBuYW5kOiBNYWNyb25peCBNWDMwTEYxRzE4QUMKPiAgIG5hbmQ6IDEyOCBN
aUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTog
NjQKPiAgIG10NzYyMS1uYW5kIDFlMDAzMDAwLm5hbmQ6IEVDQyBzdHJlbmd0aCBhZGp1c3RlZCB0
byA0IGJpdHMKPiAgIHJlYWRfYmJ0OiBmb3VuZCBiYnQgYXQgYmxvY2sgMTAyMwo+ICAgMTAgZml4
ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2UgbXQ3NjIxLW5hbmQK
PiAgIENyZWF0aW5nIDEwIE1URCBwYXJ0aXRpb25zIG9uICJtdDc2MjEtbmFuZCI6Cj4gICAweDAw
MDAwMDAwMDAwMC0weDAwMDAwMDA4MDAwMCA6ICJCb290bG9hZGVyIgo+ICAgbXRkYmxvY2s6IE1U
RCBkZXZpY2UgJ0Jvb3Rsb2FkZXInIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZyBVQkkg
YmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgo+ICAgMHgwMDAwMDAwODAwMDAtMHgwMDAwMDAxMDAwMDAg
OiAiQ29uZmlnIgo+ICAgbXRkYmxvY2s6IE1URCBkZXZpY2UgJ0NvbmZpZycgaXMgTkFORCwgcGxl
YXNlIGNvbnNpZGVyIHVzaW5nIFVCSSBibG9jayBkZXZpY2VzIGluc3RlYWQuCj4gICAweDAwMDAw
MDEwMDAwMC0weDAwMDAwMDE0MDAwMCA6ICJGYWN0b3J5Igo+ICAgbXRkYmxvY2s6IE1URCBkZXZp
Y2UgJ0ZhY3RvcnknIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZyBVQkkgYmxvY2sgZGV2
aWNlcyBpbnN0ZWFkLgo+ICAgMHgwMDAwMDAxNDAwMDAtMHgwMDAwMDIwMDAwMDAgOiAiS2VybmVs
Igo+ICAgbXRkYmxvY2s6IE1URCBkZXZpY2UgJ0tlcm5lbCcgaXMgTkFORCwgcGxlYXNlIGNvbnNp
ZGVyIHVzaW5nIFVCSSBibG9jayBkZXZpY2VzIGluc3RlYWQuCj4gICAweDAwMDAwMDU0MDAwMC0w
eDAwMDAwMjAwMDAwMCA6ICJ1YmkiCj4gICBtdGRibG9jazogTVREIGRldmljZSAndWJpJyBpcyBO
QU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4KPiAg
IDB4MDAwMDAyMTQwMDAwLTB4MDAwMDA0MDAwMDAwIDogIktlcm5lbDIiCj4gICBtdGRibG9jazog
TVREIGRldmljZSAnS2VybmVsMicgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIFVCSSBi
bG9jayBkZXZpY2VzIGluc3RlYWQuCj4gICAweDAwMDAwNDAwMDAwMC0weDAwMDAwNDEwMDAwMCA6
ICJ3d2FuIgo+ICAgbXRkYmxvY2s6IE1URCBkZXZpY2UgJ3d3YW4nIGlzIE5BTkQsIHBsZWFzZSBj
b25zaWRlciB1c2luZyBVQkkgYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLgo+ICAgMHgwMDAwMDQxMDAw
MDAtMHgwMDAwMDUxMDAwMDAgOiAiZGF0YSIKPiAgIG10ZGJsb2NrOiBNVEQgZGV2aWNlICdkYXRh
JyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVh
ZC4KPiAgIDB4MDAwMDA1MTAwMDAwLTB4MDAwMDA1MjAwMDAwIDogInJvbS1kIgo+ICAgbXRkYmxv
Y2s6IE1URCBkZXZpY2UgJ3JvbS1kJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJ
IGJsb2NrIGRldmljZXMgaW5zdGVhZC4KPiAgIDB4MDAwMDA1MjAwMDAwLTB4MDAwMDA1MjgwMDAw
IDogInJlc2VydmUiCj4gICBtdGRibG9jazogTVREIGRldmljZSAncmVzZXJ2ZScgaXMgTkFORCwg
cGxlYXNlIGNvbnNpZGVyIHVzaW5nIFVCSSBibG9jayBkZXZpY2VzIGluc3RlYWQuCj4gICBtdGtf
c29jX2V0aCAxZTEwMDAwMC5ldGhlcm5ldCBldGgwOiBtZWRpYXRlayBmcmFtZSBlbmdpbmUgYXQg
MHhiZTEwMDAwMCwgaXJxIDIxCj4gCj4gVGhpcyBpcyBtb3JlIGxpa2VseSB0byBhbm5veSB0aGFu
IHRvIGhlbHAgdXNlcnMgb2YgZW1iZWRkZWQgZGlzdHJvcyB3aGVyZQo+IHRoaXMgZHJpdmVyIGlz
IGVuYWJsZWQgYnkgZGVmYXVsdC4gIE1ha2luZyB0aGUgYmxvY2tkZXZzIGF2YWlsYWJsZSBkb2Vz
Cj4gbm90IGltcGx5IHRoYXQgdGhleSBhcmUgaW4gdXNlLCBhbmQgd2FybmluZyBhYm91dCBib290
bG9hZGVyIHBhcnRpdGlvbnMKPiBvciBvdGhlciBkZXZpY2VzIHdoaWNoIG9idmlvdXNseSBuZXZl
ciB3aWxsIGJlIG1vdW50ZWQgaXMgbW9yZSBjb25mdXNpbmcKPiB0aGFuIGhlbHBmdWwuCj4gCj4g
TW92ZSB0aGUgd2FybmluZyB0byBvcGVuKCksIHdoZXJlIGl0IHdpbGwgYmUgb2YgbW9yZSB1c2Ug
LSBhY3R1YWxseSB3YXJuaW5nCj4gYW55b25lIHdobyBtb3VudHMgYSBmaWxlIHN5c3RlbSBvbiBO
QU5EIHVzaW5nIG10ZGJsb2NrLgo+IAo+IEZpeGVzOiBlMDc0MDNhOGM2YmUgKCJtdGRibG9jazog
V2FybiBpZiBhZGRlZCBmb3IgYSBOQU5EIGRldmljZSIpCj4gU2lnbmVkLW9mZi1ieTogQmrDuHJu
IE1vcmsgPGJqb3JuQG1vcmsubm8+Cj4gUmV2aWV3ZWQtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXpl
cXVpZWxAdmFuZ3VhcmRpYXN1ci5jb20uYXI+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRo
YW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
