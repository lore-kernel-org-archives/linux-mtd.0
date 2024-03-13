Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C96C54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaYuv79jagC5W6BqlgQjLuvmXwlw0/pkJzZ6gm3iQgU=; b=Jh1+KtNuFd/eZg
	g5XI/QBPKWry+nm1LprhXiWI+TtiW56jnYLZ4lWt2Bh73j3bAmeHrz9TrVS6TX8vvFrpyDaYlYdvl
	cjA7PdMmod9ySR/B0EN70fiSWAthSW6T6XCveieu6KPk8oWAptJNFq79lejG0XNxtBe2p6AL/JvTO
	uA+qh1sG3SdG9TAZbOTN7qNMbfj5wZZSDbUZQ25GXSxr5o7wKeGdDFTba6UKRpoCGaGiy08p7GiTA
	NYmvPnPUSt4wXKFVGozHwDVkWU/SEub8CAEv4Erbibq5DJlJRhwK/AoJ1W4k20a+bHSrrKJIbsfHi
	oIJIuzCjBUEe4oMqCx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNAu-00000009yHh-2lvZ;
	Wed, 13 Mar 2024 11:53:36 +0000
Received: from fout1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNAr-00000009yH4-2K8M
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 11:53:35 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id D6D621380134;
	Wed, 13 Mar 2024 07:53:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 13 Mar 2024 07:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710330809;
	 x=1710417209; bh=gn0b2WKvEfTg/FZ9LXq190CVS7p5sTA5MQLvPVDkM3s=; b=
	ZYnQM7p8x/dP3H+5hWC13tUah5T99wlcWE8gOwezOGhcibshahMJ5psB/nXpI11J
	kjwEu3VUBPQfU5TCmCNMNFZGOcQ0xO3MDxzIK/2kd5Bo6v1BnO4AT5IqU3GO5iby
	M27nshnCWSa7JyT6usf/0VIXG+DYDnrknzaYcyFg1oUXziIClTElvL71abMRpRDK
	H7gvKtv4XpEedSnH0rBSy55tQUq/eQcmP+JqQV1ZiljN0N9r0IAlecQHVscQRSyt
	GkCv31l1hX8AW6X4vgbIW5husbH5zCyFiTeXJQlDP0DNPveoTMD0rf1qwP+K/7k1
	5VhecXmy3tGx5ZOVquwoNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710330809; x=
	1710417209; bh=gn0b2WKvEfTg/FZ9LXq190CVS7p5sTA5MQLvPVDkM3s=; b=e
	ZUqb3sUkme8YY7sunqMcd7kgqEWfeQZ4GfUpMMuwqPWi3qZC7uCjmrk3AUvXF5I6
	sCzYembUcddX4rNT4jppC5CJa9geTUpG2MUT8Tt3jzLwTHlr9cl8wTfDl+BLYfS6
	7IAxclCPexIrBG2BVnePeiPOFON5U34KRQEvpF6iAGRdrF1nimJbq1gKm8jgYWbJ
	QapwtZ3LBd7JWtkrq7TQmYlb21d6CDah3Uf3FgZ8DyMW6jb/fhLiAXkUHkF77uWS
	U1xrPo7H6Qu/ds46blGaA+7yIFSIWUzr5CzwupSlXBNEthYy//0L0cBEo25Iaf9a
	wGDf9Xeuuux7gvDqb72VA==
X-ME-Sender: <xms:uZPxZTU141cMxAzB1qC7B0IRPSUJwJG3UNsdiYYw8SRtDWUf4XWvXw>
    <xme:uZPxZblhXdjQvRXBBwmSjLSK0xXK7OkgwgQ2ImSOV_QTSRzIRhgb1OK8kgux-9EuX
    b2R_iw3t1KOaxewfi0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:uZPxZfYpe4EJPrxNTPVtS-AjAzTrDk7bd2mdHCVE-zQn1igwJ4sWHQ>
    <xmx:uZPxZeVNzxCRcItYmAYR83vxJAjKHCOls9zlkWWdj1qZeq59iPhI4A>
    <xmx:uZPxZdmsnwm7NkJDATBGK1wi7cn3sv_gkrMacb0qxQsLeW2P4sK2_w>
    <xmx:uZPxZbcqOpW6nUb74efVXhKe6YWnhc2z9lhxGOnHcF3yDXRdmIL8fw>
    <xmx:uZPxZf57wFFPJfrIxMya7jtFJn6lO-PNwRuFGUxiwAbWrwE71s4_pQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 46CCEB6008D; Wed, 13 Mar 2024 07:53:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
In-Reply-To: <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
References: <20240313084707.3292300-1-arnd@kernel.org>
 <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
Date: Wed, 13 Mar 2024 12:53:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Richard Weinberger" <richard@nod.at>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Daniel Golle" <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_045334_050496_E70F50F2 
X-CRM114-Status: GOOD (  11.57  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQsIGF0IDEyOjI5LCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5Zyo
IDIwMjQvMy8xMyAxNjo0NiwgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+IAo+PiBUaGUgdXNlIG9mIGRvX2RpdigpIGluIHViaV9u
dm1lbV9yZWdfcmVhZCgpIG1ha2VzIGNhbGxpbmcgaXQgb24KPj4gMzItYml0IG1hY2hpbmVzIHJh
dGhlciBleHBlbnNpdmUuIFNpbmNlIHRoZSAnZnJvbScgdmFyaWFibGUgaXMKPj4ga25vd24gdG8g
YmUgYSAzMi1iaXQgcXVhbnRpdHksIGl0IGlzIGNsZWFybHkgbmV2ZXIgbmVlZGVkIGFuZAo+PiBj
YW4gYmUgb3B0aW1pemVkIGludG8gYSByZWd1bGFyIGRpdmlzaW9uIG9wZXJhdGlvbi4KPj4gCj4g
RG8geW91IG1lZXQgYSBwZXJmb3JtYW5jZSBwcm9ibGVtIG9uIGEgMzItYml0IG1hY2hpbmU/IFRo
ZXJlIGFyZSB0b28gCj4gbWFueSBwbGFjZXMgaW52b2tpbmcgZG9fZGl2LCB3aHkgZG8geW91IG9w
dGltaXplIHRoaXMgb25lPwo+IEhhdmUgeW91IHRlc3RlZCB0aGUgaW5mbHVlbmNlIG9uIGEgeDg2
XzY0IHBsYXRmb3JtIGFmdGVyIHRoaXMgcGF0Y2ggCj4gYXBwbGllZD8gTG9va3MgbGlrZSB0aGF0
IGRvX2RpdiBpcyBtb3JlIGVmZmljaWVudCBpbiB4ODYuCgpUaGlzIG9uZSB3YXMganVzdCBpbnRy
b2R1Y2VkLiBUaGUgY2FsbCBzaXRlIGxvb2tzIGxpa2UgYSBmYXN0CnBhdGggYW5kIGl0IGNhdXNl
ZCBhIGJ1aWxkIHJlZ3Jlc3Npb24gdGhhdCBEYW5pZWwgYWRkcmVzc2VkIHdpdGgKYW4gc3Vib3B0
aW1hbCBjb21taXQgYjhhNzdiOWE1ZjljICgibXRkOiB1Ymk6IGZpeCBOVk1FTSBvdmVyClVCSSB2
b2x1bWVzIG9uIDMyLWJpdCBzeXN0ZW1zIikuCgpUaGUgd2F5IGl0IHVzdWFsbHkgZ29lcyBpcyB0
aGF0IHNvbWVvbmUgYWRkcyBhbiBvcGVuLWNvZGVkCjY0LWJpdCBkaXZpc2lvbiB0aGF0IGNhdXNl
cyBhIGxpbmsgZmFpbHVyZSwgd2hpY2ggcHJvbXB0cwp0aGUgb3JpZ2luYWwgZGV2ZWxvcGVyIHRv
IGVpdGhlciByZXdyaXRlIHRoZSBjb2RlIHRvIGF2b2lkCnRoZSBsb25nIGRpdmlzaW9uIGlmIHBv
c3NpYmxlLCBvciBhZGQgZG9fZGl2KCkgYWZ0ZXIgc2hvd2luZwp0aGF0IGl0IGlzIG5vdyBwZXJm
b3JtYW5jZSBjcml0aWNhbCwgZS5nLiBvbmx5IGNhbGxlZCBhdApwcm9iZSB0aW1lLgoKICAgICBB
cm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
