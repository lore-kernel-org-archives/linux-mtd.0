Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E11EC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20763206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXVIq560"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20763206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dL0N0SpLwI+gHEHSTAIFSVjfS2nK0Q7L2pTMXTxg40U=; b=hXVIq560m8xQw7
	ZbSSlRA4zGJXB2uAo0HqNJiCWzZ4FaMnxoxfkeTSdmP7FSySxz6Fe1Xa2XZskms8w7P1+fsQUtShv
	v//jD0FNFZL07gepmgvHlQuGAIyVwz2W6787VVcfeExn2F1qv51Vj/M8g6NoANz3JhgbLLnZhb0hL
	xDNwran0PDO3exicI+ggBPVJbmtiRbbn1emHm7PmoihHNWpFIkY3tZV6GtWa6tYwG1OYsqNHJlYmB
	FcJCc8bvnvZxZG5qJJ3h9vYr2vfyFKQyAsR1UYQVdj0eSdH3bfJlBHSgX9o7dGJ/B4OfEmwZVSuug
	aV197xMldtJVx/bXMkjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipbWH-0007pf-Qe; Thu, 09 Jan 2020 17:22:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipbWE-0007od-EC
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 17:22:52 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 20A53C0006;
 Thu,  9 Jan 2020 17:22:43 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:22:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin DEVERA <devik@eaxlabs.cz>
Subject: Re: [PATCH] mtd: rawnand: Fix unexpected timeouts in waitrdy
Message-ID: <20200109182242.03743cf7@xps13>
In-Reply-To: <73164aea-d889-21e4-4e7d-345ebd4e5197@eaxlabs.cz>
References: <20191210150319.3125-1-devik@eaxlabs.cz>
 <20200109163752.621c6248@xps13>
 <73164aea-d889-21e4-4e7d-345ebd4e5197@eaxlabs.cz>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_092250_613054_15D255E9 
X-CRM114-Status: GOOD (  24.52  )
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
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, jan.pohanka@merz.cz,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIERFVkVSQSA8ZGV2aWtAZWF4bGFicy5jej4gd3JvdGUgb24gVGh1
LCA5IEphbiAyMDIwIDE3OjE3OjMwCiswMTAwOgoKPiBPbiAxLzkvMjAgNDozNyBQTSwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPiA+IEhpIE1hcnRpbiwKPiA+Cj4gPiBNYXJ0aW4gRGV2ZXJhIDxkZXZp
a0BlYXhsYWJzLmN6PiB3cm90ZSBvbiBUdWUsIDEwIERlYyAyMDE5IDE2OjAzOjE4Cj4gPiArMDEw
MDoKPiA+ICAKPiA+PiBUaGUgdXNlZCB3YXkgdG8gY29tcHV0ZSBqaWZmaWVzIHRpbWVvdXQgYnJv
a2VzIHdoZW4KPiA+PiBqaWZmaWUgZGlmZmVyZW5jZSBpcyAxLiBTaW1wbHkgYWRkIDEgLSBpdCBo
YXMgbm8gb3RoZXIKPiA+PiBzaWRlIGVmZmVjdHMuCj4gPj4gRml4ZXMgU1RNMzJNUDEgRk1DMiBO
QU5EIGNvbnRyb2xsZXIgd2hpY2ggc29tZXRpbWVzIGZhaWxlZAo+ID4+IGV4YWN0bHkgaW4gdGhp
cyB3YXkuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gRGV2ZXJhIDxkZXZpa0BlYXhs
YWJzLmN6Pgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMg
fCA2ICsrKysrLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
YmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+PiBpbmRleCBkNTI3
ZTQ0OGNlMTkuLmJlYWIzYTc3NWNjNyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2Jhc2UuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFz
ZS5jCj4gPj4gQEAgLTcyMSw3ICs3MjEsMTEgQEAgaW50IG5hbmRfc29mdF93YWl0cmR5KHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcgdGltZW91dF9tcykKPiA+PiAgIAlpZiAo
cmV0KQo+ID4+ICAgCQlyZXR1cm4gcmV0OyAgCj4gPj4gICA+PiAtCXRpbWVvdXRfbXMgPSBqaWZm
aWVzICsgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKTsgIAo+ID4+ICsJLyogKzEgYmVsb3cg
aXMgbmVjZXNzYXJ5IGJlY2F1c2UgaWYgd2UgYXJlIG5vdyBpbiB0aGUgbGFzdCBmcmFjdGlvbgo+
ID4+ICsJICogb2YgamlmZnkgYW5kIG1zZWNzX3RvX2ppZmZpZXMgaXMgMSB0aGVuIHdlIHdpbGwg
d2FpdCBvbmx5IHRoYXQKPiA+PiArCSAqIHNtYWxsIGppZmZ5IGZyYWN0aW9uIC0gcG9zc2libHkg
bGVhZGluZyB0byBmYWxzZSB0aW1lb3V0Cj4gPj4gKwkgKi8KPiA+PiArCXRpbWVvdXRfbXMgPSBq
aWZmaWVzICsgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKSArIDE7Cj4gPj4gICAJZG8gewo+
ID4+ICAgCQlyZXQgPSBuYW5kX3JlYWRfZGF0YV9vcChjaGlwLCAmc3RhdHVzLCBzaXplb2Yoc3Rh
dHVzKSwgdHJ1ZSk7Cj4gPj4gICAJCWlmIChyZXQpICAKPiA+IEkgZG9uJ3QgcmVhbGx5IHdoYXQg
eW91IGFyZSBmaXhpbmcgaGVyZSwgSSBzdXNwZWN0IHRoZSByb290IGNhdXNlIHRvIGJlCj4gPiBh
IHdyb25nbHkgY2FsY3VsYXRlZCB0aW1lb3V0X21zIGluIHRoZSBjYWxsaW5nIGRyaXZlci4KPiA+
Cj4gPiBJdCBpcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGNhbGxlciB0byB1c2UgdGhpcyBm
dW5jdGlvbiB3aXRoIGEKPiA+IHJlbGV2YW50IHRpbWVvdXRfbXMgcGFyYW1ldGVyLiBNYXliZSBD
aHJpc3RvcGhlIGNhbiBoZWxwIHlvdSBoZXJlPwo+ID4gIAo+IEhpIE1pcXVlbCwKPiAKPiBhc3N1
bWUgdGhhdCBuYW5kX3NvZnRfd2FpdHJkeSBpcyBjYWxsZWQgd2l0aCB0aW1lb3V0X21zPT0xLiBJ
IHN1cHBvc2UgaXQgaXMKPiB2YWxpZCBjYXNlLiBKaWZmaWVzIGFyZSAxMDAwIGZvciBleGFtcGxl
IChhc3N1bWUgc29tZXRoaW5nIG1vcmUgbGlrZSAxMDAwLjk5IC0KPiBqdXN0IGJlZm9yZSBpbmNy
ZW1lbnRpbmcgdG8gMTAwMSkuCj4gV2UgY29tcHV0ZSB0aW1lb3V0X21zID0gMTAwMCttc2Vjc190
b19qaWZmaWVzKDEpID0gMTAwMSAoYXQgbGVhc3QgZm9yIG15IGppZmZpZXMgcmF0ZSkuCj4gbmFu
ZF9yZWFkX2RhdGFfb3AgaXMgY2FsbGVkIGZvciB0aGUgZmlyc3QgdGltZSBhbmQgcmV0dXJucyAw
LiBEdXJpbmcgdGhlIGNhbGwgamlmZmllcyBjaGFuZ2VzCj4gdG8gMTAwMSB0aHVzICJ3aGlsZSBs
b29wIiBlbmRzIGhlcmUgKHdyb25nbHkpLgo+IE5vdGljZSB0aGF0IHJvdXRpbmUgd2FzIGNhbGxl
ZCB3aXRoIGV4cGVjdGVkIHRpbWVvdXQgMW1zIGJ1dCBhY3R1YWwgdGltZW91dCB1c2VkIHdhcyBz
b21ldGhpbmcKPiBiZXR3ZWVuIDAuLi4xbXMgKHdoaWNoIEkgYWxzbyBtZWFzdXJlZCBieSB0cmFj
aW5nICYgc2NvcGUgb24gdGhlIGJ1cykuCj4gT3IgaXMgbXkgYW5hbHlzaXMgZmxhd2VkIHNvbWV3
aGVyZSA/CgpJIGFncmVlIHdpdGggeW91ciBhbmFseXNpcy4gRXZlbiBpZiBuYW5kX3NvZnRfd2Fp
dHJkeSB3aWxsIG5vIGxvbmdlciBiZQp1c2VkIGJ5IHRoZSBzdG0zMiBkcml2ZXIgKENocmlzdG9w
aGUgc2VudCBhIHBhdGNoIGZvciB0aGF0KSBJIGFtIGZpbmUKYXBwbHlpbmcgdGhpcyBjaGFuZ2Uu
CgpDb3VsZCB5b3UgYWRkIGEgY29tbWVudCB0byBleHBsYWluIHRoZSAnKzEnIGFuZCByZXNlbmQ/
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
