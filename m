Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5FBC433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:03:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93FD20848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3vNgpFt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B93FD20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3n/N+YQFnMUBPNiNMnqOsKeYE5ZssNEx0xgGdEUZ+nU=; b=r3vNgpFtTTJpbwjvE2C9tFfDj
	WvBKVzJqSSFhVVa9aqsbS3bf5xuhxyRmneTV6kISKToUsT419kQ1oEVGHuc8zXfvtY6QjTtZHa35K
	UdNwSGTAEzLrcPOd8iOQA2qayTBv5zixAzAGTatSUN4T00JLrVNN2Lv5WpS0piudvmGUskWXBhaUY
	3VFB0Ib4L/99Z4On9fFFLsX+vWXaALM2X7dK7vq39KHgOQwa7zjvlQleRt8dpoTpIIZt/7Z/pLkP5
	wD7OZ0ZiERaWkoSKmSBBf3/99JnGC1BYCQ40qf4F78Dgh6Dcc90SWJS8UIltxICLug5kkhQP6ZbqS
	bpijb2pmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTT79-0002jC-4I; Fri, 16 Oct 2020 17:01:59 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTT75-0002hj-SA
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 17:01:57 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4D6C9200002;
 Fri, 16 Oct 2020 17:01:51 +0000 (UTC)
Date: Fri, 16 Oct 2020 19:01:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
Message-ID: <20201016190149.55a3d62f@xps13>
In-Reply-To: <20201016135351.GL13710@pengutronix.de>
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <20201016135351.GL13710@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_130156_020394_3F6F89B9 
X-CRM114-Status: GOOD (  20.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBGcmksIDE2IE9jdCAyMDIwCjE1OjUzOjUxICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24g
RnJpLCBPY3QgMTYsIDIwMjAgYXQgMDk6NDk6NDJBTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IE5vIEVDQyBpbml0aWFsaXphdGlvbiBzaG91bGQgaGFwcGVuIGR1cmluZyB0aGUgaG9z
dCBjb250cm9sbGVyIHByb2JlLgo+ID4gCj4gPiBJbmRlZWQsIHdlIG5lZWQgdGhlIHByb2JlIHRv
IGNhbGwgbmFuZF9zY2FuKCkgaW4gb3JkZXIgdG86Cj4gPiAtIGlkZW50aWZ5IHRoZSBkZXZpY2Us
IGl0cyBjYXBhYmlsaXRpZXMgYW5kIGNvbnN0cmFpbnRzIChuYW5kX3NjYW5faWRlbnQoKSkKPiA+
IC0gY29uZmlndXJlIHRoZSBFQ0MgZW5naW5lIGFjY29yZGluZ2x5ICgtPmF0dGFjaF9jaGlwKCkp
Cj4gPiAtIHNjYW4gaXRzIGNvbnRlbnQgYW5kIHByZXBhcmUgdGhlIGNvcmUgKG5hbmRfc2Nhbl90
YWlsKCkpCj4gPiAKPiA+IE1vdmluZyB0aGVzZSBsaW5lcyB0byBteGNuZF9hdHRhY2hfY2hpcCgp
IGZpeGVzIGEgcmVncmVzc2lvbiBjYXVzZWQgYnkKPiA+IGEgcHJldmlvdXMgY29tbWl0IHN1cHBv
c2VkIHRvIGNsYXJpZnkgdGhlc2Ugc3RlcHMuCj4gPiAKPiA+IEZpeGVzOiBUT0RPCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4g
LS0tCj4gPiAKPiA+IEhpIEhhbiwKPiA+IAo+ID4gQ291bGQgeW91IHBsZWFzZSBnaXZlIHRoaXMg
cGF0Y2ggYSBzaG90PyBJdCBpcyBzdXBwb3NlZCB0byBmaXgKPiA+IHRoZSBMUzEwNDNBIGlzc3Vl
IHdlIGhhdmUgc2VlbiBpbiByb2JvdHMgcmVwb3J0cyB0aGUgbGFzdCB3ZWVrcy4gIAo+IAo+IFdp
dGggdGhpcyB0aGVyZSdzIG5vIGxvbmdlciBhIGRpdmlzaW9uIGJ5IHplcm8gaW4gdGhlIGtlcm5l
bCwgYnV0IE5BTkQKPiBub3cgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nLiBBbHNvIEkgY2FuIGNv
bmZpcm0gdGhhdCAibXRkOiByYXduYW5kOgo+IFVzZSB0aGUgRUNDIGZyYW1ld29yayB1c2VyIGlu
cHV0IHBhcnNpbmcgYml0cyIgaW4gbmV4dCBicmVha3MgaXQsIHdpdGhvdXQKPiB0aGlzIHBhdGNo
IHRoZSBkcml2ZXIgcnVucyB3ZWxsLgo+IAo+IFNhc2NoYQo+IAo+IG5hbmQ6IGRldmljZSBmb3Vu
ZCwgTWFudWZhY3R1cmVyIElEOiAweDIwLCBDaGlwIElEOiAweGExCj4gbmFuZDogU1QgTWljcm8g
TkFORDAxR1IzQjJDWkE2Cj4gbmFuZDogMTI4IE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lC
LCBwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXplOiA2NAo+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUg
XS0tLS0tLS0tLS0tLQo+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDEgYXQgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbXhjX25hbmQuYzoxMzkwIG14Y19uYW5kX2NvbW1hbmQrMHhjNC8weDI2Ywo+IFVuaW1w
bGVtZW50ZWQgY29tbWFuZCAoY21kPTApCj4gTW9kdWxlcyBsaW5rZWQgaW46Cj4gQ1BVOiAwIFBJ
RDogMSBDb21tOiBzd2FwcGVyIE5vdCB0YWludGVkIDUuOS4wLXJjMi0wMDAyMC1nMmUwMDQ1MGE1
ODUyICMyMAo+IEhhcmR3YXJlIG5hbWU6IEZyZWVzY2FsZSBpLk1YMjcgKERldmljZSBUcmVlIFN1
cHBvcnQpCj4gWzxjMDAxMDZhND5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8YzAwMGRkMDg+
XSAoc2hvd19zdGFjaysweDEwLzB4MTgpCj4gWzxjMDAwZGQwOD5dIChzaG93X3N0YWNrKSBmcm9t
IFs8YzAzNzk1MGM+XSAoZHVtcF9zdGFjaysweDIwLzB4MmMpCj4gWzxjMDM3OTUwYz5dIChkdW1w
X3N0YWNrKSBmcm9tIFs8YzAwMWM2OGM+XSAoX193YXJuKzB4YjgvMHhlYykKPiBbPGMwMDFjNjhj
Pl0gKF9fd2FybikgZnJvbSBbPGMwMDFjYTU0Pl0gKHdhcm5fc2xvd3BhdGhfZm10KzB4OTAvMHhi
YykKPiBbPGMwMDFjYTU0Pl0gKHdhcm5fc2xvd3BhdGhfZm10KSBmcm9tIFs8YzA0OTRjYjg+XSAo
bXhjX25hbmRfY29tbWFuZCsweGM0LzB4MjZjKQo+IFs8YzA0OTRjYjg+XSAobXhjX25hbmRfY29t
bWFuZCkgZnJvbSBbPGMwNDg5ZjUwPl0gKG5hbmRfcmVhZF9wYWdlX29wKzB4MjhjLzB4MzAwKQo+
IFs8YzA0ODlmNTA+XSAobmFuZF9yZWFkX3BhZ2Vfb3ApIGZyb20gWzxjMDQ4YTBkND5dIChuYW5k
X3JlYWRfcGFnZV9yYXcrMHgyYy8weDZjKQo+IFs8YzA0OGEwZDQ+XSAobmFuZF9yZWFkX3BhZ2Vf
cmF3KSBmcm9tIFs8YzA0ODZiNjg+XSAobmFuZF9yZWFkX3BhZ2Vfc3dlY2MrMHgzOC8weDExYykK
PiBbPGMwNDg2YjY4Pl0gKG5hbmRfcmVhZF9wYWdlX3N3ZWNjKSBmcm9tIFs8YzA0ODdmNWM+XSAo
bmFuZF9yZWFkX29vYisweDIzOC8weDczMCkKClNvZnR3YXJlIEVDQyBpcyB1c2VkLCBpcyBpdCBl
eHBlY3RlZD8KCkNhbiB5b3UgdHJhY2UgcmF3bmFuZF9kdF9pbml0KCkgdG8gc2VlIHdoYXQgaGFw
cGVuIGluIHRoZSBlbmdpbmVfdHlwZQpjaG9pY2U/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
