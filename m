Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA3DC3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC4D246A1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qeVKle+X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1/bKuNEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DC4D246A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRImzaXGnUq3B7g5nEF0DgWfJavPwvbi5i8l6d9wWPw=; b=qeVKle+X5vK3ZF
	zFJ7ZNxv1mUbSmTe/ZR/pl69Q5fNn+y4UWE+b67IAHTG4TXe6AmNnhqf7oYTgGHadShEZ75TIv6Fv
	u88W26UnV4KWjGlQVj4GeJUvdBXBwKoW+VxdaQtBJSmHcdt2u+PXnQn3ACnhMx9PAO9pYJh76Kx2O
	j7y0LsamLQooVmIASmlrTJUkPtsa8fpEKIObjTYg8fCl+GCOyPNSnCLnQeBBPiTJaM8xtHsMHIsUr
	4ZB/YXHLiotLbCQL5nejhLxRJ9xcXNjsXjhiAFoyEkoVejG2B5tc4qhb2FUh8auM6cxcdUQz1fJJ/
	CQcFNJjmz10BNmQ8uF3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8h91-0007fl-Um; Mon, 02 Mar 2020 09:13:47 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8h90-0007fK-Ef
 for linux-mtd@bombadil.infradead.org; Mon, 02 Mar 2020 09:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=4Fx4LS2eis8MX0HQdo81+uYw1ZfQ5x69W90dlcvgAsc=; b=1/bKuNErsojCgYthyEOSdvw7PK
 lZPzrFJDNEMgGlXvLTuA88kcKDkPXvmlmJTmxBXsR7420hg0aG7YXMVWI6LbX5Q9lt/t7CFJC5AEv
 /UL4l0JsJIGyrekI97fs9YF3yaObGYbIosIpZTKKi4/BQAaMR4NptAavHl82m6G3WzlIf2xK+3vul
 hm58kHJm7CL1mSx3DtUuOKzafdikO33Mnc7JovV/IauqlFBluYRnBumCl+l4TRGqzKfHiIccs/v7X
 +R9H2ZszTmB3krP1XSVSHCZBtJzN7kDAg63QiIdhrRrVEzi4M2IFVh/2nRQzW/4pcYMmvSPgihqpo
 A61FPHxg==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8h8x-0005OS-F1
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 09:13:44 +0000
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E8381100002;
 Mon,  2 Mar 2020 09:12:55 +0000 (UTC)
Date: Mon, 2 Mar 2020 10:12:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 1/2] mtd: spinand: toshiba: Rename function name to
 change suffix and prefix (8Gbit)
Message-ID: <20200302101254.31ca0c83@xps13>
In-Reply-To: <d2837c89-c9b2-fd18-d090-567f2a90cf75@kontron.de>
References: <cover.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
 <41b30e2d308ec7f252d71970a2ed1c29cd25c0d7.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
 <d2837c89-c9b2-fd18-d090-567f2a90cf75@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+IHdy
b3RlIG9uIE1vbiwgMiBNYXIgMjAyMAowODowMjoyNSArMDAwMDoKCj4gT24gMjguMDIuMjAgMDQ6
MTEsIFlvc2hpbyBGdXJ1eWFtYSB3cm90ZToKPiA+IFRoZSBzdWZmaXggd2FzIGNoYW5nZWQgdG8g
Y2xhc3NpZnkgZnJvbSAiZyIgdG8gImoiIGJldHdlZW4gMXN0IGdlbmVyYXRpb24KPiA+IGRldmlj
ZSBhbmQgMm5kIGdlbmVyYXRpb24gZGV2aWNlIHRoYXQncyBuZXcgU2VyaWFsIE5BTkQgb2YgS2lv
eGlhIGJyYW5kLiAgCj4gCj4gSSBoYWQgdG8gcmVhZCB0aGlzIHNlbnRlbmNlIG11bHRpcGxlIHRp
bWVzIHRvIHVuZGVyc3RhbmQgaXQuIE1heWJlIAo+IHNvbWV0aGluZyBsaWtlIHRoaXMgd291bGQg
YmUgYmV0dGVyOgo+IAo+ICAgIFRoZSBzdWZmaXggd2FzIGNoYW5nZWQgZnJvbSAiZyIgdG8gImoi
IHRvIGNsYXNzaWZ5IGJldHdlZW4gMXN0Cj4gICAgZ2VuZXJhdGlvbiBhbmQgMm5kIGdlbmVyYXRp
b24gc2VyaWFsIE5BTkQgZGV2aWNlcyAod2hpY2ggbm93IGJlbG9uZyB0bwo+ICAgIHRoZSBLaW94
aWEgYnJhbmQpLgo+IAo+ID4gQXMgcmVmZXJlbmNlIHRoYXQncwo+ID4gMXN0IGdlbmVyYXRpb24g
ZGV2aWNlIG9mIDFHYml0IHByb2R1Y3QgaXMgInRjNThjdmcwczNocmFpZyIKPiA+IDJuZCBnZW5l
cmF0aW9uIGRldmljZSBvZiAxR2JpdCBwcm9kdWN0IGlzICJ0YzU4Y3ZnMHMzaHJhaWoiLgo+ID4g
Cj4gPiBUaGUgOEdiaXQgcHJvZHVjdCAiVEg1OEN4RzNTMEhSQUlKIiBpcyBuZXcgbGluZSB1cCBv
ZiBLaW94aWEncyBzZXJpYWwgbmFuZAo+ID4gYW5kIGNoYW5nZWQgdGhlIHByZWZpeCBmcm9tIHRj
NTggdG8gdGg1OC4KPiA+IFRodXMgaXQgd2FzIGNoYW5nZWQgYXJndW1lbnQgdG8gdGhlIGZ1bmN0
aW9uIGZyb20gInRjNThjeGd4c3giIHRvCj4gPiAidHg1OGN4Z3hzeHJhaXgiLiAgCj4gCj4gU2Ft
ZSBoZXJlLiBJdCBpcyB2ZXJ5IGhhcmQgdG8gcmVhZC4gSSB3b3VsZCB3cml0ZSBzb21ldGhpbmcg
bGlrZSB0aGlzOgo+IAo+ICAgIFRoZSA4R2JpdCB0eXBlICJUSDU4Q3hHM1MwSFJBSUoiIGlzIG5l
dyB0byBLaW94aWEncyBzZXJpYWwgTkFORCBsaW5ldXAKPiAgICBhbmQgdGhlIHByZWZpeCB3YXMg
Y2hhbmdlZCBmcm9tICJUQzU4IiB0byAiVEg4NSIuCj4gCj4gICAgVGh1cyB0aGUgZnVuY3Rpb25z
IHdlcmUgcmVuYW1lZCBmcm9tIHRjNThjeGd4c3hfKigpIHRvCj4gICAgdHg1OGN4Z3hzeHJhaXhf
KigpLgo+IAo+IFdpdGggYW4gZWFzaWVyIHRvIHVuZGVyc3RhbmQgY29tbWl0IG1lc3NhZ2U6Cj4g
Cj4gUmV2aWV3ZWQtYnk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJv
bi5kZT4KCkFncmVlZCwgdGhlIGNvbW1pdCBsb2cgcHJvcG9zYWwgZnJvbSBGcmllZGVyIGxvb2tz
IGJldHRlci4KClRoZSByZXN0IG9mIHRoZSBwYXRjaCBpcyBmaW5lIGJ5IG1lIHRob3VnaC4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
