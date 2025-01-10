Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE7E77188
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpIVj2xMVfpFXJGBPpshVKPZu3QjgKQwNVBenHiH2lw=; b=xzqM3CoBLQftb0
	mhQZM6JpI4Kcj+BD0rQHTt+WH7zQySL1vmDn3wdFet80rgM485RpZJUIYPirwNMW3cNB9HE4WxyXi
	JwbXlIQoVr1g52L8ZdnFNJfEZ/LorapSyjuIPHwkZflKHZtKOIjmyeCPp/as5bM4dz10jtyO/lyZT
	y7t//KX/jgtfRYAxQb8I7Yko+6qLXQDOrA3rUuxRYaxexa+QUD/lRvbw+onY9i285URdZLm2xKw6k
	HaB4uo3hcHsYS+YO2DL08joDgiuC+sH739itSncVU24PkKRsdwPFOdjqewwL7m6IL7Hg+dJb2uKjO
	8QbfcBDRJJVicVIAg6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB3i-0000000Edc3-08Bp;
	Fri, 10 Jan 2025 09:12:02 +0000
Received: from mail.venturevistas.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB3c-0000000Edal-4414
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jan 2025 09:11:59 +0000
Received: by mail.venturevistas.pl (Postfix, from userid 1002)
	id D5DDA24A16; Fri, 10 Jan 2025 10:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturevistas.pl;
	s=mail; t=1736500308;
	bh=dZvZFRKGwxZcTXPz7AZkoF1+C6QCkI8mt9zwq4ep1B0=;
	h=Date:From:To:Subject:From;
	b=rIrvSpKz4sUqC/EMmPN45FcU45+ceaemRo2Si43HRrZKMu3pKIDNG4LbM32lT1pVh
	 el56U/sRBJ7Yn71iO1FIhTd4ywc+sLj95flyJu58X0csTRuqDpgld6HQMXDwQ1AQ/U
	 N7+EeQsWbqF26uyZNiLR4n2qVh2jAoEStTn3ME6LDQGdX7Jt/VRcq02PR/g7XZAahh
	 dfor2ADe4NqCG9P4kcZ8rs4xYHTeYbVKtyexFuJBInb7K05kvBDYpJykmOai+dPYu0
	 f5iAASSoipKo2NMjV3iypkFUWqqPkPekhm0EvJv6Lbzf6lW+vHJ63nqXrsFt6pe7gN
	 TOxh2O/m7/ooQ==
Received: by mail.venturevistas.pl for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2025 09:10:49 GMT
Message-ID: <20250110084500-0.1.fe.zwnw.0.kmjozdg0ah@venturevistas.pl>
Date: Fri, 10 Jan 2025 09:10:49 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@venturevistas.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.venturevistas.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_011158_376133_96957C48 
X-CRM114-Status: UNSURE (   2.44  )
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
