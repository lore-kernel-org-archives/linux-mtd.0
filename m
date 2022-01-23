Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C40C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iR6kS2LuLJqlH/8lDRyO+EC5cSWXXnbqP51gApkABHE=; b=rU2zTN+EjWR1te
	tAGgNRkxn3CYGfd3aXYS/t9gAl62s998lO13ajJllPdQ0u3hSfejGlyzvjUcrLsnLgeZaPe0EsPkv
	P5zaoS+ZKWuBlw8BdKEG9vo4iQqieiR/3+x6l5UM+iUDcglbCWu3HEtgISlPlQBu8xpMvMnu2GrbN
	Md2tBqDFS3zEyIjDSAooujEOC0P4BwTfcVnL23wI9u8cqRzwojle/lzrYMcL1PpR2cYVh6OV/2Jqn
	w90HIpnA3QdmcPjM93jjg6pFDaZpI5NQ59Jy55HgPX5uBjasRWkIWaR0oA6p6FOXJYTR0DlaqaZo2
	ldiQJpecC4KJQwrgLAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBf3J-0019zh-Be; Sun, 23 Jan 2022 15:45:13 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBexv-0018LO-Jg
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:39:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8BC0B60004;
 Sun, 23 Jan 2022 15:39:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/4] mtd: rawnand: gpmi: support fast edo timings for mx28
Date: Sun, 23 Jan 2022 16:39:36 +0100
Message-Id: <20220123153936.673237-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220118095434.35081-5-dario.binacchi@amarulasolutions.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ac178a21754cf720b27e82965c2f11e71e9e5968'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073939_869520_B8AEF5B6 
X-CRM114-Status: GOOD (  10.73  )
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

T24gVHVlLCAyMDIyLTAxLTE4IGF0IDA5OjU0OjM0IFVUQywgRGFyaW8gQmluYWNjaGkgd3JvdGU6
Cj4gSW4gdGhlIGkuTVgyOCBtYW51YWwgKE1DSU1YMjhSTSwgUmV2LiAxLCAyMDEwKSB5b3UgY2Fu
IGZpbmQgYW4gZXhhbXBsZQo+ICgxNS4yLjQgSGlnaC1TcGVlZCBOQU5EIFRpbWluZykgb2YgaG93
IHRvIGNvbmZpZ3VyZSB0aGUgR1BNSSBjb250cm9sbGVyCj4gdG8gbWFuYWdlIEhpZ2gtU3BlZWQg
4oCL4oCLTkFORCBkZXZpY2VzLCBzbyBpdCB3YXMgd3JvbmcgdG8gYXNzdW1lIHRoYXQgb25seQo+
IGkuTVg2IGNhbiBhY2hpZXZlIEVETyB0aW1pbmdzLgo+IAo+IFRoaXMgcGF0Y2ggaGFzIGJlZW4g
dGVzdGVkIG9uIGEgMjA0OC82NCBieXRlIE5BTkQgKE1pY3JvbiBNVDI5RjJHMDhBQkFFQUg0KS4K
PiBLZXJuZWwgbXRkIHRlc3RzOgo+ICAtIG10ZF9uYW5kYml0ZXJycwo+ICAtIG10ZF9uYW5kZWNj
dGVzdAo+ICAtIG10ZF9vb2J0ZXN0Cj4gIC0gbXRkX3BhZ2V0ZXN0Cj4gIC0gbXRkX3JlYWR0ZXN0
Cj4gIC0gbXRkX3NwZWVkdGVzdAo+ICAtIG10ZF9zdHJlc3N0ZXN0Cj4gIC0gbXRkX3N1YnBhZ2V0
ZXN0Cj4gIC0gbXRkX3RvcnR1cmV0ZXN0IFtjeWNsZXNfY291bnQgPSAxMDAwMDAwMF0KPiBydW4g
d2l0aG91dCBlcnJvcnMuCj4gCj4gQmVmb3JlIHRoaXMgcGF0Y2ggKG1vZGUgMCk6Cj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZXJhc2VibG9jayB3cml0ZSBzcGVlZCBpcyAyMDk4IEtp
Qi9zCj4gZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDI2ODAgS2lCL3MKPiBwYWdlIHdyaXRlIHNw
ZWVkIGlzIDE2ODkgS2lCL3MKPiBwYWdlIHJlYWQgc3BlZWQgaXMgMjUyMiBLaUIvcwo+IDIgcGFn
ZSB3cml0ZSBzcGVlZCBpcyAxODk5IEtpQi9zCj4gMiBwYWdlIHJlYWQgc3BlZWQgaXMgMjU3OSBL
aUIvcwo+IGVyYXNlIHNwZWVkIGlzIDEyODAwMCBLaUIvcwo+IDJ4IG11bHRpLWJsb2NrIGVyYXNl
IHNwZWVkIGlzIDczMTQyIEtpQi9zCj4gNHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjA0
ODAwIEtpQi9zCj4gOHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCj4g
MTZ4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwo+IDMyeCBtdWx0aS1i
bG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKPiA2NHggbXVsdGktYmxvY2sgZXJhc2Ug
c3BlZWQgaXMgMjU2MDAwIEtpQi9zCj4gCj4gQWZ0ZXIgdGhpcyBwYXRjaCAobW9kZSA1KToKPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZXJhc2VibG9jayB3cml0ZSBzcGVlZCBpcyAzMzkw
IEtpQi9zCj4gZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDU2ODggS2lCL3MKPiBwYWdlIHdyaXRl
IHNwZWVkIGlzIDI2ODAgS2lCL3MKPiBwYWdlIHJlYWQgc3BlZWQgaXMgNDg3NiBLaUIvcwo+IDIg
cGFnZSB3cml0ZSBzcGVlZCBpcyAyOTA5IEtpQi9zCj4gMiBwYWdlIHJlYWQgc3BlZWQgaXMgNTIy
NCBLaUIvcwo+IGVyYXNlIHNwZWVkIGlzIDE3MDY2NiBLaUIvcwo+IDJ4IG11bHRpLWJsb2NrIGVy
YXNlIHNwZWVkIGlzIDIwNDgwMCBLaUIvcwo+IDR4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlz
IDI1NjAwMCBLaUIvcwo+IDh4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIv
cwo+IDE2eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKPiAzMnggbXVs
dGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCj4gNjR4IG11bHRpLWJsb2NrIGVy
YXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwo+IAo+IENvLWRldmVsb3BlZC1ieTogTWljaGFlbCBU
cmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
TWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+IFRlc3RlZC1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+
IFJldmlld2VkLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+CgpBcHBs
aWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210
ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
