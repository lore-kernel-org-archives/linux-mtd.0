Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFFDCA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RNcQsNKiufxeNEwA++4tssQHA7OOa1uPaFzzitoTec=; b=3No4gStF/QWNp2
	Qm9zaSIVO/mQWaSYYkqc1LtAJqOoGAydA5Nby2wKrgBI67qLFbs8UOYzj8MuMap0/6fbbHobXzGEf
	bBRaHyWxgzVTzTfzB1xHCul9thrBSXW7hPzh1Sch5qKoAlS7HM3VH+LPOzkRyIVVGtWDGhCZhT6PR
	1telahlmiqmfDyschAQVIsEa9jJ5HFPG1a4aYmxhARqLaXRyEOvMlZWjh/6cBEYgLOh6OLh0PPARq
	UpDSwIBlC2JlSua8c2RSsjiHGV6pe1o9Iqrs4Z8AXUzoHr1YQ/jg618CI23cz2L+fwQhTgBU19pgW
	YsffRAI30baJhTTRVkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqD2e-00000006Jq5-2AmH;
	Sun, 24 Aug 2025 15:54:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqD01-00000006Jgy-3u4H
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 15:51:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4BBD44E40C1D;
	Sun, 24 Aug 2025 15:51:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 092EE605F1;
	Sun, 24 Aug 2025 15:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6C5A1C228A5B;
	Sun, 24 Aug 2025 17:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756050674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N8TnPVsESid2cQ1hhF98BtD+FAEy1qWNfNCLT8zQ3XY=;
	b=xGvqGf7RUIbvnFHVKYwyDxsvhN4cpVYRJdpCk068CKtchXKw29FhSGK9ubTRudt41vNmuo
	RNeqCEwo6Jea8JbdC+CeptKrmAXbyr9tvmM4GyzAY2iLXG9t3+G5A0toPdWcRJdybjl+AJ
	FcrFjY8NolfvDVaZW2qZOwNB4fnoBdBeRwXgcKPpk3+uaS19knB1dWK8KwEI0BdAnWzkrf
	bLnlmOgQNbw704qsR9jlBfh9ytUyKUhm/fM8IQRRmSOBVO2XGQoXwpJ+Mi9VlCsGhczfTs
	HqMke15N7FYJXtvy9Ythj9ewNzLHeby+Pw2HK+7znGITVrZAAtgrKhQT3tSxlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  Ray Liu <ray.liu@airoha.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH RESEND v2 4/4] spi: spi-airoha-snfi: return an error for
 continuous mode dirmap creation cases
In-Reply-To: <e8f77b06-b47c-456e-8671-ac8ae573af64@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 14 Aug 2025 18:33:25 +0300")
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
	<20250814065423.3980305-5-mikhail.kshevetskiy@iopsys.eu>
	<78542bbe-1def-4aca-8424-cc26542d9762@sirena.org.uk>
	<e8f77b06-b47c-456e-8671-ac8ae573af64@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 17:50:56 +0200
Message-ID: <87o6s4k9b3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_085118_092406_8F06F649 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

T24gMTQvMDgvMjAyNSBhdCAxODozMzoyNSArMDMsIE1pa2hhaWwgS3NoZXZldHNraXkgPG1pa2hh
aWwua3NoZXZldHNraXlAaW9wc3lzLmV1PiB3cm90ZToKCj4gT24gMTQuMDguMjAyNSAxODoyOSwg
TWFyayBCcm93biB3cm90ZToKPj4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMDk6NTQ6MjNBTSAr
MDMwMCwgTWlraGFpbCBLc2hldmV0c2tpeSB3cm90ZToKPj4+IFRoaXMgZHJpdmVyIGNhbiBhY2Nl
bGVyYXRlIHNpbmdsZSBwYWdlIG9wZXJhdGlvbnMgb25seSwgdGh1cwo+Pj4gY29udGludW91cyBy
ZWFkaW5nIG1vZGUgc2hvdWxkIG5vdCBiZSB1c2VkLgo+Pj4KPj4+IENvbnRpbnVvdXMgcmVhZGlu
ZyB3aWxsIHVzZSBzaXplcyB1cCB0byB0aGUgc2l6ZSBvZiBvbmUgZXJhc2UgYmxvY2suCj4+PiBU
aGlzIHNpemUgaXMgbXVjaCBsYXJnZXIgdGhhbiB0aGUgc2l6ZSBvZiBzaW5nbGUgZmxhc2ggcGFn
ZS4gVXNlIHRoaXMKPj4+IGRpZmZlcmVuY2UgdG8gaWRlbnRpZnkgY29udGludW91cyByZWFkaW5n
IGFuZCByZXR1cm4gYW4gZXJyb3IuCj4+IFRoaXMgc2VlbXMgbGlrZSBpdCBqdXN0IGFwcGxpZXMg
YW55d2F5IHJlZ2FyZGxlc3Mgb2YgdGhlIHJlc3Qgb2YgdGhlCj4+IHNlcmllcz8KPgo+IENvdWxk
IHlvdSBwcm92aWRlIGEgbGluaz8gSSBkbyBub3Qgc2VlIHRoaXMgaW4gdXBzdHJlYW0gbGludXgg
cmVwby4KCk5vIGxpbmssIE1hcmsgY2FuIGFwcGx5IHRoaXMgd2l0aG91dCB0aGUgcmVzdCBvZiB0
aGUgc2VyaWVzIGl0IHNlZW1zLiBJZgp0aGF0J3MgdGhlIGNhc2UsIGl0J3MgYmVzdCB0byBzZW5k
IHR3byBzZXJpZXMgYmVjYXVzZSB0aGVzZSBwYXRjaGVzCmFwcGx5IHRvIGRpZmZlcmVudCB0cmVl
cy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
