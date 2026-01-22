Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81959C44500
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb0CawPEqNPnLJse1gvBtOkl2GxY0tvIMj7jH02Aylo=; b=gLiiNFOlXI4fQI
	Gj949Ufq1uxHncNHCm0DnsxdrrAUAMjeXT+KKeBbmf3iLgq5XHp5fST6p3DBBK6yzBzowHgeIP/rT
	eoVs1XBSqvHbhS6t2vnyn0PIgGFb3rLNx9dzSU5/wT9pDnx7xCxXpYcZ9VAMxamvBoOS6d89aFaaH
	RwiRC0+Sap0OXdQ3Nt2e5B2apNuYnvddBtt4KvNKs+Q+QDH3Soj+OUYbvi4Z73mMJ7joYjLguvGJ2
	WtwvUqo6bQUxy95lKnBs7/JK5RelTD3ruL0EZ1IkpgFRfA1MBgIMQNC2g7mgV9mUr43o/FnYOzNxB
	lgc2x6fkSuBTW3mcy+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virz3-00000006qeL-2OVL;
	Thu, 22 Jan 2026 10:32:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virz0-00000006qdZ-1mqG
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 10:32:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 37F334E421EB;
	Thu, 22 Jan 2026 10:32:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B64E606B6;
	Thu, 22 Jan 2026 10:32:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4720119B2652;
	Thu, 22 Jan 2026 11:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769077923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ryhJKdIrubrtkhY998UD9rUltkB54cVzq5qpVX6sT0w=;
	b=n9VwJlT/bDSClmAYLwqJ5gM67D0CnPLgczwU+8WRBcs7yiQSC9sK/6fndI4xhMSOdVDFEy
	3CRmi6m88cyUQhVzhlonegTTJrvQnSClabqt/YUoXi4QuUImlpUzMvtiDBI8POkocXD0jO
	VQOGrRApe0+dF2w23GhVUIHMkJk0rO9JQyNij5BmXu3lFgmkI2lQr3T1QT430a9IG1Trhf
	4cmnikguSPMyMAf0pQTyZmlxHCwc94Lnj1ap42/YVemOVgUum3ZnRGQj0URh5XuD276fb9
	rHON4Kqqq7YJhtfuEGAM5eKfjXg4BMTUIPB7jxw0cTgMey8GeoLLizxZDdjWMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,  Chad Monroe
 <chad.monroe@adtran.com>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Brian Norris
 <computersforpeace@gmail.com>,  Kamal Dasu <kdasu.kdev@gmail.com>,
  William Zhang <william.zhang@broadcom.com>,  Nick Terrell
 <terrelln@fb.com>,  David Sterba <dsterba@suse.com>,  =?utf-8?Q?Rafa?=
 =?utf-8?Q?=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Simon Glass <sjg@chromium.org>,  Linus Walleij
 <linusw@kernel.org>,  Ulf Hansson <ulf.hansson@linaro.org>,  Marcus
 Folkesson <marcus.folkesson@gmail.com>,  Tony Lindgren <tony@atomide.com>,
  Roger Quadros <rogerq@kernel.org>,  Hauke Mehrtens <hauke@hauke-m.de>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mmc@vger.kernel.org,  Krzysztof
 Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/10] dt-bindings: mtd: partitions: Drop
 partitions.yaml
In-Reply-To: <aXFCws0XUToQ03UH@makrotopia.org> (Daniel Golle's message of
	"Wed, 21 Jan 2026 21:18:58 +0000")
References: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
	<20260121-dt-mtd-partitions-v3-6-ec3af93c8f93@kernel.org>
	<aXFCws0XUToQ03UH@makrotopia.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 22 Jan 2026 11:31:54 +0100
Message-ID: <87tsweos4l.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_023210_593582_9CC4EAB2 
X-CRM114-Status: GOOD (  13.47  )
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

T24gMjEvMDEvMjAyNiBhdCAyMToxODo1OCBHTVQsIERhbmllbCBHb2xsZSA8ZGFuaWVsQG1ha3Jv
dG9waWEub3JnPiB3cm90ZToKCj4gT24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgMDE6NTY6MzlQTSAt
MDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4+IFRoZSBwYXJ0aXRpb25zLnlhbWwgc2No
ZW1hIGlzIGFuIHVudXN1YWwgc3RydWN0dXJlIGluIHRoYXQgaXQgaW5jbHVkZXMKPj4gYWxsIHBv
c3NpYmxlIHBhcnRpdGlvbiB0eXBlcywgYW5kIGl0IGRpc2FibGVzIHRoZSBub3JtYWwgbWF0Y2hp
bmcgYnkKPj4gY29tcGF0aWJsZSBzdHJpbmdzLiBBcyBwYXJ0aXRpb25zLnlhbWwgaGFzIG5vdGhp
bmcgdG8gbWF0Y2ggb24sIGl0IGlzCj4+IG9ubHkgYXBwbGllZCB3aGVuIGV4cGxpY2l0bHkgcmVm
ZXJlbmNlZC4gVGhlIHVzZSBvZiAib25lT2YiIGFsc28gcmVzdWx0cwo+PiBpbiBtaXNsZWFkaW5n
IHdhcm5pbmdzIHdoaWNoIGFyZSBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZC4gRHJvcAo+PiBwYXJ0
aXRpb25zLnlhbWwgYW5kIHJlbHkgb24gdGhlIHN0YW5kYXJkIGNvbXBhdGlibGUgbWF0Y2hpbmcg
aW5zdGVhZC4KPj4gCj4+IFRoZSAibW1jLWNhcmQiIGNhc2UgcHJldmlvdXNseSBhbGxvd2VkIGFu
eSBwYXJ0aXRpb24gdHlwZSwgYnV0IG5vdyBvbmx5Cj4+IGFsbG93cyAiZml4ZWQtcGFydGl0aW9u
cyIuIFRoZXJlIGFyZW4ndCBhbnkgdXNlcnMgYW5kIHRoZSBvcmlnaW5hbAo+PiBpbnRlbnQgYXBw
ZWFyZWQgdG8gYmUgb25seSBmb3IgImZpeGVkLXBhcnRpdGlvbnMiLgo+Cj4gSXQgd291bGQgYWN0
dWFsbHkgYmUgZ3JlYXQgdG8gYWxzbyBhbGxvdyAnZ3B0LXBhcnRpdGlvbnMnIGFzIGNvbXBhdGli
bGUKPiB0eXBlIHdpdGggI2FkZHJlc3MtY2VsbHMgPSA8MD4gYW5kICNzaXplLWNlbGxzID0gPDA+
IGFuZCBhbGxvdyBtYXRjaGluZwo+IG9uIHBhcnRpdGlvbiBVVUlELCBuYW1lIG9yIGluZGV4LiBU
aGlzIGhhcyBwcmV2aW91c2x5IGJlZW4gZGlzY3Vzc2VkIGFuZAo+IHdvdWxkIGF2b2lkIGhhdmlu
ZyB0byBleHRyYWN0IE1BQyBhZGRyZXNzZXMgYW5kIFdpRmkgRUVQUk9NIGRhdGEgaW4KPiB1c2Vy
c3BhY2Ugb24gbWFueSBkZXZpY2VzIHdoaWNoIHJlbHkgb24gc3VjaCBjb252ZW50aW9ucy4KCk91
dCBvZiBjdXJpb3NpdHksIHdoeSBub3QgZXhwb3NpbmcgdGhpcyBkYXRhIHRocm91Z2ggYW4gTlZN
RU0gY2VsbAppbnN0ZWFkPyBBbnl3YXksIHRoaXMgKHJlPylhZGRpdGlvbiBjYW4gcHJvYmFibHkg
YmUgcGFydCBvZiBhIGZvbGxvdy11cApzZXJpZXMgYW5kIGlzIGFsbW9zdCBvcnRob2dvbmFsIHRv
IHRoaXMgY2xlYW51cCBJTU8uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
