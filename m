Return-Path: <SRS0=OCz7=HG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6268FC433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 09:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA41464F3F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 09:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA41464F3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yF4253gxOSsSbOVBqOaj/qI3Kxot9wAHLKCrtwXz3aU=; b=sMfyIFWJ/uhHt+KqCnlT4TBfi
	SZrj7tJAvPuvEOFaJpUk1AX/+cGog2FEwC+X92GGev4i0h62Wk2z+V6+6aSiLBqefCq6NQDA+J3f9
	e7vtM/mfMT9SjCdTHDDIzPBSzG4bPsOK97XOMAF/7w8bo6u9SPLwtkt8cH0qdbbqKmv0O4BUZstgm
	Z+MHSP/fg4E7c/kXzg9LE8SoN/sVSwFnwSsEb8O+isIoLRO6+ZNs/13dTWmlvoPfMP5oJrOC9LSSA
	8bP7sUPatUz8Rf/lRnOW5Bpl+y2BQK9xJC+HxNTC7F7bodzCDlUEPAv0iND7rGuHceSni5vhIFOZ0
	Q79NN6Vkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7aUa-00064N-RP; Thu, 04 Feb 2021 09:00:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7aUW-00063V-MV
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2021 08:59:57 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 42B531C000A;
 Thu,  4 Feb 2021 08:59:52 +0000 (UTC)
Date: Thu, 4 Feb 2021 09:59:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210204095951.0a9642de@xps13>
In-Reply-To: <20210204085221.GB8235@thinkpad>
References: <20210202041614.GA840@work> <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
 <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
 <20210203111914.1c2f68f6@collabora.com>
 <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
 <20210203122422.6963b0ed@collabora.com>
 <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
 <20210204091336.1406ca3b@xps13> <20210204085221.GB8235@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_035956_919021_52874CAC 
X-CRM114-Status: GOOD (  22.34  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFRodSwKNCBGZWIgMjAyMSAxNDoyMjoyMSArMDUzMDoK
Cj4gT24gVGh1LCBGZWIgMDQsIDIwMjEgYXQgMDk6MTM6MzZBTSArMDEwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPiA+IEhpIE1hbml2YW5uYW4sCj4gPiAKPiA+IE1hbml2YW5uYW4gU2FkaGFzaXZh
bSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFdlZCwKPiA+IDAz
IEZlYiAyMDIxIDE3OjExOjMxICswNTMwOgo+ID4gICAKPiA+ID4gT24gMyBGZWJydWFyeSAyMDIx
IDQ6NTQ6MjIgUE0gSVNULCBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJv
cmEuY29tPiB3cm90ZTogIAo+ID4gPiA+T24gV2VkLCAwMyBGZWIgMjAyMSAxNjoyMjo0MiArMDUz
MAo+ID4gPiA+TWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGlu
YXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4gICAgCj4gPiA+ID4+IE9uIDMgRmVicnVhcnkgMjAyMSAz
OjQ5OjE0IFBNIElTVCwgQm9yaXMgQnJlemlsbG9uICAgIAo+ID4gPiA+PGJvcmlzLmJyZXppbGxv
bkBjb2xsYWJvcmEuY29tPiB3cm90ZTogICAgCj4gPiA+ID4+ID5PbiBXZWQsIDAzIEZlYiAyMDIx
IDE1OjQyOjAyICswNTMwCj4gPiA+ID4+ID5NYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5u
YW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4gPj4gPiAgICAgIAo+ID4gPiA+
PiA+PiA+PiAKPiA+ID4gPj4gPj4gPj4gSSBnb3QgbW9yZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSB2
ZW5kb3IsIFRlbGl0LiBUaGUgYWNjZXNzIHRvICAgIAo+ID4gPiA+dGhlICAgICAgCj4gPiA+ID4+
ID4zcmQgICAgICAgIAo+ID4gPiA+PiA+PiA+cGFydGl0aW9uIGlzIHByb3RlY3RlZCBieSBUcnVz
dHpvbmUgYW5kIGFueSBhY2Nlc3MgaW4gbm9uICAgIAo+ID4gPiA+cHJpdmlsZWdlZCAgICAKPiA+
ID4gPj4gPj4gPm1vZGUgKHdoZXJlIExpbnV4IGtlcm5lbCBydW5zKSBjYXVzZXMga2VybmVsIHBh
bmljIGFuZCB0aGUgZGV2aWNlCj4gPiA+ID4+ID4+ID5yZWJvb3RzLiAgICAgICAKPiA+ID4gPj4g
Pgo+ID4gPiA+PiA+T3V0IG9mIGN1cmlvc2l0eSwgaXMgaXQgYSBwZXItQ1MtbGluZSB0aGluZyBv
ciBpcyB0aGlzIHNlY3Rpb24KPiA+ID4gPj4gPnByb3RlY3RlZCBvbiBhbGwgQ1M/Cj4gPiA+ID4+
ID4gICAgICAKPiA+ID4gPj4gCj4gPiA+ID4+IFNvcnJ5LCBJIGRpZG4ndCBnZXQgeW91ciBxdWVz
dGlvbi4gICAgIAo+ID4gPiA+Cj4gPiA+ID5UaGUgcWNvbSBjb250cm9sbGVyIGNhbiBoYW5kbGUg
c2V2ZXJhbCBjaGlwcywgZWFjaCBjb25uZWN0ZWQgdGhyb3VnaCBhCj4gPiA+ID5kaWZmZXJlbnQg
Q1MgKGNoaXAtc2VsZWN0KSBsaW5lLCByaWdodD8gSSdtIHdvbmRlcmluZyBpZiB0aGUgZmlybXdh
cmUKPiA+ID4gPnJ1bm5pbmcgaW4gc2VjdXJlIG1vZGUgaGFzIHRoZSBhYmlsaXR5IHRvIGJsb2Nr
IGFjY2VzcyBmb3IgYSBzcGVjaWZpYwo+ID4gPiA+Q1MgbGluZSBvciBpZiBhbGwgQ1MgbGluZXMg
aGF2ZSB0aGUgc2FtZSBjb25zdHJhaW50LiBUaGF0IHdpbGwgaW1wYWN0Cj4gPiA+ID50aGUgd2F5
IHlvdSBkZXNjcmliZSBpdCBpbiB5b3VyIERUIChpbiBvbmUgY2FzZSB0aGUgc2VjdXJlLXJlZ2lv
bgo+ID4gPiA+cHJvcGVydHkgc2hvdWxkIGJlIHVuZGVyIHRoZSBjb250cm9sbGVyIG5vZGUsIGlu
IHRoZSBvdGhlciBjYXNlIGl0Cj4gPiA+ID5zaG91bGQgYmUgdW5kZXIgdGhlIE5BTkQgY2hpcCBu
b2RlKS4gICAgCj4gPiA+IAo+ID4gPiBSaWdodC4gSSBiZWxpZXZlIHRoZSBpbXBsZW1lbnRhdGlv
biBpcyBjb21tb24gdG8gYWxsIE5BTkQgY2hpcHMgc28gdGhlIHByb3BlcnR5IHNob3VsZCBiZSBp
biB0aGUgY29udHJvbGxlciBub2RlLiAgIAo+ID4gCj4gPiBMb29rcyB3ZWlyZDogZG8geW91IG1l
YW4gdGhhdCBlYWNoIG9mIHRoZSBjaGlwcyB3aWxsIGhhdmUgYSBzZWN1cmUgYXJlYT8gIAo+IAo+
IEkgd2F5IEkgc2FpZCBpcywgdGhlICJzZWN1cmUtcmVnaW9uIiBwcm9wZXJ0eSB3aWxsIGJlIHBy
ZXNlbnQgaW4gdGhlIGNvbnRyb2xsZXIKPiBub2RlIGFuZCBub3QgaW4gdGhlIE5BTkQgY2hpcCBu
b2RlIHNpbmNlIHRoaXMgaXMgbm90IHJlbGF0ZWQgdG8gdGhlIGRldmljZQo+IGZ1bmN0aW9uYWxp
dHkuCj4gCj4gQnV0IGZvciByZWZlcmVuY2luZyB0aGUgTkFORCBkZXZpY2UsIHRoZSBwcm9wZXJ0
eSBjYW4gaGF2ZSB0aGUgcGhhbmRsZSBhcyBiZWxvdzoKPiAKPiBzZWN1cmUtcmVnaW9uID0gPCZu
YW5kMCAweGZmZmY+OwoKUHJvYmFibHkgbW9yZSBsaWtlOgoKc2VjdXJlLXJlZ2lvbiA9IDwmbmFu
ZDAgMHgwIDB4RkZGRj47IC8vIG9mX25vZGUsIHN0YXJ0LCBzaXplCgpidXQgeWVhaCwgbG9va3Mg
ZmluZSBieSBtZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
