Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC216C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Qm3PIqLfc92nkD4zacY69al82hha1lQ3j0JQ+8T7hk=; b=fliF81Y5WvBjjY
	RI/nYXoauMJzVgrS1UWE5drbBpERGyII8C14oy0rcvpAXYSSZ3D4CtvveuLBQAiLBDNP7ZEvCPVQk
	a7bRvCI+nA9uuYC/BuBBeL9JtgxHNUquqDUbwVol/ls4ug/E+GhbEKTPcCXhxQUbezjBKePL+AW4p
	+4nyLmoEA6KSGjYoZbSVB/yYS78ftdzsV887zTvCBkr9EXfFzQYrnz1eGxFWSQHkbaQAy5MBlTczt
	rnQC34SuxT3u8IExabOYWE0UOlW41vyTVterBCvUV4VHcdHyR/1v27CASva3Mh7vK9ij9zW/EO+77
	wNQfMZb0YgVuDLlUFjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwpT5-00AqnT-Ik; Mon, 13 Dec 2021 17:50:31 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwpT1-00Aqn8-Qi
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 17:50:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 86635240002;
 Mon, 13 Dec 2021 17:50:23 +0000 (UTC)
Date: Mon, 13 Dec 2021 18:50:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: GPMC omap nand using CS1
Message-ID: <20211213185021.0cb22fea@xps13>
In-Reply-To: <fb71fa47-a59f-9434-a16a-6b59da9e2646@smile.fr>
References: <fb71fa47-a59f-9434-a16a-6b59da9e2646@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_095028_053596_68671484 
X-CRM114-Status: GOOD (  25.57  )
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

SGVsbG8gUm9tYWluLAoKcm9tYWluLm5hb3VyQHNtaWxlLmZyIHdyb3RlIG9uIE1vbiwgMTMgRGVj
IDIwMjEgMTE6MTg6MDMgKzAxMDA6Cgo+IEhlbGxvLAo+IAo+IEknbSB1c2luZyBhbiBBTTM1MDUg
Y3B1IHdpdGggdHdvIG5hbmQgZGV2aWNlLCBuYW5kMCB1c2UgQ1MwIGFuZCBuYW5kMSB1c2UgQ1Mx
Lgo+IAo+IFRoZSBuYW5kMCBpcyBvayBidXQgbmFuZDEgaXMgbm90IGRldGVjdGVkLgo+IEkgZ2V0
ICJuYW5kOiBObyBOQU5EIGRldmljZSBmb3VuZCIKCkVhc3kgYW5zd2VyIChzdXBwb3J0IDEwMSwg
c29ycnkgYWJvdXQgdGhhdCA6LSkgKSwgZGlkIHlvdSBjaGVjayB0aGF0IHRoZQpDUyB3YXMgdG9n
Z2xpbmcgd2l0aCBhIHNjb3BlPyBKdXN0IHRvIGJlIHN1cmUgdGhhdCB0aGlzIGlzIGEgTkFORApj
b3JlL2RyaXZlciBpc3N1ZSBhbmQgbm90IHNvbWV0aGluZyBlbHNlPwoKPiBSZWdhcmRpbmcgdGhl
IGRldmljZXRyZWUgZm9yIG5hbmQxLCBJIGRpZCBzb21ldGhpbmcgc2ltaWxhciB0byBvbWFwMzQz
MC1zZHAuZHRzCj4gd2hlcmUgdGhlIG5hbmQgaXMgb24gQ1MxLgo+IAo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvdHJlZS9h
cmNoL2FybS9ib290L2R0cy9vbWFwMzQzMC1zZHAuZHRzP2g9djUuMTUuNiNuMTAyCgpBbmQgdGhp
cyBpcyBwcmVjaXNlbHkgdGhlIHJlYXNvbiB3aHkgd2Ugc3dpdGNoZWQgdG8gYSBuZXcKRFQgcmVw
cmVzZW50YXRpb246IGFzIGxvbmcgYXMgeW91IGhhdmUgYSBzaW5nbGUgY2hpcCwgbm90IGRlc2Ny
aWJpbmcKdGhlIE5BTkQgZGV2aWNlIGluc2lkZSBhIGJpZ2dlciAibmFuZCIgbm9kZSB3YXMgZmlu
ZS4gQnV0IHdoZW5ldmVyIHdlCm5lZWQgdG8gc3VwcG9ydCBtb3JlIHRoYW4gb25lIGl0IHN0YXJ0
cyB0byBiZSBhbiBpc3N1ZS4gSSBzYXcgdGhhdCB0aGUKbG9naWMgaGVyZSB3YXMgdG8gYWRkIGEg
c2Vjb25kIG5hbmQgbm9kZSB3aGljaCwgb24gYSBwdXJlIERUCnJlcHJlc2VudGF0aW9uIGxvZ2lj
IGlzIHdyb25nOiB0aGUgR1BNQyBoYXMgc3Vibm9kZXMgd2hpY2ggYXJlIHRoZQpkaWZmZXJlbnQg
Y29udHJvbGxlciAodGhlcmUgaXMgb25seSBvbmUgTkFORCBjb250cm9sbGVyIHRoZXJlKSB3aGlj
aApzaG91bGQgY29udGFpbiB0d28gTkFORCBkZXZpY2Ugc3Vibm9kZXMgd2l0aCB0aGVpciBzcGVj
aWZpYyBwcm9wZXJ0aWVzLgpBbnl3YXksIHRoYXQgaXMgbm90IGhvdyB0aGlzIGNvbnRyb2xsZXIg
aXMgY3VycmVudGx5IGJlaW5nIGRlc2NyaWJlZCwKc28gbGV0J3MgYXNzdW1lIGNyZWF0aW5nIHR3
byBOQU5EIG5vZGVzIGlzIGZpbmUgYXQgbGVhc3QgdG8gbWFrZSBpdAp3b3JrLgoKSSBhc3N1bWUg
eW91IHRyaWVkOgoqIGJvb3Rpbmcgd2l0aCBvbmx5IENTMCBkZXNjcmliZWQgLT4gd29ya3MKKiBi
b290aW5nIHdpdGggb25seSBDUzEgZGVzY3JpYmVkIC0+IE5vIE5BTkQgZGV2aWNlIGZvdW5kIGVy
cm9yCkFtIEkgcmlnaHQ/Cgo+IEknbSBub3Qgc3VyZSB0aGlzIGR0cyBhY3R1YWxseSB3b3JrcyBz
aW5jZSBpbiBuYW5kX2Jhc2UuYyBuYW5kX2RldGVjdCgpIGNhbGwKPiBuYW5kX3Jlc2V0KGNoaXAs
IDApIHdpdGggY3MgPSAwLgo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvdHJlZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2Jhc2UuYz9oPXY1LjE1LjYjbjQ5NDUKClRoaXMgaXMgaW5kZWVkIHRoZSBmaXJzdCBzdGVw
LCB3ZSBhbHdheXMgc3RhcnQgd2l0aCB0aGUgZmlyc3QgQ1MgYW5kCnRoZW4gaWYgdGhlIGZpcnN0
IGRldmljZSB3YXMgZGlzY292ZXJlZCwgd2UgY2hlY2sgaWYgdGhlIG90aGVyIENTIGFyZQp3aXJl
ZC4gVGhpcyBvbmx5IHdvcmtzIG9mIGNvdXJzZSBpZiBuYW5kX3NjYW4oKSByZXF1ZXN0cyBzY2Fu
bmluZyBtb3JlCnRoYW4gb25lIENTLiBUaGlzIGlzIGN1cnJlbnRseSBub3QgdGhlIGNhc2UgYW5k
IHdhcyBhbHJlYWR5IGxpa2UgdGhhdApmb3IgcXVpdGUgc29tZSB0aW1lLiBNYXliZSB0aGF0IGlz
IHdoeSB0aGUgTkFORCBjb250cm9sbGVyIHdhcwpkZXNjcmliZWQgdHdpY2UgaW4gdGhlIGxpbmsg
YmVsb3csIHRvIGdldCB0aGUgcHJvYmUgb2YgdGhlIGNvbnRyb2xsZXIKY2FsbGVkIHR3aWNlPwoK
QW55d2F5IGlmIHRoZSBxdWVzdGlvbiBpcyAnaG93IGRvIEkgZ2V0IENTMSBiZWluZyBjaGVja2Vk
IGZpcnN0JywgeW91CnNob3VsZCBsb29rIGF0IHRoZSBwcm9iZSBmdW5jdGlvbiB3aGljaCBpbnN0
YW50aWF0ZSB5b3VyIGNvbnRyb2xsZXIuClRoYXQgaXMgd2hlcmUgdGhlIGRyaXZlciBpcyBzdXBw
b3NlZCB0byBwYXJzZSB0aGUgRFQsIGZpbmQgdGhlIHJpZ2h0CkNTIHRvIGhhbmRsZSBhbmQgdGhl
biByZWdpc3RlciB0aGUgTkFORCBjaGlwLiBGcm9tIHRoZSBjb3JlCnBlcnNwZWN0aXZlLCBpdCBj
YW4gdXNlICJ0YXJnZXQiIDAsIDEsIGV0YywgZXZlbiB0aG91Z2ggZnJvbSB0aGUKY29udHJvbGxl
ciBwZXJzcGVjdGl2ZSwgdGFyZ2V0IDAgZm9yIGEgZ2l2ZW4gY2hpcCBtaWdodCBiZSBDUzEuIFlv
dSBjYW4KbG9vayBhdCAicmVjZW50IiBkcml2ZXJzLCBsaWtlIE1hcnZlbGwgb3IgQXJhc2FuIHdo
aWNoIHN1cHBvcnQgc2V2ZXJhbApDUy4KCj4gSXQgc2VlbXMgaXQgd2FzIHBvc3NpYmxlIHRvIHVz
ZSB0d28gbmFuZCBvbiBncG1jIChrZXJuZWwgMy4xNik6Cj4gCj4gaHR0cHM6Ly9lMmUudGkuY29t
L3N1cHBvcnQvcHJvY2Vzc29ycy1ncm91cC9wcm9jZXNzb3JzL2YvcHJvY2Vzc29ycy1mb3J1bS8z
NDMwMTcvYW0zMzV4LWdwbWMtd2l0aC10d28tbmFuZC1mbGFzaC1pbi1kZXZpY2UtdHJlZQoKSSBo
b25lc3RseSBkbyBub3Qga25vdyBpZiB0aGlzIGV2ZXIgd29ya2VkIG9yIGlmIGl0IHdhcyBzdXBw
b3J0ZWQKdXBzdHJlYW0sIGl0IGlzIHZlcnkgbGlrZWx5LCBsb29raW5nIGF0IHRoZSBjdXJyZW50
IGNvZGUgYmFzZSwgdGhhdAppZiB5b3Ugd2FudCB0d28gQ1Mgb24gdGhpcyBib2FyZCB5b3UgYXJl
IGdvaW5nIHRvIG5lZWQgdG8gd3JpdGUgYQpjb3VwbGUgb2YgcGF0Y2hlcyA6KQoKR29vZCBsdWNr
LCBkbyBub3QgaGVzaXRhdGUgaWYgeW91IGhhdmUgb3RoZXIgc3BlY2lmaWMgcXVlc3Rpb25zLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
