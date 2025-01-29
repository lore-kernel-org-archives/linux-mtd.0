Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F894C0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpIVj2xMVfpFXJGBPpshVKPZu3QjgKQwNVBenHiH2lw=; b=UvGOjc3yMGpToM
	KK19Sp2/rvJn8d+j3Yq8R0AzfA7rridB11pVQSnM/+et2qXg1EA+Ur0jglbI6qpcD9ondSiz8wj9E
	908iLBA7GSTkBoxYUE1US/hFeVrGc1cu3FFbSmCIoB4ccQtpHgWl4mVNmA0N/TQ8nn4I12dVO0uh5
	hhoESBzhbdH8Ri4PneI4rYf49wfnG4JTWpKcSnzIkoHY69y4iAPRS59mSp7f24roAxxmF2MiWj7um
	p/UlNPS1oXTcrJqCPU3dqU0aEVrTTBTSa84pig5HUm36jBBYPsk5RuJZ+UAkBDFq1rgyaxqP0du5A
	4+AUUxdaCKSSaSEASfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td49u-00000006cnD-18N9;
	Wed, 29 Jan 2025 09:14:54 +0000
Received: from mail.venturevistas.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td49q-00000006cm0-2aWk
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 09:14:52 +0000
Received: by mail.venturevistas.pl (Postfix, from userid 1002)
	id 6E71024A86; Wed, 29 Jan 2025 10:11:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturevistas.pl;
	s=mail; t=1738141909;
	bh=dZvZFRKGwxZcTXPz7AZkoF1+C6QCkI8mt9zwq4ep1B0=;
	h=Date:From:To:Subject:From;
	b=AJkX8ytJZsb8BCfspZVpGnXJ7y2gzv7SLbSqFasbRpSpku0RdRKoe3oVYH3fbPrT/
	 3uRzzoIpBM6Rr+Ny29bO5grwtwpzzSU+6Uyigltzw8jKouqTT8NCe1aQ8+hs+R+nbv
	 +PSOn0iemCzcQ/kO1HGc5RRTkqwgqgzDSLzcynqvHdndDU4uTD9SE1aKSgzHNB5Rcl
	 xyx3c1B8rUOfgdhlYpu+oVF5U0Sis0HwjHu7UvQeIK6VgfEHpGjWOIZkMRbRTwEf1Z
	 UB5ok8rM8cmUaj37Ta7sytQlhy6rQVUpGjgCgAGXq+mV9KgJi5AvCXgfCIC+CNKhXL
	 AUoG4cvkjy8Rg==
Received: by mail.venturevistas.pl for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2025 09:11:02 GMT
Message-ID: <20250129084500-0.1.fr.13bmy.0.xyr1d1403q@venturevistas.pl>
Date: Wed, 29 Jan 2025 09:11:02 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@venturevistas.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.venturevistas.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_011451_349224_48800333 
X-CRM114-Status: UNSURE (   2.45  )
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
