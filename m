Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C906C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoIo6gtR8VKhv93ML0aC9f3JH945A4tDxAUWLRMTjOw=; b=kpRe3LQljRaLpV
	OqnRJumQlkh9dmZpn2PJjYvegEHrnWLCCrjIRkWS/O+yu6seXMQP1czMvEdgpqm0Fj8a7m+53a7VM
	ltURRXf8IuzuoYrZBBYsbPZAftSLsZpxc2cjl4oE8T96hZ4uBk6kpf8XxHM7N/+/bivpYotdyiIqC
	B32J+LaAPzRemli5rb9P73p0MBYfj6LwJahFduGMrQTZqmj5QPCQycnWPmPQvED/FFnAKS4ELoguw
	acsWwVrNhM818M+g8gscazm24wkWylUD+FeObqeI98GTRoBqi/SIzFbGLDCFsl1ohOPIZ2/iKSFBg
	oRT4ByoiQy4HCR/e+hVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP1C-0000000AILB-3521;
	Wed, 13 Mar 2024 13:51:42 +0000
Received: from fout2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP18-0000000AIJA-34Ca
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 13:51:41 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 3788C13800C4;
	Wed, 13 Mar 2024 09:51:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 13 Mar 2024 09:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710337896;
	 x=1710424296; bh=UF33/biTEk+qguK6UgC6G5DzkRWJpdJ3TPt8FCcXrto=; b=
	OgW22M8NJ5eWiAaCNYCPbbSMKZhr3yN8z3+VjSy410ClcDv5i7z8CZsFaDgxqMn5
	pgoV1h45tTvUOlsLK6zmDmWnmhbwUhH8SbtsZeazwUB8G+cDlST/vsqArttL47i5
	trONPg+Tad2vw5CfbUWVr9GADXMHTmagizAsrQ1axinvklQHm4N4xwI6yMjNIo2n
	ExZN+RNBI5BrlGPyjl20ep3Pl7oZXcAKn/rIsqD+LKaefX41v78jqPNseU3ElXn5
	/aRSb1/sCw6hTrtK9WsvwFpJCmv9lemvfohH11UuKjTD13n45fg3spg8uyPmVdoC
	2lX5AGTN0as5oG31/5c2HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710337896; x=
	1710424296; bh=UF33/biTEk+qguK6UgC6G5DzkRWJpdJ3TPt8FCcXrto=; b=I
	Xlb1e7iaQ9sB1Gh28/aRIyf91fDvFf/FQU2hbkk1TWs/vZf9zgZBRlXH0giCrmwl
	AR2wFmmdH5pSAOft9/cr+/dBRLbuHifafZY6IXWMkbPmDlk+6Xdb8P2Teqn6W5oo
	/0r35KJjQAMJrH7gNwoEthHva3ciPgsEUx7LFBtRuUzQSRtkjpEmh1OINmZ0xkSW
	NiEE+i5X+bLKaqRb8H5vc3gkzSFe9V0PubjJkun8C6bytlmW/RhQVH1Af6s4MO/C
	02g/H7ynvqV4rDwnWXlLnymSQbXx5aivauR60MFg5JpVg1d+KVEi9vzlGvqy715o
	7iS8tITxYSgvxUvZlOGvw==
X-ME-Sender: <xms:Zq_xZQ6YcqwjbX8cpD0MWJwABF5FhoQCfz0XPLpIZTwgSDMUsEGw-w>
    <xme:Zq_xZR5uRfpGHMkWAQJVg7LRVXt1T25X3Ko_sKnxI6xRV1Taw3y_05LtLN8ZSV3fQ
    b0a-lrbFvfDRhqYw-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Zq_xZfcuh2-c0LS5sXsSce9JHykwNIph3tccVuz6FZkoc6RzRgDJXg>
    <xmx:Zq_xZVJVWLMuACqtXw0sbVnqj5o6tkC__Yac1SvW4jJChN8i4cQ5iQ>
    <xmx:Zq_xZULEH7kh3YQyNbQ9-J13UCD_0iuxsp3AimTkgNUFq5YGDhfVYQ>
    <xmx:Zq_xZWx4mAZXPvXa0uBBF6pyJaG5Q44Z17gyBwrv0TZftlpSRNF6BQ>
    <xmx:aK_xZT_DS3-L1O6zcIQnJk9OmvxiXiV3CPLyEIhn9vUIgo6nXNUBIA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A6AD1B6008D; Wed, 13 Mar 2024 09:51:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <1ee86ea9-fa91-4795-b5f8-2e57609ae65e@app.fastmail.com>
In-Reply-To: <ecc5d070-a773-1180-b50c-59088b23695e@huawei.com>
References: <20240313084707.3292300-1-arnd@kernel.org>
 <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
 <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
 <1a12c8ed-0cb5-5650-24a2-84b021c444c3@huawei.com>
 <b08aaae4-8c69-47eb-9658-5f3f5c8e4056@app.fastmail.com>
 <610231c3-c3ee-e543-1a8a-8e1098ee6a7c@huawei.com>
 <21cd0f32-c94b-4b2b-8fa6-ebe12756b0c4@app.fastmail.com>
 <ecc5d070-a773-1180-b50c-59088b23695e@huawei.com>
Date: Wed, 13 Mar 2024 14:51:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Richard Weinberger" <richard@nod.at>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Daniel Golle" <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_065139_199790_272EEFEB 
X-CRM114-Status: GOOD (  11.53  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQsIGF0IDE0OjQzLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5Zyo
IDIwMjQvMy8xMyAyMTozOSwgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4KPj4+IFRoYW5rcyBmb3Ig
ZXhwbGFpbmF0aW9uLCB3aGljaCBtZWFucyB0aGF0IGRvX2RpdiBpcyB1c2VkIGZvciA2NC1iaXQK
Pj4+IGRpdmlzaW9uIHRvIHNvbHZlIHRoZSBsaW5rIGZhaWx1cmUgY2F1c2VkIGJ5IG1pc3NlZCBs
aWJnY2MuIFNpbmNlCj4+PiBwYXJhbWV0ZXIgJ2Zyb20nIGlzIHUzMiwgdGhlcmUgaXMgbm8gbmVl
ZCB0byBpbnZva2UgZG9fZGl2IG9uIGEgMzItYml0Cj4+PiBwbGF0Zm9ybSwgeW91IGp1c3Qgd2Fu
dCB0byBzdG9wIHRoZSB3YXN0aW5nIGJlaGF2aW9yIG9uIGEgMzItYml0Cj4+PiBwbGF0Zm9ybS4g
RG8gSSB1bmRlcnN0YW5kIHJpZ2h0Pwo+PiAKPiBIb3cgZG8geW91IGZpbmQgaXQ/IEkgbWVhbiB0
aGVyZSBhcmUgc28gbWFueSB0eXBlcyBhbmQgbWFueSBkb19kaXYgCj4gY2FsbGVycywgZG8geW91
IGhhdmUgYSBzdGF0aWMgY2hlY2sgdG9vbD8KCkkgaGFkIGEgbG9jYWwgZml4IHdpdGggdGhlIHNh
bWUgZWZmZWN0IHRoYXQgSSBhcHBsaWVkIHdoZW4KdGhlIGNvZGUgb3JpZ2luYWxseSBicm9rZSwg
YnV0IGhhZCBub3QgZ290dGVuIGFyb3VuZCB0bwpzZW5kaW5nIG15IGZpeC4KCkFmdGVyIGI4YTc3
YjlhNWY5YyAoIm10ZDogdWJpOiBmaXggTlZNRU0gb3ZlciBVQkkgdm9sdW1lcyBvbgozMi1iaXQg
c3lzdGVtcyIpIGludHJvZHVjZWQgYSBkaWZmZXJlbnQgd29ya2Fyb3VuZCwgSSBnb3QgdGhlCmxp
bmsgZXJyb3IgYmVjYXVzZSBJIGhhZCByZW1vdmVkIHRoZSBkb19kaXYoKS4KCiAgICAgQXJuZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
