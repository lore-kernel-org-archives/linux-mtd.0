Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E91C02198
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpIVj2xMVfpFXJGBPpshVKPZu3QjgKQwNVBenHiH2lw=; b=Qpg1wGlgc4Ljy7
	5BKumMkthhL18jJA77nAdE8UQF6m2nLl0SXUS+5a1Ynxzq0BQtpqeyfE7McPckcVp+BK8cpjXdr6W
	WOcoSaTVD4yh73VCpPy/hEWBLzGaV0R+wfuuSKVt07AhJ+8skRoIqbQV2gu44CGFTAey2xD92Urvu
	XNEJX4zrO/sDD19LaVBLV4h0GLTbvfycrYaGb9C35aFCvAk/jqW/8qZqTGz3MddvekGkkhqqNRwoZ
	MRQRLJnOQxzU6zRbK4pepvpC03kUcRjXKePTgjFxjQkHs0L6a8y0rCtiKls340IQR863yJlrMjy+0
	ltx86Bc82VWXwA6IvLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirfQ-0000000EF4B-2zRV;
	Fri, 14 Feb 2025 09:07:24 +0000
Received: from mail.venturevistas.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirZo-0000000EDYm-1nEN
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 09:01:38 +0000
Received: by mail.venturevistas.pl (Postfix, from userid 1002)
	id 2422E24AE3; Fri, 14 Feb 2025 10:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturevistas.pl;
	s=mail; t=1739523691;
	bh=dZvZFRKGwxZcTXPz7AZkoF1+C6QCkI8mt9zwq4ep1B0=;
	h=Date:From:To:Subject:From;
	b=uygD47Q/B1YiWNMSojBdqtlxyS+47qWFlS2rqHnv7wV8ROrxFehZV6v9S3J96RxVV
	 dM+vi8drDX/ZtiJQd/dWrBvTx8/cDwmvpXX7Rgf+L69zCf/ceaiCy3Vv4HRBNZ4dnX
	 OYmuh2qKSqKUIxio7umqfw0O60lFYD0vovfxrbY4099TidE5vBwnbagxyPIuNxbI8b
	 J2luaGUTTd06AaROtRTZ7nrYatdES1D2UJhox+AKPweYpuN2S6l2ur7lfeeq6Dw3xP
	 9SkN/M2TNUUh1aTqK93imnUu0unkapuqs5Xzy2dBF96iW7YBisHo9TNb2YfmI6KEGA
	 xEJAg6w+0+cUg==
Received: by mail.venturevistas.pl for <linux-mtd@lists.infradead.org>; Fri, 14 Feb 2025 09:01:17 GMT
Message-ID: <20250214084500-0.1.g3.16gdg.0.e1y34pl5w7@venturevistas.pl>
Date: Fri, 14 Feb 2025 09:01:17 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@venturevistas.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.venturevistas.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_010137_160979_44BFEFB9 
X-CRM114-Status: UNSURE (   1.49  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHpkYXJ6YSBzacSZLCDFvGUgbXVzesSFIFBhxYRzdHdvIGJvcnlr
YcSHIHNpxJkgeiB6YWxlZ8WCeW1pIHDFgmF0bm/Fm2NpYW1pIG9kIEtsaWVudMOzdz8KCk9mZXJ1
amVteSBrb21wbGVrc293ZSByb3p3acSFemFuaWEgZGxhIGZpcm0sIGt0w7NyZSBwcmFnbsSFIHph
YmV6cGllY3p5xIcgc3dvasSFIHDFgnlubm/Fm8SHIGZpbmFuc293xIUgaSBvZHp5c2thxIcgbmFs
ZcW8bm/Fm2NpLgoKQ2jEmXRuaWUgb23Ds3dpxJksIGphayBtb8W8ZW15IHdzcGllcmHEhyBQYcWE
c3R3YSB3IHR5bSBwcm9jZXNpZS4gQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSBkYWxz
esSFIHJvem1vd8SFPwoKClBvemRyYXdpYW0KUGF1bGluYSBTb2tvxYJvd3NrYQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
